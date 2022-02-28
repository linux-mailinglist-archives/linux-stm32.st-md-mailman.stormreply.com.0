Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D03FB4C613D
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7045DC6049A;
	Mon, 28 Feb 2022 02:40:04 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 468FDC5F1F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015994;
 bh=Hex8IO2WpX9Y5fu2wHgqKu6/ZEI0eyXNRweluNBil8E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MJmRpAW3ELiY6xmT8V4KIe4FskOUjZzBMr+hm7/cHlIfvw81Qje3192nHowzBXVY9
 b5CgdtlH859uTcoXNJ/GyzdvD+/VFlkaCMGoPJlMl8cLbAZMo6I6ICUHRKF0x7BuNn
 XXli6wwUkLOh7DPRPs9uvruS+/RBnJZ5xe20SR5A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHnm-1oDsRs1Bm6-00tkfi; Mon, 28
 Feb 2022 03:39:54 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:24 +0100
Message-Id: <20220228023928.1067-6-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PzdDhAUBSdMJlshR3Bdzn7uubrZ2Nqrom7Xkdt+5MPDni17JylJ
 t3FciW6GtSjmf5Ut97Sks6n4utUOydeU7gnjx6v/Yak2RTSJzHFghZKqpi47SGHBhWCzXQ2
 YWa5kbBtRYJmUZEJLqtzBlBFdaAQl1vPmh+LQhcxMJQ54sGeiw5aXcLiFBku65BSEC7itr0
 VY3LlyMM+54qBAx+XafLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uHeAU+X1K68=:nK1t7m6GVjwVR6dIW1wsGX
 NOenbdx4BFVOw3CUbblMN0zzCgag2cOsSj3+6s9anpjScW1azi64Nw/uVkWrRK80ddT41u+8Z
 jDJsxPKF2R2zKiEZDYXKq7iNP2EAPcpH1+jWkBNg8vdZzfbYkC2mcummtRvqG+E4B4LEF5HKz
 dmYE9uFF2j5DVF6+UUgW8EWA+bbaVdFYL+mGFCbUxZ8QKa/3u74VFxXr4k3VaiMlsZDy1tGnX
 4U6KwaXLoQF6C5HCQDbVOUfb+JIrLbCuzbhQTACnmN036iLO70VHqB4RQlM3iFKCHrg/6YFCT
 Xv5zDLgv1TkVUEjA44QHFV0sHfTyEovGMJ8NCqzXhnSFOhndSlM22OqqzN2GpUFD44G+HmEI4
 k9TTaWBkg/ya0pFqDXonrUDxG+kMrY0Eo6XsQvnf14maIF4Ny1fhvjL7IZlsL7giCE74c7zzW
 Le5SSzYJmiHs1Io83NQ64upO6mNjqvNuLUqvEBADX3kbjUhBh7iTH8WxlxjmnFzAR+y8kDtAL
 +PSIHUYwZRD0X4NSPADZPOVrWygAromcdV7UFhji1zh2xTuDTgvj/I75h6YXf0JfVbk7lwhAv
 WRldHkBP3kNCfTanjM872Y0lXKHRY3EDXXnkoB6Vw5f1Z9XJSo+TalFOQOeIjTlRgeizaXBLZ
 UW6TQ/Qo5FM7+UX/yfbjN7seeJ40bTu8mb8dEYa+vbV2U2FwjVnM2//t35X/bdqBpmCEAlaFX
 2Xqq64WRIfel2IK2e1i4N41FzH5iWbSF1DKEh46lZfhfIuB+CrC4fzjNw67HSwZm97jjANzo6
 tTEAwGF+umpeQwHecZoHYIIegu5NaR7DGeD9B+g23dTRXJy3dBFvWFhm2dD3Ac6qBUQx9VtGn
 BpQ5zVdmyTCkuYH7M9mRmKaSjm4ry+lvKOLk1xhQGQ8p5zb8Lm2WYYWlv7+bavO9rGj7w3yDq
 L1mlMH7iwaFJSl2McvA6CO7XvWz9Vdsr+rCecwWwXc3uH5OBdd45gTF0MeYytAcZNx6W++2rE
 45WJ96obHqNSYRUWRd4B2gCgTXUs08KJgtq2Cm/ejUQU1A1bDpAcrEkA4jM4v491uREQcru4c
 5BxKbNQwiaQta0=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 5/9] serial: omap: remove redundant code in
	rs485_config
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

In uart_set_rs485_config() the serial core already clamps the RTS delays.
It also assigns the passed serial_rs485 struct to the uart port.

So remove these tasks from the drivers rs485_config() function to avoid
redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/omap-serial.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
index b4e060205e61..15ddaa1fdfa4 100644
--- a/drivers/tty/serial/omap-serial.c
+++ b/drivers/tty/serial/omap-serial.c
@@ -1336,18 +1336,11 @@ serial_omap_config_rs485(struct uart_port *port, struct serial_rs485 *rs485)
 	up->ier = 0;
 	serial_out(up, UART_IER, 0);
 
-	/* Clamp the delays to [0, 100ms] */
-	rs485->delay_rts_before_send = min(rs485->delay_rts_before_send, 100U);
-	rs485->delay_rts_after_send  = min(rs485->delay_rts_after_send, 100U);
-
-	/* store new config */
-	port->rs485 = *rs485;
-
 	if (up->rts_gpiod) {
 		/* enable / disable rts */
-		val = (port->rs485.flags & SER_RS485_ENABLED) ?
+		val = (rs485->flags & SER_RS485_ENABLED) ?
 			SER_RS485_RTS_AFTER_SEND : SER_RS485_RTS_ON_SEND;
-		val = (port->rs485.flags & val) ? 1 : 0;
+		val = (rs485->flags & val) ? 1 : 0;
 		gpiod_set_value(up->rts_gpiod, val);
 	}
 
@@ -1358,7 +1351,7 @@ serial_omap_config_rs485(struct uart_port *port, struct serial_rs485 *rs485)
 	/* If RS-485 is disabled, make sure the THR interrupt is fired when
 	 * TX FIFO is below the trigger level.
 	 */
-	if (!(port->rs485.flags & SER_RS485_ENABLED) &&
+	if (!(rs485->flags & SER_RS485_ENABLED) &&
 	    (up->scr & OMAP_UART_SCR_TX_EMPTY)) {
 		up->scr &= ~OMAP_UART_SCR_TX_EMPTY;
 		serial_out(up, UART_OMAP_SCR, up->scr);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
