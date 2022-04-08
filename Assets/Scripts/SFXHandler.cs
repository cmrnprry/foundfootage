using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SFXHandler : MonoBehaviour
{
    public AudioClip heavyfootsteps;
    public AudioClip lightfootsteps;
    public AudioClip lightfootstepsquick;
    public AudioClip doorSlam;
    public AudioClip doorCreak;
    public AudioClip doorBanging_1;
    public AudioClip doorBanging_2;
    public AudioClip ShowerCurtain;
    public AudioClip distortedVoice_1;
    public AudioClip distortedVoice_2;
    public AudioClip distortedVoice_3;
    public AudioClip distortedVoice_4;
    public AudioClip giggling;
    public AudioClip shuffling;

    private AudioSource source;

    private void Start()
    {
        source = GetComponent<AudioSource>();
    }

    public void PlayHeavySFX()
    {
        source.PlayOneShot(heavyfootsteps);
    }

    public void PlayLightWalkSFX()
    {
        source.PlayOneShot(lightfootsteps);
    }

    public void PlaylightRunSFX()
    {
        source.PlayOneShot(lightfootstepsquick);
    }

    public void PlayDoorSlamSFX()
    {
        source.PlayOneShot(doorSlam);
    }

    public void PlayDoorCreakSFX()
    {
        source.PlayOneShot(doorCreak);
    }

    public void PlayDoorBang1SFX()
    {
        source.PlayOneShot(doorBanging_1);
    }

    public void PlayDoorBang2SFX()
    {
        source.PlayOneShot(doorBanging_2);
    }

    public void PlayOpenShowerCurtainSFX()
    {
        source.PlayOneShot(ShowerCurtain);
    }

    public void PlayDistortedVoice1SFX()
    {
        source.PlayOneShot(distortedVoice_1);
    }

    public void PlayDistorted2VoiceSFX()
    {
        source.PlayOneShot(distortedVoice_2);
    }


    public void PlayDistorted3VoiceSFX()
    {
        source.PlayOneShot(distortedVoice_3);
    }

    public void PlayDistorted4VoiceSFX()
    {
        source.PlayOneShot(distortedVoice_4);
    }

    public void PlayGigglingSFX()
    {
        source.PlayOneShot(giggling);
    }

    public void PlayShufflingSFX()
    {
        source.PlayOneShot(shuffling);
    }
}
