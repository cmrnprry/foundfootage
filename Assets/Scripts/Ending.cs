using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class Ending : MonoBehaviour
{
    public Animator anim;
    public AudioSource source;


    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(End());
    }
    
    private IEnumerator End()
    {
        print("start");
        yield return new WaitForSecondsRealtime(15F);
        print("play");
        anim.gameObject.SetActive(true);
        anim.SetTrigger("Toggle");
        yield return new WaitForSecondsRealtime(3f);
        source.Play();
        print("audio");
        yield return new WaitForSecondsRealtime(1f);

        SceneManager.LoadScene("StartGame");
    }
}
