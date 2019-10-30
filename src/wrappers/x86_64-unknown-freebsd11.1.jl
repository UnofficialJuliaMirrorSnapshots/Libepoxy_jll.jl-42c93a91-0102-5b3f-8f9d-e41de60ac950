# Autogenerated wrapper script for Libepoxy_jll for x86_64-unknown-freebsd11.1
export libepoxy

using Libglvnd_jll
using Xorg_libX11_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libepoxy`
const libepoxy_splitpath = ["lib", "libepoxy.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libepoxy_path = ""

# libepoxy-specific global declaration
# This will be filled out by __init__()
libepoxy_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libepoxy = "libepoxy.so.0"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Libglvnd_jll.PATH_list, Xorg_libX11_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Libglvnd_jll.LIBPATH_list, Xorg_libX11_jll.LIBPATH_list,))

    global libepoxy_path = abspath(joinpath(artifact"Libepoxy", libepoxy_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libepoxy_handle = dlopen(libepoxy_path)
    push!(LIBPATH_list, dirname(libepoxy_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

