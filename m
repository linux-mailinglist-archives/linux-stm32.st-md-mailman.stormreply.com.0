Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEF34B7BB8
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 777B7C6046F;
	Wed, 16 Feb 2022 00:18:58 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 366F3C6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970726;
 bh=BQ5MyBCpjfg+yHv6OzKWHvUqGE9f+kW4GWjcO6Xbhrg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Dz12jh4ANy9mGmLaDvnvpB6Suvo2dMtVONY/FoEbGMR9Uzd3UGNJ0f/ySjBQMtfRT
 bKb5oX2Kodg4U/t8DEla21qObCRl3j2bqHL8KXVvzRWbLJM1hqZspDDGr7xm9a3TvM
 op7q34WgeNSbvFUUJAQQ7hUz7p1aeMQqT0Stnvfo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0JW-1o06c208y0-00kSRH; Wed, 16
 Feb 2022 01:18:46 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:18:02 +0100
Message-Id: <20220216001803.637-9-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:P/8CsEWOtdAMBAgYCvJwzihfTUjSNmpksL/b7HGx4d+x+KZ+Aq5
 GDe5r5fjAQPth1LWFk/RyKy+qtkIBQz/E2LHhpvHNpgkpJbIMQok+PDGFSINGISuUgutAS5
 S0kOwaqwpPwogy0rb4nDgg/89JCHkCZs4YDbEDrHhvHwoQfSBnIghNqmTI7GlAQZTIBU1xe
 rV4ZGCdkwDmJR4ot70cnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:52WexnfShw4=:drvjfqfunKYHM+fpCmKW8S
 K++lOUwYbzYVqR+mjmOneD5ojZwnaaaTmJ7KZGTKZPVyKW60Re7EQTKq5Sb2Ubpgc5JgOSFDP
 4upLqhrTe0RS/bLjAEbXE11r0K6swVCxxvg0e2BaHNw38IVhbg2iWdiv/nCSeiETIdbWeqkmk
 o3qQogHTuR64jG+EaLAE9GcTQRn3M7QSTgVR7I9B6Z27EcCnXokiv4itGTJTlHUZa5uhLJuod
 7LkKHIj5W0rfhkQgAaVpTIFzRJpB3ZdXjArDCDauMrM69WxeWEKA9bJsRUFPW/5s1g9z0LAut
 O6BYpPNQ987YzYnetcF067t20/2/BcMUebzRWS9NDyLmvyeEh0aMUrdgqQn7VT3/NpqVaC/fo
 npHK7EBQBpeOt/KToVMmBbzZTnKveUXp6M6H1ocH0B/9g3XCvN39IAhguG9LKIQKJUHrwf3M0
 cwRaXRm2/GGWO0hO5rCVx7cruLaKh8ocTzyvKzEXCaj2C+9jBqL+H7gNbfLtGIyGoufw/Tr+p
 LrKg4H+Yls/MhjjabyflH9oZclYfGmLRFlhinblR8dTJC2RMOI28PXbe271mxhgU5MME4DdCH
 tG7tvJ3Rcd96edoNpGB8KS4jD3ZHm+nqh6D8yd2GOkNcLAIhV8uogsXe7DWfbFZaiOjZvv/EU
 zWZMyisGZIJLfHDkTGjnVR3NF6Zmp3fCzBrMoGRlIMLDmFUSoV00j6NXMffJp6JOfI4IefRnt
 UDz59onhesy9t7jFkbg7kGss5LCD9IN1DUgV05nMfcdPkCShizKYs9L+ARcxKxvKeEti4XUV/
 6luXNJjmtHlOWQzS6W+71Aa36hYDB/19EEzXlMOMO77oiEivC74/M7OeI/DdhgdjfkQHtTfla
 y+JPf5ochr/b8+sQx8IlNAIONuleXxmJB3qDi2z8xk9OfCB0djsDb58Q3N1zW0EMf1q1sPDTs
 Y4htZIssY9YnC5OH8Y4ybLDvfwWeIlMzAB9Iy+IOxrPwOC2lisZb9L1lHYAh2zMUiPa/BZbkx
 tswJfHhiKUaLSjRoCcXUYZAC6vDMnwaF0yZ388YwhJ6977YkBlhzjGliwd0XyBEVKyvdvPN3U
 m+oQDsS40NCVS8=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 8/9] serial: fsl_lpuart: remove redundant
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
