import qbs
import qbs.File
import qbs.FileInfo

StaticLibrary {
    name: "SDL"
    destinationDirectory: project.path + "/sysroot"

    Group {
        name: "Makefile"
        files: "Makefile"
        fileTags: ["Makefile"]
    }

    Rule {
        inputs: [ "Makefile"]
        usings: [ "staticlibrary"]

        Artifact {
            filePath: project.path + "/sysroot/lib/libSDL2.a"
            fileTags: ["staticlibrary"]
        }
        Artifact {
            filePath: project.path + "/sysroot/lib/libSDL2_image.a"
            fileTags: ["staticlibrary"]
        }
        Artifact {
            filePath: project.path + "/sysroot/lib/libSDL2_mixer.a"
            fileTags: ["staticlibrary"]
        }
//        Artifact {
//            fileName: product.destinationDirectory + "/libSDL2_ttf.a"
//            fileTags: ["staticlibrary"]
//        }

        prepare: {
            if ( File.exists( project.path + "/sysroot/lib/libSDL2.a")){
                var cmd1 = new Command("sleep", [ "1"]);
                cmd1.workingDirectory = project.path + "/SDL2";
                cmd1.description = "making SDL(skip)";
                cmd1.highlight = "compiler";
                cmd1.silent = false;
            }else{
                var cmd1 = new Command("/usr/bin/gmake", [ "_SDL"]);
                cmd1.workingDirectory = project.path + "/SDL2";
                cmd1.description = "making SDL";
                cmd1.highlight = "compiler";
                cmd1.silent = false;
            }

            if ( File.exists( project.path + "/sysroot/lib/libSDL2_image.a")){
                var cmd2 = new Command("sleep", [ "1"]);
                cmd2.workingDirectory = project.path + "/SDL2";
                cmd2.description = "making SDL_image(skip)";
                cmd2.highlight = "compiler";
                cmd2.silent = false;

            }else{
                var cmd2 = new Command("/usr/bin/gmake", [ "_SDL_image"]);
                cmd2.workingDirectory = project.path + "/SDL2";
                cmd2.description = "making SDL_image";
                cmd2.highlight = "compiler";
                cmd2.silent = false;
            }

            if ( File.exists( project.path + "/sysroot/lib/libSDL2_mixer.a")){
                var cmd3 = new Command("sleep", [ "1"]);
                cmd3.workingDirectory = project.path + "/SDL2";
                cmd3.description = "making SDL_mixer(skip)";
                cmd3.highlight = "compiler";
                cmd3.silent = false;

            }else{               
                var cmd3 = new Command("/usr/bin/gmake", [ "_SDL_mixer"]);
                cmd3.workingDirectory = project.path + "/SDL2";
                cmd3.description = "making SDL_mixer";
                cmd3.highlight = "compiler";
                cmd3.silent = false;

            }

            return [ cmd1, cmd2, cmd3];
        }
    }

    Export {
        Depends { name: "cpp" }
        cpp.systemIncludePaths: product.destinationDirectory + "/include"
        cpp.libraryPaths: product.destinationDirectory + "/lib"
//        cpp.staticLibraries: [
//            product.destinationDirectory + "/lib/libSDL2.a",
//            product.destinationDirectory + "/lib/libSDL2_image.a",
//            product.destinationDirectory + "/libSDL2_mixer.a"
//        ]
    }
}

