Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B94B6B29
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70BA9C60470;
	Tue, 15 Feb 2022 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18363C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791285;
 bh=bZh7fD3BxcL0U4ga7XTlAYTEC0EPT7y619IUOjTzv7Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RG8BL/3hnOqCkN8Y2FE9lEVGlXBqqK/fncb4/LOQmAFJUicXB1gEOXVvp4NT8gLkw
 ZKZhqJGA0wx6NMgIpMIvMGfy8E74XlHo0TjNXC2zu6tyilA0CPugWs2HLCLIphHWTm
 bg7uEUU9SyC2jP86Jd6+SEL7cVg7eBWBRiMeFgdQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1oORt22z8W-015L7F; Sun, 13
 Feb 2022 23:28:05 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:29 +0100
Message-Id: <20220213222737.15709-2-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:a70uNS3aT4SFE/6OuZPcmU57hS9z6lw3Arpt/2q+1Rn1DqngY4I
 cqop7d/eCjPhLHz9sZAYXp8ibRRdjqeKMEGk6i8ckZI+xCeYiAixStK8vfEAdAWCt5bZW84
 pGb79r9pJC9KWgmT7d2YGAKs5egMFgBpJUZOpsIxXRwVf4VSjo2bXW3br64Ayb/nGyae5pI
 kWJYGVzKhf3TfZQ3c5gGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MDKmZPIX+AM=:ejUYpmz5XajPfujXJyVH1r
 6U5CuIact4NZYyjNF9mVhmobMV0e07iJ4mCXAx4ROMgDPh7A3JRkJRSJV/wkYFlAP+VoZ78pK
 g02bb+zcTjvvE861GOmg9BoYt2SwQDbYzDNGCMuSCAtxrLb3lOeNxiDz/R7Ar7SKYwySmtJr6
 cfsdTei2CTSAhUuA2EQcXYyXLYB/pJInKD9MXqTWe8KGJIUAp2aw0n3EZw1UBlBUgQGJqi0f0
 OkLZgRgh78wArN4U1F3wN3tB8hzgLs1biB5uMM60LaJFW7udSr4F3nQ6m98++9d4iQYJvmnL9
 FSFOblc8Sjv6NvhVzlPx0W33923AShxSllwYRMc1MF8LKq76mUylFA42vVDAN8fPVJpOhMtGS
 k09UMyxLiM/OMOgATAnPrapuRx4ZOadTIIJBPV7qSnsRAX1BmrI+b/kfe+8h8uFelOZDTd5wO
 DRvCwCiqw92P+Yb1+V78K0USC8twVnj2obidAcCL1Ee9KdfA7z4J0S5ye30pl267/wJ6EIO4W
 p1imaaUvPWf5SOJtcWgcjeiIG0wU9SwFtRcdWJLaHtyyK/omsvojPZzhJdo/jiC+d4UuzbIBZ
 Io6/wCF5V9Pe4Mn1y3tgU0KsnA12OtbK49B2EbbVyGzf1OdnskIuIG6EsSjRiBYasXRcU+JK/
 sVDPSxcq0sL6H9j9G7HZLcZ0Gzov2cqL0ZBSC2H9ry3FAaP4b7qqT7PFpX4yjamASVlQ+9kIZ
 VxUcXh93S671T8X3iWE1F4C+/OkJFQbDdQHzY8b2vxN/gJF5MbONEN3Mf4088+PSw5tr+RuGm
 zZqTDn9lV7H9jfTVPDdzar9/8euBOL21p4WjxJNnJdkq0VhBDlKA1QBRFusl0tld/U3dz/+uw
 /nmhlUrgHj0OV8xv4GCUAdEp0U58ArKVzYrocYuu8mvQAI9WMkHpWvxsZEUcdOJem7jWUn3MV
 tPOvmCzy1o7b7Y+HClYbxJFlSej0xOuLabHMF1D7qen911i/aL06ILU2l4ujGsiU/79Q4oQW+
 y5GQAwDhb0/l2UVr+pApKj32Jxuc/FCWJT3VAxG0vPlaFiodRfoj21sV6OvD5mhkQJnQ+sMu0
 sw1NHPFrvIt81k=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/9] serial: core: move RS485 configuration
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
implement on or more of the following tasks:

- in case of an invalid RTS configuration (both RTS after send and RTS on
  send set or both unset) fall back to enable RTS on send and disable RTS
  after send

- nullify the padding field of the returned serial_rs485 struct

- copy the configuration into the uart port struct

- limit RTS delays to 100 ms

Move these tasks into the serial core to make them generic and to provide
a consistent beheviour among all drivers.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/serial_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 846192a7b4bf..3fab4070359c 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1282,8 +1282,21 @@ static int uart_set_rs485_config(struct uart_port *port,
 	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
 		return -EFAULT;
 
+	/* pick sane settings if the user hasn't */
+	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) ==
+	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
+		rs485.flags |= SER_RS485_RTS_ON_SEND;
+		rs485.flags &= ~SER_RS485_RTS_AFTER_SEND;
+	}
+	/* clamp the delays to [0, 100ms] */
+	rs485.delay_rts_before_send = min(rs485.delay_rts_before_send, 100U);
+	rs485.delay_rts_after_send = min(rs485.delay_rts_after_send, 100U);
+	memset(rs485.padding, 0, sizeof(rs485.padding));
+
 	spin_lock_irqsave(&port->lock, flags);
 	ret = port->rs485_config(port, &rs485);
+	if (!ret)
+		port->rs485 = rs485;
 	spin_unlock_irqrestore(&port->lock, flags);
 	if (ret)
 		return ret;

base-commit: ad30d108a5135af584ff47f5ff81be971b6c26f1
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
