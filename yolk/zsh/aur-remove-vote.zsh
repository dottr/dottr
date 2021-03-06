# Remove given package(s) 
# If the package is in the local installed packages (e.g. AUR)
# checks if you voted for it and prompts for unvoting it 
# prefix of subfunctions: "arv_" for aur-remove-vote
# Query local packages is much faster than pacman -Si

aur-remove-vote() { 
	if (( $# == 0 )); then
		echo "No parameter given"
		echo "Usage: $0 packet [packet2, ...]"
		return 1
	fi
	
	echo "yaourt -Rns: Removes package, its configurations + dependencies; yaourt -Rns"
	
	local args=($@)
	local aur pack removal

	for pack in $(pacman -Qem | awk '{print $1}'); do aur+=("$pack"); done

	yaourt -Rns "$@";
	for removal in $args; do
		for pack in $aur; do
			if [[ "$pack" == "$removal" ]]; then
				arv_prompt-vote "$removal"
				break 
			fi
		done
	done

	return 0
}

arv_prompt-vote() {
	local ans
	local removal="$1"
	if aurvote -c "$removal" | grep -q already; then
		read "ans?You already voted for ${removal}. Unvote? [Y/n] "
		if [[ $ans != 'N' && $ans != 'n' ]]; then
			echo -n "Unvoting "
			aurvote -u "$removal"
		fi
	else
		read "ans?Would you advise ${removal} and vote it anyhow? [y/N] "
		if [[ $ans == 'Y' || $ans == 'y' ]]; then
			echo -n "Voting "
			aurvote -v "$removal"
		fi
	fi
	
	return 0
}
