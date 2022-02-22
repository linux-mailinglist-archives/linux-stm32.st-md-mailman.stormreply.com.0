Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA04BEEDF
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54203C6046C;
	Tue, 22 Feb 2022 01:15:25 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A992C60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492510;
 bh=iSIbiqQY+am1M73zZEjjrGJSzNxevmnnhXm36hRIfqw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AeyV7Qm6vKSfQKXhoeUcb75P59CSBGm947hqdfZBUF3+8x0Dk9TccuMYRoRHWaaJJ
 8Y2IBs/tws3+mtRJRolcpLDMt8YG/+CHXDbhDg4kd5ppeY95IlK9efawH85QjnYP+j
 GkW7mpqWW7Z7xEU2ZMfLs2Ddi6SzTXRUJNOGDEtE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3DW-1nSrDS1nUu-00FV8u; Tue, 22
 Feb 2022 02:15:10 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:30 +0100
Message-Id: <20220222011433.8761-7-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:wKGwZ92bvJ8eZUe5xx6uvTWNLasLSuFKw+u6quzZxtU7poVTk55
 j5s9fonP6abJ9aj5k/Sjxn3klkZB8Js5Q0q+3sm8bNDETNs+k5npnVX2gd2LISm9IaWbw6G
 sLf1UEY4o+wPHOY5D7hkdejw6Ls8wPRst3CS1nOE/zl/1BRfFsi5+zXEU/RMvac4OlA/+b7
 rUiTgtWlLCkFRpRlfwGWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lhyAliQH69Q=:2hUiu6M3Dm94AHqmQ4FPRp
 ahirSDrA+IJixDhwZQiB0t+u99J1K/k82eQ1OSlPa4jUi8JIvroXaHdVknRxGCmRPP+Ze1X+h
 QjAfY9vGn+0XjiKMEBlrdO+M8y3UmmiCwkZfabIApB+2u1Ff6i2VgN4PTiDE5aQbT+bsBdgsS
 +QNf3kvPnPUnHAW7ec8EYxVW32yZp7Jrp8yh1eZoa5wMsVn8HnEoBV02s0diIcfoRGbl0nRZx
 xpdWGuJzF++IGWPHz29WqEP3VJtUMp5653u76OTxLpzmum6YpuieANHIlOnLtavQeJJDC52aB
 b1s1v1rm2Fv/Vxvtd7PhHCwt1e03dO1DaUBUL+PIgCTlRS9RB14mZBVq+libkgrdbgtTKMzuw
 m/aRkORAAv2JOk1zlNqi+QAZdvTHI7/KCaQmNtpllP6HI1lCwsm2O6ZBSUtsJQ5FWaDXtxN+8
 BFESbX/RnLyazLIQRRCf6CMhLu0/2ajsapGBvDAYupXIlE7LYvEBo3o6aBb/Xo0ADIg8tgWo0
 ReYgPJe/6ib8zbx0CKeWGlqsMy2Jf2Ih3/BqRpLm80E8DaMi7Dgi9+uo7GDToK0OQ++nrmZM6
 XZYFu8No3ZnnDR3dpOUju1sAOaZCnn+Tu73AqvuBJmiabSpbrO2k7T5RLIgpLR0aEKt5oRC4i
 4emJzgVs8lLyZJY/LjWMHraZTcTS4pZww7jBl1DLOXtlN+mxWeEJ0x0deyH8SAY+ZjLkl4rEP
 Rw4WAWMy77+qUoWDb79xurw9oqOVP8rEWD4/9NCIzpZ//Jk8EFFaFFW0IbEHQwdv+ezvg+X5x
 jc4kPLuuMSpd/E94wd3e8FdRTErdjtaunV70arGJKx6j3zzlKU0Mre2J6voR70Zd8Ab/OwSDi
 xPbwH3KGf+FwQUL14+NIoK/GSkOg9FB0CFOwV+2S5cUpe7uRuO6ZJdFMMmk7ED/RaX2xHcsIY
 BGioZ4n3t9x8jSUTGR1AWMhv3nKFVUdhwhQMFYt9xWnIP+BhnPcbH0rYCzx77QRNpqxO9fznm
 9sUGlz7WzjYqlXmLqE9hggrVqHlNU65er/5l5YV3poCd86/TpB8i6qd3EPGbkGmRqMqW00FAs
 YuewyqJeGHl0tk=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 6/9] serial: max310: remove redundant
	memset in rs485_config
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

In uart_set_rs485_config() the serial core already nullifies the padding
field of the passed serial_rs485 struct before returning it to userspace.

Doing the same in the drivers rs485_config() function is redundant, so
remove the concerning memset in this function.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/max310x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index dde0824b2fa5..2ecc5f66deaf 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1037,7 +1037,6 @@ static int max310x_rs485_config(struct uart_port *port,
 
 	rs485->flags &= SER_RS485_RTS_ON_SEND | SER_RS485_RX_DURING_TX |
 			SER_RS485_ENABLED;
-	memset(rs485->padding, 0, sizeof(rs485->padding));
 	port->rs485 = *rs485;
 
 	schedule_work(&one->rs_work);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
