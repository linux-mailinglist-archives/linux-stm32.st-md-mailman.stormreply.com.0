Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2117F4B6B2D
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D57A4C6047C;
	Tue, 15 Feb 2022 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 790BFC6046E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791286;
 bh=u821ZeufKC1vgSSd268mPpvvDOICAs/3gToqbHdVQwA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Lt1rKs6vV0DZwnmV3xwwtQf7bHV7mqojHYze30QJ1ujeUXZ6C1L629U1eLWJ52rTd
 +Oexxvoi/iPn8VPB+PF2oX3YeLc14J70XmtuViPAGc2D0VzfeI/dEJ+xD9qxYaIkrh
 YHExK1fIv8gEi5ro76YORs1w51HwlnjKzyG69uV8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wLT-1nLsS52Jel-007R7i; Sun, 13
 Feb 2022 23:28:06 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:31 +0100
Message-Id: <20220213222737.15709-4-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:sRdxeSRpCIAmn+my6vWuOVRB84leThgA0NX64DL3hpPO+tdh91W
 TkrXZLeAshkj2yoQmJj3uD2KRkZruMzX/KMtxlhgSTzxJltILw8O9ZQgFpHE2zqSjLW0fkw
 1ZyhFd3k5xZEyeR9yC3h5LyinJdGCylV7yxXMLp8PyYNL2srQU+aiwHqhzDOZ/XVFnf8YNw
 Y/9rDt6YIDtM28DRYlWsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wBeMAHUe56U=:hH838uO9L/b5Sei0Q7IRLR
 RvgaN+QhtVNmCFB0d3FsRv6TCDdB11GCeuzEFpDCmfyb5IxdMUtN9fWIJ24rqijPpsbNu3aGY
 K06/7p1OgQom3EPTu+Q3b2MsIBASOPi8Pm5hOGt51QFHgZS0s2ehJzEClkLmnf9R2XM/3MoUh
 uc9axeNbCNcGv8I3uF92dVWPZ5KQ2LFQK/TraT4Hcbc/VO2VjqNmluhz3dnH1QAL1HO7Zg5Ft
 cjAVUnO3vbeRtDKRF+VtEQzYHD2DsKG/6KujZYSYOoyZUv0vRjNVcw3fEBUOSKCcRATK9aSyB
 xHCUQLYGEuO0QarBD/f2rAFFwSDPSNf7Ol5yutSSQJu497TDejuvXU9II37yZirsfikxA+Vvz
 Hw8KYUzBWP+P3wqEBBlBtQD4XTBbcXXzp1GB8Vtf0Eyoy0O+OuVrvwQkiWhnZ3lAbCwAmQrDT
 v88bN79GIibyPmdIx96mZC+zHG3tZBtxHb6vBoCgJ1DGSOXgbOkcSROc71yMIJxX0we8grR5p
 V7creLjU3z9o3QVxWl9HygZayPnvJyO05yZuuKm/6mmVeRNELW5r3W7aZ06w6DF5oTUvuiT40
 fyctoLRv4pxJn+8PKSlTH2QO0NM2HLbFvLJ/5MR29nhpNMKGfA2Omrf/M2eejxxNuwDPeHtAb
 Pjyt67wh/nygf5YQePB+1DyzvlSDN8rRJCT7Z4zt8Ar7qAWKMruHtmE4zHlMujCfSUDZrqb1g
 K+COCTsJJQYkt0gNulvzuodYDh+syOmkr05iwiPvVroZI1vttRDskVawncbZLtUQZyVc6KZdK
 Wx6pG2u6ovMmeurG+sHgOmbNp22muX5wUHTuPS0ifM6fdOjVAhAtPWw3hf1F8Flmzz/wc8vku
 sQMBM7uIfmvE5O1+SnZWVhIEE683IldpNpht1B1Igk3wmr6JV2t06Tnxe7fYBavuOVNI8sYR9
 DpQhZQthkQNsqOrZOtifEpkl2U43R4njR0CyAlQtW2CLOPShFnl9PA3LVWOxiqHzOanTBlYDT
 KpBGFlkX0hKgdI1eSZRcSYLVRGmZYwc1kiLb6FGXFqAROQlASKZGcsA3bx0T9BlBABvYCZlvL
 drqj3+91jVGWf8=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/9] serial: stm32: remove redundant code in
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

When RS485 is configured by userspace the serial core already ensures valid
RTS settings and assigns the configuration to the uart port. So remove
these tasks from the code of the drivers config_rs485 function to avoid
redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/stm32-usart.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 1b3a611ac39e..6a014168102c 100644
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
