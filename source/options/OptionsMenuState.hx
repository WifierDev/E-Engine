package options;

import flixel.system.replay.FlxReplay;
import Controls.KeyboardScheme;
import Controls.Control;
import Section.SwagSection;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import Song.SwagSong;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.FlxSubState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import MusicBeatState;

using StringTools;

class OptionsMenuState extends MusicBeatState
{
	var curSelected:Int = 0;
	var BG:FlxSprite;
    var optionsCats:Array<String> = ['Visuals And UI', 'Gameplay', 'Controls'];

	var grpOptionsCats:FlxTypedGroup<Alphabet>;
	override function create(){
        BG = new FlxSprite().loadGraphic(Paths.image('menuBG'));
        BG.screenCenter();
        add(BG);
        grpOptionsCats = new FlxTypedGroup<Alphabet>();
		add(grpOptionsCats);
        for(i in 0...optionsCats.length){
			var optionsText:Alphabet = new Alphabet(0, (i + 1) * 100, optionsCats[i], true, false);
			optionsText.isMenuItem = true;
			optionsText.targetY = i;
			grpOptionsCats.add(optionsText);
		}
		super.create();
        }

	override function update(elapsed:Float)
	{
		super.update(elapsed);

			if (controls.BACK) {
				FlxG.switchState(new MainMenuState());
				OptionsData.initSave();
            }
			if (controls.UP_P)
				changeSelection(-1);
			if (controls.DOWN_P)
				changeSelection(1);

			if (controls.ACCEPT)
			{
				switch(curSelected)
				{
					case 0:
					FlxG.switchState(new VisualsOptionsMenu());
                    case 1:
                    FlxG.switchState(new GameplayOptionsMenu());
                    case 2:
                    FlxG.switchState(new ControlsOptionsMenu());
                    }
				}
		FlxG.save.flush();
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpOptionsCats.length - 1;
		if (curSelected >= grpOptionsCats.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptionsCats.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.3;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}

class VisualsOptionsMenu extends MusicBeatState
{
	var curSelected:Int = 0;

	var options:Array<Option> = [
		new DownscrollOption(),
	];
    var menuBG:FlxSprite;

	private var groupOpts:FlxTypedGroup<Alphabet>;
	override function create()
	{
        menuBG = new FlxSprite().loadGraphic(Paths.image('menuBG'));
		menuBG.screenCenter();
		add(menuBG);

		groupOpts = new FlxTypedGroup<Alphabet>();
		add(groupOpts);
		for (i in 0...options.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getDisplay(), true, false);
			controlLabel.isMenuItem = true;
			controlLabel.targetY = i;

            groupOpts.add(controlLabel);
		}
		super.create();
        changeSelection();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

			if (controls.BACK)
				FlxG.switchState(new OptionsMenuState());
			if (controls.UP_P)
				changeSelection(-1);
			if (controls.DOWN_P)
				changeSelection(1);

			if (controls.ACCEPT)
			{
				if (options[curSelected].press()) {
					groupOpts.remove(groupOpts.members[curSelected]);
					var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, options[curSelected].getDisplay(), true, false);
					ctrl.isMenuItem = true;
					groupOpts.add(ctrl);
				}
			}
		FlxG.save.flush();
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = groupOpts.length - 1;
		if (curSelected >= groupOpts.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in groupOpts.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.3;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}

class GameplayOptionsMenu extends MusicBeatState
{
	var curSelected:Int = 0;

	var options:Array<Option> = [
		new NewInputOption(),
		new GhostTappingOption(),
	];
    var menuBG:FlxSprite;

	private var groupOpts:FlxTypedGroup<Alphabet>;
	override function create()
	{
        menuBG = new FlxSprite().loadGraphic(Paths.image('menuBG'));
		menuBG.screenCenter();
		add(menuBG);

		groupOpts = new FlxTypedGroup<Alphabet>();
		add(groupOpts);
		for (i in 0...options.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getDisplay(), true, false);
			controlLabel.isMenuItem = true;
			controlLabel.targetY = i;

            groupOpts.add(controlLabel);
		}
		super.create();
        changeSelection();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

			if (controls.BACK)
				FlxG.switchState(new OptionsMenuState());
			if (controls.UP_P)
				changeSelection(-1);
			if (controls.DOWN_P)
				changeSelection(1);

			if (controls.ACCEPT)
			{
				if (options[curSelected].press()) {
					groupOpts.remove(groupOpts.members[curSelected]);
					var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, options[curSelected].getDisplay(), true, false);
					ctrl.isMenuItem = true;
					groupOpts.add(ctrl);
				}
			}
		FlxG.save.flush();
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = groupOpts.length - 1;
		if (curSelected >= groupOpts.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in groupOpts.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.3;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}

class ControlsOptionsMenu extends MusicBeatState
{
	var curSelected:Int = 0;
    public static var instance:ControlsOptionsMenu;

	var options:Array<Option> = [
		new DFJKOption(controls),
	];
    var menuBG:FlxSprite;
    public var acceptInput:Bool = true;

	private var groupOpts:FlxTypedGroup<Alphabet>;
	override function create()
	{
        menuBG = new FlxSprite().loadGraphic(Paths.image('menuBG'));
		menuBG.screenCenter();
		add(menuBG);

		groupOpts = new FlxTypedGroup<Alphabet>();
		add(groupOpts);
		for (i in 0...options.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getDisplay(), true, false);
			controlLabel.isMenuItem = true;
			controlLabel.targetY = i;

            groupOpts.add(controlLabel);
		}
		super.create();
        instance = this;
        changeSelection();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

			if (controls.BACK)
				FlxG.switchState(new OptionsMenuState());
			if (controls.UP_P)
				changeSelection(-1);
			if (controls.DOWN_P)
				changeSelection(1);

			if (controls.ACCEPT)
			{
				if (options[curSelected].press()) {
					groupOpts.remove(groupOpts.members[curSelected]);
					var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, options[curSelected].getDisplay(), true, false);
					ctrl.isMenuItem = true;
					groupOpts.add(ctrl);
				}
			}
		FlxG.save.flush();
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = groupOpts.length - 1;
		if (curSelected >= groupOpts.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in groupOpts.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.3;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}

class Option
{
	public function new()
	{
		display = updateDisplay();
	}

	private var display:String;
	public final function getDisplay():String
	{
		return display;
	}

	// Returns whether the label is to be updated.
	public function press():Bool { return throw "stub!"; }
	public function pressL():Bool { return throw "stub!"; }
	public function pressR():Bool { return throw "stub!"; }
	private function updateDisplay():String { return throw "stub!"; }
}

class DownscrollOption extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.downscroll = !FlxG.save.data.downscroll;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return FlxG.save.data.downscroll ? "Downscroll" : "Upscroll";
	}
}

