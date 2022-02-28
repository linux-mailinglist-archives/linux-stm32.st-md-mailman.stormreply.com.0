Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1FD4C6144
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32639C628AA;
	Mon, 28 Feb 2022 02:40:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8D5CC6049C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015995;
 bh=iSIbiqQY+am1M73zZEjjrGJSzNxevmnnhXm36hRIfqw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f6CP4unmD1KZ6N3RFfl8UvbOK2ln9OziJUJ24F+mj9VZ9nCuIc8mraxGLehVELvKf
 yklplZE/IoQHmUEMq56NkwrbP+0C6ZhdyAVOdkUlLN7Bo6FFPyCuWr777QIomqSKuQ
 6Rz5IoGASlXLfwJ/GyUcW+iZ2/XNOep/ky6pwQrk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1nKeKX020A-004yWo; Mon, 28
 Feb 2022 03:39:55 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:25 +0100
Message-Id: <20220228023928.1067-7-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UyxTOKZGWZ8nWvI2z/fzQ/YFBYocUp7YsypBgL9evAkOXKLDvLG
 jqIYO6zgCFPAOEYbCgIhAs3A3H7FnznWX/T/BescrY0+tQ3zgaJfbVj0wv+a3jJ7hUhmprd
 OD6EWw1ppf0YKRpLSfBN9X9yYNxjecYR2BAbmo2d5P4PnXyTsewWCoXpHXE4Hmts8sBD84q
 t4V4L9fgC5B8tfs42BLQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k2oBVy4zoV4=:mwK/Xpc21jlTi3xDXhNs2k
 eqhAzjMrEQaaTinvJFPpT8+PG3BscULCtOOD2Q46zirOe2wo6XfuQP61Xx3lktvHDMplBWKmA
 89Bbigh9VGvMOLJPXZwGVJlXqKXIsewde0aglzDzEAvy+h2lic23Nzhjg8SlnLc/YScv5tjHz
 CcIzXvZ5wNWhnvNcyQIYCUL77vqCOWEIaQKruVurPFbxP7C5EiLXGMw67l4WvmEo2CavqZrjj
 1EZT9gqxbYqfqPdGxxOydReXgJJWLLLiRGVpB3r2+PoWjVSqMINHCzbzNDtLMC5jfBJkgN0zs
 bgCh67fbI/DRI2oxV32dJgZoJiPzlikQcktPkNnaU9Zj6ivDQRn/VORadsjBnsXqI7jTx2jY6
 4awBVAbJccqZm+Samr5Tloem4nb1ewNaO6enTJswzrAgETXv2sm0HZZAbLfX0EffpsDDlU2l3
 yflCFuLpd/Y4Xo/0l1F5llnA2zcsTMwFxrgqfZCvnxPqE6hGQbAc4xZKvorbVfwnHwJwaH8GV
 Sl1mntBp+aZGwIDUTR3+tDkGGZKgZvLpI+cbmsKVHpBQh/tCC7HzkwyWd1ODVBGuWEC5ZpH5N
 GsbJfWP1agNrRoxSbF5HvcUggtS/cJjDE1AZQllBD4n7GHYRIFj1tLQYFW2oLwicJjx3Q7Gdp
 7kLPRlqdFhivB4MbSTIYhMkE4gWdU7yINiWkIOxloQMIB7/d4nmLEnYdCsr9QN1CNX7VprmWi
 sTGYqnzfklFeqLedSZHOFF+A00A/W9q7UMvPizVDzAFmlcscKwSOlPrdzaGqpkmWYWuhgVwP0
 ANcRRw8fc+a2961XI8CTc56EUo8SzP/VPGnSo68DhmuL8KyHzrgmBOcwVEKXP5jJ6WYnR8bMh
 oglr6yhgaAx/rIw95OddFzEgtMshc6O7lUdGBvZzQB9ieeKEEuqBH/OmBp/CxcY4NchZZSd/U
 R5ud+PnMUobadXESaVlN6VKbdEGFAMlVYvp4ejTpwGPkUuOvDDAMPnJN3lTie/QpfN0RMKPxa
 3SssHCffvI+xYJOi6utjrhCMiPEKlRlLAyjq03DRf6WVS00OHS/NQRdXJEIbXuVI2M+P99dtV
 KWx/tkZ9TZjLXg=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 6/9] serial: max310: remove redundant
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
