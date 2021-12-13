Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAD47354F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 20:54:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 739E2C5EC76;
	Mon, 13 Dec 2021 19:54:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2653EC5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 19:54:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BDI38Yj026406;
 Mon, 13 Dec 2021 20:54:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=7wKpIHGWEy8M5xUzhTi1s7ndfkGX92kVjAQlUeldafU=;
 b=44ZhTGpjmKiRPxf9tmm1D9Re+tmfXa10HcwhqWzIdca4UCWSkZTUT1cP4VCcFgQZvp/a
 ZplaCl/bse0EwaBwU7Z6NeIdiiCybTm0ng6h/uXjQmnXVWvqP+hi/oQid0NoBnVai4td
 /IcXHzxPI4F1bkRBsGnfzh/s0E4hqmnnQcMqHYtTghhu2Hzf6nilPTS1JNMkxPtmUljQ
 5R0DpzZ2IhqBUfuBYxhIUDGj71HldytqX4zmCj5EjdmbGIDU7fOo8UYnir80H1nAemwC
 wu+IUOu5Q2EardmaCkBTPXqCOYHvZXyCGgCDCZcH305HsT9S+o76RywIWQfWfYD1qNj3 AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cx0sqvfx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 20:54:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C307810002A;
 Mon, 13 Dec 2021 20:54:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B671F216ED0;
 Mon, 13 Dec 2021 20:54:32 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 20:54:32
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>
Date: Mon, 13 Dec 2021 20:53:46 +0100
Message-ID: <20211213195346.12894-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_09,2021-12-13_01,2021-12-02_01
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] tty: rpmsg: Fix race condition releasing tty
	port
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

In current implementation the tty_port struct is part of the
rpmsg_tty_port structure.The issue is that the rpmsg_tty_port structure is
freed on rpmsg_tty_remove but also referenced in the tty_struct.
Its release is not predictable due to workqueues.

For instance following ftrace shows that rpmsg_tty_close is called after
rpmsg_tty_release_cport:

     nr_test.sh-389     [000] .....   212.093752: rpmsg_tty_remove <-rpmsg_dev_
remove
             cat-1191    [001] .....   212.095697: tty_release <-__fput
      nr_test.sh-389     [000] .....   212.099166: rpmsg_tty_release_cport <-rpm
sg_tty_remove
             cat-1191    [001] .....   212.115352: rpmsg_tty_close <-tty_release
             cat-1191    [001] .....   212.115371: release_tty <-tty_release_str

As consequence, the port must be free only when user has released the TTY
interface.

This path (inspired from vcc.c):
- moves the management of the port in the install and clean-up tty ops,
- allocates the tty_port struct independently of the rpmsg_tty_port structure,
- uses tty_vhangup and tty_port_hangup.

Fixes: 7c0408d80579 ("tty: add rpmsg driver")
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Applied and tested on fa55b7dcdc43 ("Linux 5.16-rc1", 2021-11-14)
---
 drivers/tty/rpmsg_tty.c | 81 ++++++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
index dae2a4e44f38..50a79b1ea53c 100644
--- a/drivers/tty/rpmsg_tty.c
+++ b/drivers/tty/rpmsg_tty.c
@@ -27,11 +27,14 @@ static DEFINE_MUTEX(idr_lock);	/* protects tty_idr */
 static struct tty_driver *rpmsg_tty_driver;
 
 struct rpmsg_tty_port {
-	struct tty_port		port;	 /* TTY port data */
+	struct tty_port		*port;	 /* TTY port data */
+	struct tty_struct	*tty;	 /* TTY associated structure */
 	int			id;	 /* TTY rpmsg index */
 	struct rpmsg_device	*rpdev;	 /* rpmsg device */
 };
 
