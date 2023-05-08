Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77C6FB2C0
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 16:27:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 462CCC6A606;
	Mon,  8 May 2023 14:27:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7DA3C6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 14:27:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1pB-0008Nm-Te; Mon, 08 May 2023 16:26:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p2-0021Gd-S8; Mon, 08 May 2023 16:26:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p2-002Sk4-6B; Mon, 08 May 2023 16:26:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Date: Mon,  8 May 2023 16:26:26 +0200
Message-Id: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=e18Kj38bK3tEm/hSzc46Mes9xzQDcw64Vnd25cb8omc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWQaMhtXiVZEIsYdTMyD+fsTSBXFA2k+fVfb7W
 Z4wnuQlykSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFkGjAAKCRCPgPtYfRL+
 TqeRCACo0+Gsv6LM1FIlu9KxZ+EkcpVDZXwiB+Le4QCe34u4Z/sJjN/PGWVm1DJGX3TZAiXg1R6
 lE6OXvG4Kp8Ek78HiENVfQtqBMLAsxWlabhUC1S8i9iHY50JOkyM3AxazQOY8jKgllX+YCjNIsd
 1ElRgtMImqflj1afHSmN5c0aXV8XRTvC05pHb0G7JHDup/b6z1YLYx4wChYq+u/GJJg/BzO24lo
 Am9+8bevKXSdcTpE48zAsNXTXHweMxlnojnuXv49mB6LJDhh+SrwSDLeFW4y4Q7RFgljVJ4JHt5
 lYzHPUfU7TFnx4J9dEc6QUhnC8E6LC7crHmAiKw2JMXhPWtQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-oxnas@groups.io, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac: Convert to
	platform remove callback returning void
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

SGVsbG8sCgooaW1wbGljaXQpIHYxIG9mIHRoaXMgc2VyaWVzIGlzIGF2YWlsYWJsZSBhdApodHRw
czovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvMjAyMzA0MDIxNDMwMjUuMjUyNDQ0My0xLXUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZQouCgpDaGFuZ2VzIHNpbmNlIHRoZW46CgogLSBBZGRl
ZCB2YXJpb3VzIFJldmlld2VkLWJ5OiBhbmQgQWNrZWQtYnk6IHRhZ3MgcmVjZWl2ZWQgZm9yIHYx
CiAtIFJlbW92ZWQgYSB2YXJpYWJsZSBpbiBhbiBlYXJsaWVyIHBhdGNoIHRvIG1ha2UgYWxsIGlu
dGVybWVkaWF0ZSBzdGVwcwogICBjb21waWxhYmxlLCBzcG90dGVkIGJ5IFNpbW9uIEhvcm1hbgog
LSBSZWJhc2VkIHRvIHY2LjQtcmMxICh3aGljaCBuZWVkZWQgYSBzbGlnaHQgYWRhcHRpb24gdG8g
Y29wZSBmb3IKICAgNGJkM2JiN2I0NTI2ICgibmV0OiBzdG1tYWM6IEFkZCBnbHVlIGxheWVyIGZv
ciBTdGFyRml2ZSBKSDcxMTAgU29DIikpCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvD
tm5pZyAoMTEpOgogIG5ldDogc3RtbWFjOiBNYWtlIHN0bW1hY19wbHRmcl9yZW1vdmUoKSByZXR1
cm4gdm9pZAogIG5ldDogc3RtbWFjOiBkd21hYy12aXNjb250aTogTWFrZSB2aXNjb250aV9ldGhf
Y2xvY2tfcmVtb3ZlKCkgcmV0dXJuCiAgICB2b2lkCiAgbmV0OiBzdG1tYWM6IGR3bWFjLXFjb20t
ZXRocW9zOiBEcm9wIGFuIGlmIHdpdGggYW4gYWx3YXlzIGZhbHNlCiAgICBjb25kaXRpb24KICBu
ZXQ6IHN0bW1hYzogZHdtYWMtdmlzY29udGk6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrCiAgICByZXR1cm5pbmcgdm9pZAogIG5ldDogc3RtbWFjOiBkd21hYy1kd2MtcW9zLWV0
aDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sKICAgIHJldHVybmluZyB2b2lk
CiAgbmV0OiBzdG1tYWM6IGR3bWFjLXFjb20tZXRocW9zOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjawogICAgcmV0dXJuaW5nIHZvaWQKICBuZXQ6IHN0bW1hYzogZHdtYWMtcms6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAog
IG5ldDogc3RtbWFjOiBkd21hYy1zdGk6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZwogICAgdm9pZAogIG5ldDogc3RtbWFjOiBkd21hYy1zdG0zMjogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sKICAgIHJldHVybmluZyB2b2lkCiAgbmV0OiBz
dG1tYWM6IGR3bWFjLXN1bjhpOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjawog
ICAgcmV0dXJuaW5nIHZvaWQKICBuZXQ6IHN0bW1hYzogZHdtYWMtdGVncmE6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrCiAgICByZXR1cm5pbmcgdm9pZAoKIC4uLi9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1hbmFyaW9uLmMgICB8ICAyICstCiAuLi4vc3RtaWNyby9z
dG1tYWMvZHdtYWMtZHdjLXFvcy1ldGguYyAgICAgICAgfCAgNiArKy0tLS0KIC4uLi9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1nZW5lcmljLmMgICB8ICAyICstCiAuLi4vbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWlteC5jICAgfCAgMiArLQogLi4uL2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLWluZ2VuaWMuYyAgIHwgIDIgKy0KIC4uLi9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1pbnRlbC1wbGF0LmMgICAgICAgICB8ICA5ICsrKy0tLS0tLQogLi4uL2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLWlwcTgwNnguYyAgIHwgIDIgKy0KIC4uLi9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1scGMxOHh4LmMgICB8ICAyICstCiAuLi4vZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYyAgfCAgOSArKystLS0tLS0KIC4uLi9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVzb24uYyB8ICAyICstCiAuLi4vZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtbWVzb244Yi5jICAgfCAgMiArLQogLi4uL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1veG5hcy5jIHwgIDIgKy0KIC4uLi9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1xY29tLWV0aHFvcy5jICAgICAgICB8IDE1ICsrKystLS0tLS0tLS0tLQogLi4uL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jICAgIHwgIDYgKystLS0tCiAuLi4v
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jICAgfCAgMiArLQogLi4uL2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0YXJmaXZlLmMgIHwgIDIgKy0KIC4uLi9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RpLmMgICB8ICA2ICsrLS0tLQogLi4uL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jIHwgIDYgKystLS0tCiAuLi4v
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bjhpLmMgfCAgNiArKy0tLS0KIC4u
Li9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3VueGkuYyB8ICAyICstCiAuLi4v
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXRlZ3JhLmMgfCAgNiArKy0tLS0KIC4u
Li9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5jICB8IDE5ICsrKysrLS0t
LS0tLS0tLS0tLS0KIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0u
YyB8ICA0ICstLS0KIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0u
aCB8ICAyICstCiAyNCBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA3NyBkZWxldGlv
bnMoLSkKCmJhc2UtY29tbWl0OiBhYzlhNzg2ODFiOTIxODc3NTE4NzYzYmEwZTg5MjAyMjU0MzQ5
ZDFiCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
