//script to change the text objects accordingly
//feel free to steal

#include "lib/std.mi"

Global Container containerPL;
Global Layout layoutPLNormal;
Global Layer ext;

Global group WasabiFrameGroup;

global text filenamedisplay, filetypedisplay, hz, kbps;

Global Function refreshPlInfo();

System.onScriptLoaded() {
  containerPL = System.getContainer("PLEdit");

	layoutPLNormal = containerPL.getLayout("normalpl");

	WasabiFrameGroup = layoutPLNormal.findObject("pldir");

	ext = WasabiFrameGroup.getObject("exticon");
	filenamedisplay = WasabiFrameGroup.getObject("filename");
	filetypedisplay = WasabiFrameGroup.getObject("filetype");
	hz = WasabiFrameGroup.getObject("samplerate");
	kbps = WasabiFrameGroup.getObject("bitrate");

	refreshPlInfo();
}

System.onTitleChange(String newtitle) {
	refreshPlInfo();		
}

refreshPlInfo(){
	filenamedisplay.setXmlParam("text", System.removePath(System.getPlayItemString()));
	filetypedisplay.setXmlParam("text", system.getDecoderName(system.getPlayItemString()));
	//hz.setXmlParam("text", "Samplerate: "+System.getPlayItemMetaDataString("srate")+ "hz");
	//kbps.setXmlParam("text", "Bitrate: "+System.getPlayItemMetaDataString("vbr")+"kbps");

	//get file extension
	String extension = System.getExtension(System.removePath(System.getPlayItemString()));

	//change icon according to file extension
	if(extension == "flac"){
		ext.setXmlParam("image", "pl.icon.flac");
	}else if(extension == "mp3"){
		ext.setXmlParam("image", "pl.icon.mp3");
	}else if(extension == "wav"){
		ext.setXmlParam("image", "pl.icon.wav");
	}else if(extension == "mid" || extension == "midi"){
		ext.setXmlParam("image", "pl.icon.midi");
	}else if(extension == "mp4" || extension == "avi"){
		ext.setXmlParam("image", "pl.icon.video");
	}else if(extension == "sid"){
		ext.setXmlParam("image", "pl.icon.sid");
	}else{
		ext.setXmlParam("image", "pl.icon.generic");
	}
}
