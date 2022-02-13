Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F17334B6B2B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A70DEC60476;
	Tue, 15 Feb 2022 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C612C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791289;
 bh=qLYG3ShC2H3ubPzsSwJCdlMrSsl/GQcb1NMteyXFxUQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lgP1/MpdcAcPp7WHS54cbOSQHqn1sGQ3HE+4zwm10xwkG3C7wQ8tond7u+hcQ54uN
 JusZjET/+F0Dw/hYVft7ItRNPQFZyprK4024TqW0p9cCpgO43EOLrVGCaRxMvK+bXU
 DHo+H3RYpGQC23RkbBntSMjv1S/LHUh8IzWAuXsA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHGCu-1nWcsj2aye-00DExV; Sun, 13
 Feb 2022 23:28:09 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:34 +0100
Message-Id: <20220213222737.15709-7-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:pNx+oEQyE87SI8SUhuYE/49GQx6eFVSP9sCHmwT/ditRcv0ylZN
 rkC/z0D7Q2MUrIrRUkpVmA71yNbDTddrfPtrt8KCP/4yOZ2GPb61Nh3ULguiKqL0WQstrUN
 QGKtvqxZref4S6azX7N1AacR+IVk1yMV8IHdwiZZEUXR+W4Bo/HkFSxPoooN5TYo9XQpjMZ
 K15CBILg6Irsn1kmnCbgg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2gMVRpGJ+Pg=:zWCMeP+npjT8Y/OgwGxOaG
 VMCSchLMxUMyAtHOqgp4TAJYxw4V54Y7dRP9R47RZn88AnOXCBib0+YGubMvpcd8wThqHSC/8
 Nwg3RxXlciQGdYTwDzyx8nuJs0+/HbiqeMRcc6iVF5BT5djY/lnnfRKlMY2Tqxen3hNNcrzpe
 hAf/S9kELuCs5w8/zl12hULu07GN/u5aR6jS49nBQ0k0wRd6Q4Rzw9FnolG4+TYpx09Uq+/sN
 EmxqPxEYSXVSId9vb0wL8msWTg0RPW5c3MDGG/PpyHsluHHRsdsdqaPQOK9jJyN0nIq8sRCFd
 8r8SqmskkiM01Amycn22xIo6ZeXMu8BTfcgSI+ixEQ1B5LnYdeeDFbHh1tjhfzUj4jsdpQAmg
 5Ojw/hI8b+Nv08Ot1IM++wHBCKaRMfB4y7aajEkh5EetA1ujxusE+YMMMvwabFtv5Yq9DWFp9
 PmJ2r+9RCvHsSf5+Wd9QXNdCenDMhv8YQCLR4mrjolo16/BaLEZHVGvJ75vCiS9S50XVYTxWQ
 kdbWAklmpKik+nXwIOIeXvrLoSnUwq1rnxq1i5XJR3YLdANcT65ngL6ls4PdhF19EyND6a/NN
 dPyj9Zl0VJR5UFWUcI8WiLXEWvvKmwjkuve1TkCzSIGljdioSA7J1HlLKNKUF/+8Ie6RxzwS9
 zEpg6d6V2WFl86pvi7SQitcRPaCq9U0EHUzHr7Ius+yD61O4YQJn3/giZSN5gAeoSqydxWHFJ
 k5tlDvtOk0BJFuQtYEzQR7rGv53UQZxp5+agsffHOEoBv88OiOb9eQ1bn520pIwr5mnysCJVa
 GLThz5R3CXjBoNNKRh0Qj+LGF1QzEED8OO7PRFZFOLgIkEO1a7aFHGKyttq5qUNO8kfqgrYbq
 +mQYoci7vdgPotq87O5yy23/y/53YirGVVURl8+OfGrfurqoV+Xe5+MHBxVrPNBIiIIWvwx1K
 6vhzMKZCPdKbtrODQ1jCNQONvgUfe6nE57FtGa8paqjR0xKLsOMdlKPGxkkj78zorK7Yeu6Lr
 df24JZAl9ZhMZOco6ake+ytEyjjVIPKgS6Hxzie695CjJ+V2ZSOZDw5zekAcMdIcTDsKmbLJc
 /Kplh30qc0nLcE=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 6/9] serial: max310: remove redundant code in
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

When RS485 is configured by userspace the serial core already nullifies the
padding field of the returned configuration struct. Doing the same in the
drivers rs485_config function is redundant, so remove the concerning
code in this function.

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
