# Step 1: Deployment Troubleshooting

### Problem

The deployment hello-world can run but its pod gets restarted over and over. When inspected, that pod gets the error CrashLoopBackOff like this image:

![Problem inspect all](./img/problem-inspect-all.png)

Pod gets CrashLoopBackOff error because of failing Liveness probe check:

![Problem inspect pod](./img/problem-inspect-pod.png)

### Reason

The hello-world pod has livenessProbe configuration wrong (/nginx_status). This endpoint will return status 500. The right endpoint for health check status is /healthz. Here is the log of the failed pod:

![Reason log pod](./img/reason-log-pod.png)

### Solution

Fix livenessProbe of hello-world container to right health check endpoint to help the pod to be deployed successfully:

![Solution manifest](./img/solution-manifest.png)

After fixing, the deployment is successful and the hello-world app can be accessible now:

![Solution web](./img/solution-web.png)

Here is the log of hello-world application after running `kubectl logs <pod_name>`:

![Solution healthy](./img/solution-healthy.png)