+static const struct tty_port_operations rpmsg_tty_port_ops = { };
+
 static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
 {
 	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
@@ -39,21 +42,60 @@ static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *p
 
 	if (!len)
 		return -EINVAL;
-	copied = tty_insert_flip_string(&cport->port, data, len);
+	copied = tty_insert_flip_string(cport->port, data, len);
 	if (copied != len)
 		dev_err_ratelimited(&rpdev->dev, "Trunc buffer: available space is %d\n", copied);
-	tty_flip_buffer_push(&cport->port);
+	tty_flip_buffer_push(cport->port);
 
 	return 0;
 }
 
 static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 {
-	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
+	struct rpmsg_tty_port *cport;
+	struct tty_port *port;
+
+	mutex_lock(&idr_lock);
+	cport = idr_find(&tty_idr, tty->index);
+	mutex_unlock(&idr_lock);
+
+	if (!cport)
+		return -ENXIO;
+
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	tty_port_init(port);
+	port->ops = &rpmsg_tty_port_ops;
 
 	tty->driver_data = cport;
 
-	return tty_port_install(&cport->port, driver, tty);
+	cport->port = port;
+	cport->tty = tty;
+
+	return tty_port_install(port, driver, tty);
+}
+
+static void rpmsg_tty_cleanup(struct tty_struct *tty)
+{
+	struct tty_port *port = tty->port;
+	struct rpmsg_tty_port *cport;
+
+	WARN_ON(!port);
+
+	mutex_lock(&idr_lock);
+	cport = idr_find(&tty_idr, tty->index);
+	mutex_unlock(&idr_lock);
+
+	if (cport) {
+		cport->tty = NULL;
+		cport->port = NULL;
+	}
+
+	tty_port_destroy(port);
+	kfree(port);
+	tty->port = NULL;
 }
 
 static int rpmsg_tty_open(struct tty_struct *tty, struct file *filp)
@@ -106,12 +148,19 @@ static unsigned int rpmsg_tty_write_room(struct tty_struct *tty)
 	return size;
 }
 
+static void rpmsg_tty_hangup(struct tty_struct *tty)
+{
+	tty_port_hangup(tty->port);
+}
+
 static const struct tty_operations rpmsg_tty_ops = {
 	.install	= rpmsg_tty_install,
 	.open		= rpmsg_tty_open,
 	.close		= rpmsg_tty_close,
 	.write		= rpmsg_tty_write,
 	.write_room	= rpmsg_tty_write_room,
+	.hangup		= rpmsg_tty_hangup,
+	.cleanup	= rpmsg_tty_cleanup,
 };
 
 static struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
@@ -146,8 +195,6 @@ static void rpmsg_tty_release_cport(struct rpmsg_tty_port *cport)
 	kfree(cport);
 }
 
-static const struct tty_port_operations rpmsg_tty_port_ops = { };
-
 static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
 {
 	struct rpmsg_tty_port *cport;
@@ -159,13 +206,9 @@ static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
 	if (IS_ERR(cport))
 		return dev_err_probe(dev, PTR_ERR(cport), "Failed to alloc tty port\n");
 
-	tty_port_init(&cport->port);
-	cport->port.ops = &rpmsg_tty_port_ops;
-
-	tty_dev = tty_port_register_device(&cport->port, rpmsg_tty_driver,
-					   cport->id, dev);
+	tty_dev = tty_register_device(rpmsg_tty_driver, cport->id, dev);
 	if (IS_ERR(tty_dev)) {
-		ret = dev_err_probe(dev, PTR_ERR(tty_dev), "Failed to register tty port\n");
+		ret = dev_err_probe(dev, PTR_ERR(tty_dev), "Failed to register tty\n");
 		goto err_destroy;
 	}
 
@@ -179,7 +222,6 @@ static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
 	return 0;
 
 err_destroy:
-	tty_port_destroy(&cport->port);
 	rpmsg_tty_release_cport(cport);
 
 	return ret;
@@ -188,16 +230,19 @@ static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
 static void rpmsg_tty_remove(struct rpmsg_device *rpdev)
 {
 	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
+	struct tty_struct *tty = cport->tty;
 
 	dev_dbg(&rpdev->dev, "Removing rpmsg tty device %d\n", cport->id);
 
-	/* User hang up to release the tty */
-	if (tty_port_initialized(&cport->port))
-		tty_port_tty_hangup(&cport->port, false);
+	/*
+	 * If there's a process with the device open, do a synchronous hangup of the TTY.
+	 * This may cause the process to call close asynchronously, but it's not guaranteed.
+	 */
+	if (tty)
+		tty_vhangup(tty);
 
 	tty_unregister_device(rpmsg_tty_driver, cport->id);
 
-	tty_port_destroy(&cport->port);
 	rpmsg_tty_release_cport(cport);
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
