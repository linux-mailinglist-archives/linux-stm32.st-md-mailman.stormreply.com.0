Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 378034B6B2E
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6840C6047F;
	Tue, 15 Feb 2022 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76AB1C6046D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791291;
 bh=n1QSAdLWsAQBxZRJC/gnWpm6+lTx/Zgz/1kXnTeWbTk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ewg+pyudUNNhlTxmxJ8m6Y3bDNHGCsC/G+mULYJ8HmmdZKqlR1VpEkkaQluanR/LW
 KkB4PMKjYTYHzXm1iotEX+SZ41V+5uf8qWFSjAAQQzMQBNrZnMaX2XhNsWyU8hywL2
 6uHBxCyMo29Jn83DPp4fedU0Y6PEZJrupTOabWx0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0NU-1nz4sc49Zg-00kOyf; Sun, 13
 Feb 2022 23:28:11 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:36 +0100
Message-Id: <20220213222737.15709-9-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:C/eQLJontq2RLt02NobbFgS16JscCgWH9ptxRkHS5Z0m9OOZox8
 QJGSADIVHCm1oXdpAIolH0IZm4dSg8gHv3aQgY5IRT0JMcQLYAzrw6FPiw1+XnQmDkw/xGA
 W1WYjAcv3FUh6R5QieabywvgR65jtD6wAJRB1A7LCgqcjvv7kUdIfMTyYwJm6rwuRAh/fiw
 3G7H1DWGTLFL4eHAtVtHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GW96dTaR/Ik=:6fYq+kp+ugwqcmrcScHMoV
 wOyxIc3gMQMRzOuEnq6jtapGs4U2M8+oUbMt40BV043zmHcmQWGYUj8dDBHY1yY6norO36M1n
 iLjV4E/eKtC9UvCoBwDHvJ/De7yCeltCTg2C4nH0J8JqSxNEFTNkaV5CjJ9PjpwCoyzKvJJXU
 ViHnDFV4EGwFNkhmIbUOYNJoTEL6FjJsPm7zFEpSPQIVxoaOsOWRGiWuJFeGwvAmTagcv2z+k
 vgTlgaFGH9VolAQF/547ya+PrpoLbqN7fVImQIofNzcUVOW5vF8BX8ZnG7RQzifTgW6L6uFta
 cZMkfHowUdQMM1wWw0gsPn0QR+nu0HTJWrrAxD7FOWFTlg2tXeQFecsdzUn6+WuvQLvEQ17Ge
 Nu/O2UuBw1oHiMy/i96I5iycFskGaUB0veiYC/UferD6jrR0gDLyrvGHkPq2TkrDB59CM5nws
 Irt9JWtQ7lSpzstneXMh+eSqm7RMsY2pkKyavxomlAj6gJ+iVwSSymmw3qNS6iUNudWVMmmUy
 X/r15abl8xgXnCwaNgU2nmC6bQNylF/PiBsbLO26fQ7RdRkmmRxA2rCg4QDSOmY3Bgc5WU3sP
 +5p6nkurvY512d1Lh2RYEquXw+BCFwEgEaUrpC30GXRl9VUQObsZnmUl+FWkinx+jIg3X51lm
 JDxwxOb99VgRe6pSP672lFY8PTUVzKfnkNEoUPdD5XUy5Gphr5Q0KZrUaN1Pfmffj8N0J2EfZ
 bico4auJJJ1CYfKartha5WPYYxIKiNCsjf3aylRjLnM69xTBqWBKa8uG8dc51TVuNeocqOPG1
 msF45QnjwajjZAddvYbe6F0wJpFU+t7yq229qTTYbtyRNcEOLAPQfTZ0jJDBIainijc4QMaFX
 rYI6YRkejlmWgClXwy3S68++4/mCEL5MtqBUlakr+0KGJWJL7gX95o585ZZDS6g/Hvi7oHk8C
 CSr6/n8YCbJpPuuxFyrJTW/o05vv2DoBTupXcJcBbIJgYSB8Uo653tuL3pgZEgi8UZKE0oZ3V
 GhqGp3xUjYGnnkHcakzt6VkE43zKlAaQDB1A61TL1xDn4dHrqnYbAS3VRFU5of8PXHfKB3pbN
 OS50J6mm4wD4M8=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 8/9] serial: fsl_lpuart: remove redundant code
	in rs485_config functions
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

When RS485 is configured by userspace the serial core already checks for
valid RTS settings and assigns the configuration to the uart port. So
remove both tasks from the code of the lpuart_config_rs485 and the
lpuart32_config_rs485 function to avoid redundancy.

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
