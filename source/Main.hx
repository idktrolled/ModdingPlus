package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;
#if typebuild
import plugins.ExamplePlugin;
import plugins.ExamplePlugin.ExampleCharPlugin;
#end
class Main extends Sprite
{
	#if sys
	public static var cwd:String;
	#end
	public function new()
	{
		#if mobile
		#if android
		StorageUtil.requestPermissions();
		#end
		Sys.setCwd(StorageUtil.getStorageDirectory());
		#end
		#if typebuild
			// god is dead
			ExamplePlugin;
			ExampleCharPlugin;
		#end
		super();
		#if sys
		cwd = Sys.getCwd();
		#end
		addChild(new FlxGame(0, 0, #if mobile CopyState.checkExistingFiles() ? TitleState : CopyState #else TitleState #end, 1, OptionsHandler.options.fpsCap, OptionsHandler.options.fpsCap, true));
		#if !mobile
		addChild(new FPS(10, 3, 0xFFFFFF));
		addChild(new MemoryCounter(10, 3, 0xFFFFFF));
		#end
	}
}
