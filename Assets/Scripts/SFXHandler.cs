using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SFXHandler : MonoBehaviour
{
    public AudioClip adultWalking;
    public AudioClip adultRunning;
    public AudioClip childWalking;
    public AudioClip childRunning;
    public AudioClip doorSlam;
    public AudioClip doorCreak;
    public AudioClip openShowerCurtain;
    public AudioClip closeShowerCurtain;
    public AudioClip distortedVoice;
    public AudioClip whispering;
    public AudioClip giggling;
    public AudioClip shuffling;

    private AudioSource source;

    private void Start()
    {
        source = GetComponent<AudioSource>();
    }

    public void PlayAdultWalkSFX()
    {
        source.PlayOneShot(adultWalking);
    }

    public void PlayAdultRunSFX()
    {
        source.PlayOneShot(adultRunning);
    }

    public void PlayChildWalkSFX()
    {
        source.PlayOneShot(childWalking);
    }

    public void PlayChildRunSFX()
    {
        source.PlayOneShot(childRunning);
    }

    public void PlayDoorSlamSFX()
    {
        source.PlayOneShot(doorSlam);
    }

    public void PlayDoorCreakSFX()
    {
        source.PlayOneShot(doorCreak);
    }

    public void PlayOpenShowerCurtainSFX()
    {
        source.PlayOneShot(openShowerCurtain);
    }

    public void PlayCloseShowerCurtainSFX()
    {
        source.PlayOneShot(closeShowerCurtain);
    }

    public void PlayDistortedVoiceSFX()
    {
        source.PlayOneShot(distortedVoice);
    }

    public void PlayWhisperingSFX()
    {
        source.PlayOneShot(whispering);
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
