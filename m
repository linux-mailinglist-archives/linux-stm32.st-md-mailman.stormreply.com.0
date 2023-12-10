Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F274D80BD98
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Dec 2023 23:13:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1FD8C6B46B;
	Sun, 10 Dec 2023 22:13:14 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDDF9C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Dec 2023 22:13:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCS2a-0006OU-5i; Sun, 10 Dec 2023 23:12:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCS2S-00ExXo-CA; Sun, 10 Dec 2023 23:12:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCS2S-000RVl-1s; Sun, 10 Dec 2023 23:12:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Date: Sun, 10 Dec 2023 23:12:15 +0100
Message-ID: <cover.1702245873.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=aN2uTP9pET0YKd8ErrSoTK5vjrK84yOnSnlqPftwp5U=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBldje/IGRTw6Qp6aopoOZNEu5aabfn86EmYir5f
 1EWoJBaSb6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXY3vwAKCRCPgPtYfRL+
 TiWpB/0QkgCxo9rWPPZuG0mV+7+gEk/GZc38dQ5EFWJhV8Stqce7VjU2EH4481MoRPnL/0AXAPH
 XiiR4C7gz2B/1olwgpo6lWRPxtxXYx6Sd3+aWvOsfgqAW/q4OjcKyEk3xg48rrbtLvf1xoWFo7y
 0fw9lVR0RmrbvnjwaTKkcDngwN7dAD8Qflw7z7gflMyrKN0MFgRgzwvvbuD5RqWmP2ZVOJM4GRh
 0k+qapzlIcA2ElXaxL07bXhanFkd0Mdw38vbHTh4dy8RCryXCfaxbiWkCskcDwfQzZ0FlwQLcQS
 Fb2Sj2N3HmsMlw8S8d8sC9OF1ybvnjz5+54B3FySEScCa9Gv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>,
 Hadar Gat <hadar.gat@arm.com>, Deepak Saxena <dsaxena@plexity.net>,
 kernel@pengutronix.de, Yangtao Li <frank.li@vivo.com>,
 Yu Zhe <yuzhe@nfschina.com>, Andrei Coardos <aboutphysycs@gmail.com>,
 =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Tali Perry <tali.perry1@gmail.com>, Alexandru Ardelean <alex@shruggie.ro>,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH 00/12] hwrng: Convert to platform remove
	callback returning
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgaHdybmcgcGxhdGZvcm0gZHJpdmVycyB0
byB1c2UgLnJlbW92ZV9uZXcuClNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06IFBy
b3ZpZGUgYSByZW1vdmUgY2FsbGJhY2sgdGhhdApyZXR1cm5zIG5vIHZhbHVlIikgZm9yIGRldGFp
bHMgYW5kIHRoZSBldmVudHVhbCBnb2FsLgoKQWxsIGRyaXZlciBjb252ZXJzaW9ucyBhcmUgdHJp
dmlhbCBhcyBhbGwgdGhlaXIgcmVtb3ZlIGNhbGxiYWNrcyByZXR1cm4KMCAoYXMgZ29vZCBkcml2
ZXJzIHNob3VsZCBkbykuCgpBbGwgcGF0Y2hlcyBhcmUgcGFpcndpc2UgaW5kZXBlbmRhbnQuIFRo
ZXNlIHBhdGNoZXMgc2hvdWxkIGdvIGluIHZpYSB0aGUKdXN1YWwgaHdybmcgdHJlZS4gSXQncyBt
ZXJnZSB3aW5kb3cgbWF0ZXJpYWwuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5p
ZyAoMTIpOgogIGh3cm5nOiBhdG1lbCAtIENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgaHdybmc6IGNjdHJuZyAtIENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgaHdybmc6IGV4eW5vcyAtIENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgaHdybmc6IGluZ2Vu
aWMgLSBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAog
IGh3cm5nOiBrcy1zYSAtIENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCiAgaHdybmc6IG14YyAtIENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgaHdybmc6IG4yIC0gQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBod3JuZzogbnBjbSAtIENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgaHdybmc6IG9tYXAgLSBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIGh3cm5nOiBz
dG0zMiAtIENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
CiAgaHdybmc6IHRpbWVyaW9tZW0gLSBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAogIGh3cm5nOiB4Z2VuZSAtIENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9hdG1l
bC1ybmcuYyAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvY2hhci9od19yYW5kb20vY2N0cm5nLmMg
ICAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL2V4eW5vcy10cm5nLmMg
ICAgfCA2ICsrLS0tLQogZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9pbmdlbmljLXJuZy5jICAgIHwg
NiArKy0tLS0KIGRyaXZlcnMvY2hhci9od19yYW5kb20va3Mtc2Etcm5nLmMgICAgICB8IDYgKyst
LS0tCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL214Yy1ybmdhLmMgICAgICAgfCA2ICsrLS0tLQog
ZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9uMi1kcnYuYyAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZl
cnMvY2hhci9od19yYW5kb20vbnBjbS1ybmcuYyAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL2No
YXIvaHdfcmFuZG9tL29tYXAtcm5nLmMgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9jaGFyL2h3
X3JhbmRvbS9zdG0zMi1ybmcuYyAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvY2hhci9od19yYW5k
b20vdGltZXJpb21lbS1ybmcuYyB8IDYgKystLS0tCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3hn
ZW5lLXJuZy5jICAgICAgfCA2ICsrLS0tLQogMTIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgNDggZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IGJjNjNkZTZlNmJhMGIxNjY1MmM1
ZmI0YjljOTkxNmI5ZTdjYTFmMjMKLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
