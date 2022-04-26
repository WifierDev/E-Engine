package notes;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxTween;
import Section.SwagSection;
import Song.SwagSong;
import editors.ChartingState;
import PlayState;

using StringTools;

class StrumNote extends FlxSprite
{
	public var resetAnim:Float = 0;
	private var noteData:Int = 0;
	public var sustainReduce:Bool = true;
	
	private var player:Int;
	
	public var texture(default, set):String = null;
	private function set_texture(value:String):String {
		if(texture != value) {
			texture = value;
			reloadNote();
		}
		return value;
	}

	public function new(x:Float, y:Float, leData:Int, player:Int) {
		noteData = leData;
		this.player = player;
		this.noteData = leData;
		super(x, y);

		var skin:String = 'ronhell';
		if(PlayState.SONG.arrowSkin != null && PlayState.SONG.arrowSkin.length > 1 && player != 1)
		skin = PlayState.SONG.arrowSkin;
		texture = skin;

		scrollFactor.set();
	}

	public function reloadNote()
	{
		var lastAnim:String = null;
		updateHitbox();
        if(animation.curAnim != null) lastAnim = animation.curAnim.name;

		if(lastAnim != null)
		{
			playAnim(lastAnim, true);
		}
	}

	public function postAddedToGroup() {
		playAnim('static');
		x += Note.swagWidth * noteData;
		x += 50;
		x += ((FlxG.width / 2) * player);
		ID = noteData;
	}

	override function update(elapsed:Float) {
		if(resetAnim > 0) {
			resetAnim -= elapsed;
			if(resetAnim <= 0) {
				playAnim('static');
				resetAnim = 0;
			}
		}
		super.update(elapsed);
	}

	public function playAnim(anim:String, ?force:Bool = false) {
        animation.play(anim, force);
		centerOffsets();
		centerOrigin();
		if(animation.curAnim.name == 'confirm')
		centerOrigin();
		}
	}
