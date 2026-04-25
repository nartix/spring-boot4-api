# dev-springboot-base

## Run in Dev Mode

Use two terminals so Spring Boot can restart automatically when files change.

### Terminal 1: Run the app

From the workspace root:

```bash
cd uniapi
pgrep -f "org.gradle.appname=gradlew.*bootRun" >/dev/null && echo "bootRun is already running" || SPRING_PROFILES_ACTIVE=dev ./gradlew bootRun
```

The app starts on http://localhost:8080.

### Run with environment variables

From the workspace root:

```bash
cd uniapi
SPRING_PROFILES_ACTIVE=dev SPRING_CLOUD_VAULT_ENABLED=false ./gradlew bootRun
```

Prod-style startup example:

```bash
cd uniapi
SPRING_PROFILES_ACTIVE=prod SPRING_CLOUD_VAULT_ENABLED=true SPRING_CLOUD_VAULT_TOKEN=<your-token> ./gradlew bootRun
```

### Terminal 2: Continuous compile

From the workspace root:

```bash
cd uniapi
pgrep -f "org.gradle.appname=gradlew.*-t classes processResources" >/dev/null && echo "continuous compile is already running" || ./gradlew -t classes processResources
```

This watches Java and resource changes and recompiles continuously.

## How Auto-Reload Works

1. Save source or resource changes.
2. Continuous compile updates build outputs.
3. Spring Boot DevTools detects the updates and restarts the app.

## Notes

- If Vault is needed, enable it with SPRING_CLOUD_VAULT_ENABLED=true and provide a token.
- For local development without Vault, default config keeps Vault disabled.
