#=
Install a lot of usefull packages at once.
=#

Pkg.update()

packages = [
            # data
            "HDF5",
            "JLD",

            # notebook
            "IJulia",

            # pomdps / mdps / bayesnets
            "GridInterpolations",
            "LightGraphs",
            "Distributions",
            "https://github.com/sisl/BayesNets.jl.git",
            "https://github.com/sisl/ProbabilisticGraphicalModels.jl.git",
            "https://github.com/sisl/Discretizers.jl.git",
            "https://github.com/JuliaPOMDP/POMDPs.jl.git",

            # datasets
            "RDatasets",
            "DataFrames",

            # viz
            "Interact",
            "PGFPlots",
            "Colors",
            "ColorBrewer",
            "ImageMagick",
            "QuartzImageIO",
            "ImageView",
            "https://github.com/sisl/TikzPictures.jl.git",    
            "https://github.com/shashi/Reel.jl.git",        

            # python
            "NPZ",
            "PyCall",

            # automotive
            "https://github.com/sisl/Records.jl.git",
            "https://github.com/tawheeler/SmileExtra.jl.git",
            "https://github.com/tawheeler/Vec.jl.git",
            "https://github.com/tawheeler/AutomotiveDrivingModels.jl.git",
            "https://github.com/tawheeler/AutoViz.jl.git",
            "https://github.com/tawheeler/AutoScenes.jl.git",
            "https://github.com/tawheeler/ForwardNets.jl.git",
            "https://github.com/tawheeler/DynamicBayesianNetworkBehaviors.jl.git",
            "https://github.com/tawheeler/ConditionalLinearGaussianDrivers.jl.git",
            "https://github.com/wulfebw/AutoRisk.jl.git",

            ]

for p in packages
    f = contains(p, "git") ? Pkg.clone : Pkg.add
    try
        f(p)
    catch e
        println("\npackage $(p) raised exception $(e)\n")
    end
end

function get_pkg_name(name)
    if !contains(name, "git")
        return name
    else
        return replace(split(name, "/")[end], ".jl.git", "")
    end
end

# build them all
for p in packages
    pkg_name = get_pkg_name(p)
    Pkg.build(pkg_name)
end