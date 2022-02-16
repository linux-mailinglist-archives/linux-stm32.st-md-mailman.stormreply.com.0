Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EDA4B7BB4
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 224DCC60479;
	Wed, 16 Feb 2022 00:18:49 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D922CC6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970722;
 bh=9fjzLBN+PWaAWLzb25vUWj/J8xwxeq7xuYNRStHQTXY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TRWqadBfpr7rXZETxXnexOCp6OoWAYSskM8CzJzSwwM4rgEEehYeH93UEQki8dlkm
 5GozK644G2TnN/4/WOtHzVm9egbeTz/fJ5ltBzD5OgUSMzWDa9Zyn0MJgjbVLPFhXn
 FQhIG6pmbAPlxpya9Su+pDVGmegzB7B651sV7oaQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1o9Ljs0JhK-00thbF; Wed, 16
 Feb 2022 01:18:42 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:17:59 +0100
Message-Id: <20220216001803.637-6-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/tz633QAQ1FCT4Yf0dg8eH/yTxYQTHHuIgr3F7fDKxaDLTEMWfe
 0WvgIa6xZbYzyxJbrmhlAc1kl4UgQlreMe4xgdm6LcjZ/ormhh6Gbj6g1SeFMEkV50vusEg
 GM3o8gWe8OsYLW7m1QdsliQ+aKaQlpWnVMo9orcFLR9YxCzWYXB+G4ACr1wxje7J0ZnDYQg
 VEBc9+xvvhv1krq8PDlQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T84ZUqvS1kM=:/YXYpP6Mtxpi/jTICB252b
 OCIdLsaQBwP5p8uM0yynpYrVhaTyb8JcbJOK1SM41xuT830pDk+RWYGoYSbfPcHmUmGdt0Z0N
 IWqGbe2qEhzTuuBVLQZr1GBnPr5dXsGK+TJ854uZjqHcBEL4qLcGpnFMxGtmkmOCQhn80axYr
 WxQ8kRFucSAeRTthxOHkMGBxzjDLf6gE2QLilJfzAex87RuaxRTSXdXw1VyVt6ncMX5N+zx+H
 B8bhLEMo/36++c7KHrQOXPuFZws7IEa+gPL4cUinBbBBSB+TKvaVdSHl6ILA9CPbOypzHni9i
 BDveYO3yEBm6pms34fb5vK2RccA5ZMZoSqZA6r2igb/EUAz9qCmFVGtnKlGKMKYzb5Z4+qX6+
 RNmHVpWiDhF61OwDVooHKoMi0kRlq1BcAPEIGIXMLKP/Q7GdhLkmWtSi6pK2ytfvxINX0ypsc
 xvEhTx7WwO0lG2ky7ZmpAOyLB8wgDfJbgtsyJZUjPBKwDs9toJW6Dd38R4RKET675OLqj2S+u
 O3C/jmn9xNIJ4lYWdtu7VKfpAsH6zRgBuG+mTn1aJLKdeuvnDDVOrnwgM3syFL+iirMfrQfCH
 lZiA53asWW9Fz5GuKX9bx0ZMft1X8kxLROrmuHFmQ3eV2OEe8BpWcEN5fDIUt920OybHaK0lc
 Y2EVGw5VDJOQU/Vi27QojPnhOSRmiqH55F0BflxYkdsl6vUdatlEnCsiYEBncGYJg8mcGfwgT
 NeAhpnZxVs70PXh44kAOdy7jtgyPbj36SNN4DhkUJBySGAzSvpwTE75LYF5OCcCjjeaOsghsK
 5N9ONFbDAhEfgPkpSWpPllfYe+hhcWHhWehiBN4B5St0Aem3ptLXFl8OUpvVb0ppNT9rE9rbF
 mw9xMhFAremA9ks/3NWW4dBkakdOsDV5N3XGs57uwCGR2GCo6uAfaz9Vge1EG4txWZMtfOeGW
 nfq6WbQg9tT7UGeF58rpUHd9QuVAg9JIHpzY9T+VPg4nXBQXCAG9+dINuQQw0nQZ73XDtxUEv
 Ss4TKSOWU5N6Kl/F/0fNoMTzru6kFCUHKBgil9mralYkoo/GGS0E2j8ToK76EUf0oYEq4Zazt
 vWM627MxQ6T3LM=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 5/9] serial: omap: remove redundant code in
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
