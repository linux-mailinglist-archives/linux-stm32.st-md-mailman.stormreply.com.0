Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605E4BEEDD
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EE17C6047F;
	Tue, 22 Feb 2022 01:15:21 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF57DC6046F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492512;
 bh=lEGAOtzgMEFzQKENfjNLVN0s0ToEzWqdhUuUbTO2bGM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ge/7Uk7V/IzQamDgNXDVZvVyKqd5insicDzvapDhXavvi3qo4FYW7M0nyZDFh+YSj
 4Qwj/k0FxGe1jZ6UvIQcW0bLgf+sp3SpexFk6m8CAWRzKw2p3RA3b9gMPBhyHMx+WI
 kEqu29XU9YXG34Hytbz2bNt/WzYUAx2Mtxjr+PEE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJV6-1nqh301gSk-00fT5W; Tue, 22
 Feb 2022 02:15:12 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:33 +0100
Message-Id: <20220222011433.8761-10-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bv2z3mAXWdpqELROOyojpjGAFmvhd9PZYl442nj8R122IfdOqxk
 1tQpzRuLC7Fsyr4HxbpC8xSGSSJHPnaHWcP4ketFZsBdZ5ZpmJoJmpMFHvfiTa1YR5BLMzh
 cfNM0W9I/MenOtYzJSnXNdBIbrdvZCHwMLNyc46qbPHuLRSY9O0m1lANaZ2AMk/4P8bzpvz
 hDZOOPRadR7oxCIq2jwcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b9iQb2TqwS0=:FMH99wrfQQGCjY2UNaGD8t
 3voyfBU2YiqBxOp/7Yjfl2vovYpoCeU4ao/AaLL/+2nLHggL8MvxrfsV1TXfUVdbJrKoUKacv
 kPN6DWZCwxRxRLzRS+lp9ZWRMWTZm2GO3aqdIpg+PbLOQbgFwQw6+ExGr3p156V06egM+zO43
 dkgkvJ/zOgjrU5MYbj5XpZgqz1evF9WVcmwSPDLWrIRxYluq9LRbKdOVOOUMMCElkRophkndl
 24N0xjtpeHQcRTU5pAKT0Mnava7kvxfR2dkHC3vM7aZlvtfqzs9bcHerOEqKGtRZJTkTbW6PY
 usu2rMEp3XCwaz3c8O9lod7B8MLkUv7vn5r7QqlmXtaNQ1cVqZyQlVmbOoFG62U5i+e9nmaPs
 GK7NneVEHN2X29x6l8NybWkH8eABylVpfOH2F3NzWpTq7KSf8u0Xu0d63ysu55x1u2cxLZ3tH
 3Di1L3VI8ATgULFDI6rEoLFgP6sO0EcRq8SvWrLe89cL5BjKeSOx7xZ1GKirIu1oQURjGL5Bd
 jMV6pr+MwTkvbIR5aiXYDeGLiQ6ZUajH9qsbEva0eyVE8vMR+rhrJjauTJM3K5DtnlG44pNQV
 RjMUySGhd2HPDgrihsWL7zSjRV8C/GZYEoTXs3AajN8SW7rFy67+U8w7SLN/0TrXjh6eEGdVj
 IhtC4TPPCI7QjVmSsoBZVBDh+O/XFeyYValvhxPawUnapL+KhS4OvfKx242TGSaRtXbfljkSq
 u+NGDicXrwBmfLR/N17ikCmzk1W1H4Fmd1mF/94OtJYkKN/byg1i46wu5vHFS8Dsnwj4SW8Gm
 GMYnCqFu51V/PoVc1j6H91y51YPBwvU+OZMn/vksJaqmM4jx72xw6jccBaz4htVPEP1N81U46
 DNTgV08Sm97yuXLHNrjbahlziAbVliddDHmrn/XOMmaGlhgYj5LvWUwFJB3qstdYeN4a6V1ll
 VghyGPa2GQJN8YCKf9ttyj3NLv7IgNiUZZPaEcDurG+VkljkOBc8JGChXI7sncidPvV3kqhMr
 j03vWp3jusvtN4jtqLqWxdnPXXlEz/dA/a/g4lQMK3X9pO2/VKUPh/NktmVkyMtBReul/hzoE
 DIlSFzITkj95kI=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 9/9] serial: atmel: remove redundant
	assignment in rs485_config
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

In uart_set_rs485_config() the serial core already assigns the passed
serial_rs485 struct to the uart port.

So remove the assignment from the drivers rs485_config() function to avoid
redundancy.

Acked-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/atmel_serial.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 73d43919898d..18d3bbdcb7a2 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -299,11 +299,9 @@ static int atmel_config_rs485(struct uart_port *port,
 	/* Resetting serial mode to RS232 (0x0) */
 	mode &= ~ATMEL_US_USMODE;
 
-	port->rs485 = *rs485conf;
-
 	if (rs485conf->flags & SER_RS485_ENABLED) {
 		dev_dbg(port->dev, "Setting UART to RS485\n");
-		if (port->rs485.flags & SER_RS485_RX_DURING_TX)
+		if (rs485conf->flags & SER_RS485_RX_DURING_TX)
 			atmel_port->tx_done_mask = ATMEL_US_TXRDY;
 		else
 			atmel_port->tx_done_mask = ATMEL_US_TXEMPTY;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
