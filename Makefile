adb-restart:
	adb kill-server
	adb start-server

apply-lint:
	dart fix --dry-run
	dart fix --apply

basic-tests:
	dart format --set-exit-if-changed . -l 150
	flutter analyze --no-pub

cache-repair:
	flutter pub cache repair
	make clean

clean:
	flutter clean
	flutter pub get

format-code:
	dart format . -l 150

watch-code:
	flutter packages run build_runner watch --delete-conflicting-outputs