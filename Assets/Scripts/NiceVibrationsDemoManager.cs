using UnityEngine;

public class NiceVibrationsDemoManager : MonoBehaviour
{
	protected string _debugString;

	protected string _platformString;

	protected const string _CURRENTVERSION = "1.0";

	public static NiceVibrationsDemoManager Instance
	{
		get;
		set;
	}

	protected virtual void Awake()
	{
		Instance = this;
		MMVibrationManager.iOSInitializeHaptics();
	}

	protected virtual void OnDisable()
	{
		MMVibrationManager.iOSReleaseHaptics();
	}

	public virtual void TriggerDefault()
	{
		Handheld.Vibrate();
	}

	public virtual void TriggerVibrate()
	{
		MMVibrationManager.Vibrate();
	}

	public virtual void TriggerSelection()
	{
		MMVibrationManager.Haptic(HapticTypes.Selection);
	}

	public virtual void TriggerSuccess()
	{
		MMVibrationManager.Haptic(HapticTypes.Success);
	}

	public virtual void TriggerWarning()
	{
		MMVibrationManager.Haptic(HapticTypes.Warning);
	}

	public virtual void TriggerFailure()
	{
		MMVibrationManager.Haptic(HapticTypes.Failure);
	}

	public virtual void TriggerLightImpact()
	{
		MMVibrationManager.Haptic(HapticTypes.LightImpact);
	}

	public virtual void TriggerMediumImpact()
	{
		MMVibrationManager.Haptic(HapticTypes.MediumImpact);
	}

	public virtual void TriggerHeavyImpact()
	{
		MMVibrationManager.Haptic(HapticTypes.HeavyImpact);
	}
}
