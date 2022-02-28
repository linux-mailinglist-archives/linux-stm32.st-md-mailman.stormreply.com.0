Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C71604C613E
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87F49C60496;
	Mon, 28 Feb 2022 02:40:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C362C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015996;
 bh=b2y7rSofyMsAlLxNarbQCRJjCqiYzdU9dmvDBfCGMLU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=JR1AKVuNiqUbEUxyLsIzhssXF9U04iy6wbasXIWcmPYcWOwJvuupuX1uddFXeogpZ
 Igz8/9xLnDe0p0aWHdBknWFv+R6f5be4m8UZ3HGhaJF+F7oEyj2PmyvBaIS/3Y+4R6
 FbdhhRQz9Q6v8Nl4MfPcx22jhW1XiIKwXCqnvXqM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfUe-1nV5W81iES-00B2Hg; Mon, 28
 Feb 2022 03:39:56 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:27 +0100
Message-Id: <20220228023928.1067-9-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XQdTAWN+hOCHQZI0v6PwJlCmNFGeLzfYONORxEzccuJo5JNkvy3
 LLjpCfNjS+SyndZBa+MKsmY2KvbzaO3kciBZ+FYB2TZLsPwtWHz4At+PqEUr9rvE5H5xc2x
 nAmhN97jHyt9gP8kJvALdVh996IQr0+jGMGXgVrAInjtwCeZiEnMgx+jcWkfUn/luA1Ngyh
 h3KdHQN5wKUJuISgYfiDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xCK482DrRnc=:5lU9ulK8+36KTJoyzoD0vk
 +P/p+0PDYAbyZ4UQNvt/bpM/kJmxA4pYmDCK95qVXJork8vvYnw8ruFeweH/PvmGSaApDTHh1
 Az/tVDrEz3Er3RB7OuOOUhFIshN/ZpgOzOgGxk90xI1QN4dWE+Cvd1y++v45p+K+t2YiDadCe
 LrBJSyV8XLDSccTCmIi18lU+li4jjZmNwFFuzYL1UUVwmrInpsMJmBE4plwYH3skq47e6ecQl
 6XslkiKzE7Df6gZCvjZl1kpSMKw1Py3dok/l6GhXVEAnfwZUBYSE5nNKo30xlWF8PsePP+DwK
 Bb9T2nw+XlkBFsd+aq/px+FMFSLPXMIxBvuRHaSCb3ZGdeg2JJ3YFo8ilLx4qxjApztFPXCQz
 S4icdn1oHul70PywIAcElMwqf7f30Z5xo4TIF5B3a/ZbPEcbkUYr9h2ouR/hk8u0um5gOg/eu
 2uIpWhmUGwkPeNUGgLP6lD5erLt/LvQgo0eLX8BxOv9uWG0atkB20J0Lz8U9Ly0SsFyBlBjWy
 dVR1NpmPqe97bOTayj8lAlVF8pASU+dddr9cp2PXbHzNRqkrA8WfaDeFCmuFsny5+ryG+G3DL
 FGVgCoqZm8y2o4ZK3R1ANcXVwcl79hwTNALkl8gMYMG5xJMn9idlCzEKBFaHNDB9ff4V6aUD4
 sOQ2f7m85Da3+4itnf7ShvhQ6ct44UUYiiW3gHUF58i2VAP/nlBd8ayrFb1vb8u4lNC2gB3Zb
 eWzn44IBEKq4crDyf1CHMm7s0BcFE1mD1OSVXa/LlXRXj7TxMi67iheev4xrz/zeQHrMKaAGi
 7CIJExyh9iwCI8DL3R+9+9F2qOiJx9TqWd7Pf5XbypfH2N1HpTQD1taLu4T92kXyjd5ZctcvG
 q93VbVjfUxgPHblv9p8hTlvUKwG1fHWmrUXyor05j/VuzBUxqUGI8Di2NkQ1Dz11wkXaCElqb
 syV/NuRUnFUnqvPrSG8/TMt5tAv7kv5ejJnerymMg0Xe6ntqCIRNk7sqg/6sFVNUbKwhV/De0
 aQ6QSi2Xyt2t+5f1LgX/5n5kslu4LKcqCzuS1sGOK6B8rb7uZMu3IOwkTrJbKgkO1RzeHU7Fd
 jaO8BDIuDCxWc0=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 8/9] serial: fsl_lpuart: remove redundant
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
