Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 067674FAD54
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4ED2C60493;
	Sun, 10 Apr 2022 10:47:26 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9B7DC60494
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587639;
 bh=JByECI7TAM6CgORkivVd7bXTA2zEkD7TRbKJYZRCVwU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Q0GmQdFVVtIDZEjsMvsKkTHWKuiQIUpuSnwVlh0O4VsrtgQSy0pfA9awKY9GygFGU
 xUZ49NTV32j0QL9mO8ilQsZaUvu+OjXj4yBwwEe22/3eGEPife4x8qFzDPnaGkrvcO
 sp0kUAquj+xqL4tN0IS6AgwMZPuvWSuPQak7sPqA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1ncx8P38GQ-000YNM; Sun, 10
 Apr 2022 12:47:19 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:41 +0200
Message-Id: <20220410104642.32195-9-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Z+XKmCv9ccGIK4kvzSz6jEc3jegf7kILeUSLei2lpJxdxHIULrQ
 rPYaRQSw/gut4KnzrGNgaRL613Z0dAXLTuKiOTrQJP5SYsbxvHaAwS14Aae2ObBk92jvEF7
 YZXbWfyY+4QcWEcob6oB8o2Qu01Fo6A0CC3iuS3v8KT0ruS6pS8fRVDxIzbVYkTYjzoraKu
 SeiqKOCxPZA/iIU8y1LIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+HQ5Fnn3+po=:XkIi68X6HUVmbNelzXpCkP
 nmMJiXiCoEzrXXxVSadBtPkTcM5QF82TcAqMzQ07MqHsKxIy9JqgPYAet2aQKD2x/tjsw2Bao
 a7BIaR2NSwizS1BwwDGyUWt2saQeXMWNzWmBUI7U+vOD7GhlUvaNztlx1mu3sVpwrlxP42++A
 IeV8GaTka+sGZt0ydub798tOHillaijOLEbFz74tGuEocRzLgwtq+tzNjcbQGMUBITAnqy6yZ
 Ta7iwJmh0rnkyYJZniz+R9UUQC+/yRjn1/xarZvKMrkDNBVGpLkdoM/gLNsApVwJyeDd8KLmj
 gejKoaXWDeNneTsOHThFD/V5CEJjhRnCIuyH17ohFWPgdDl0Ts7Y7puMOJsgKb4Aj/49Xiu+5
 M16bzcebi2grpMGgDGxWwPzLKD92KswEfyevC6P2BrPZECAcFoEqMhovDlMG7kf0F/P7A9rif
 nORqzePvaS39/W8QJVihVEB6fxAO5YOebE1TcVLqs226Ngse1PxB2U7AG74eqcijSSg4afx3A
 WFx/B4KWy69yRslv6auEdwjz8nR9kbJEIVaGS2zd6aqCGbLAtyE1gsCI2HSHq8mPFI5RTZ+Ho
 nCYV/BKLjnfBIEFvJYeorcDPfhGaluMLT0v+ahauppMJGYTbz4oQwG7maQasvILmRvTm8tmC0
 xftth2k18lrQ+Qn6gfeSVrAp96igKGB6zliPsTVR1nZmd/xNCqDWWwtGWk+xa4aabONO3y8Il
 u64SU7blmTEPkM74NlH24SyETEPh2z4S37m/VSBfG8pPwh8BDCII5UmHf/3bpa72eE5osIkvF
 pW+76T/UUcpflJBiAHFLJIkPzkwHDb99BoApdr/5LCIB0DYU2+HJhQa3/xR4IbNkrUwh7Eu5Z
 gy05WJMc1YodbpKz/Tui2/pyOxawMXGVuuOF2RsiblIum2jCAbG3LULr22wqAynzT5SFbpXqj
 WYzoAEgf1v//gBHY6k/WxsuPiAnP1vYwuEfxISwDVzLDrgmGkM8ERueB6alEWcslY6A1lZp9G
 o8tFY7UUQPJOm8umRMPKzdK0o8ZyNPXVgIVLOjp1IDTJsWmxhC+GBMfLHS3I57/KkZoF1Mla1
 phymVb20OGHnzE=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 RESEND 8/9] serial: fsl_lpuart: remove
	redundant code in rs485_config functions
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
both options RTS on send or RTS after send is set. It also assigns the
passed serial_rs485 struct to the uart port.

So remove the check and the assignment from the drivers rs485_config()
function to avoid redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/fsl_lpuart.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index 87789872f400..8fea7fd915d2 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -1377,19 +1377,6 @@ static int lpuart_config_rs485(struct uart_port *port,
 		/* Enable auto RS-485 RTS mode */
 		modem |= UARTMODEM_TXRTSE;
 
-		/*
-		 * RTS needs to be logic HIGH either during transfer _or_ after
-		 * transfer, other variants are not supported by the hardware.
-		 */
-
-		if (!(rs485->flags & (SER_RS485_RTS_ON_SEND |
-				SER_RS485_RTS_AFTER_SEND)))
-			rs485->flags |= SER_RS485_RTS_ON_SEND;
-
-		if (rs485->flags & SER_RS485_RTS_ON_SEND &&
-				rs485->flags & SER_RS485_RTS_AFTER_SEND)
-			rs485->flags &= ~SER_RS485_RTS_AFTER_SEND;
-
 		/*
 		 * The hardware defaults to RTS logic HIGH while transfer.
 		 * Switch polarity in case RTS shall be logic HIGH
@@ -1402,9 +1389,6 @@ static int lpuart_config_rs485(struct uart_port *port,
 			modem |= UARTMODEM_TXRTSPOL;
 	}
 
-	/* Store the new configuration */
-	sport->port.rs485 = *rs485;
-
 	writeb(modem, sport->port.membase + UARTMODEM);
 	return 0;
 }
@@ -1428,19 +1412,6 @@ static int lpuart32_config_rs485(struct uart_port *port,
 		/* Enable auto RS-485 RTS mode */
 		modem |= UARTMODEM_TXRTSE;
 
-		/*
-		 * RTS needs to be logic HIGH either during transfer _or_ after
-		 * transfer, other variants are not supported by the hardware.
-		 */
-
-		if (!(rs485->flags & (SER_RS485_RTS_ON_SEND |
-				SER_RS485_RTS_AFTER_SEND)))
-			rs485->flags |= SER_RS485_RTS_ON_SEND;
-
-		if (rs485->flags & SER_RS485_RTS_ON_SEND &&
-				rs485->flags & SER_RS485_RTS_AFTER_SEND)
-			rs485->flags &= ~SER_RS485_RTS_AFTER_SEND;
-
 		/*
 		 * The hardware defaults to RTS logic HIGH while transfer.
 		 * Switch polarity in case RTS shall be logic HIGH
@@ -1453,9 +1424,6 @@ static int lpuart32_config_rs485(struct uart_port *port,
 			modem |= UARTMODEM_TXRTSPOL;
 	}
 
-	/* Store the new configuration */
-	sport->port.rs485 = *rs485;
-
 	lpuart32_write(&sport->port, modem, UARTMODIR);
 	return 0;
 }
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
