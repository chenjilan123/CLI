using System;
using System.Runtime.InteropServices;

namespace gege
{
    class Program
    {
        // ref: https://docs.microsoft.com/zh-cn/dotnet/core/deploying/deploy-with-cli
        // 发布命令
        // dotnet publish -r osx.11.0-x64

        static void Main(string[] args)
        {
            System.Console.WriteLine(Figgle.FiggleFonts.Standard.Render("Hello, World!"));

            // System.Console.WriteLine(Environment.OSVersion); //Unix 11.0.0
            // System.Console.WriteLine(RuntimeInformation.OSArchitecture); //X64
            // System.Console.WriteLine(RuntimeInformation.OSDescription); //Darwin 20.1.0 Darwin Kernel Version 20.1.0: Sat Oct 31 00:07:11 PDT 2020; root:xnu-7195.50.7~2/RELEASE_X86_64
            // System.Console.WriteLine(RuntimeInformation.RuntimeIdentifier); //osx.11.0-x64
        }
    }
}
