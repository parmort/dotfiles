setTime() {
  echo "Date (yyyy-mm-dd); EX- 2018-02-19 (Feburary 19, 2018)"
  read date

  echo "Time (HH:MM:SS) in 24-hour time; EX- 15:09:00 (3:09:00 PM)"
  read now

  sudo timedatectl set-time "$date $now"
  sudo hwclock --systohc
}