class DFJKOption extends Option
{
	private var controls:Controls;

	public function new(controls:Controls)
	{
		super();
		this.controls = controls;
	}

	public override function press():Bool
	{
		ControlsOptionsMenu.instance.openSubState(new KeyBindMenu());
		return false;
	}

	private override function updateDisplay():String
	{
		return "Key Bindings";
	}
}

class GhostTappingOption extends Option{
	public override function press():Bool{
		FlxG.save.data.ghosttapping = !FlxG.save.data.ghosttapping;
		display = updateDisplay();
		return true;
	}

	override function updateDisplay():String{
		return FlxG.save.data.ghosttapping ? "Also Ghost Tapping" : "Ghost Tapping";
	}
}

class NewInputOption extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.newInput = !FlxG.save.data.newInput;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return !FlxG.save.data.newInput ? "Broken Input" : "New Input";
	}
}

class OptionsData
{
	public static function initSave()
		{
			if (FlxG.save.data.newInput == null)
				FlxG.save.data.newInput = true;
	
			if (FlxG.save.data.downscroll == null)
				FlxG.save.data.downscroll = false;

            if (FlxG.save.data.dfjk == null)
				FlxG.save.data.dfjk = false;

			if (FlxG.save.data.ghosttapping == null)
				FlxG.save.data.ghosttapping = true;
		}
}