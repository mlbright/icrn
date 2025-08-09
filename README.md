# IMDSv2 Capacity Rebalancing Notifier

Get notified via ntfy.sh about AWS Spot Instance interruptions and rebalancing recommendations using a systemd service.

## What is this?

This service will:

- Use IMDSv2 (more secure) with token-based authentication
- Check every 5 seconds for spot interruption notices and rebalance recommendations
- Log findings to the system journal
- Automatically restart if it crashes
- Start automatically on system boot

## Build

```bash
make build
```

For other tasks and actions check the [Makefile](./Makefile)

## Running the service

Check service status with `systemctl status ec2-monitor`

## Packaging

```bash
make package
```
