using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using DG.Tweening;

public class MenuController : MonoBehaviour
{
    public Animator anim;
    public Image fade;
    public float fadeTime;
    public GameObject credits;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    /// <summary>
    /// Player clicks start button.
    /// </summary>
    public void StartGame()
    {   
        StartCoroutine(FadeToGame());
    }

    private IEnumerator FadeToGame()
    {
        anim.SetTrigger("Toggle");
        yield return new WaitForSecondsRealtime(1f);
        fade.DOFade(1.0f, fadeTime);
        yield return new WaitForSecondsRealtime(fadeTime);
        SceneManager.LoadScene("Main");
    }

    /// <summary>
    /// Player clicks quit button.
    /// </summary>
    public void QuitGame()
    {
        UnityEditor.EditorApplication.isPlaying = false;
        Application.Quit();
    }

    /// <summary>
    /// Player clicks on credits button.
    /// </summary>
    public void ShowCredits()
    {
        if (credits.gameObject.activeInHierarchy) credits.gameObject.SetActive(false);
        else credits.gameObject.SetActive(true);
    }
}
