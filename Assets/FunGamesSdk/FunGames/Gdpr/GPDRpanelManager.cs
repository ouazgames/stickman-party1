using System;
using UnityEngine;
using UnityEngine.UI;

public class GPDRpanelManager : MonoBehaviour
{
    public static GPDRpanelManager _instance;
    public Button PlayButton;
    private int activeButton = 0;

    private void Awake()
    {
        if (_instance == null)
        {
            _instance = this;
            DontDestroyOnLoad(this.gameObject);
        }
        else
        {
            Destroy(this);
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void ValidateGDPR()
    {
        ValidateCallback();
        gameObject.SetActive(false);
    }

    public void CheckToggle(bool value)
    {
        activeButton += value ? 1 : -1;
        if(activeButton == 3)
        {
            PlayButton.interactable = true;
        }
        else
        {
            PlayButton.interactable = false;
        }
    }

    public Action ValidateCallback;
}
