using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;

public class InkExample : MonoBehaviour
{
    public TextAsset inkJSONAsset;
    private Story story;
    public Button buttonPrefab;

    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSONAsset.text);
        Refresh();
    }

    private void Refresh()
    {
        ClearUI();

        // New gameobject
        GameObject newGameObject = new GameObject("TextChunk");
        // set its transform to the canvas (this)
        newGameObject.transform.SetParent(this.transform, false);

        // Add new text component
        Text newTextObject = newGameObject.AddComponent<Text>();
        // Font size
        newTextObject.fontSize = 24;

        // Load next story block (if any)
        string text = GetNextStoryBlock();
        // Get current tags (if any)
        List<string> tags = story.currentTags;

        // If tags, use first one. Otherwise just show text
        newTextObject.text = (tags.Count > 0) ? "<color=grey>" + tags[0] + "</color> - " + text : GetNextStoryBlock();


        // Load Arial from built-in resources
        newTextObject.font = Resources.GetBuiltinResource(typeof(Font), "Arial.ttf") as Font;

        foreach (Choice choice in story.currentChoices)
        {
            Button choiceButton = Instantiate(buttonPrefab) as Button;
            choiceButton.transform.SetParent(this.transform, false);

            // Get text
            Text choiceText = choiceButton.GetComponentInChildren<Text>();
            choiceText.text = "[" + (choice.index + 1) + "]: " + choice.text;

            // Set listener
            choiceButton.onClick.AddListener(delegate
            {
                OnClickChoiceButton(choice);
            });
        }
    }

    // When click choice button, story choose that choice
    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        Refresh();
    }

    void ClearUI()
    {
        int childCount = this.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            GameObject.Destroy(this.transform.GetChild(i).gameObject);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    // Load and potentially return the next story block
    public string GetNextStoryBlock()
    {
        return story.canContinue ? story.ContinueMaximally() : "";
    }
}
