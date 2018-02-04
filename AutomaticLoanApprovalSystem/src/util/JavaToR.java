package util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.rosuda.JRI.Rengine;



public class JavaToR {

	public void TrainMachine(String[] args) throws IOException {
		Rengine engine = new Rengine(args, false, null);
		Path path = Paths.get("C:\\Users\\Vishal\\Documents\\Train.R");
		List<String> lines=Files.readAllLines(path);
		lines.stream().forEach((line)->{engine.eval("s<-"+line);});
		String s = engine.eval("s").asString();
		System.out.println(s);
	}
	
	public void ValidateFromMachine(String[] args) throws IOException {
		Rengine engine = new Rengine(args, false, null);
		Path path = Paths.get("C:\\Users\\Vishal\\Documents\\Validate.R");
		List<String> lines=Files.readAllLines(path);
		lines.stream().forEach((line)->{engine.eval("s<-"+line);});
		String s = engine.eval("s").asString();
		System.out.println(s);
	}
	
	public static void main(String args[]) throws IOException
	{
		JavaToR jtr = new JavaToR();
		jtr.TrainMachine(null);
	}
}
