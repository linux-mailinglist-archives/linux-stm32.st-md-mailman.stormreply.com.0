Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4194BEEE0
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60622C60473;
	Tue, 22 Feb 2022 01:15:25 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ACC1C6046B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492506;
 bh=VqDtjCu1On8E90PP+zcmUBiCFF/DRJ7DnsmAzRfKwqs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RNrqn3EGfsrYU7qAwyec8yYuxacsBA3JJj2OSnWGScS2QimbzXLMIK7d2XTnPvzz1
 e/EoyrF7kRS915ouO1baNbEwCZptCjFGttoiweCVHkqTyEwUZT/YSHjb8071UQUelS
 4sUmoFj15lAavtgtD+p2fNSomniGai4/LanotcWo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiacH-1nqy1F0fOZ-00fkCh; Tue, 22
 Feb 2022 02:15:06 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:25 +0100
Message-Id: <20220222011433.8761-2-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SSsn/0UwWR3j7W6KX8VHiJO40uYcDYbhSEf6Uj+6iT5yAPMPiY2
 DRtOInCigEKQmPnoKe2o/eI4N3ft3SFBNYY3rzbb4FqEShSJSAq0ZJut4p2B0+uFtki9HY8
 O0g5SqO8bnSG9ZBK6IjSfYw6ZOxyTPOlYstuIej508E5Bg5nSVTtHF7+AksSve/UNN6w5/a
 gwWSJT4IxjADoN+sTrxnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QmI32g1894s=:RsjLS1yif5G6gEPcRSo6AJ
 +GufJ9SftvEz8xJ1dECRlgc5t4+2cUaR8CxxDi+4K6nQ2Mqoe4qXIYF7IX1crVxbKdElNurki
 xyEz2dacQqAY8/I69QBbs8gu+IX9tAht7N9Y7Cquy8Rn2K/lVXBwl35iRzLLXVzDRcI2Ye9rc
 rTSUPs6Tj6BAmITa2OiHIbXpW52QvccbPxXHq5GIRQCY+H6ZtFVDp0ON/aeu/zouD/qHVXK5Q
 DVnUW30yEO0F3YIht3gVCylV1DIbnMp3XaRjIA+igDj0vMyRUmNfsGEK484zs6Le+NfKPXJY8
 2zp+sGNfhacpaMGW4mVbCj5ZlZq3pFBpOt1bKavMLd0/yJDZmtip0+9p48/WqLpBqhdOvPdGQ
 IyechYq8cSwGaC6DeMzUd95h69h0fERuxWVtrGZclFXW3pSXeAjmL8cG0BNDFKl1Z1ZliofOM
 tlRqGtSIgbGc3UuPh+wMYeYmyJOlHcAYUkLYjXhYC04c7ejWPFh/I61w/r8z0Dpx5jyZoUoIs
 m5rWeTH019U1XsjAWAg5XYiYdtx+RMNcVjKnnVhgf38YmyNlCZG4x1ecny9vd1Nh8u5p23ln7
 E23r3IjbTmOGx0VpX/T77YAI/TMayw9aY0EbDJPcyu/E82+wPOj9E1m7krj4BqpAS7aTQ30RV
 SXwKUgnFlHjccFvJNb2/1su53GogUOdalfSCVEtyRCRrVPx2h6E7TuUfuzO/nKO4oQVlg+sk5
 QIFrZrTWuodSul3xQ3qTn5MGRYKlfK16fPj/y2/h+2irH3OqhWEOLAHo9aeKlHuJaTF7iLv9a
 zMGk46hg823+9E1bOr4IPGkk6ANrcry4vcJzXmLM2Y9ZuvQcJSBV7/XIaURMcRHoBz/8l31j6
 pA8z4hLuPwUHa9esLbPDmkATaP54BMiBwS0FEgDcSIBM5r7N9MeZmPOqofOM1/PqDRctCru6K
 3weNt2ojBUjN69/ruP/olavuzCwM6rTHIP2Cxs18Y0sez3pJ2Y8C/WjHfoEv1X137lqqYtU/y
 lDX9d5l2FF5JPbcoxhCfR2ZAE/0HFr/Ybu0r69Uy9S/sqKX+r6JHmbifbguik2kMjy6jlHDna
 aAaAUmlkxhxbYM=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 1/9] serial: core: move RS485 configuration
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
 drivers/tty/serial/serial_core.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 846192a7b4bf..2b3afe038c1c 100644
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
@@ -1282,8 +1287,32 @@ static int uart_set_rs485_config(struct uart_port *port,
 	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
 		return -EFAULT;
 
+	/* pick sane settings if the user hasn't */
+	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) ==
+	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
+		pr_warn("invalid RTS setting, using RTS_ON_SEND instead\n");
+		rs485.flags |= SER_RS485_RTS_ON_SEND;
+		rs485.flags &= ~SER_RS485_RTS_AFTER_SEND;
+	}
+
+	if (rs485.delay_rts_before_send > RS485_MAX_RTS_DELAY) {
+		rs485.delay_rts_before_send = RS485_MAX_RTS_DELAY;
+		pr_warn("RTS delay before sending clamped to %u ms\n",
+			rs485.delay_rts_before_send);
+	}
+
+	if (rs485.delay_rts_after_send > RS485_MAX_RTS_DELAY) {
+		rs485.delay_rts_after_send = RS485_MAX_RTS_DELAY;
+		pr_warn("RTS delay after sending clamped to %u ms\n",
+			rs485.delay_rts_after_send);
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

base-commit: a603ca60cebff8589882427a67f870ed946b3fc8
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
