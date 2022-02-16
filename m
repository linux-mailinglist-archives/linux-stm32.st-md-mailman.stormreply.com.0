Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22C4B7BB5
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 370BFC6046E;
	Wed, 16 Feb 2022 00:18:52 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49AD4C6047B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970724;
 bh=lQa+jzYKtWp6KPdLT/a3HxqzMlHwKAFbTOnPK9FsF40=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XZQ+M+AO+wB74+I1fnj8BkEb+9CR3jpL3CTOnF2YHrX3pJ66yddgdz3mjzNT1UGgq
 oDrfImn6Dv0cHTzDLDEW6w47mTXazsKIAxLd1s2Ui4EQ/FyJAcswqSv14mj3INzMdU
 ctPus1IPg5EXKD+DDrzGEVLBs9hwk8Z3ai94w/pw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f9h-1nHfK93YRL-004DLI; Wed, 16
 Feb 2022 01:18:44 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:18:00 +0100
Message-Id: <20220216001803.637-7-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:28MycnKYVIB7UlJrdb5FGLVDDUI7YjCcJKyT8XyTdj3c1KUUJzM
 yHQYiA0dsl5qqPPMN1Cb3K5J18csfM44YW3gGHUDdUEP8UfU2F0y/O3WpJKfaqgdPrH0bsJ
 QW0mOmLfrK9F7f59Z7Uw6WlEetyWbFfcVZ0bQkpWI+nF16kGriZ8GzkDzCC1Dq6kOHEsXRM
 es/oIPpaWxTNtIODzYBOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2PraAB5/itw=:tiTHeVTo7ob0QfR/7R4HK/
 jZtFrlwS14tTg/dSVs4zj+8VMP1VlVYYCEi12Mr/LTKG2EkBUEKrq4vxOP1Hn0yJui7t59Dca
 WxrXIMsm23aIL358IhO1JSRnE4oNvFvEV+9swKKG6MSEaCLkHVrbUXeeco+5OxtyUVoK4qBwK
 qOJpr3cDFshGEVew++ZM3V1unvTOZXAKfwy0iwP6uW9WFEr7yEW6MIfs8r2cAbw5J6QwokkSl
 huTsO/kyx6l62dV9+jHEHeL6hSHxHFCzTPWS6aOFNIM2kL941XSDOtolzUC4zVxvsuIkpOzwE
 zU3qYZm4HjYpDHgirPtLVxNtNyPppkuR43IrBn+Nr3EIC/YtdJcDwcs0B9iZPw9Hyt3SVikM8
 +A0x51gb50Z6Bf3SRSJof85sjlGfPkHQBwaZiNPioHxzVITqBPcGbKeBWzORuEZj1KqOtuSPB
 jSWM+gU48wkstHvoIrLn/9QKKEU66k76xtfYO8yDzKwEZxKLn0jUaitj7NNrH2eW/+oWUQ1W1
 bvgtMjEK/bIMtzKqNcul9euXLUgG0RvnwXKudV7QfkQZukN4YXRIjv52hoFBzxlrzl6JzVOqR
 KgwCsVRiNbgxMg6vk7NlzKSBXhc4luADcrlkorfG8T3zfqB3+XXrTd/tDrxtsh7I+F1/CdVQV
 NLq9lhzvLm9fVdwKH8l0bdsuNDgdNHzOaKtKam75lvzURDMFociCKxz+fKTYbq4jrjxJajTA0
 kO7NpmoBcfiNBVXR3hjqtWztr3IU4k4LD4TKOGDmTIvK9C+Uc9QXHzrAW5GXvFZi8xwJBotYc
 mzeD5qfMNSZlI4qErtbYLKJG5lpSqKhH3tPuLCy5se4lmPmzAFryOi6b2OD9/ggDPyEfwPT6Z
 Yc8fTtaNLofjeLwYqPe/Z/AGs9OpBa/htBF0QcoiI9fyGhv0t2Je55mWTNlwb9QpW5uct/JM8
 MLu07J0hPwWxFEwDdJuu1yKGWhlwGHbQZN8xqR388Y6QJUNKOIkyni3XOdrLmXnG7vYvcCOeW
 +EIf4gEG3fXyuR5d/s5ftMahNH7WysBHqGgBaKn2iWii1t4QaNTC+OpZy2XGLxD/lQhbSWaa/
 fDsgft+HJFPxyA=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 6/9] serial: max310: remove redundant memset
	in rs485_config
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
