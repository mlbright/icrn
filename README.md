# IMDSv2 Capacity Rebalancing Notifier

Get notified via [ntfy.sh][ntfy] about AWS Spot Instance interruptions and rebalancing recommendations using a systemd service.

## What is this?

This service will:

- Use IMDSv2 (more secure) with token-based authentication
- Check every 5 seconds for spot interruption notices and rebalance recommendations
- Log findings to the system journal
- Automatically restart if it crashes
- Start automatically on system boot

## Intallation

```
apt install icrn
```
## Build

```bash
make build
```

For other tasks and actions check the [Makefile](./Makefile)

## Running the service

Check service status

```bash
systemctl status icrn
```

Start the service:

```
systemctl start icrn
```

Stop the service:

```
systemctl stop icrn
```

### Setting the Ntfy topic

Set the ntfy topic by creating a systemd settings override file:

```bash
mkdir -p /etc/systemd/system/icrn.service.d
echo -e "[Service]\nEnvironment=NTFY_TOPIC=my-topic" > /etc/systemd/system/icrn.service.d/override.conf
```

## Packaging

```bash
make package
```

[ntfy]: https://ntfy.sh
