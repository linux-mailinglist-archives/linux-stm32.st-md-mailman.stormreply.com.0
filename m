Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 991314C613B
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E35C60491;
	Mon, 28 Feb 2022 02:40:04 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B055AC5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015991;
 bh=s7PQLkyF7lgwD3XBQiSaqNoJa0DuoiTYpx9LJQP/Mls=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cxpUscFLGUZJNcWt88FoOwBRPkoIN93GG0po2YwCVFNCRwfHt2GBaOum3BkF2QZYW
 ldIyQx9k8nFEALMlOWGIv631902+dQR4M46lVwG/+52ltRkBiS9LsEFMoWmJSYlJt2
 eQgVFw1ngAqm2Sp03hXt4Trb1XrPfm5Ton43sq+M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUUm-1nytxL1gXU-00ptLI; Mon, 28
 Feb 2022 03:39:51 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:20 +0100
Message-Id: <20220228023928.1067-2-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YyRUGiMq45KbcRKKJ3U/JHT8I4NesVil7nhtV13/29TW+GJXRoX
 Pf/8SR9YukbA1QMs8UGUiOzhxfyOA+kAAwIoOhrF07ECYmOkfIoyaCtz/zfEzdBgPnZUv34
 dVj5mtDXkQEbG/53/jau9Mc8euWvMdWvWdpp3MbqxlpRwKvmZ7hUf0A7ReoWnADXHww59Uo
 Ur6JsXNkhtqZ4ThEzYr2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6riyR5wDhXQ=:lEWlpN6no3qJp3+G1QlEVt
 e8G/phjdUIcBqYZknMZ1Q3/aKVNjUBOkQEEOe0PD6Rc96uFjemUUZ3Y0Gnw79kWBJi2HQQb8s
 nxTKp6kjLKq58/OTd7fEX8qJFcHqIc8vrVfZBWxvOX4D8NpCKDNFUKwQFH8/LGmUuSFCZlsxy
 HsHWnnLfj5ENMw0tk8eELbDxPzYElN38ljG1olO//WHEbG7u5KY0uajiNAPvpge3s1Kq3iN9t
 X1rmR18lbnk8im3MPTlI8RiuQgwcNPSCIoI2eBlTrW/VxavGBRM+sMJ5Yh33uTItGJVq7Mn4C
 q68v48xbHVGGatXkUrhlEDIkC1q88BTEp6Y74vALQuOogkl2/3o/vFBOhbCE4AZqTsz4WO4T8
 Fq/3YNG1WN3sTD8h12g7CHIUT1yUa+jJKLmb2CAIVchoFirWIPnkreCNkoAfE7+V6Cn3CI/bW
 eLncy1KCmPAzQpaldG3EI+owWVVKH/HrIC74K1EFuecTYuU09qrLE6NM4wsBtQl2ucHEeb9hB
 Y+3mAV1xBZ7WmhhB4+sIDPSXvOyBUAI+kc2X5SGEILRF2iho+8UI8M0lgNcu/9YCx3TTqxCQ9
 VTXdceMbMHG6E+4tNLeDA3GEnpOcipHT0nue7+RCNkz7gxVOlmlDIAqvibM0IbiXZTF0jHcFc
 c+ekGlgK4ObGZzuEvUqj1c9hD+gPiQNah+u3Op1EN6DD4OZjj0+QuEG0dk/XdwNkSCK0HV5qp
 V7hrPzIT8J6aLyN0EDfG9kMX7OaMlCj33OJ9d/WcAWE0KhADQ+4m+1uO/tFxCGCNE4Hh+MmQ9
 I/YzYvh5CNxPTjqq7BOdhqxVN3MI/EOrnSImyBfYUN+8wfnJa8K1BUzDLak2GtYw0Ec5ag78G
 fd9oXevkBRI7B16+Jvgv5bSVTvqVPiU15C32e49NdiuXS0jL9dMiZgweh7VeJZnrANFFEZ6WS
 W2eM8wXk2Xpgbp3vz+4H3fUdmMR9pF+/7PNlzZrMnFlaZ4F2mUhDIuQE8k6+Ke1NWGCp1d80J
 i3igUQBF9hn8tv1wMOHQNezy0avDyrMlTnK5ymElvjPcaseOQyAWf1+q6jXeOM+yi+v7NI0nl
 w+ur/ENLj9LS9k=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 1/9] serial: core: move RS485 configuration
	tasks from drivers into core
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

Several drivers that support setting the RS485 configuration via userspace
implement one or more of the following tasks:

- in case of an invalid RTS configuration (both RTS after send and RTS on
  send set or both unset) fall back to enable RTS on send and disable RTS
  after send

- nullify the padding field of the returned serial_rs485 struct

- copy the configuration into the uart port struct

- limit RTS delays to 100 ms

Move these tasks into the serial core to make them generic and to provide
a consistent behaviour among all drivers.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/serial_core.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 846192a7b4bf..06eb3cfbe610 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -42,6 +42,11 @@ static struct lock_class_key port_lock_key;
 
 #define HIGH_BITS_OFFSET	((sizeof(long)-sizeof(int))*8)
 
+/*
+ * Max time with active RTS before/after data is sent.
+ */
+#define RS485_MAX_RTS_DELAY	100 /* msecs */
+
 static void uart_change_speed(struct tty_struct *tty, struct uart_state *state,
 					struct ktermios *old_termios);
 static void uart_wait_until_sent(struct tty_struct *tty, int timeout);
@@ -1282,8 +1287,36 @@ static int uart_set_rs485_config(struct uart_port *port,
 	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
 		return -EFAULT;
 
+	/* pick sane settings if the user hasn't */
+	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) ==
+	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
+		dev_warn_ratelimited(port->dev,
+			"%s (%d): invalid RTS setting, using RTS_ON_SEND instead\n",
+			port->name, port->line);
+		rs485.flags |= SER_RS485_RTS_ON_SEND;
+		rs485.flags &= ~SER_RS485_RTS_AFTER_SEND;
+	}
+
+	if (rs485.delay_rts_before_send > RS485_MAX_RTS_DELAY) {
+		rs485.delay_rts_before_send = RS485_MAX_RTS_DELAY;
+		dev_warn_ratelimited(port->dev,
+			"%s (%d): RTS delay before sending clamped to %u ms\n",
+			port->name, port->line, rs485.delay_rts_before_send);
+	}
+
+	if (rs485.delay_rts_after_send > RS485_MAX_RTS_DELAY) {
+		rs485.delay_rts_after_send = RS485_MAX_RTS_DELAY;
+		dev_warn_ratelimited(port->dev,
+			"%s (%d): RTS delay after sending clamped to %u ms\n",
+			port->name, port->line, rs485.delay_rts_after_send);
+	}
+	/* Return clean padding area to userspace */
+	memset(rs485.padding, 0, sizeof(rs485.padding));
+
 	spin_lock_irqsave(&port->lock, flags);
 	ret = port->rs485_config(port, &rs485);
+	if (!ret)
+		port->rs485 = rs485;
 	spin_unlock_irqrestore(&port->lock, flags);
 	if (ret)
 		return ret;

base-commit: 71404f653cf7858fdbb81dd5419a8a4ac4ffa20c
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
