Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F14BEEE1
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78D0BC60478;
	Tue, 22 Feb 2022 01:15:25 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C61EC60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492512;
 bh=b2y7rSofyMsAlLxNarbQCRJjCqiYzdU9dmvDBfCGMLU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HHyhmPBXip9YYtenzshreMUrlHEgCwgJ6wWiL/edeehDc1L9FOIWnsma8Bu6uZZyD
 WkEX/X87zgvOP77rTQKWAm3o7zDefUjJz8HnuJ/nD1rhqTix3XlYzHJDUMyJssIx/h
 nshou38+ERYs0+EqfKUkYzd49GigfpK6SX/dsj9Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysRk-1o9SNJ303m-00vtVm; Tue, 22
 Feb 2022 02:15:11 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:32 +0100
Message-Id: <20220222011433.8761-9-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:R0QwZ7CNF/l/mRVr+oYBpn8dTdTWnAg8vgoTGVXQ9Mtiola7ML7
 Mkl6ZXbpw9nxjwQ/YrMsXG2eychqcNDicAHEe+IabnCRP/RAvPcJ62XIxtBfpGAF+em2sek
 kUgKEtTAosYJNi0QhCrHzl2C/mYfmrhCSBRcRGlzm2+8QTn3h+O5RxxmHLTEkVJPxtuFdYE
 E+2R4PaSc8DQHuCuSPcyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DUG/ztOuIFI=:1BsmmNuF7gdS2hxGJQpIHJ
 5hpDyATXMN3pr7gBPEGWyh3vAF/XwBTer6Ej5JP4t+K/4C4kurCUZKMuYxzMi1Xz5NoUoNX4q
 9l21cWU4Pv7pui2RjU7YNu3FiQK4Jk4uZo3hVTqZpZYZ4mOt2G4IXi0xu8dtC7VzZqFtEThXo
 D29SNRRz0zJsS7fV1o7BzW4gUoreZ0i2W0PlFsaluRF8fRPmhmPoahynjwBo6z/S5xHadGD0f
 r9kO9UYv+aCI5meYUYrO37GTBHDxnrkHiDNCJStcWJ5WW3kDXH4DmXJlQsxljJpycdrL9hWqq
 9aZHwS3iRjn6zat858JCplxguKC2gb60qRDyg/A584yjHq6TGTo7j+gTNGSHv3j6yUCwyoem1
 YAZKrCL7KAJ7AhFcKb31/kMRwmGjH+NO7VFblWN7BvaKs/39vrNonBtrNa4dXTg8juV4WMHAQ
 yGOY0jpyh9hnVvC5c8rTv1LMBjJSgUuv8YhgTqYu7U237Bdz7O1nyGFqAyY9KjWCuvDJr96Dr
 FtGSJ+hKgcDpNQw410ctyRHiyJnmsJmTkXF0+HzfhZ6w2ysj5nmgNiCk01FyNGCcAYp6CfD7H
 i6dreZ1DgIj1Ydt2a/pJYynR0SBMxakK4ArPSrPSDt9YJ3dyvYJrCQf7TzbOckGf8qT/u53WP
 /wf0mcE5PUjp4+r0IAvbwp2q4yga+zS9oLatt3p+JxdA90Rl2raox8xM7B6GgWoAXTF4/nrXu
 7tAAHLRJtGjhmvwhvAdhCUh2HGey4qi4zfw70VImeH+FB9xXrh+R7jCRDeRiRYDPjWSQLF3xy
 TD+/+LDL/vZsi+SepeInxHaP1yzcsR8r7OlHicy7xO7mHclozUdbnkKmHgQDoc47l+0us0wB+
 UwkAf7bg+5d6r4RINRFrgbySE0XVnBq7lWHJyHpjAUuoKgLyCvAfmfpM1DvcYeQp9iiiL5UjW
 4HXjKxQF84bIRqbZbg8XgLD1Dv1CHmH+LbIiDvYhdt1Urv1AUtUH0kyJHzCu1gUu3monwdCoj
 pyZqFbfcmYieAK4/7HVQFjGYri+JtV30JpBymfzWn98afpf1m3RtLuxJ22RQn6rRrGjmZ1B2Q
 st6kdOr4Wviz+I=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 8/9] serial: fsl_lpuart: remove redundant
	code in rs485_config functions
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
index 7d90c5a530ee..a201be44d68a 100644
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
