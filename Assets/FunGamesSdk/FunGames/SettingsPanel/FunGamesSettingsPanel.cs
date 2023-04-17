using System;
using TMPro;
using UnityEngine;

namespace FunGamesSdk.FunGames.SettingsPanel
{

    public class FunGamesSettingsPanel : MonoBehaviour
    {

        private static FunGamesSettingsPanel _instance;

        public enum ButtonStyle
        {
            WHITE_SQUARED,
            BLUE_SQUARED,
            WHITE_ROUNDED
        }

        public enum BackgroundStyle
        {
            BLUE,
            GREEN,
            WHITE
        }

        private Action _connectGiftCallback;
        private Action<bool> _vibrationCallback, _m_soundsCallback;
        private Canvas _canvas;

        /// <summary>
        ///   <para>Displays the settings dialog.</para>
        /// </summary>
        /// <param name="backgroundStyle">Color of the background.</param>
        /// <param name="buttonStyle">Color and shape of buttons.</param>
        /// <param name="sortOrder">Sort order of the canvas. (If the dialog is displayed behind one of your canvas, just increase this value)</param>
        public static Builder ShowSettingsPanel(BackgroundStyle backgroundStyle, ButtonStyle buttonStyle, int sortOrder = 10)
        {
            if (_instance == null)
            {
                throw new MissingComponentException("FunGamesSettingsPanel prefab not found in the scene.");
            }
            else
            {
                _instance._canvas.sortingOrder = sortOrder;
                return new Builder(backgroundStyle, buttonStyle);
            }
        }

        public void OnToggleAudio(SpriteSwitch switchSprite)
        {
            _m_soundsCallback.Invoke(switchSprite.IsEnabled);
        }

        public void OnToggleVibration(SpriteSwitch switchSprite)
        {
            _vibrationCallback.Invoke(switchSprite.IsEnabled);
        }

        public void OnClickConnectButton()
        {
            _connectGiftCallback.Invoke();
        }

        public void Close()
        {
            _canvas.enabled = false;
        }

        private void Awake()
        {
            if (_instance)
            {
                Destroy(gameObject);
            }
            else
            {
                _instance = this;
                _canvas = GetComponent<Canvas>();
                _canvas.enabled = false;
                DontDestroyOnLoad(gameObject);
            }
        }

        public class Builder
        {
            private Transform _soundRoot;
            private Transform _vibrationRoot;
            private SpriteSwitch _soundSwitch;
            private SpriteSwitch _vibrationSwitch;

