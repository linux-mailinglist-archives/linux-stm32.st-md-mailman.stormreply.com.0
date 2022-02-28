Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5054C6142
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07F22C628A4;
	Mon, 28 Feb 2022 02:40:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 475E8C60493
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015993;
 bh=TpdW3ujSzU0TXKj+hjSJqItA5IWaO0lajrfotqHvNTE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SHDpFx/t87YD4N39Vn0qmonme2X2chHIAI7X3OefweS/IUkys5tCyBcHo7Td1Lv7v
 8L+mKBznQMuaBoBuDtrf4Nuqxi5yDdtCt5jJgVYzMG9mWinpHOQbCBb/hEmb65u1xV
 jZ6CS6XQaXj7nlhKdn94u+MPeC3k9hRRsihy9jBM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1nqglD2Osw-00hbbS; Mon, 28
 Feb 2022 03:39:53 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:23 +0100
Message-Id: <20220228023928.1067-5-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oSVWg5rBCqpWa6pMX1jUqajlxQKq82aAt/AFQNSu3Xr1YF5rLO9
 gIRovRZ9arcEguHqRVmFa3sxRXd6jVcPN07+t4pnm2iAQK+CpO+iRq9oIssAlL98vv+w0Pa
 x0WkPFDbMq2uF4t1IG+E98MuZpzZJYyVNe1FdI38bQMUme4ePfskpdr9xmdBh3Z/S3kxt/Y
 A4UthJuyuD4JeA4DkJvWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:46l4yZiWaho=:rgAJEltv7CEBl925Gvl0Ze
 1Fq0F86+Azyy+VB5eCzIfVhub8QX2MJqWr/D2X5AXXjZkiLpn4FV1fnsr0pAv+yDc91HPlL9Y
 nqZWCNMiNfyelGzNfyIqwc760ISN9pBZv0JLt77KXDYnP6dzwiGE0wfowNzkHcQapWKUbxwy8
 YUckouXi++aouCIoCRZCwZUp3HWmcQp8lNprg1ixTNCqbtBNAxfPa+ndFTHzaHScYZTrogD3X
 yQT4Yw/KHM8+2v8o0SjZ5FxLgP2b1FQkN/RXvz1jCKYEfB/YMFTVmsAaOsnQeIND0ce5vPoFE
 r9ND3ZgBMNAed3kDr53GDHvvMwJqHx8LOKlfggds7Inm08/vIrEa/vx8i/EzoygAXs7uUW0kF
 Wssz4AbeXclEQYj5ebrInEzC6UdZEqhilOatkUQPyvLgDTHxQ4fuzRpEMIHp4XNK6N/t174MH
 Cn93zISM7GPL5+lgcdO5hmr+L0rEtSMU6DgieP2no/XuXiAwDHmYXOZqKNNDpV0AMMBTjg/IK
 6jYKzcXlGhsCLWkWbAHkvuu1mgYMKLjg/J5BLWZNt7QwWcaIphn6R5jZeTnYfCHK+ULZ1jhH8
 f4pmlH20WmnlD0jBrpzX15U4imbKzFAh+BhIeNpxAzy5A25APWDtFQNrEuYokC12cj1Au8J/3
 6WHhJI81t6aNVLLWtvD5LOzubHNrvzOXo3rSxyiYTcLTvbPlMXjvdBAlfzIi5PZYsIA3J/0XU
 Zp/uE/Au+tMn8rnrQ6SEUIbdY3yckErUWQTPIm60ZxQpF3P8eGTgyngam4OtdaA9PN4njY+5O
 so5BT5310JJoe3R49rHyEXTepsUreB2uKm8sKkaU9o/7KpQkgLOBnCsTrXhPirHSmQtf+j3dv
 fIfD4Ye/9gGYqE0qOBjm3edIfRSi5yVevTNkFdvkqAyMip81Op8bcfwCXsy3X6j0FDHNGXs6+
 I7kjs+7gIReooFF0KZwm5xgYWYpq3aMe1XiwMDyGaNyJku4Vh3HJeQ3wryzSK7JZ8vRd11c94
 GwoqbsymVyx4KbVM1fyuywBSP2sBYkxznP0SvCT0MoNmctMlvnZ95TlsGhLyW2geBCOa1e3Gw
 +J2WXUMF8vHeyA=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 4/9] serial: sc16is7xx: remove redundant
	check in rs485_config
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
both options RTS on send or RTS after send is set.

So remove this check from the drivers rs485_config() function to avoid
redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/sc16is7xx.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index b7a2db9c03e2..b4e66a322a58 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -983,16 +983,6 @@ static int sc16is7xx_config_rs485(struct uart_port *port,
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
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
