Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C004383C241
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 13:13:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81A60C6B444;
	Thu, 25 Jan 2024 12:13:37 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DC5CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 12:13:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZB-0003Ze-Mz; Thu, 25 Jan 2024 13:10:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZ6-002HOt-Gy; Thu, 25 Jan 2024 13:10:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSyZ6-007myG-1E;
 Thu, 25 Jan 2024 13:10:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 25 Jan 2024 13:08:25 +0100
Message-ID: <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=SfOslAbsyBLEr/955V0luBriAR1MBuqlRLojueDMWPA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk89sMCb69Ns1+4RognQQiOh0kwtwTRgZqZe7
 Qr1BL64ZR+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPPQAKCRCPgPtYfRL+
 Tm5ICACqUZnuAnSjFfXrvBpLBI7tlj8WA+HQMKQ6Zc+N4XX6ETnakaKJsM+x6j+q4etOxq2c/gZ
 zxT7BpN14RbPiCl4D8hdIHJMFSxpOXgFMhHn6G0CiQZKij7FYNQcIit0BAKORd4VGZ3VwABrQ/Y
 OjjIIjxHWR1qdMK2N2kNbFpbTf4/2PRkxMHdXTJcAMAnSGWqM6H23gUlqytwn6NbEab8dDUgmkC
 dj7M9Z8Ubq9AofnoudLfMHIY54wLfZ0PkykBosZOeOLWLjqyM0qMfK6/MVn1CgVUVr75LWffVka
 lOK3tBDX44i4Xzm74nXYI2dfx77u3aY3K3mXE4UoCo8Z6Cl7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH v5 003/111] pwm: Provide a macro to get the
	parent device of a given chip
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

Q3VycmVudGx5IGEgcHdtX2NoaXAgc3RvcmVzIGluIGl0cyBzdHJ1Y3QgZGV2aWNlICpkZXYgbWVt
YmVyIGEgcG9pbnRlcgp0byB0aGUgcGFyZW50IGRldmljZS4gUHJlcGFyaW5nIGEgY2hhbmdlIHRo
YXQgZW1iZWRzIGEgZnVsbCBzdHJ1Y3QKZGV2aWNlIGluIHN0cnVjdCBwd21fY2hpcCwgdGhpcyBh
Y2Nlc3NvciBtYWNybyBzaG91bGQgYmUgdXNlZCBpbiBhbGwKZHJpdmVycyBkaXJlY3RseSBhY2Nl
c3NpbmcgY2hpcC0+ZGV2IG5vdy4gVGhpcyB3YXkgc3RydWN0IHB3bV9jaGlwIGFuZAp0aGlzIG1h
Y3JvIGNhbiBiZSBjaGFuZ2VkIHdpdGhvdXQgaGF2aW5nIHRvIHRvdWNoIGFsbCBkcml2ZXJzIGlu
IHRoZQpzYW1lIGNoYW5nZSBzZXQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGluY2x1ZGUvbGludXgvcHdtLmgg
fCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9wd20uaCBiL2luY2x1ZGUvbGludXgvcHdtLmgKaW5kZXggOGZmZTlhZTdh
MjNhLi5kNzk2NjkxOGYzMDEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHdtLmgKKysrIGIv
aW5jbHVkZS9saW51eC9wd20uaApAQCAtMjg5LDYgKzI4OSwxMSBAQCBzdHJ1Y3QgcHdtX2NoaXAg
ewogCXN0cnVjdCBwd21fZGV2aWNlICpwd21zOwogfTsKIAorc3RhdGljIGlubGluZSBzdHJ1Y3Qg
ZGV2aWNlICpwd21jaGlwX3BhcmVudChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCit7CisJcmV0dXJu
IGNoaXAtPmRldjsKK30KKwogI2lmIElTX0VOQUJMRUQoQ09ORklHX1BXTSkKIC8qIFBXTSB1c2Vy
IEFQSXMgKi8KIGludCBwd21fYXBwbHlfbWlnaHRfc2xlZXAoc3RydWN0IHB3bV9kZXZpY2UgKnB3
bSwgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpOwotLSAKMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
