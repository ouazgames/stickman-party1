using UnityEngine;
using UnityEngine.UI;

#pragma warning disable 0649

namespace FunGamesSdk.FunGames.SettingsPanel
{
    public class SpriteSwitch : MonoBehaviour
    {
        [SerializeField] private Sprite onSprite; 
        [SerializeField] private Sprite offSprite;

        public bool IsEnabled { get; private set; } = true;

        private Image _imageComponent;

        private void Awake()
        {
            UpdateSprite();
        }

        public void SwitchSprite()
        {
            IsEnabled = !IsEnabled;
            
            UpdateSprite();
        }

        private void UpdateSprite()
        {
            GetImageComponent().sprite = IsEnabled ? onSprite : offSprite;
        }

        private Image GetImageComponent()
        {
            if (!_imageComponent)
            {
                _imageComponent = GetComponent<Image>();
            }
            return _imageComponent;
        }
    }
}
