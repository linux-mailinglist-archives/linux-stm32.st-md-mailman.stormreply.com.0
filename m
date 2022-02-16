Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424B4B7BB3
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C6C0C60476;
	Wed, 16 Feb 2022 00:18:49 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9620FC5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970721;
 bh=Tt2p+xBICfmPSy8m5S6zW8vENc8fwomto2cjA2t2EVo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=i/tKOBvLBEEFkFBYQ0nT9tO9nGYqtIz9t162BQLFhPkYdU3hK+cFr9Bo3PLPyDX6c
 5bIAvEF03nYIIvUH7eINBG878X7982n0brjw5LYMF8UveEW5IbbqEDazowMW3iu/Xq
 KGOSIM/FecwpSk3lFuPIjBfSI2ntkZO/2Vf9l12k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3DW-1nVBiD00Pg-00FVKl; Wed, 16
 Feb 2022 01:18:41 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:17:58 +0100
Message-Id: <20220216001803.637-5-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EEaXsoGNJ4qUV1f9eq7vhlIcz4++hzNSBNP5W6lbbP2Yw6cQmbm
 tA87Jtta6/ZlyhZO9ogHIAF/n9pqVFOLp16HL+//jSckxHHVHYCCrcR77wyR01fS9pF0yY3
 krEZv5p0efq4nUIaQgbuVtYEItqqxTUyNFFX16maBiceUizax+8xYb8yLJzzVomeA3FI3Pq
 L5FDLGuDpZS2xLqih+2ew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l/iG3p3tGsM=:h/qmikgE8v2UxCaxs/kOE/
 R0yuOR4tZdltGDU1QPIJKb75yyQkBxuFPSZ0Fpsm12GQr2lUusfm/gWcRgjviurIRTMBrJlUe
 qGYuJcf30DLT4qCgg2g6ktC/qv0E6lhJzMd/1ikErW4d0uXgxS4XtWz1RXhzZLC6pmhfTJr3/
 HGpFB4N5o7b3oDZAKiSutSfh3B0m/7ZigkFp14J37S1b6Hg/R+WXqXfgTf6HbV+7enSge72IW
 vL0u6xv1ld17UHrweBdqz/b7yvQEjk1Cn/1EGYZxn1OySL3HZjFfl0PN6JUW0E2JgUuIUfK7N
 OETd7gW3J18ZKWXWUj/i+bbfVSp95FaOd858JiHtcjGfCIGoCDOd6ojA0YKaG/pLaFxxLxs5v
 wjJSPGyvXG95buWpCRbZ3PLThIzLytG9+pQ19B9/g9N8bkKPVuX5S9sZxlJFTL4mFr+ehxQSd
 evQvoJLkY9Jhs+a/ABTE7yA3Qr4l+oxU9ZcQijIqX9LcK07RdXXMbUerCeIKao91IjWV8Bs2d
 aq36BMefiwRAdWwD6XNPfeGkL6Zol62pKt6Nq0RFR5EQSxDMt2atHEp2ErNQ3TVFZZIeMPZDz
 r0UTNn8Q+HHBtYszbG33G+I+XDc7IMuLRnedGsWb8YPKPPujoRtYPDm4lLvZbpIlt26GLfSpe
 croDMY1Sbjle+Mn6z3NGsGj6oc0E7jlweKl6vjj/2LyxiDP1VEdpyzgNojvaq73v7Z6Nih1Pi
 xZbuIV9ba02MeLAHu/UW9vXCXXUP/hTdlqEPnh6KtNa3s47sXIrCzz+0+nmDLrEQvFRRJEe89
 2dyZGL8jYZypmZqrRAbzLZXbB03aLN2qgWWuQBMMetnOxd51nn/jjWTsMRsVOjH6vtC0k0Ay9
 wrhVOuSMc+Kt8QWEwL05ugkEKXyWk8cJvNcZ/pJsnHUwFGqih392OmbMbPPQvv27uG+xPBv2n
 4Spi5UoDvMjKrLJyaMSrDfWAkUMIGD+LTeWgkY+rDOuSa7fMo0fS0lnj9eXvgUmvSOWzHsj7Y
 SFB2VtQSQWCaIe06JgWJ+GJKU+Ts8/DiSTOZtpFTduwSDXqH0Fmq4W6gJvTLnHkNqn/0aAaIO
 kql0RB99FA4JN0=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 4/9] serial: sc16is7xx: remove redundant
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
