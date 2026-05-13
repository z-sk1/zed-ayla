use zed_extension_api::{self as zed, Command, LanguageServerId, Result, Worktree};

struct AylaExtension;

impl zed::Extension for AylaExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<Command> {
        if language_server_id.as_ref() == "elen" {
            let path = worktree
                .which("elen")
                .unwrap_or_else(|| "C:/Users/ziads/go/bin/elen.exe".to_string())
                .replace("\\", "/");
            Ok(Command {
                command: path,
                args: vec![],
                env: vec![],
            })
        } else {
            Err("Unsupported language server".into())
        }
    }
}

zed::register_extension!(AylaExtension);
