# create a manifest that kills a process named killmenow

exec { 'pkill':
  command  => 'pkill -f killmenow',
  onlyif   => 'pgrep killmenow',
  provider => 'shell',
}