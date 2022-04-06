using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using DG.Tweening;

public class MenuController : MonoBehaviour
{
    public Button startButton;
    public Button quitButton;
    public Button creditsButton;
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