            public Builder(BackgroundStyle backgroundStyle, ButtonStyle buttonStyle)
            {
                
                var backgroundParent = _instance.transform.Find("Root/Background");
                DisableChildren(backgroundParent);
                switch (backgroundStyle)
                {
                    case BackgroundStyle.BLUE:
                        backgroundParent.GetChild(0).gameObject.SetActive(true);
                        break;
                    case BackgroundStyle.GREEN:
                        backgroundParent.GetChild(2).gameObject.SetActive(true);
                        break;
                    case BackgroundStyle.WHITE:
                        backgroundParent.GetChild(3).gameObject.SetActive(true);
                        break;
                }
                _soundRoot = _instance.transform.Find("Root/SettingsButtons/Sound");
                _soundRoot.gameObject.SetActive(false);
                var soundButtonsRoot = _soundRoot.Find("Buttons");
                DisableChildren(soundButtonsRoot);
                switch (buttonStyle)
                {
                    case ButtonStyle.BLUE_SQUARED:
                    _soundSwitch = soundButtonsRoot.GetChild(2).GetComponent<SpriteSwitch>();
                        break;
                    case ButtonStyle.WHITE_ROUNDED:
                    _soundSwitch = soundButtonsRoot.GetChild(1).GetComponent<SpriteSwitch>();
                        break;
                    case ButtonStyle.WHITE_SQUARED:
                    _soundSwitch = soundButtonsRoot.GetChild(3).GetComponent<SpriteSwitch>();
                        break;
                }
                _soundSwitch.gameObject.SetActive(true);
                _vibrationRoot = _instance.transform.Find("Root/SettingsButtons/Haptic");
                _vibrationRoot.gameObject.SetActive(false);
                var vibrationButtonsRoot = _vibrationRoot.Find("Buttons");
                DisableChildren(vibrationButtonsRoot);
                switch (buttonStyle)
                {
                    case ButtonStyle.BLUE_SQUARED:
                        _vibrationSwitch = vibrationButtonsRoot.GetChild(2).GetComponent<SpriteSwitch>();
                        break;
                    case ButtonStyle.WHITE_ROUNDED:
                        _vibrationSwitch = vibrationButtonsRoot.GetChild(1).GetComponent<SpriteSwitch>();
                        break;
                    case ButtonStyle.WHITE_SQUARED:
                        _vibrationSwitch = vibrationButtonsRoot.GetChild(3).GetComponent<SpriteSwitch>();
                        break;
                }
                _vibrationSwitch.gameObject.SetActive(true);
                switch (buttonStyle)
                {
                    case ButtonStyle.BLUE_SQUARED:
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/Twitter"), 0);
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/Instagram"), 0);
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/TapNation"), 0);
                        break;
                    case ButtonStyle.WHITE_ROUNDED:
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/Twitter"), 1);
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/Instagram"), 1);
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/TapNation"), 1);
                        break;
                    case ButtonStyle.WHITE_SQUARED:
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/Twitter"), 2);
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/Instagram"), 2);
                        EnableSpecificChild(_instance.transform.Find("Root/ConnectButtons/TapNation"), 2);
                        break;
                }
                _instance._canvas.enabled = true;
            }

            /// <summary>
            ///   <para>Displays the sound toggle in the dialog.</para>
            /// </summary>
            /// <param name="currentState">Is the sound of your game currently enabled ?</param>
            /// <param name="soundsCallback">This callback is called when the toggle is set to on or off. Here you can put the code that enables or disables the sound of your game.</param>
            public Builder DisplaySoundToggle(bool currentState, Action<bool> soundsCallback)
            {
                _soundRoot.gameObject.SetActive(true);
                _instance._m_soundsCallback = soundsCallback;
                if (_soundSwitch.IsEnabled != currentState)
                {
                    _soundSwitch.SwitchSprite();
                }
                return this;
            }

            /// <summary>
            ///   <para>Displays the vibration toggle in the dialog.</para>
            /// </summary>
            /// <param name="currentState">Is the vibration of your game currently enabled ?</param>
            /// <param name="vibrationCallback">This callback is called when the toggle is set to on or off. Here you can put the code that enables or disables vibrations of your game.</param>
            public Builder DisplayVibrationToggle(bool currentState, Action<bool> vibrationCallback)
            {
                _vibrationRoot.gameObject.SetActive(true);
                _instance._vibrationCallback = vibrationCallback;
                if (_vibrationSwitch.IsEnabled != currentState)
                {
                    _vibrationSwitch.SwitchSprite();
                }
                return this;
            }

            /// <summary>
            ///   <para>Displays the vibration toggle in the dialog.</para>
            /// </summary>
            /// <param name="connectGiftCallback">This callback is called when a connect button is clicked. Here you can put the code that gifts the player, to encourage him clicking.</param>
            public Builder ConnectGiftButton(Action connectGiftCallback)
            {
                _instance._connectGiftCallback = connectGiftCallback;
                
                return this;
            }

            private void EnableSpecificChild(Transform transform, int childIndex)
            {
                DisableChildren(transform);
                transform.GetChild(childIndex).gameObject.SetActive(true);
            }

            private void DisableChildren(Transform transform)
            {
                for (int index = 0; index < transform.childCount; index++)
                {
                    transform.GetChild(index).gameObject.SetActive(false);
                }
            }

        }

    }

}

