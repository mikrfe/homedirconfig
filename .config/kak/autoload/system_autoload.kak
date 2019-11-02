evaluate-commands %sh{
    autoload_directory() {
        find -L "$1" -type f -name '*\.kak' \
            | sed 's/.*/try %{ source "&" } catch %{ echo -debug Autoload: could not load "&" }/'
    }
    if [ -d "${kak_runtime}/autoload" ]; then
        autoload_directory "${kak_runtime}/autoload"
    fi
}
