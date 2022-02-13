Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D304E4B6B2A
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 880A1C60473;
	Tue, 15 Feb 2022 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0A4EC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791287;
 bh=e4EzhSBd05ZEK5ajCopJGbJXFDfnsrEfcW+jvd6E+EY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=STLst4lAjQO2aaHoXQIhOYARHXJ6XlPxmkJVoAUQjQFRwFsmEa6HK8w9yRlZ2Frq+
 X5WKn5OybS/dtVHBUkEF1FbX/+VZF60pvi/pwdCBWWAyMsbJIVkbh8U90UU4E7i8lE
 iEmlCPQrK0x5ecSF9u62iJZypBMyqMJ21SeXO848=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD6g-1nxP7t2Zs2-00eI2N; Sun, 13
 Feb 2022 23:28:07 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:32 +0100
Message-Id: <20220213222737.15709-5-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dCybVK/xN3+Sufq+aIz+9f9d8QRQ5K5pMV3gwc6qC9O0NCSdf1D
 cunb/0Yy49nK2WJiwnG/+2iYNACFAlKyWdWsfvp1naKMMsRuUqdzTZzl+xqlpHZPw3EmPHH
 cibXWxB0zOOjR1LwlupJz/gBg3u2f9jFJ6mj2wZ/7+fxaGmahcpW28UDocXGZCRFeRNrbCQ
 4yjiBCc3/e+QF/Ah5zyTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aKkoKQM+Niw=:w9opw6DPjw/Opr/KqbN+rB
 ymJPaf8mIS3FNLW6vprkomZuQPEymZTl0UWHNblaHbr2eVcjj0v4jPn1+aZMOmUJxXzNaDPRu
 cl/jG1nnV85ebW5mQMzaX2D1zMavfpclrQZzcfqFJxWNc6/XiyW/DIxEGC91Bi2OAU+qcecUK
 PtF0AB4ecTlLeks9vZ5ZzEz7HlnpiqhULNBANP28WT8O8BIRgQxsNSJU1ve2IEuyjxM/jRqLI
 R5E5FTLBMsz0TNDuJxcoxvGJxyywfi4p5RFuHSkcJBLdbjR6RjiV9Vf+8y9RQAJ0Pp5yYP617
 Gyu7uPrN57ueFlZ5U2zN+olfpRIS1l5PgAfdgNDYtG5N6XKH3lUm4mXP9B0/5r5PfPp4IhihX
 69Yyh/SDBERp+KX+Jw7erFp+RPXmqiEFg3s5qb3n+VR7NH88Qln/5HxAXADiNQ3vnXQe/fUm3
 HSi4Km7WVKlREaH2NUEOMPHVTg5ZSnmkMJIOU0czn0smQ7I5TBclbaJTUyfpPDOjK5ycz9lP/
 dMKJpRJ+gXZ5FKYSIgy582WdV1jOMY5AK3awmoIUlku0Q6snbZQwmRmWxGOD/tyAd5RxN7xQd
 EIqDRkl91q7i+cnp7O8PZ1I5t8NJz1H9t2F+RnabTbV6hmU2oDphzQWa6mbOIikX2Wcs4vEDd
 SF/4pG4UUMyPj5UhWlVbhELhIIemvbwZ3sqaFjUUaWttAKwLjaNJWWkJsK9V/sopRI6lC7n93
 NeuByx7DUAgFTtNTgYK2C8Rb+JCJbek0KccgEmb0FgUKVgrPCsbSyfjit0pA+xo8adLUa7tkH
 zkPPErTGqjGygIKJuCkrHG6k1rKAT9HnJ3EOG9f608BZ22fZLz9lg1eqsQox1BDzPtI9RHeJG
 sUf++xMp5s00HwHoWGHb1cvEGMvGvBwcyipAcSJ0sRThVmhvzZ01dEZ+YD1DiV0zHJPrFiINE
 vCmcWAScBZi37Un9UsyuWC1Dx70yr6azZw3b+6+HCi4gbBBMNO9KY+6nVEQX4y1pCjvc2vWM8
 M5ADToxSgoxi5sck+1dE7c8YTd5zNGA37Q6A8fmAxwt3W9eyDVd3fVAJMkoZ8Du2LfWVvGp1B
 V88fCP6jF2XSV8=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/9] serial: sc16is7xx: remove redundant code
	in rs485_config
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
valid RTS settings. So remove the check from the implementation of the
sc16is7xx drivers rs485_config function to avoid redundancy.

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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
