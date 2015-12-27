shopt -s globstar;
	for d in **/*/; do touch -- "$d/$1"; done

