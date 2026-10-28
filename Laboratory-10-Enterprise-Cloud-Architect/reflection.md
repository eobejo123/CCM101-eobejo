# Reflection

I've drafted the repo files for you so you can fill in the blanks instead of writing from scratch.

I wrote six files for Requirement 5: `README.md`, `OPERATIONAL_MANUAL.md`, `REFLECTION.md`, `.env.example`, `.gitignore`, and `crontab.txt`. Download them from the file cards and keep the same names.

---

## Step 1: Set up the folder on Windows

Create `final-mission` inside your portfolio repo with these subfolders:

```text
final-mission/
├── scripts/
├── diagrams/
└── screenshots/
```

The downloaded files go in the root. In Windows Explorer, turn on **View → Show → Hidden items** so you can see `.env.example` and `.gitignore`.

---

## Step 2: Copy your real files from the VM

Run these in PowerShell on Windows, from inside `final-mission`:

```powershell
scp -P 2222 ranny@127.0.0.1:~/cloudnova-stack/docker-compose.yml .
scp -P 2222 ranny@127.0.0.1:~/cloudnova-stack/scripts/backup.sh scripts/
```

Don't copy `.env`, because it holds your real passwords.

---

## Step 3: Add your screenshots

Put them in `screenshots/` with these exact names, because the README links to them:

- `01-wordpress-browser.png`
- `01b-virtualbox-port-forwarding.png`
- `02-docker-compose-ps.png`
- `03-ufw-status-verbose.png`
- `04-backup-script-and-files.png`
- `05-crontab-and-journalctl.png`
- `06-site-after-reboot.png`
- `06b-containers-after-reboot.png`

Check each one for visible passwords before you add it. Your `cat .env` screenshot must stay out of the repo.

---

## Step 4: Make the architecture diagram

In Draw.io, draw this and export it as `diagrams/architecture.png`:

- Windows host (browser `localhost:8080`, PowerShell `ssh -p 2222`)
- → VirtualBox (NAT, 8080→80 and 2222→22)
- → Ubuntu VM
- → UFW (deny incoming, 22 limited, 80 open)
- → Docker (`cloudnova-web` on frontend + backend, `cloudnova-db` on backend only)
- → volumes `wp_data` and `db_data`

Add a cron box (2 AM) running `backup.sh` into `~/backups`.

---

## Step 5: Edit before you push

- In `README.md`, replace `YOUR NAME`.
- In `REFLECTION.md`, fill in your own details and write the last section in your own words. It's a draft built from our journey, and it should sound like you.
- In `OPERATIONAL_MANUAL.md`, read it once. It lists the real problems you hit, and the root-owned backup archive appears under known limitations. If you've fixed that with `chown`, delete that line.
- The manual includes a restore procedure I haven't seen you run. Test the database restore once so you can demo it.

---

## Step 6: Check, then push

- [ ] No `.env` or passwords anywhere in the repo
- [ ] `docker-compose.yml`, `backup.sh`, `.env.example`, `crontab.txt` are present
- [ ] The diagram shows in the README
- [ ] All screenshot filenames match

```powershell
git add final-mission
git commit -m "Add CCM101 final mission: infrastructure, docs, scripts"
git push
```

Then open the repo on GitHub and check that the README renders and the images show.

---

## Still open from earlier

- I haven't seen the clean-reboot result (containers coming back on their own). Do that test so your `06b` screenshot is real.
- Run `./scripts/backup.sh` once more now that the site has content, and retake screenshot `04`.

When you've pushed, tell me and I'll write the video showcase script with the exact commands and talking points for each section.
