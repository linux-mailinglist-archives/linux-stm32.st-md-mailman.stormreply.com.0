Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B74B6B30
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23FB9C60485;
	Tue, 15 Feb 2022 11:34:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82050C6046D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791288;
 bh=uj5taIEdJ6Lv1V75u7KWN5Qj+Nh06Is1dtaFBls+PDY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VcjeUSqNk2wot0DmejNVMqJC4kPZH1pndSE7mesHbhU2Ghjf06Jo7tD38k4uGSx8g
 Ytr2/JnEmmvy6VCaWVh14E3f9uOInAoMpGqPGOqoHxy1RYdrqbmOhDtzJnE7N97FUf
 XdBdTwgzV5TIqDVTzUWCZnvk/xXpQlzOW6eAXBm8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1ncPlv1wIB-00Jbos; Sun, 13
 Feb 2022 23:28:08 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:33 +0100
Message-Id: <20220213222737.15709-6-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:X9sHYupZQvrcHlgLqYrbYPQwoslXDrcL7/CgGZCd85CUEbScmXQ
 dgeYkd3PBvcxbJEL7xGCejBKonr9VJtpen2Uv4WLxIm7wRH4tITAaHpboYWG1qTt2Lefm3F
 8tzfOiBftGiTUQ9A1ydNYN7oQlx8OzcyCs9JElxoTYJHcceogCLGQaxeOGIQaa2Lv8aSOjM
 7Bo8+KL6CI45Lzyb57W0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ec9qICE4XOk=:UlzKclOOGCV1qRQ9Db/6ke
 RW513ewoMiyKZtCXR0QKOTLX4RKt7nHX09jCx0o0tY+Fconkskawn2ztqK0Hq8ihY6q4QjTaK
 7vGm/HcFS4MtA8tcAEKBfwA8qTRoATZRQik12DmtOnsIw5MyGsD5kEVKg7fU/SYLpP7DOC9Bf
 4XbhbXvxbTTmRnCQRD8+iTt3gnZ7PDlQf1LIPNl88GdN0+Pxawr0Bc5N81fBSkBKG3qUUDy8c
 Aw+dxXCK/RSQMsofeEklJtEXgvsQ9hwkPq9ezK4PxmEmXB/cibHCGi2W5aqiqY7Djfk9tDmoF
 84CqYplVZRBuqcZ0HCMhg0XuvBp1QM/ms2LiQYzOtUZbJCVARCrv9yHpdUk7hdHwnkhkveEJv
 MPhuE17Glp2ZfrP9rPhzi/wBR2cbiuyzLXnoP1NWQ48L+8qGCXB4eZWVKxxXXFDvE8He6zlck
 S5wWH/Nnfr4WPFLXjx93XLd2Cghy3maT0M8yXB3aHohsHvmiPyzlt1kfYKjXmky8xFNP6tyEZ
 7KnsSHPL47Kc/yrb/k7creK7Yw1UqJ/FUYfIIN5Fn2Eyze9IRtfC0PIHn+5wD7XZhR6hZ++Bl
 FKrPw39cCn9VC8hUkylKFf8mzx3rqerjvc5VLqNatq539QtLnuXA6ZeQ2YU+M/CNJO0rH1Td0
 ar7qJfpddWFdqD53nw3PkSmTvnqTsHyQB4hLB7gyktKO2I5uJ37wPO3fLXOzKA2RU79/nqGJJ
 FQqbBcn64c075PWlfl7qReNsyghzWwD3UHEcuD+6fZCYq09myaE8IyHE8v2Kz/WrEaKEn4gPI
 hc5voNQjf/YMpigjgH+LgoA1LjwU65POpdpv9mom62MS2UuQ1MD5Ny7mvs8uvA8Ptk9U6pTPX
 qYmZMKeGc9KkKeOt08jSOXBJzOSRx8KFs1Wtpa9YgCqHn8X2Xnc6IVxl8sQOw0faLyY8XMXEB
 epZdd0AI7l8rRlP8VCTqPh1YPlurOVaOEA5QwTIWytfjYZj+xbErOFG4n1PFWMvS1xWE5JfdA
 HKBCjuxiynaPIqIHqVCyN/9Ej7bTg39IfaNSkdlwZ6T7wKk3yXsDrQQhNNsMouWZaPIkCH+Kx
 z434pcfy3F+a3M=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 5/9] serial: omap: remove redundant code in
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

When RS485 is configured by userspace the serial core already clamps the
RTS delays and assigns the configuration to the uart port. So remove these
tasks from the code of the drivers rs485_config function to avoid
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
