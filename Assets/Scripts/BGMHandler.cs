using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class BGMHandler : MonoBehaviour
{
    public AudioClip bgm;
    private AudioSource source;
    public float maxVolume;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    private void Awake()
    {
        source = GetComponent<AudioSource>();
        source.Play();
        Debug.Log("playing song");
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void FadeInBGM(float time)
    {
        source.DOFade(maxVolume, time);
    }

    public void FadeOutBGM(float time)
    {
        source.DOFade(0.0f, time);
    }
}
