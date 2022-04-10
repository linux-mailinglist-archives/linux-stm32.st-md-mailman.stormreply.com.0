Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 042814FAD53
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3723C60493;
	Sun, 10 Apr 2022 10:47:24 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35611C5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587636;
 bh=lkxJVJmba/8nGWmkZt8VLyvvaLEgdx0YvxHumaFHroI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jDJ18xjT48BEajopxGlSKFpbKHA+3XowB+XmZzxZFcGrtKYV+DeU5HXDpMRoHRX42
 cLWreO79tiZssHyxeMPMAroFC/+XLbP4/M8hi1wC6+hCfwB6LRydeDYYAIixkN4UZs
 kXYGtNLUfaO8odIMMfCgEVbBLVH7A0RrW8+t9iSU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNcz-1oBAp12tBf-00ht0f; Sun, 10
 Apr 2022 12:47:16 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:36 +0200
Message-Id: <20220410104642.32195-4-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:J+WiHeBDacS1zu76ddyWcxiEI6alS3VWYM45BJKJNo7Z/NgiA24
 DyRk1Uw03xCS1+EyxzLFhwIJvxVfnM4gZSu3Knb6AV5pD8INpqoi7V5Qo4ozq/QfqaJOU2u
 9r7lnpSUW1yU7ndR5t5x4kxpLAY1XjmTeUjKrZuudM3BowK/1EOsDHi+qyOx4JtpD0e2cpk
 lI8+ZMBM8TH7DSjhF86Qg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lVJiE9ZGsJ0=:+savRGCYH+KQc9hqcGVhtg
 Vrk90sQ5NgkPsCXZGCGz0jgUQeZUSYIjYEXboaKVGHuE5Q8vMvrbitNcGLrWUdMLsdu2sNVGu
 U9ER86HGerZxQeh3E/lr2JocJVZ4kg5MkuYUwltMPNIIxLaudPHFJ8IAK6xpUCITOfoYArjgu
 jwLf1dJ45as2eCwWwT5+l7Ut+1BPQ/MjtaAXwJFNhKnI8+RvkZSOXUvdnf5qd4uFrAL/kYzoC
 +AiUgiz6BEoYQ+j1J8wHbVm5+FmRmtqGsaNvhlPV7XU7stNMPH00UY7/pibFb0SClMFLlO/Kj
 0ZMK1rf+vdNskQlYO1cVou2AIJVfMgeduWqwZkle47XdbUjOWUdS0TgDRgsmL4Ct8zMKNAa7W
 ZojutqSPRMecJocT5m4dPKg7hiQqCrd5zfRMlV6gv9SZaYFHuN8VbwbHTKwJY5kgeY5yEzUnt
 s7g0n9I/mbvxCO9QzBk4eKiAyNAcBzl7t3b4I9P3ojzMgZb8u1Leo94dsN9U58QQchvZWJ/yq
 Kl7/fzWAF0FFJdMkLyM7q7RMLuoFH+096jJmFjxViQiewATL12CCv5ef7niYSMD0wQdMTGeVL
 ar4AwBVZ03ZVuKbewbu7qT4JN6w11vqZv/Rq0def/3hZexDm6AQCbyu/CQD1l2eBOPrbff4v0
 BRlJcufKDX8e1v7hNMeTnOclXLgfU7FWQJJUfIDDRUG/ZGi5X9JNfVeaW0xUysFPgQ8UPBjr1
 R15CUYqweeKTNrVvtf9NOS/7LuETIxp0JG/peM975vCXYNvzxf+laBKf2D9Q92+I9DBFX6oxW
 5NHsWclb8C5WYQCiKceMnTxTFCgTpILb/V1JbuM6WS79vqpPmKZnKGoBsny1nFDebja/vM6ZV
 V0mUQs976GRQzQC7XcC/NyfDdj2/azWhDmabHmdwMBEJ/OIpti4XNSSSmSJMX3MdDj0w/RloO
 SEBpLhFvfBrydzl71TvQpbSDs/L/tkytN4WVWD+iNX1GObHXHbEfpyAT4hI/XIQfD9bnwBDD/
 jHMlogCNG7Z7GAh2ymyReSg82VF4ssbfIzfaqcwUJW5vJrwm145AYhtAz6EaQiFsOqb6zsHP9
 O2+3XLkCPQmA+E=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 RESEND 3/9] serial: stm32: remove redundant
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

In uart_set_rs485_config() the serial core already ensures that only one of
both options RTS on send or RTS after send is set. It also assigns the
passed serial_rs485 struct to the uart port.

So remove the check and the assignment from the drivers rs485_config()
function to avoid redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/stm32-usart.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 87b5cd4c9743..f886976daef6 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -107,8 +107,6 @@ static int stm32_usart_config_rs485(struct uart_port *port,
 
 	stm32_usart_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
 
-	port->rs485 = *rs485conf;
-
 	rs485conf->flags |= SER_RS485_RX_DURING_TX;
 
 	if (rs485conf->flags & SER_RS485_ENABLED) {
@@ -128,13 +126,10 @@ static int stm32_usart_config_rs485(struct uart_port *port,
 					     rs485conf->delay_rts_after_send,
 					     baud);
 
-		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
+		if (rs485conf->flags & SER_RS485_RTS_ON_SEND)
 			cr3 &= ~USART_CR3_DEP;
-			rs485conf->flags &= ~SER_RS485_RTS_AFTER_SEND;
-		} else {
+		else
 			cr3 |= USART_CR3_DEP;
-			rs485conf->flags |= SER_RS485_RTS_AFTER_SEND;
-		}
 
 		writel_relaxed(cr3, port->membase + ofs->cr3);
 		writel_relaxed(cr1, port->membase + ofs->cr1);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
