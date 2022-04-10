Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D584FAD59
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2C19C628A8;
	Sun, 10 Apr 2022 10:47:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 294E4C628A6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587637;
 bh=sH4GWcet3t8UsheqwmzweMT86DhSlYFlIJ8afvdMkbA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LTrw3NSD5pR1mT2xtl5BD/JvFX1Q0D1uUHVI1pnqVEhYG5cZc4WG+eQLlfn5x/kJQ
 hJjUzTDy8Q7aE/zJ2Nkgh+CqrohMChOJc5sxsAIP0uYVbWZlyET6T42SJCxrgC4y02
 P2CsiCgGy+2xHDR4ShO84kkvdZmyfANiQsPBli6c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1naBAv16nc-005WBa; Sun, 10
 Apr 2022 12:47:17 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:37 +0200
Message-Id: <20220410104642.32195-5-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nxIRW4IpASBzZhIC0wKy6myh05IHHt/dHYiioie/NX+/0nfaj9T
 uNtygXATATV0Qm9fZYh+gE5u5cdUbX57WBaeO5gq7rJfCU1v1tkuvdI8iuVOivsWtIUjTJ1
 OINg7Ky7tb3wwvZsYxKmV9WJf5HBzwME98+GKW14IIW8nTRrmv/LtWOFZ2b3OfOJXQD03XI
 qEa6SLzdia+3YLo316fQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rv+ObUgxBd8=:MS/eHE+YbEGx9By85ob2Al
 kgKW/1/ebyasIoMZ7FogvN7E4iRz+HEV1UyCpxdYHSOKap3adVOrfcs7/zMVEgnUd31QXYTmB
 A8Hw3GtqU1+0uYNy05odZ7kiOl+bsKNuCp42wVupTOHlEBaSb8JmkCaAXvptbLWvysWCKu18/
 jSi8CzYtAdFM+9c+a8Nedm51+Ab0vACwf8Huc9s1FCaHAW1FwS31jT/flp5S7q1T+Se9+Vvn5
 4QG+Bjp8qRbaeJSKdfpNAVsAvtAsEYdbLyw4tBfwZ01b6fPcfaTqXftNZz5d8eGOZ8GV3CFoE
 M5gnel3S6R10DrToO8VX+DDm9D7I21yPiDHiP++zqyTFBoxWqxuoJvgRuK1JLtyKL3XbuAu1z
 7z0WWARCPT0uO1nHEt/q50iWkldQimhS7JIZUqMJ5yQYbBHC0qU2JZ5sIMthiMFQukPqqSuKi
 xRlWnl+LU0kGvsikVDOP83xoB3WwQxznagE0WItbHKESAxOdTBF6b5YNCcedLY5m9CF/8sl3G
 WLHeQ6DObfjtQbTv+z7/v+voWjtjcBF7CF/n67p9Cl3UUD638EmDHUZtSlYTBm76vEK6bg/4T
 SbtkGe6RzoTAMwSGTpqkNyI2MQQAdZ3zr8IRfOn24O4qRbm/uHQedKV6vVIwQmLiJjSaIRcay
 vKUGxSUtzRqjcl7higDFlB76UF040unecWD8rmSyheo5U7w6eScNEWz9oewgPWvPjJSYCz5dE
 Qbokol7Ubas8n/obFedoyZrzm4QMSaSfa93t7WN5qiOhuLDWUQG1O2HJeao4aLSL8JjcP2rve
 hdLxCj4PqRsX4JZL36f/W7X8XRuz4RhR9kPJ/vQbUAgThrp5JIvZwBEQNzpjSOCPRHw0QzW7G
 V4Kb/9RTMcCbjkBHGggNQ0JA6F4oFjYU1ds4QJT1BJoA3DITVk//E3MYAd1Oox/3eQ3JoTkEN
 10zBMbuKZzv1YJwTgCGP2O/axAVeuGBZ7AjP/hBschgqwNfiIZp/CGjrl0B2chSx1t2KCL+KQ
 S3ZSq+htgRL8CrXdx9rtN4uxLw33o48fDe1BxhoOLuEiIJZnJ84XFnochqijKQH+0660qSlFw
 7hCUneFyc0ttig=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 RESEND 4/9] serial: sc16is7xx: remove
	redundant check in rs485_config
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
index e857fb61efbf..bb939d2877db 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1134,16 +1134,6 @@ static int sc16is7xx_config_rs485(struct uart_port *port,
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
