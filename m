Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63F4BEEDB
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E330BC60476;
	Tue, 22 Feb 2022 01:15:20 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66127C6046C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492511;
 bh=TjAcqoaAnmI0l2suIZ3fiCn2gdLnVgDyq5jYOOZmOWA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LTz0z5Gv0OEbNfXEttjpUpY1StURQ43ghgXLj6NkVcjkFCinQ8M+jpRBMV9heU0iO
 86BpIdarylbTDMgLwJSzsU2wB5jmx3o/qiHAQBlFmnbN49+XqE4Qzqb7FyMg5pDmkZ
 TBmzZfptM7cp7slPKH/+TIdEdjMvk0MqhncaeFsM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1nWB8d0GvU-00CDtI; Tue, 22
 Feb 2022 02:15:11 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:31 +0100
Message-Id: <20220222011433.8761-8-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1YjX8AGdE1o4xjj2QyZrTsKWKlZdYsaumGzkTXDBGOIRX0WhWF1
 PY+KkvB9dRtw2LGnGpFJYSr/TYktTeU2sH+z8xpLb+7FlurVJ3LKy3H8hDAVHoSC5Pr2ogx
 P81UN/2jp9d+KYIGKwwcPh+LCJ6SYpR1L9kSN6NuowVZUvzc6momOrQ9Oew9LeOw6K+pejj
 1Q9VfetxAdi6QQYh7XDoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1wWUJEnpg5s=:ivv3awWHvYGuc2TZ3OchJg
 APy6vv4xNBuzxPiqGyz9JtocH9MYSK7i6TjVINtD9Qii2oIgN+4/LLe3ciyc58ctcNuS/7Qot
 a+LEvoIjPCY0nlu0hrJbZWp3JGTj3TBDAqJbBUXUG/ojOX6TN50h1hO/rhxyAjZ9nHBDXYYrm
 3wlP490nhGFWGT03kNt+FRR4CTr6VPtlpUUZJDaLYWAztvKpv/ekgW+riAdmK/WT1OCTNShiN
 OH9Fp3C/3lhEySPXPgjW44bphhiOmdKn9F2yj8spKYmWyAJsQubozh1ZdcyGmtNFAtgf3ftub
 YrVAeVSwZsQc43f6y3B6dmt+weKGrXFZr0rmS5yAMWdTtCcqBaS9Hali2WRAlYNJu04IMVgKH
 QPNq2HYdi1+gJOqDVH1YkeJwr262zuK1iA7l1GLyat3YdpSBuaQGhd5fkO7jbXFefQFf3mZYt
 LlH4y4YR3R8dgqZVwztexm+0W4eiPoTARVUXvwRjy5ZQsDvMTG1Vl1qZK4BDSsXdnhN/ZzEk0
 GPbZbNKcxzaOO4za/u+Xx4yj00Nq01hlzURnfo1cmmSn0sfC2a30NdJ6R4i20ujOKikzyNPM+
 oE9xzxxv6vC0lVxmQlhued/Nz3m3a2gqYNe+N/OYUmK0l3jniX6jlUWu5SD+EXI/RgY1jl6H7
 Em6EkfsKO0FOy91jsmcJczFPcMG7+FItiRZ5ljvsm0vOamXo1KJW8DPETSNLzFDWOrvRMnWfN
 vJPOaULRb8sZby4AmAYmWX6SpxJ3l6L/NgB2neSwoLzMPACrA27oheCsn/nBvbNBFwiNN1ekm
 LyMNFAMykCwG4wKyq54YjvZEW89MB/b/q0t9ZeDzx91zrO99VhCthNPXwY2eS11WAgSZmLPlM
 k6SnS4Tb7UIEYUyZLljpQfk+Q19zZX1A/7c3hyCfJ7y7TexTLckRuSOHoy+MVwATE6tJQkFE5
 5lysybyi2i/7nIOXu0hti1O0ocriMSPc79K58wv9xChIzwzhgkSBbNlcYkZ/wiwWDdwtZqJyQ
 209fzvbtyHxIvgTPIPoNNjvDgp06UHSp7i1PCa+zaIKnKvHsPgS91V5Dh+T2ML437GiIq8YHI
 0GnWJ42CXehcT8=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 7/9] serial: imx: remove redundant
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
