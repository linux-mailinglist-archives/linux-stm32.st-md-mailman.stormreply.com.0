Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A6A4B6B2F
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15622C60482;
	Tue, 15 Feb 2022 11:34:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1861FC6046D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791292;
 bh=WBgs4UsljChJvlnfHo4GVoBnICbWqNN2tqDkgEeXK8E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CwqT8j/XAyjFTenc5EWadJ9L5zmGbowtXcDGjm61u5A4NViTeDJQB9C18zzKcgfor
 NV+2fjqSdYHD2+D1ciHgMo8jMswyMluyVxfp/6gkP3i41BDsDPAFsqLVKCPTa4jngS
 lvAAfGK3psRu4EEryVzOA192Z0M885REfOqtiOkk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQj7-1nVFpu35HZ-00GonE; Sun, 13
 Feb 2022 23:28:11 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:37 +0100
Message-Id: <20220213222737.15709-10-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Q3ZlTb7isrIm8pDj4u1NbzVTiR5ZqKFpbyFVf3Sdoi4eXu3Ta8z
 oYr8DGswb8CiESXcXRkinbjAqcyDZxNc8JafBdlTupttlUD+Z9NxWNASfbGJhOPYqeE5I6g
 ZvCF/t1Zd866PwCgY+foXoupJw53+0IHnS3uR1IJZwozNfOaUy2VzvCWMZzPGb7rd1/maoM
 10tuzyU9LtKQuXKqUFAjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Dj1twAEpak=:OVSN2JAe4ZE0uvWQM649Op
 BL6K6yF8FeiZqlaEr5I98uPm8X6KxeuRNih8e+Wvx9vUuqtst0I2Oz91NdYv/GoipdF3DB1ZL
 ROOIseNmi8iTFt7FnsKxldz9TE/2WeiSIa0Wr9Ms70imRWn8jQEjPQU2Ij/FfiRgkpTqDruyq
 CtbWkfIz0MMTauBC/UqINDBQNI5qI+Mt9/DHwkJasSGUkFnsD98EIaWAQGIab51XBWBu0uOgA
 7aw7PH0Xi5uh27EFNpp9/+kSYM30xRiSr6YUrLBrs8LuygG+POkPLCOXQCCE2msuOL2KneoIM
 /q/r2keASCEXJ8YamkC61+eWDzw50epOpeORYUc3L1jJUudPl/Z1BgK8TMu3MoPL+OZViOcnE
 8HZr1oSfPnqhmCpIY9dw5YB3btCCV92bkj7zmqLoamUklN/ZNinNF4MFqEvPOJz8ajWz/JDAp
 w5A8S8iCAppW75Fim5IQTU3AXtSbME1wBRtyNUf2SqV+2XKB0DtiVOqMg18wGXWnTTrTIIQPJ
 5I0TCMBrVT4cSlWAgbiDgePjlevFVjthqfc98KJZNPQuuIe1Q19D0hf/mtP6GZctd0qy0x6rA
 HALXA2kRPj4P2LHkGJ1Sv75ZCLoKf3S0pMvovCwtx2awMTVURxCdCeB5B5txX5stmvARkuXP1
 DG2o17SRHoe1aviwNlGS4Svqp4aZfvH4li7XSGPBQ9PggopYWViWxV1tiyI7UGxyviPKpLWeA
 pvMHAPM7r/Dy0TIBNgOpG3b8g82qatKm2SKUKFZibvVV63Oj2IJpNhjVtUK1FEu1Z9Cdx5B6F
 5o2AkcHDK1oIkfpxT5OGEMUaEXP0UZHVMSMvz69sVqTT6pEKs/cdLnE8o1wvBxNBGxRdK9I9j
 +1zeo7CqBgAG2OMYYrwtvnYhQtBmp52TF4GZzrrEJUnGsHSqiRC5b9ErxqLstQV033DNsMez6
 XfSG/NuG++vj0/igLW4ipwhNi29OJkLg0+vGyXq2eQKNU5vYogYnMY1NFUJkB6cfPsPxTKNm/
 mb8L+T8L135tc9YFmXouLB9wcMgFC7LZe9eLSbatJ8gVt4U7TYLz6AKBqmM34VRfQC8hJ8Vd8
 bBOnRd9txaJJSA=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 9/9] serial: atmel: remove redundant
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

When RS485 is configured by userspace the serial core already assigns the
passed configuration to the uart port. So remove the assignment from the
drivers rs485_config function to avoid redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/atmel_serial.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 2d09a89974a2..2ab589a3d86c 100644
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
