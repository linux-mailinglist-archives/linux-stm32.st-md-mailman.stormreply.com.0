Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF54B7BB6
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4270CC60474;
	Wed, 16 Feb 2022 00:18:53 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 338A3C6046B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970725;
 bh=p8QMhzf5BXOGOgdpvzQpYcOARim4oxi/fBzc9Njmipc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CpVK4e7q8OypWMAKUrl1FHsiB2ucyfwSCBGbLCveYOvPBOtFsqNlO2ko3PRm1u+DC
 wKV5Yqo2CZMDS0BHUe+gF58uUsdbiwKrflMwOIIQjmQLbSPnmDFucjsaE0yad3gCXw
 JK5jdTSD/Vag8AO3jqSfeeMI99P52catderNOcFo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b6l-1nLXD617jZ-00835i; Wed, 16
 Feb 2022 01:18:45 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:18:01 +0100
Message-Id: <20220216001803.637-8-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ifqonzAg/uOEZqJ5tzZdRX/mbDQweIG/xNMJGv13ZEz4LKelJp+
 AVB9rxaJPrOXTC8FQFCMiv0QNx479OQdXZgsHF7YJJKPGI/r+2TdRrQRigWD88Kw3dU7xdj
 l6uMtxsjlSdyxeYuZ3rj8e8mNAgCv7++KKHGEA7Nvu242Q0Qo0CmigcDtVpNXfWYMS2FTVM
 qGy32Szlz3qnmwh7Yt2xA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ix5KGaxI8GU=:a/XP+OGQKZMZgoHSmS2tK2
 t+rYXpeNE4KPdUsdhJv8p8uAS7531rSr768CYZl/9JAP9qwORBpzs3JDnDEYjpdPRENmJkatZ
 T+ZGFsjgkwlzcBSqNP2vftImjX8Go7Bm4SG48WBxK/XGzkCeFi/AskettlRfi/egXNIHQ9+c3
 ZQDeyCsxVQAdCo1p5JvwnsOkgn/8/y1KsKcwmQ7luf22eByxSqqeUfxJmtYSMxT+6fDwuitJ8
 nkDj4qRBtKRfldKmeS+7/1LWPX9IP0DebooSoqsaVvqIz03IXOiZEoGuBy5BSgNwHmA6ejLLk
 t1EWpWsnlQGxCgH87p50GT3Box/+e93jm3orusdfYooWzbcTOgGGgibsat2uldFMRTRiHD2pm
 eR1erqM086jSjDV3Qqsn0GtNU4fvGqZNl+WB82FjXHTtgwLfxZ1+NGjTdlJcix5yWAnDYVe6j
 gBL9ylRelbKA+wygM7L2D0cBGAmRlVL5DuOGVBzDhdXX8n4WU5OEcz5MbmTPG6mTN7LBOlVZJ
 2T4dazfyfm8f9UPw1bPv0rgGsUSWUGCHS9yU+YN0RWT0xLYfb1EHjc6TuOJiueYQX0DWd1U0O
 GvYeXOqsG1y+RFg1C3TlDS2nhY9EfgEKihnFk6khx7Qr4gbQ8y55m7IMzrTWun/VQqkx0y+H/
 huuvuAsDjQT+0NKnVNQUANCHib1c7cqClRkSEigEWk3F8dQiJgycbQ1wfEb8ms4wlWyxSY/5d
 RtJqor29Dqb+HUg9x8icqWd0sgN3OyJLMr/FrDI/JytHbQ1Qyi3klcT5f0Obpxr2NRKF0mZ2c
 PkDdIo+I1yClRGjRWNgS2BnYKhs9clvK9S1+dhRrkoNDNWDomsxATfPs2PVdbghFdEVqHuQYY
 xJ3G7KtV8/YRSS5cYEHuXuVQrMXFiZO/vQYC0rSaPvwu7yuUUtm2TNdv3dvPKi7vBaD/Fc8TX
 INak2TvnmG6D5KZdMi335mz6AeZ/yMVMGrr7dkh7VItPl3/HuLrzKH8BdKiYi7BWsVAjTT8Cf
 psbi0HqxkI8M+AKWtK3N7zcFDXn5Dhhl8kqxMzyhuJMFaGitvATK5C0M9NrRsMP+nSE+4mYTJ
 moOCkvYcTX4n08=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 7/9] serial: imx: remove redundant
	assignment in rs485_config
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

In uart_set_rs485_config() the serial core already assigns the passed
serial_rs485 struct to the uart port.

So remove the assignment in the drivers rs485_config() function to avoid
reduncancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/imx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 0b467ce8d737..ab56ff23e8a9 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1937,8 +1937,6 @@ static int imx_uart_rs485_config(struct uart_port *port,
 	    rs485conf->flags & SER_RS485_RX_DURING_TX)
 		imx_uart_start_rx(port);
 
-	port->rs485 = *rs485conf;
-
 	return 0;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
