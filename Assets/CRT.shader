Shader "Unlit/CRT"
{
    Properties
    {
        _MainTex ("tex2D", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }
            
            float2 crt_coords(float2 uv, float bend)
            {
	            uv -= 0.5;
                uv *= 2.;
                uv.x *= 1. + pow(abs(uv.y)/bend, 2.);
                uv.y *= 1. + pow(abs(uv.x)/bend, 2.);
    
                uv /= 2.5;
                return uv + .5;
            }

            float vignette(float2 uv, float size, float smoothness, float edgeRounding)
            {
 	            uv -= .5;
                uv *= size;
                float amount = sqrt(pow(abs(uv.x), edgeRounding) + pow(abs(uv.y), edgeRounding));
                amount = 1. - amount;
                return smoothstep(0., smoothness, amount);
            }

            float scanline(float2 uv, float lines, float speed)
            {
                return sin(uv.y * lines + _Time.y * speed);
            }

            float random(float2 uv)
            {
 	            return frac(sin(dot(uv, float2(15.5151, 42.2561))) * 12341.14122 * sin(_Time.y * 0.03));   
            }

            float noise(float2 uv)
            {
 	            float2 i = floor(uv);
                float2 f = frac(uv);
    
                float a = random(i);
                float b = random(i + (1.,0.));
	            float c = random(i + (0., 1.));
                float d = random(i + (1.));
    
                float2 u = smoothstep(0., 1., f);
    
                return lerp(a,b, u.x) + (c - a) * u.y * (1. - u.x) + (d - b) * u.x * u.y; 
                     
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float2 uv =i.uv;
    
                float2 crt_uv = crt_coords(uv, 4.);
    
                float s1 = scanline(uv, 200., -10.);
                float s2 = scanline(uv, 20., -3.);
    
                float4 col;
                col.r = tex2D(_MainTex, crt_uv + float2(0., 0.01)).r;
                col.g = tex2D(_MainTex, crt_uv).r;
                col.b = tex2D(_MainTex, crt_uv + float2(0., -0.01)).b;
                col.a = tex2D(_MainTex, crt_uv).a;
    
                col = lerp(col, (s1 + s2), 0.05);
	            return lerp(col, (noise(uv * 75.)), 0.05) * vignette(uv, 1.9, .6, 8.);
            }

            

            ENDCG
        }
    }
}
