Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC1A4B7BAF
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0063C5F1F9;
	Wed, 16 Feb 2022 00:18:48 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87DB8C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970719;
 bh=9lwKvrStVOccoHp+PLQwpjNTIUqYC6p1OopT1OpjSik=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jJrdsNDsGjNDALmaTOHlXec73KfDH3yQsQ/G2Ps/pQMWBCWc3+59U1VaqZwBds1Re
 XvvkfySyJ3GcQanUTRRbbN9Ki6x90nrcBItn9iVOUoauH4TZBT7a99jZyZASvsPg39
 /SRoq89ZfDOMo7pnNPyVeLqlJrx+I7S9dQaMpC4U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1ns5zw1wJH-00cRhI; Wed, 16
 Feb 2022 01:18:39 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:17:56 +0100
Message-Id: <20220216001803.637-3-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nlUm6+8IP+H8OyDSlYvKBHsZIXLMdKTnPNVnV93RqHp2sapA+yB
 4dCFcJu02oLHrtNEFIpZZuMWTXbgM3k+/VVlqH7K/QBcwAfuGT26+ZLwBCE649vwRwf2+qm
 FwHmtjgv3Kv3r1n1QpSLvvqoOoQOYhpgNdo65VSs3MCvJ59MskMqXaYr/zv0DKrAuB2UV0G
 OyVfyp+DBzQl0jdru8SUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AlySP49HIQA=:SLMi1GsmDrZnp8QAjxu15K
 RbN/rs0B8QYBdXbqjNqkMHsb7r0M4U6DtYKmbdx+IsIhfTrCNqSUGDgO+O9hlHHhwfU+S1wVq
 5asFCz+geCSdlMg8185mc7hUw9BoIaAVK4HUlF8zwBCpUj0esK5/axT3yqd2E2zTiB58pgBdJ
 uMVvEVN4uOgBMLkfC4ZZsMKK9Almakt64rCKlPyLzMiPXBXDWs+U3q5XG0rsOef2F3JYyPvm9
 rmEZ4x8jZ6EECabqm5o58NSjOalicEoZ+E2FxlxnSp4v81j10F/jTiY6xQmbymFvapbYJCxS7
 f+kNP5tQOyhFZcEVLhYgIWGqW8L5j6m0uTPSivL1LDIupCNOV8ZIj46Bq2LXegaWmDl+QNyaX
 v9hPKYwkwJZstsj1ycvXIPsChO9ypJbvdEG5VhC1pGMZwaXCsB8RHGlfarxgn3JY37cO0VIcZ
 xiw5dw1zNJYWDJ3Y1USfV97okuNvsKhI9JSKtjZehGNFulqTixpXEEoyEScrv9zezvd8k3tW1
 ms5ydWop3XOKx9GcpYyDYqp7ZEKCS/2R3y+D+si7M2CziQ46M8DBgyUOi8qQH4AEZVW3lfFW7
 GwZCHZdhIDpKiOYf/mPusAVadR7vxIdGdIIS+q/ZHdTnuWyYac5GXCY3DIIotqfenR/KtLRmb
 EkBW2KUBBsAGr9pGrhGAEE0rLNa7gJiAtXCH0x6JWeosvR714lx4dRo6+xZMci9zCDTblR8c5
 d+1gm0fRFKSnPDXK0tlsXdCnoq9JvhkDN9A30hK2JfU1fYGuviaKkfMnrQ4BdGm2LJjdy20r9
 RGJ7aQYiw+LhKB0iEuRAGA8dYo+V0IiSfDj3hBg1l/tGnyj3w3OhGfGtwtWCH4teP7WDqNz/+
 0AmrXJJ9wAR1tfDyripx5SN10kdwJ7Vv9GEfV8igt92rGVXEZPPwc1eHdP29cEkQu1R5GNu03
 Kiq/UdNHb5zM2EqXjDdiNoDGzi8VMTvTHqAtaZVFhOj+VQeWaZLBGnVLsBkxTASuAsJ7KEYQN
 ENfGxmDP42HVZ4JitNKx78zLO/SAMyDrUVgPRThPE5GBKsAgmW4A+fGm4TSFUmc0zLJaemOsU
 ZQmHs8PRLjLz08=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 2/9] serial: amba-pl011: remove redundant
	code in rs485_config
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

In uart_set_rs485_config() the serial core already

- ensures that only one of both options RTS on send or RTS after send is
  set

- nullifies the padding field of the passed serial_rs485 struct

- clamps the RTS delays

- assigns the passed serial_rs485 struct to the uart port

So remove these tasks from the code of the drivers rs485_config() function
to avoid redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/amba-pl011.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index ba053a68529f..35c633739975 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2170,25 +2170,11 @@ static int pl011_rs485_config(struct uart_port *port,
 	struct uart_amba_port *uap =
 		container_of(port, struct uart_amba_port, port);
 
-	/* pick sane settings if the user hasn't */
-	if (!(rs485->flags & SER_RS485_RTS_ON_SEND) ==
-	    !(rs485->flags & SER_RS485_RTS_AFTER_SEND)) {
-		rs485->flags |= SER_RS485_RTS_ON_SEND;
-		rs485->flags &= ~SER_RS485_RTS_AFTER_SEND;
-	}
-	/* clamp the delays to [0, 100ms] */
-	rs485->delay_rts_before_send = min(rs485->delay_rts_before_send, 100U);
-	rs485->delay_rts_after_send = min(rs485->delay_rts_after_send, 100U);
-	memset(rs485->padding, 0, sizeof(rs485->padding));
-
 	if (port->rs485.flags & SER_RS485_ENABLED)
 		pl011_rs485_tx_stop(uap);
 
-	/* Set new configuration */
-	port->rs485 = *rs485;
-
 	/* Make sure auto RTS is disabled */
-	if (port->rs485.flags & SER_RS485_ENABLED) {
+	if (rs485->flags & SER_RS485_ENABLED) {
 		u32 cr = pl011_read(uap, REG_CR);
 
 		cr &= ~UART011_CR_RTSEN;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
