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
        StartCoroutine(QuitOut());       
    }

    private IEnumerator QuitOut()
    {
        yield return new WaitForSecondsRealtime(1.5f);
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
