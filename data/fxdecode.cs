using System;
using System.Linq;
using System.Collections.Generic;
using System.IO;
using System.Text;

public class SoundBankSplitter
{
    private static void ConsoleWriteColour(ConsoleColor colour, string message)
    {
        var cachedColour = Console.ForegroundColor;
        Console.ForegroundColor = colour;
        Console.WriteLine(message);
        Console.ForegroundColor = cachedColour;
    }

    private static void ConsoleWarn(string warning)
    {
        ConsoleWriteColour(ConsoleColor.DarkYellow, warning);
    }

    private static int ConsoleError(string error, int errorNumber)
    {
        ConsoleWriteColour(ConsoleColor.Red, error);
        return errorNumber;
    }

    public static int Main(string[] args)
    {
        if (args.Length < 1)
        {
            return ConsoleError("Usage: fxdecode <fx file>", 1);
        }

        var inputFile = args[0];
        if (!File.Exists(inputFile))
        {
            return ConsoleError("Specified file could not be opened.", 2);
        }

        var bytes = File.ReadAllBytes(inputFile);
        var i = 0;
        while(i < bytes.Length) {
            var f = bytes[i];
            Console.Write($"Vol: {f&15} ");
            i ++;
            if ((f & 0x20) != 0) {
                Console.Write($"Tone: {bytes[i] + bytes[i+1] * 256} ");
                i+= 2;
            }
            if ((f & 0x40) != 0) {
                Console.Write($"Noise: {bytes[i] & 15} ");
                ++i;
            }
            Console.WriteLine("");
        }
        return 0;
    }
}
