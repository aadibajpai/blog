# Options must be validated before this code is run. Some dependencies are only
# necessary if certain features are enabled.

################################################################################
# define programs and options to pass to them
################################################################################
M4="$(which m4)"
M4_FLAGS="--prefix-builtins"
MAKE="$(which make)"
MAKE_FLAGS="-j 8 --makefile internal/Makefile --quiet"
MKDIR="$(which mkdir)"
MKDIR_FLAGS="-p"
GPG="$(which gpg)"
GPG_SIGN_FLAGS="--yes --armor --detach-sign --local-user ${GPG_FINGERPRINT}"
GPG_EXPORT_FLAGS="--armor --export ${GPG_FINGERPRINT}"
RM="rm"
RM_FLAGS="-fr"
# have nix installed cmark-gfm
# there are also cmark-gfm binaries built for linux and macOS in internal/
MARKDOWN="$(which cmark-gfm)"
# if no cmark-gfm, fallback to the binary
: "${MARKDOWN:="./internal/cmark-gfm"}"
# --unsafe is needed in order to render manually-entered HTML when generating
# the table of contents. If you do not trust the markdown-formatted text
# content of your blog (i.e. it isn't written by you), then it probably is not
# safe to use the --unsafe flag.
MARKDOWN_FLAGS="--unsafe -e footnotes -e table -e strikethrough -e autolink -e tagfilter -e tasklist"

################################################################################
# check for always required programs
################################################################################
[ ! -x "${MARKDOWN}" ] && echo "error: cmark-gfm not found" && exit 1
[ ! -x "${MAKE}" ] && echo "error: make not found" && exit 1
[ ! -x "${M4}" ]  && echo "error: m4 not found" && exit 1

################################################################################
# check for programs that are only sometimes needed
################################################################################
if [[ "${GPG_SIGN_PAGES}" == "yes" ]]
then
	[ ! -x "${GPG}" ] &&
		echo "error: gpg not found" &&
		exit 1
fi

