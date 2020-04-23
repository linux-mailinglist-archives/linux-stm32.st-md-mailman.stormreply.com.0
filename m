Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBEF1B5AD5
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Apr 2020 13:56:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D056C36B0B;
	Thu, 23 Apr 2020 11:56:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15EF8C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 11:56:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NBqWu1025463; Thu, 23 Apr 2020 13:56:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BCdNw/6bNXDgvzYMM/yuCjYQaZbw1vGHMQ1wGH6OfQw=;
 b=U6MmSMBAFtju9TIfyfARL7+zBExJ1rFHpv8Pz9BAqe1QGj43VEk+F6zswnEfuue998Vq
 y+5/TvErKyfRRYJTjjpLMjqKFYcUijgEAgxLUN9yhopTH5YEJszGDBYwJ8wY9k89kl/i
 wuh3nk3jveeWSBDi3X6yJamja44ASgWSqlqXHx65lDLbBQ3Z0BgnL/AWOLRlX1PXyqUq
 VektRD6eJYG55ysqLOPgfaJGUGDBN7yLm5cdTuuf3rQCUg7UqIGlMYvRbIuMhF9jvTG9
 AlFbzaU4slX5Gsp6Ie2190uLMQXR2FqGy5eLuSd/PCd2SJRxIfJsbHEVCEAGoNONNOJo 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregvjtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 13:56:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3003D10002A;
 Thu, 23 Apr 2020 13:56:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2624E2ADA08;
 Thu, 23 Apr 2020 13:56:17 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 23 Apr 2020 13:56:16 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <balbi@kernel.org>
Date: Thu, 23 Apr 2020 13:55:54 +0200
Message-ID: <1587642956-8157-3-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587642956-8157-1-git-send-email-fabrice.gasnier@st.com>
References: <1587642956-8157-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_07:2020-04-22,
 2020-04-23 signatures=0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 2/4] usb: gadget: u_serial: add suspend
	resume callbacks
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

Add suspend resume callbacks to handle the case seen when the bus is
suspended by the HOST, and the device opens the port (cat /dev/ttyGS0).

Gadget controller (like DWC2) doesn't accept usb requests to be queued in
this case (when in L2 state), from the gs_open() call. Error log is printed
- configfs-gadget gadget: acm ttyGS0 can't notify serial state, -11
If the HOST resumes (opens) the bus, the port still isn't functional.

Use suspend/resume callbacks to monitor the gadget suspended state by using
'suspended' flag. In case the port gets opened (cat /dev/ttyGS0), the I/O
stream will be delayed until the bus gets resumed by the HOST.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/usb/gadget/function/u_serial.c | 57 +++++++++++++++++++++++++++++-----
 drivers/usb/gadget/function/u_serial.h |  2 ++
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 8167d37..3cfc6e2 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -120,6 +120,8 @@ struct gs_port {
 	wait_queue_head_t	drain_wait;	/* wait while writes drain */
 	bool                    write_busy;
 	wait_queue_head_t	close_wait;
+	bool			suspended;	/* port suspended */
+	bool			start_delayed;	/* delay start when suspended */
 
 	/* REVISIT this state ... */
 	struct usb_cdc_line_coding port_line_coding;	/* 8-N-1 etc */
@@ -630,13 +632,19 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 
 	/* if connected, start the I/O stream */
 	if (port->port_usb) {
-		struct gserial	*gser = port->port_usb;
-
-		pr_debug("gs_open: start ttyGS%d\n", port->port_num);
-		gs_start_io(port);
-
-		if (gser->connect)
-			gser->connect(gser);
+		/* if port is suspended, wait resume to start I/0 stream */
+		if (!port->suspended) {
+			struct gserial	*gser = port->port_usb;
+
+			pr_debug("gs_open: start ttyGS%d\n", port->port_num);
+			gs_start_io(port);
+
+			if (gser->connect)
+				gser->connect(gser);
+		} else {
+			pr_debug("delay start of ttyGS%d\n", port->port_num);
+			port->start_delayed = true;
+		}
 	}
 
 	pr_debug("gs_open: ttyGS%d (%p,%p)\n", port->port_num, tty, file);
@@ -680,7 +688,7 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	pr_debug("gs_close: ttyGS%d (%p,%p) ...\n", port->port_num, tty, file);
 
 	gser = port->port_usb;
-	if (gser && gser->disconnect)
+	if (gser && !port->suspended && gser->disconnect)
 		gser->disconnect(gser);
 
 	/* wait for circular write buffer to drain, disconnect, or at
@@ -708,6 +716,7 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	else
 		kfifo_reset(&port->port_write_buf);
 
+	port->start_delayed = false;
 	port->port.count = 0;
 	port->port.tty = NULL;
 
@@ -1403,6 +1412,38 @@ void gserial_disconnect(struct gserial *gser)
 }
 EXPORT_SYMBOL_GPL(gserial_disconnect);
 
+void gserial_suspend(struct gserial *gser)
+{
+	struct gs_port	*port = gser->ioport;
+	unsigned long	flags;
+
+	spin_lock_irqsave(&port->port_lock, flags);
+	port->suspended = true;
+	spin_unlock_irqrestore(&port->port_lock, flags);
+}
+EXPORT_SYMBOL_GPL(gserial_suspend);
+
+void gserial_resume(struct gserial *gser)
+{
+	struct gs_port *port = gser->ioport;
+	unsigned long	flags;
+
+	spin_lock_irqsave(&port->port_lock, flags);
+	port->suspended = false;
+	if (!port->start_delayed) {
+		spin_unlock_irqrestore(&port->port_lock, flags);
+		return;
+	}
+
+	pr_debug("delayed start ttyGS%d\n", port->port_num);
+	gs_start_io(port);
+	if (gser->connect)
+		gser->connect(gser);
+	port->start_delayed = false;
+	spin_unlock_irqrestore(&port->port_lock, flags);
+}
+EXPORT_SYMBOL_GPL(gserial_resume);
+
 static int userial_init(void)
 {
 	unsigned			i;
diff --git a/drivers/usb/gadget/function/u_serial.h b/drivers/usb/gadget/function/u_serial.h
index e5b08ab..009a959 100644
--- a/drivers/usb/gadget/function/u_serial.h
+++ b/drivers/usb/gadget/function/u_serial.h
@@ -68,6 +68,8 @@ ssize_t gserial_get_console(unsigned char port_num, char *page);
 /* connect/disconnect is handled by individual functions */
 int gserial_connect(struct gserial *, u8 port_num);
 void gserial_disconnect(struct gserial *);
+void gserial_suspend(struct gserial *p);
+void gserial_resume(struct gserial *p);
 
 /* functions are bound to configurations by a config or gadget driver */
 int gser_bind_config(struct usb_configuration *c, u8 port_num);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
