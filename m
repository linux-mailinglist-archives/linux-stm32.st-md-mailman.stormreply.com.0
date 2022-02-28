Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 708614C6143
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EB4AC628A7;
	Mon, 28 Feb 2022 02:40:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96C1DC6049B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015995;
 bh=TjAcqoaAnmI0l2suIZ3fiCn2gdLnVgDyq5jYOOZmOWA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=egzCk6PLEW6jzuBH5Ay/BHf/YLpzdeNDLh12tM+XxnGLr1KoO/+ASW/ya15xBlwIk
 uK7QE0hBo6Ki0wopsnq2XbMBScFXdndYbFqvzeqUesmYtECIwaLH7blK4Fphd9Y5gD
 w+F0631x29u0i2hpiGW96sFF+/8GbhKlASgEj1/k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTRN-1navzq30QX-00NTW9; Mon, 28
 Feb 2022 03:39:55 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:26 +0100
Message-Id: <20220228023928.1067-8-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:OqeMSE2CDGXt5KJ7rWsD/nIkLMTCtETnI8mPAheao9RteHUJGjH
 uhUD9hHjzAgC5OkrDc4EyFM0mtAdCljBI8ScajPJ1tUtZ4fEtQR6l1gWFFN6dnRMb0kccMF
 GR8f+uhf6e+oXTukcckXjpiZRFG8gmLRl++cphp+zMyBSerp9tm06LJxhM3kM45hKwJDgw+
 xW99kyvyOseDuWzuSDljg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nyG/fLspJU8=:AYZg7QdM2fx5TjQNE4uplA
 ON0A/MUk4WKpoRdZVavvoFhzMeq4r9Fgp83P5TbqMSRS40Ul1qxFh8lHEZta/ylXkHQSQEI0n
 4ohkZ7iB6uxSWHgWgpbNVkKUKuhYMykU57+DkyZOf75Fo6XUB1zmOfCB4J8NwQMQrNtlH0GcB
 KkeWcyQd04hmw81OYe1zjTQ48W1IR1x+/TwI8JveQFZBVZNBH8BQDUqEbV2/PIsYzR9c4MtgC
 J/DdVfd5nBvFehz4/2aiRmSU7L6U+ey8V+yZGzx1M/ca/Ns1TfSWQHwkrF+RLdb/WhUbhF57o
 ZNzS7SW9LZLrhegJO7xvLtyXok0XgwAty+ZzHySFeIeyNL0oBygKHzfwwni4Qhk5QO1lqEk9S
 xFYrAzIcmZJ6xMkupV43OECEuKDJDl/gcLkAVL/V0IQPrd/HRqeZGfVGcgG5nK1U3p7KEFvjn
 mfaYUeeXLs/8kvLiuAigW2Z0SGmvipR2g/xPC++De10+OoKyOMAYeOBNmce5e8j3Ep/6njUwr
 TMVntYKvHbXmBKZO7uJjS1gVE0DUYdsswNYSI9YXroQ8tkDXitRXw8Zu9BebganzvmGDfFvbI
 M9cSbKjBgnsE+Em5fw58IjJxqCyrmy/A4khElxmIHcbwLQHTLTsyZkDALPk9ya6j2TTzU5dZl
 5rXKuQ0N7OYteVeVQ3usQtMSqL+DgkAwIr4n3SWzu4dkGzTPCNJGtTVroet5Awa+X0yKKqJCx
 GDQ3ks9NTEwmtsUAw5Eju6/bqQ53SDipx+KfjxCqCa6IP29tRImwHWTkiA9owpp2LwDJZuHgq
 UcjRPh0DZOhC832wOC/qzxBn2ejgbmmCfgvqf5UXENzfPw/b4e0DY6aNNLpCK0h41WXav/jSH
 opAUEv/HRD3f986FO4Gz1PDp5NVknqKIgUpwW1jJ9QwYpeJ3S0j4QHwmuruLnmSqkdbGI+TBs
 esIIwOp3QB2Dx6oxS+4IYgaRwDXbQE26AdE0EDLSHW1Z8/KXTkCwBneBvAvL1WMy58EQ5DXJt
 axykPGwCSZ+zTuhwQPfxkCYd2iGDtzJ2yFcdf1entYTBaSm1rImnribgQ2r14VbxTAkr07Bmi
 cZbfoChIBaGaUU=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 7/9] serial: imx: remove redundant
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SW4gdWFydF9zZXRfcnM0ODVfY29uZmlnKCkgdGhlIHNlcmlhbCBjb3JlIGFscmVhZHkgYXNzaWdu
cyB0aGUgcGFzc2VkCnNlcmlhbF9yczQ4NSBzdHJ1Y3QgdG8gdGhlIHVhcnQgcG9ydC4KClNvIHJl
bW92ZSB0aGUgYXNzaWdubWVudCBpbiB0aGUgZHJpdmVycyByczQ4NV9jb25maWcoKSBmdW5jdGlv
biB0byBhdm9pZApyZWR1bmNhbmN5LgoKQWNrZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IExpbm8gU2FuZmlsaXBw
byA8TGlub1NhbmZpbGlwcG9AZ214LmRlPgotLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9pbXguYyB8
IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdHR5L3NlcmlhbC9pbXguYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9pbXguYwppbmRleCAwYjQ2
N2NlOGQ3MzcuLmFiNTZmZjIzZThhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2lt
eC5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9pbXguYwpAQCAtMTkzNyw4ICsxOTM3LDYgQEAg
c3RhdGljIGludCBpbXhfdWFydF9yczQ4NV9jb25maWcoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwK
IAkgICAgcnM0ODVjb25mLT5mbGFncyAmIFNFUl9SUzQ4NV9SWF9EVVJJTkdfVFgpCiAJCWlteF91
YXJ0X3N0YXJ0X3J4KHBvcnQpOwogCi0JcG9ydC0+cnM0ODUgPSAqcnM0ODVjb25mOwotCiAJcmV0
dXJuIDA7CiB9CiAKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
