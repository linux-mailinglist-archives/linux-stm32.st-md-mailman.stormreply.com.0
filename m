Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7AC4BEEDA
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAB08C60472;
	Tue, 22 Feb 2022 01:15:20 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 613B2C60463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492509;
 bh=q9DO7/fg2xOZjFdAWb9ykKHQwvph2xk9kVhhmi9Mufs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Vcz55CeNnKecxWsY+LSbi5KyAgYWgOUaC+5bzPg02gy6zvnVqvpKeiH5u60J0AOXk
 PBjuPunYbsTgBiqT0LVTPpOdZ3LWPBvZLg2zeTqIdg89iUX7lVXaK9A8tAibNkNTDJ
 oUKy8y/xQzO0smKEl2ZsHp2X1IIPlNNLatRLRhjQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdefD-1nvvZM0rVh-00ZhnZ; Tue, 22
 Feb 2022 02:15:09 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:28 +0100
Message-Id: <20220222011433.8761-5-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tIxe3R5aj/xYwDMk5u7jQ2OEUfwHp37Mnn4DCv39EdTF+0G+o5M
 pLpdSq4pgFPgrfW4xSi751av18e2KtauIOlv7UXbD/fDH1JN/jTwkEzNbs4iOWcvdgwDnwJ
 RLIhXw87ndd1GoRidcjfIYjEJer3zgfvim4JrDSLBi6iqMDAOv5LfrgMU0sfbI0rCOz3IZJ
 ENvjOnwU/p70MF415thaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bk6LWvT7BT4=:BslbZxIX6vuRNgXN3BK4wz
 GLwX5BTmDqY+375EAHBAkqyFRY8SCNG3HQIv/DIycN56bToaVt3oKr/H96sdfNoh/KNEVrL5u
 o9YN2HZPIPcaABkeSgPrh09qpRVJVgPDZsQJV+ZpsIvmKX9E2UJqdtyA5r1+5BJam9w0zjDKC
 0wAEm8nw0Yl6wURxRD4yJ/PiABUMrOS6G5Ap1Rud6HDX7URdOxV/FU5sykaswCEfEIzl88DMa
 9vipAjrnxx6aIAQpOG6vDG+kNQ0enb5Bzkt1oK3mL3o4iDRMum7uLb4BJZqQDZKY++5k0mAjt
 KfSfjnM7HrdukJQPz8Y72R2wysxLE+/AHPdjqSrJPH9Uuf4pFRoye4upP1tGSwdbsXO9+PyzF
 1E7TA76PwnAN2WgIWtqPmIdooE0g7vz4dUYNAVvhWZf90rPIvHgEFpF6LGVgjgaW62iu7g/Bx
 eaCaIBDpTfK/HZddEmoIAsgRP1xrhdxQY+Oky0w9O9UyeyAfYOz0PPavz9wkiOLHshhLB7YMp
 w2UfoKnP+EZkLSBsd15Z+o9dzY0OnL5KJsrCOjl7XbKeWLaOa7jghJka6+7KJmrkO6g8AX3cC
 zQDcDWoZwYBJnqMuFlbc5aVjnfEPlzhHEGaLZuYyrM8p5izrwHd8CBSOVDGc7krQxre2Mj6Ye
 MTQV/TWSMS6NzV2JtVmZghVYrivo4ovqy/tsM284SdIJpXsXgjIvdbahrmAZ1cSJHHAAqN0lG
 8zWJSMvu24AU2lQYS4SgOdohZGqh2gaIsM2jZ+J9ckeTymMSB2kF/g7xjbAOD3FAqy+LETPCh
 WsV7YJwHuy55+eUHcApoxtS2EScjRfX8P/0Befgqnm/lS2XDhPdZDp1wGLBpEJMfgz8N7Bct1
 WxI35vzXE4c7XFW7okDJ+WwM6UQ7yUQFRP3nkkJtLY0hgRERYt2S3QpL3GIwlrdMRSaff0vTe
 CvN0mUWtWzS9VtC95tphM9nXhsvv/cFne7y5oI7JKCyk1kZRGyM8iK2ocYlme0A5yDgzg6Z5V
 EkAXVwtcRoytlbZ/Ww/RDtkAHM55nIaglzmaD5a8KsNtmROG4DUj0YNt0LrJzTWuNol+4IJGY
 LkJ3VDMGqDk7i0=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 4/9] serial: sc16is7xx: remove redundant
	check in rs485_config
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

In uart_set_rs485_config() the serial core already ensures that only one of
both options RTS on send or RTS after send is set.

So remove this check from the drivers rs485_config() function to avoid
redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/sc16is7xx.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index 64e7e6c8145f..730f697bb517 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -959,16 +959,6 @@ static int sc16is7xx_config_rs485(struct uart_port *port,
 	struct sc16is7xx_one *one = to_sc16is7xx_one(port, port);
 
 	if (rs485->flags & SER_RS485_ENABLED) {
-		bool rts_during_rx, rts_during_tx;
-
-		rts_during_rx = rs485->flags & SER_RS485_RTS_AFTER_SEND;
-		rts_during_tx = rs485->flags & SER_RS485_RTS_ON_SEND;
-
-		if (rts_during_rx == rts_during_tx)
-			dev_err(port->dev,
-				"unsupported RTS signalling on_send:%d after_send:%d - exactly one of RS485 RTS flags should be set\n",
-				rts_during_tx, rts_during_rx);
-
 		/*
 		 * RTS signal is handled by HW, it's timing can't be influenced.
 		 * However, it's sometimes useful to delay TX even without RTS
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
