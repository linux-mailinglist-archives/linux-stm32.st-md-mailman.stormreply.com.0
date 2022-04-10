Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F02394FAD51
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93EEDC5F1D6;
	Sun, 10 Apr 2022 10:47:23 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE172C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587635;
 bh=bcuHE5LYV9+TYYYh0ydrJw7GifQW+gzYXpAJjFrVMQk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lMxvV4i1Ks1xzYR/VWUoE2+ZOsd6jl0EDnc6VmK6Y8SGiscZalFKsnaKaeUwa4NOZ
 CtaP1VasZJFVM1r9u8kdYAK97CboQr5vQhSnHAt54MfkgmgqE4xGeh/PyW0/GIGHng
 Re6o7NEhpJiEnUjuj4kX85JcpB+dIyfWSWHjN2w0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1o2xMU2AST-017q8t; Sun, 10
 Apr 2022 12:47:15 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:34 +0200
Message-Id: <20220410104642.32195-2-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Cbf0m5TvH0ivlHwoDqjuX1YEpNeDKfr+7WrIDoXnHJHL5oc9rwR
 RR0tSPb0vgFgGpPm+NbS5IewZHnWiWlo3WHhYEGogSv1pHWCU+XP7+YOQsda4ZD3VeG2bd0
 U3RjSQ4VrJ9LB0vL6rJoiCQRPu2F12OLni7KTkft35gwUboyxKiTuIAHh1Oc6TJEpjJ1lUe
 Pv7dj4ANcF7hApqa51lnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:00Xfi7TDn+s=:jsge8c7jbl0RII1rtMh0sj
 YboDPgJwYzvC7ao5PHgFgeXSeofkdYBmYCvWSxtbhzEY4Li8Z7LybTJiyBVR8rov39QddSkGq
 B2tmg0HtKQx4S4B+uFr9kI69WV6X/ljpxzRZ3exdyE4/QcV4LvkImo1IoKDLhxCd1RRXSWovN
 ffxQBtABaIH+W+1AYG3VsT/VaGTNDNeyBOaS+e9zUFJTSlXn4D0+XJFJ4z20u7VeZFeOa0cm/
 XZ7qi3qQsOjbz9rJIaVphbDQgissBugsQNs+zQbjg1rmsKf6PTXdS8vu1qTHcRFUUZMqXs3Od
 Wje5OvLTMT5qUZvZzCicCfcVqPeWZqsJ1v23L61quFMfTHux3hEd3tWe/Na64uKtYMey8Owfd
 POygGRtbg0ZLyjCf/1IzhMxwDEpTPAXIOSGmbBK5NIfIg+2+vDW9UNC/aZG3cih1Lp9SevRfk
 5URSvi3djPl3glsOJssJx8avsmaDrPQBPqOfFFLrzYKUxUfsdcaNNVwPhE2EfI+kHxYAWvpOQ
 eUSR6oQQJES8N2Aqj6xwCYe8RZx6aEmeoIm6YSRuyQ6Q/R91ust6EN630T4NNYR81ECi4JZki
 mTnueNiYrIdzDCn37DkY4R6OAR5xNB2y6lyXNHYLFaIYTNRwPoUuac77NELFjSqEYtTKiSGsh
 ijPIZNOHEXWUkZ6sU3pEXmxXgskPNFwOf5Dqm9JbowyCD+zIKuRdXhDk1GdaOWF6M5qd18/It
 Vw7hZ6kOoY4CEPqxMbLExM74RI8SN1RLYBGSBH9KZEuNzcf7nrFJ5D0+JDTngO/CwxSDnlc8q
 3fTs7q0CIAmwUfi+5RV0SpLAZ9uDemz4Af87rKe6J5zagzLkinfq9Rm1GFdXaj3qBMudR3QlK
 LC4vXQBsrXrklC0j6j2JGtGHekNmL64eWdAi3jqtoJqJKN+LcG3ayi9GJzLNCPEWW1yrtkUkP
 9NMm85Xr1uMQvIYGRO2otn6PQfEaBT/5szjjfS5ZzAEMpaQMc8aH3tDgVj+DR5ghhEQW0YkFa
 YVHkVFeq5axL29QilBQRMFo0YII5dPxgyqoHWWLPjMYi0uvXezu/AdrT4GKEwfsXKmpBh7R2u
 dlX7syztAov0lU=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 RESEND 1/9] serial: core: move RS485
	configuration tasks from drivers into core
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
index 6a8963caf954..108b389e6e12 100644
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
@@ -1296,8 +1301,36 @@ static int uart_set_rs485_config(struct uart_port *port,
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

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
