# Aivora

Aivora is a bilingual Flutter mobile guide that helps people choose and use AI with clarity.

## Product sections

- **Start:** choose a goal and jump to the right tool.
- **Models:** search and filter a curated catalog, then open a complete profile covering strengths, ideal uses, access, and risks.
- **Platforms:** compare consumer and developer platforms, free-entry availability, supported model families, and access channels.
- **Prompt Lab:** turn any problem into a reusable professional prompt without an account, API key, or network request.

## Privacy and architecture

- No login or user account.
- No analytics or tracking SDK.
- No API key stored in the application.
- The catalog and prompt composer work offline.
- English and Arabic are both supported, including RTL layout.

## Run locally

```sh
flutter pub get
flutter run
```

## Verify

```sh
flutter analyze
flutter test
flutter build apk --release
```

AI products and pricing change frequently. The app therefore labels access information conservatively and tells users to confirm important details with each provider.
