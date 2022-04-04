using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using TMPro;
using UnityEngine.UI;
using System;
using UnityEngine.SceneManagement;

public class ProcessInkText : MonoBehaviour
{
    // Ink stuff
    public TextAsset inkJSONAsset;
    private Story story;
    private List<string> currentTags = new List<string>();
    private List<Choice> currentChoices = new List<Choice>();


    [Header("Art")]
    public GameObject background;
    public Transform itemSpawnLayout;
    public Animator anim;


    // Buttons for choosing choices
    [Header("Prefabs")]
    public Transform buttonSpawnLayout;
    public Transform textSpawnLayout;
    public Button buttonPrefab = null;
    public TextMeshProUGUI textPrefab = null;

    // Ref to ShowNextLine()
    private Coroutine showNextLineRoutine;

    // Don't detect click when making a choice
    private bool makingChoice;

    // Text boxes to put text in
    [Header("TextBoxes")]
    public TextMeshProUGUI friendTextBox;
    public GameObject friend;
    public TextMeshProUGUI otherTextBox;
    public GameObject other;
    public TextMeshProUGUI commentsTextBox;
    public GameObject comments;

    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSONAsset.text);
        makingChoice = false;
        friend.SetActive(false);
        other.SetActive(false);
        showNextLineRoutine = StartCoroutine(ShowNextLine());
    }

    /// <summary>
    /// Shows next line of dialogue.
    /// </summary>
    /// <returns>Some Coroutine junk</returns>
    private IEnumerator ShowNextLine()
    {
        string nextLine = GetNextStoryBlock();
        nextLine = nextLine.Trim();
        currentTags = story.currentTags;
        currentChoices = story.currentChoices;

        if (currentTags.Contains("friend"))
        {
            friend.SetActive(true);
            friendTextBox.text = nextLine;
        }
        if (currentTags.Contains("other"))
        {
            other.SetActive(true);
            otherTextBox.text = nextLine;
        }
        HandleAVTags();
        if (nextLine == "")
        {
            makingChoice = true;
            CheckChoices();

            friend.SetActive(false);
            other.SetActive(false);
        }

        yield return null;
        showNextLineRoutine = null;
    }

    /// <summary>
    /// Handle tags that change audio or visuals.
    /// </summary>
    private void HandleAVTags()
    {
        string[] tagArr;
        foreach (string tag in currentTags)
        {
            if (tag.StartsWith("background"))
            {
                tagArr = tag.Split(':');
                string bg = tagArr[1];
                ChangeBackground(bg);
            }
            if (tag.StartsWith("SFX"))
            {
                tagArr = tag.Split(':');
                string sfx = tagArr[1];
                PlaySFX(sfx);
            }
            if (tag.StartsWith("anim"))
            {
                tagArr = tag.Split(':');
                string anim = tagArr[1];
                PlayAnim(anim);
            }
            if (tag.StartsWith("item"))
            {
                tagArr = tag.Split(':');
                string item = tagArr[1];
                ShowItem(item);
            }
        }
    }

    private void ShowItem(string item)
    {
        Debug.Log("Showing item " + item);
    }

    private void PlayAnim(string anim)
    {
        Debug.Log("Playing anim " + anim);
    }

    private void PlaySFX(string sfx)
    {
        Debug.Log("Playing sound " + sfx);
    }

    private void ChangeBackground(string background)
    {
        Debug.Log("Changing background to " + background);
    }

    /// <summary>
    /// Checks what choices are available and creates/assigns buttons to them.
    /// </summary>
    void CheckChoices()
    {
        if (story.currentChoices.Count > 0)
        {
            for (int i = 0; i < story.currentChoices.Count; i++)
            {
                Choice choice = story.currentChoices[i];
                Button button = CreateChoiceView(choice.text.Trim());

                // Tell the button what to do when we press it
                button.onClick.AddListener(delegate
                {
                    OnClickChoiceButton(choice);
                });
            }

            comments.SetActive(true);
        }
        else
        {
            EndGame();
        }

    }

    /// <summary>
    /// When the player finishes the game.
    /// </summary>
    private void EndGame()
    {
        SceneManager.LoadScene("Ending");
    }

    /// <summary>
    /// When you click a button.
    /// </summary>
    /// <param name="choice"></param>
    private void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);

        SetChoiceText(choice.text);

        RemoveButtons();
        makingChoice = false;
        comments.SetActive(false);
        StartCoroutine(ShowNextLine());
    }

    /// <summary>
    /// Removes all buttons once a choice is made.
    /// </summary>
    private void RemoveButtons()
    {
        foreach (Transform child in buttonSpawnLayout.transform)
        {
            GameObject.Destroy(child.gameObject);
        }
    }

    /// <summary>
    /// Creates a choice button.
    /// </summary>
    /// <param name="text">Text to put on button</param>
    /// <returns></returns>
    private Button CreateChoiceView(string text)
    {
        Button choice = Instantiate(buttonPrefab) as Button;

        choice.transform.SetParent(buttonSpawnLayout, false);

        // Gets the text from the button prefab
        TextMeshProUGUI choiceText = choice.GetComponentInChildren<TextMeshProUGUI>();
        choiceText.text = text;

        return choice;
    }

    private void SetChoiceText(string text)
    {
        TextMeshProUGUI choice = Instantiate(textPrefab) as TextMeshProUGUI;

        choice.transform.SetParent(textSpawnLayout, false);
        choice.text = text;
    }

    // Gets next story line if possible
    private string GetNextStoryBlock()
    {
        return story.canContinue ? story.Continue() : "";
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0) && !makingChoice)
        {
            if (showNextLineRoutine == null)
            {
                showNextLineRoutine = StartCoroutine(ShowNextLine());
            }
        }
    }
}
