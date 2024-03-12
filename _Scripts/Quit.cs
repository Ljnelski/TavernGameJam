using Godot;
using System;

public partial class Quit : Node
{
	
	private Button _button;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_button = GetNode<Button>("QuitButton");
	}
		
	private void QuitGame() 
	{
		GetTree().Root.PropagateNotification((int)NotificationWMCloseRequest);
		GetTree().Quit();
	}
	
	public void OnQuitButtonPressed()
	{		
		GD.Print("OnQuitButtonPressed");
		QuitGame();
	}	
}


