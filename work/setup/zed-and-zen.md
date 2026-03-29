# zed and zen
**2026-02-23**

When setting up a new work computer, I need just two things:
- a terminal to edit and execute
- a browser to explore.

## a(tom) to zed

My primary workflow happens with tmux + nvim + opencode in a terminal. Usually when I am pair-programming or sharing my work with others, people find it difficult to navigate the terminal, so I prefer opening my project folder in a GUI code editor.

I used to use Atom as my GUI editor, then it got deprecated and VS Code became the next. But using the built-in VS Code terminal never felt snappy for some reason, so I always used the built-in terminal app of the particular OS instead, keeping VS Code as a backup GUI editor.

When I came across Zed, given it was written in Rust, I hoped its built-in terminal would feel snappy — and it did. I later found out it was developed by the Atom team, which made me even more inclined to use it; a bit of nostalgia for Atom goes a long way.

Soon I got rid of VS Code and used Zed as the replacement for both: a GUI editor and a terminal.

One caveat is that Zed doesn't support rendering equations in markdown preview mode. Hopefully that gets added.

## zen and the art of the browser

Before I was happy with the default browser apps that shipped with the respective OS, but this changed after I tried Zen and found its tab and session management so superior. I liked the concepts of spaces — I know it's all derived from Arc browser (credit where it's due) but Zen being open-sourced and Mozilla based made it my choice.

Every major desktop work app — be it Teams, Outlook, Slack, etc. — is now Electron-based bloatware. I decided instead of having the chat and mail apps downloaded natively, I'd rather pin them as "essential" tabs in Zen and enable web notifications. I found these much more accessible instead of juggling multiple open windows of respective apps. The apps are always reachable at their fixed positions using keyboard shortcuts (e.g. to reach the first pinned tab, just use <kbd>cmd</kbd> + <kbd>1</kbd> and so on).

One cool feature of Zen is that ephemeral tabs — usually opened from within apps like mail and chat — open in a floating window, which can be closed and done with instead of persisting in the browser as happened in my previous flow.

Another benefit of using these apps in the browser is I can use extensions like Vimium across all of them, making keyboard navigation a breeze.

## zed, zen, repeat

The setup is simple. As my machine boots up, there are just two apps to open: Zed and Zen.

Zed has one window per machine (remote, local, etc.), all opened at the root, so everything is accessible in GUI mode. Work continues as usual in Zed's terminal with tmux + nvim.

Zen has a single window with three spaces — one for work, one for self, and one for misc. All the work apps are pinned as essentials, and bookmarks relevant to each space are organised in categorised folders.

One nitpick is that both app icons are so similar visually that it sometimes takes a minute to identify which is which — but with only these two apps ever open, <kbd>cmd</kbd> + <kbd>tab</kbd> always lands exactly where I expect.

Two apps, minimal contexts, zero clutter, Zed and Zen!
