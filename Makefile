build:
	pnpm start

serve:
	while true; do \
		pnpm start || exit 1; \
		python3 -m http.server -d . 8080 & \
		SERVER_PID=$$!; \
		inotifywait -e modify,create,delete,move -r ./index.md; \
		kill $$SERVER_PID; \
	done

ext:
	rm -f ./ext.zip
	7z a extension.zip ../extension/
