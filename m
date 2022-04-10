Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4816C4FAD5A
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AAF6C628AD;
	Sun, 10 Apr 2022 10:47:30 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 699ABC628A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587640;
 bh=sgguoRaS2TlrebaefUioIyv1Sby/7wOqOhBsg4HrAe4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aCiKvZRPvrXFmsM57tB/p97dj7WQQK2pKThT5rwUTjjCh0b6nQQQfAtcJEC3XtyDv
 0TcCvS5WPFDbtzZFl7U9OHo2GGpJR6p8gMahC7/9ZD7RzMYHEibFAu5xRpQRUWSDHx
 A7J8qVqc3DBJu8KjRzgl8ZAzFT6ikKmdQKxDBQqc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8GQs-1nzNWa1YlE-014GAc; Sun, 10
 Apr 2022 12:47:20 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:42 +0200
Message-Id: <20220410104642.32195-10-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8ffrXrQsbMz/N6WspPKgXguRr1bS3q5soA6JNcGZo8ZmdFieX+Z
 rUInPwmSnSNMlv73PqUgg1KDGn7ZC6/HPnKic8Nmsb4CPH36Gsu27w3A3RdLQ+Kowzyjrsx
 76kM0WgH+bgIFRpHMJ81xmdnWoo3tQ2fctNdhXmvNWivxgeANUkn7LNS4h3G0ffypshD9mm
 BfI48+b6l6/ASA4x0nHKg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4yr4llBWTr4=:n4BWjLga1isj9AecV7NBeI
 xKwlICbnPCXbrQoCerzcmbC4fVzy2YLv/hzlZKxRwnWfOHb/d3ALgEq/jwGtlVvJupZVBXxIU
 +C2jE9y4VUaNkpoKnBQ2P7weK1Kh97sCrkJjuwJMzoztlUVBk9FoACVRVbCO4/tLip2Yu3g+s
 gR6yNXBod1Yv5pGQxT091/uvbsNc+j9rhakYUfELNi1pUvc3K5Gfw7XjtNxexXbGZOUuBLL/6
 q3jO3lEEdoqScf18SNQUGTWzPHM/50wY+P0xVVfJllUOmKuKugs7e3h3OO7VLCkpWPBRKNRs7
 5aQvfoN5PYNKww3r6uy+jMJsIZhYKx9m+2redZAcB0Up8/v3+EgAVQIwlFUxIbzPGdgZJiGUS
 Be806cz9LYpPDs1hDTNYLPEeU3ifbmFqAdJNv8YCZ6Qx2U42kQnkbYBxUmZvUPDJf7TQ55FOf
 FnUylAbT7bOAAMvRrkvkpQk/+Lo4fjShHSVRHw3pSbBt+EHe8JErC9qVeXsT9hEJohxUWaB3p
 WjTEAsgo4s88A3DtGPGU9dikTu7vfu5K6prfkFzzmMiRUPK8kq4cffUnwwFGNGy1fvy0+eiLt
 d/53+JwjId89FqB9Fg3xLsVIR0lKOMPuw3XRy1YvuQAYv5rNDVNNgRwx3ZqJbzUDmz9sMRS9k
 JlCmiFhx9kqvO2xB8Qh32g8h8sntNFGybSBZH99W4uXD4GWoE6CX1tbaX0lOicq1g7QKuPB4Q
 nXg90uhnd3N09t0MJA/e9bX/XkFa3UTaB05vmeVOUStyVFp+vc4AtDDh1Zgej0APkIJD8tXHg
 rUE7GTLeIprOPSVeaJ8ytMj7ax+olKNLxKxlLs3ruKLYazTWxXr1BpZNC2qloD+F7sJW8jvqG
 TrobolQhmzkyzyu8JN5W7+MP6AU+BnUUO2/FACGXkI2SLnlLlXxNtxxn0Nmvm9SnAwBvvfRKu
 XZo4e0q3w+LWfRVcQOOwwunZ3Rj1SeHNi8PBYsaYAWdYxeelL0/sHHxU3lIxJEfEtmZ5Tfpdo
 V2ayVlii9BsLmAyVRTBMunsjEaTmShGIyys8ueUoyisI1kk+8786Jmlhf6qEij+y+XZwEZJGE
 ymE9qc9IuPA5cA=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 RESEND 9/9] serial: atmel: remove redundant
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
index 3a45e4fc7993..dd1c7e4bd1c9 100644
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
