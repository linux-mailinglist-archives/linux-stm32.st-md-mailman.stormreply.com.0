Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE14FAD5C
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 283DEC628C0;
	Sun, 10 Apr 2022 10:47:30 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A27A9C628A6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587638;
 bh=MiPI5RKIJn/QCYR3f9zV844luaLp3IqrvICdIRruXKQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YCE7m4uQyVmiOV393SJYDNtn5tRhOW8LWsWDHZkGI6aFSABKvQWtBAqGu9TrIyowS
 RcMR8OWpAZfI0V7wYypxgZKdWhfgnMVoZi3HdvUCE/4SnfedgId8adEVL7JwamHH9w
 1++Wc15lzFnWbW6JWmM5jVZj6tJEMho2XIiXA4vo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wlv-1o6HHj2DeL-012KMt; Sun, 10
 Apr 2022 12:47:18 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:39 +0200
Message-Id: <20220410104642.32195-7-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:r4lBTsfdu2dXPObxKTZw9/+yYZ5MEP6+WV8dRsHu8tb5Ck8lo1t
 JI3S6XRC0iGI/jRA1w5UE4ixYbc+u31owPilNMVoKAZrd1cwdDbeo/Ct4WoxVCmFln3EHZt
 Gthf1FPFW2fsK/jglPkgM7dKnNFhYQiffbhPebHZPMgNFQXFMqqbeQUi+2I1cUgos85MvbH
 T/5uY/4B+rxTDWCrU30lw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:INNgmzCAPqQ=:0S4SiF3Xwrb6/shF3UJJBC
 e3r9atNNylb5GkdA2xMdBPWrHZLUlW9GERV67ADaSshMxbmKJYTAtIbPGdb1ofl2rBXooVmzC
 sVERsD+5P9fIUOucep86CNF7qbPJTgmEGZFXi4PxKVP+Fa/GIMhsGZLH7m3a4EGIU3okiH9P0
 owdHZD6W31a44gBDZnu0yqi9xcosa7l+4sm7p9JoxePrg00vanE+V1j4SQ6z0UJeDvff7VVh8
 a9a6pd6OmCYEh2a7UglMX2TKHUxhZb1i/6SL7gIaqiHqgd2MUKR7GRTnvMeRasVxrr5H/OdoG
 OCacE9b1RPmjIw0VTzcH6F1Qo0WMyZFZ3tJE9aImsfwkZn+qvHhjCMeY9+TDlRn/wIVvgAl98
 dO7wihaA6yt/KsTNDJmzXKTmbpYzRhWL7gZeQ2v2HLxHMRvB9Hdx7Gfa2bvsdJ75T0d2mmD36
 0G6e/qlmjlGqac4PKftp/+SSnBpVEBfhdeBx+l78xPKPWjO2K3RPsPgUY7w1xOkXLobXuIq7o
 8jNlAjBDNffBzinjfRiwkLjYDynP6wSxJOF4JMzxGQmlo9sG21kyskeJ3WSFUnGyaiNoxvhte
 WKrc7PuKrvjTtRJXznUVkK+XAAtHQimJqT6zIMx4uc9iX41P5bPg3SOLO8qO8JXfb+QHP/GIl
 g7H5mae6M2kJau3wkj/gtePlq3ZkBmfxaoleY+0WF6y3bd7Sm05Iuuolls4f3O68tdGQMkpQu
 EYogtAOsOXjIXPwfc4xSbLuY8iemvuj9AOYvZElDIZotHbJ3n9s98Hidzfgk+Pe4kDu+iH/pJ
 wN8V3Gcrxr2byqAz8SgTZU1VP06C5F6ZVjakZ/anlJZGMKMHMOPETuB2hL7v32+v490KQnmzi
 GWLpxU1XOYkZP+ic0ZhMuqlNs94IABW66fO8GYDxir8bw3pnWq4CJVlt4eNCyyePby8rcpZHY
 qxsX9mzqGWMuFDBlR4mNr1EWXciDJNblmHkuO5m/MUgtX3mXmZTwxTfOgx5GNiPO2x07W2etY
 TCeqk3oCqOA4QKsaGjFrZlMcgn60FWcYHWzTX3QH+cj512yM+gLor1l7dJaYPrd0Wd21XfSNW
 VUJOclbCzVCgN8=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 RESEND 6/9] serial: max310: remove
	redundant memset in rs485_config
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
index 3112b4a05448..a0b6ea52d133 100644
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
