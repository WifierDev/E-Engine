package;

import HealthIcon.CreditsIcon;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;

class CreditsMenuState extends MusicBeatState
{
   var creditsPpl = CoolUtil.coolTextFile(Paths.txt('creditsPeople')); 
   var descs = CoolUtil.coolTextFile(Paths.txt('creditsDescs'));
   var pplArray:Array<Modders> = [];
   private var groupCredits:FlxTypedGroup<Alphabet>;
   var bg:FlxSprite;
   var curSelected:Int = 0;
   private var iconArray:Array<HealthIcon> = [];
   var descBG:FlxSprite;
   var descText:FlxText;

   override function create(){
       bg = new FlxSprite().loadGraphic(Paths.image('menuBG'));
       bg.screenCenter();
       add(bg);
       descBG = new FlxSprite(300, 30).makeGraphic(550, 500, FlxColor.BLACK);
       descBG.screenCenter();
       descBG.offset.x -= 290;
       descBG.alpha = 0.6;
       add(descBG);
       descText = new FlxText(FlxG.width * 0.7, 10, 0, "", 32);
       descText.setFormat(Paths.font("cool.ttf"), 40, FlxColor.WHITE, RIGHT);
       descText.screenCenter();
       descText.offset.x -= 130;
       add(descText);
    for (i in 0...creditsPpl.length)
		{
			var leCreditsPplArray:Array<String> = creditsPpl[i].split(':');
			pplArray.push(new Modders(leCreditsPplArray[0], leCreditsPplArray[1]));
		}
        groupCredits = new FlxTypedGroup<Alphabet>();
		add(groupCredits);
        for (i in 0...pplArray.length)
            {
                var pplText:Alphabet = new Alphabet(0, (70 * i) + 30, pplArray[i].modderName, true, false);
                pplText.isMenuItem = true;
                pplText.targetY = i;
                groupCredits.add(pplText);

                var icon:HealthIcon = new HealthIcon(pplArray[i].modderIcon);
			    icon.sprTracker = pplText;

			    iconArray.push(icon);
			    add(icon);
            }
            changeSelection();
   super.create();
   }

   function changeSelection(change:Int = 0) {
    curSelected += change;
    if (curSelected < 0)
        curSelected = pplArray.length - 1;
    if (curSelected >= pplArray.length)
        curSelected = 0;

    var bullShit:Int = 0;

    for (item in groupCredits.members) {
        item.targetY = bullShit - curSelected;
        bullShit++;
        item.alpha = 0.6;
        if (item.targetY == 0) {
            item.alpha = 1;
        }
    }
    FlxG.sound.play(Paths.sound('scrollMenu'));
}

   override function update(elapsed:Float){
    if (FlxG.keys.justPressed.UP) {
        changeSelection(-1);
    }
    if (FlxG.keys.justPressed.DOWN) {
        changeSelection(1);
    }
    if(controls.BACK){
        FlxG.switchState(new MainMenuState());
    }
    if(controls.ACCEPT){
        switch(curSelected)
            {
                case 0:
                    FlxG.openURL("https://www.youtube.com/channel/UC4X_UAuj9BOpHgBHo8TvWoQ");
                case 1:
                    FlxG.openURL("https://www.youtube.com/channel/UCs4sZ0YkVdVZqdLiO3PpbLQ");
                case 2:
                    FlxG.openURL("https://www.youtube.com/channel/UCS2pLSKwwHJrwCRrnWZqfUw");
                case 3:
                    FlxG.openURL("https://search.brave.com/images?q=cool%20person");
                case 4:
                    FlxG.openURL("https://discord.gg/ysYaqgUkFs");
                case 5:
                    FlxG.openURL("https://imgs.search.brave.com/5Dc3ryfjjwMhKOHDcaALZcKwzLxKygEsCmXHzbAsFaA/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vdHVubmVs/MnRlY2guY29tL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE5LzA3/L3dvcmQtaW1hZ2Uu/cG5nP2ZpdD0xNjY3/JTJDMTY2NyZzc2w9/MQ");
                case 6:
                    FlxG.openURL("https://twitter.com/ninja_muffin99");
    }
}
   super.update(elapsed);
   descText.text = descs[curSelected].toUpperCase();
}
}
class Modders
{
	public var modderName:String = "";
	public var modderIcon:String = "";

	public function new(name:String, modderIcon:String)
	{
		this.modderName = name;
		this.modderIcon = modderIcon;
	}
}