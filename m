Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F27964BEED8
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3C7FC60463;
	Tue, 22 Feb 2022 01:15:20 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CA5EC5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492510;
 bh=eHlPTyV9IH6b1xICykBM6gHlY+Gr9tRTW5duy1JBpCA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eQUngbgwLqLUom8dFWlKScyPSsPcRzNhp2S1l8mr9vwx/IRfkkEPGb3djUohUAC1f
 l5ny3hweItnNF6kAMqIOdzzTjmarP54tzL1BNNYemiqqVcUeAJQzRDPU5SIPuXWyys
 SczksCEqxNegmyJ7hjfVOzVPNdeRM28EH9H9bvWQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1o3sKZ3XoU-00jv50; Tue, 22
 Feb 2022 02:15:09 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:29 +0100
Message-Id: <20220222011433.8761-6-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jbVz0BNPswbOMgeN+DDhwoQBpe2I7vCkKwtO+bMQdX/FHpjcwnH
 8mmQEiIsth6jNfR/2SLrMzcaYcWspkmia3HWTqVqCzTIDvE6DLoU2DJS2lwhAeuM4TVnAhw
 zYpKLPMqM+8TdUXBFfI0fcvgqHx2P5E4tA0/ZRMQvsDikWF+zXfKRqAirrwrgk56ReyTgwP
 p3+8aUY1VyqdappZfGP8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DSOyH+r7gr8=:rgl6X+KkNVZhXNpOmDfJK7
 77m3/RGNqTQBAkrsUab0Fz0lqJyPVwXHNlJ1Z39QREf8VuiS/WQN6dy6lQZYyJzG9I2r4xNs/
 FOqOk/inE9zm9UssXDFZX3P6AtG1lItZ90QlddRuQ7QZ89ugcEgewtjXt1smPQgiqgSt9RtSj
 0evq61hHN/iUTjHY9Q4p83XzDlxxs2htazuSdXOd80f35n0MyZ9DHtA1iXtT3gqC/o1kxvlZw
 vT2OJej7bgYIkWcubky3LjkaF8Bx67hdvhwVcTXckOGOxa0UUeAP1Cpl23XwllBhhIlioldVQ
 MA7GfKdZNE7cAfGLDmqdFOboygTZW0T47Ru5zPiIRyahfYFpGT7PDOVD4hyZjldTtpgJm2ohx
 brc0KEa/Shz9H/fg8TsR1klRsJ7d/ElkL2dNWcGWljEQKB1gnGy5sqyun8f/2qj8Zr4Enm+1S
 jyAb+eUp4SzVFhGPj8qq+LUAHth5ZOmpAPHYr93ObhgBLp4HohpYHHZSCLAcyy+MLccru6rKx
 W3P1X3Ctv0HPli9zNRABgW//IN+hIOzdvnc7D48d2rxOdqLuUP/H8Iq9y1YJluzFxCkPxLEtZ
 Vmf42iiSf0lZbWlaL3ppsaPqpMjDd5Dk3Q7gk8sAnyb0Lulr7ZF06MPNYgqmD+p9n99aYwzO0
 iKmwfQ8ABvYXtz+jbsbsedurmLMoSpTW4Cp1Ie3aW4mbX5wSIBN5+NLbE4UK2ujQup7AKEGs0
 8z2Gpbju4XX27Mq46wgeO587ryrX2MdbUtKBmvJBvxHhcKKlrfX1iT9YlZfPrNG/ZMwehta0v
 +4WTsbniX4j+I2P2CpV2jWL3zu0ie0sLg0EZNw67NPy2zUywJ50G4Fujtm8K8IrCeUM22PJ22
 A7gUzNU8uPeboGsq/NebpEEzpKyx6v0SX10X+wKZ0YSuUyCH2N6Nmf+ToFrTWQTgI1RBhGKOp
 YFaB/r7oEM/Ylo0VUMmVBwdAiQBUjocarplDuBPwaB1yA9wpmVX6ZeG5HBNZrScwlvUZuIRKX
 U+EhKOdxP71r/3im1hNFIlgfRuvZRCzfa2gir0nmFpDgppqldW3qhWOqW740Gnn4oSiAXi49b
 W24XQav1t/0uRs=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 5/9] serial: omap: remove redundant code in
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
index 0862941862c8..a3afcccfbd96 100644
--- a/drivers/tty/serial/omap-serial.c
+++ b/drivers/tty/serial/omap-serial.c
@@ -1350,18 +1350,11 @@ serial_omap_config_rs485(struct uart_port *port, struct serial_rs485 *rs485)
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
 
@@ -1372,7 +1365,7 @@ serial_omap_config_rs485(struct uart_port *port, struct serial_rs485 *rs485)
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
