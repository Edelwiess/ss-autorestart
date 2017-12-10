# ss-autorestart

For auto detecting and restarting shadowsocks module in koolshare of Advanced Tomato firmware.

Usage:
1. Copy ss_autoreload.sh to your /jffs/koolshare/scripts/ folder.
2. Login to your Web management page of Advanced Tomato.
3. Administration 

  > Scheduler 
     > Custom 1
        Enabled = ✓
        Time = Every Minute;
        Days = Everyday;
        Command = sh /jffs/koolshare/scripts/ss_autoreload.sh
     

