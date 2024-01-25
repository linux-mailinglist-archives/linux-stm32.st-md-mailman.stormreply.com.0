Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D828683C245
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 13:14:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B619C6B444;
	Thu, 25 Jan 2024 12:14:10 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 560A0C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 12:14:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZH-00048C-Nh; Thu, 25 Jan 2024 13:10:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZD-002HR8-To; Thu, 25 Jan 2024 13:10:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSyZD-007n0k-2K;
 Thu, 25 Jan 2024 13:10:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Walle <mwalle@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Lu Hongfei <luhongfei@vivo.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 25 Jan 2024 13:09:01 +0100
Message-ID: <1c873808bfc93ab51f49be799334dee6e8ab398a.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=xFZHrY/7C9PRNt99L0vl8g6j3yX1l4H0eIirFXKiC6s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9naZ43cfZqRmm0PAwRVRHazfdHqUBSCmiRl
 7SkEynbJGKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPZwAKCRCPgPtYfRL+
 TqyWB/0Xq9H2qxz5a4NBliO3W2OBOYrNCAIPS+YFIK+/psR+8hFCNvRcL8LkTcvrGhz+wH1p+Pb
 F64/cTSgbYddbvZjoDx1kSNtuKvpvYsZy3B/swnxRBzzhjM4qRl0nLRqI7tuxKsMoJ6KChrenmP
 ZHuoEbNaT3Jq0uJ3jCQX+OWAPfMUgSkbUr5A7m+b7JrBvE1+EcTZ0ltF9cqru7Gex1/GIk5STLR
 s4XqyNlr+QqQS2lKFYFTNPQKFohdM4YpL+GcQjYEZZG2zihg6J+r6Mx1mefplrODntBtd+WIXCL
 uGNCMjCbN1xcJ1N2Xx2QisJNxxGcBaZCqQD7Iqx5HLe1eACQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH v5 039/111] pwm: Provide wrappers for storing
	and getting driver private data
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

VGhlc2UgZnVuY3Rpb25zIGFyZSB1c2VmdWwgdG8gc3RvcmUgYW5kIHF1ZXJ5IGRyaXZlciBwcml2
YXRlIGRhdGEgYQpBZnRlciBzdHJ1Y3QgcHdtX2NoaXAgZ290IGl0cyBvd24gc3RydWN0IGRldmlj
ZSwgdGhpcyBjYW4gbWFrZSB1c2Ugb2YKZGV2X2dldF9kcnZkYXRhKCkgYW5kIGRldl9zZXRfZHJ2
ZGF0YSgpIG9uIHRoYXQgZGV2aWNlLiAgVGhlc2UgZnVuY3Rpb25zCmFyZSByZXF1aXJlZCBhbHJl
YWR5IG5vdyB0byBjb252ZXJ0IGRyaXZlcnMgdG8gcHdtY2hpcF9hbGxvYygpIHdoaWNoCm11c3Qg
aGFwcGVuIGJlZm9yZSBjaGFuZ2luZyBwd21fY2hpcDo6ZGV2LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBpbmNs
dWRlL2xpbnV4L3B3bS5oIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wd20uaCBiL2lu
Y2x1ZGUvbGludXgvcHdtLmgKaW5kZXggZDc5NjY5MThmMzAxLi4yYzQ5ZDJmZTJmZTcgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgvcHdtLmgKKysrIGIvaW5jbHVkZS9saW51eC9wd20uaApAQCAt
MjcyLDYgKzI3Miw3IEBAIHN0cnVjdCBwd21fb3BzIHsKICAqIEBucHdtOiBudW1iZXIgb2YgUFdN
cyBjb250cm9sbGVkIGJ5IHRoaXMgY2hpcAogICogQG9mX3hsYXRlOiByZXF1ZXN0IGEgUFdNIGRl
dmljZSBnaXZlbiBhIGRldmljZSB0cmVlIFBXTSBzcGVjaWZpZXIKICAqIEBhdG9taWM6IGNhbiB0
aGUgZHJpdmVyJ3MgLT5hcHBseSgpIGJlIGNhbGxlZCBpbiBhdG9taWMgY29udGV4dAorICogQGRy
aXZlcl9kYXRhOiBQcml2YXRlIHBvaW50ZXIgZm9yIGRyaXZlciBzcGVjaWZpYyBpbmZvCiAgKiBA
cHdtczogYXJyYXkgb2YgUFdNIGRldmljZXMgYWxsb2NhdGVkIGJ5IHRoZSBmcmFtZXdvcmsKICAq
Lwogc3RydWN0IHB3bV9jaGlwIHsKQEAgLTI4Niw2ICsyODcsNyBAQCBzdHJ1Y3QgcHdtX2NoaXAg
ewogCWJvb2wgYXRvbWljOwogCiAJLyogb25seSB1c2VkIGludGVybmFsbHkgYnkgdGhlIFBXTSBm
cmFtZXdvcmsgKi8KKwl2b2lkICpkcml2ZXJfZGF0YTsKIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
czsKIH07CiAKQEAgLTI5NCw2ICsyOTYsMjQgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZGV2aWNl
ICpwd21jaGlwX3BhcmVudChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCiAJcmV0dXJuIGNoaXAtPmRl
djsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkICpwd21jaGlwX2dldF9kcnZkYXRhKHN0cnVjdCBw
d21fY2hpcCAqY2hpcCkKK3sKKwkvKgorCSAqIEFmdGVyIHB3bV9jaGlwIGdvdCBhIGRlZGljYXRl
ZCBzdHJ1Y3QgZGV2aWNlLCB0aGlzIGNhbiBiZSByZXBsYWNlZCBieQorCSAqIGRldl9nZXRfZHJ2
ZGF0YSgmY2hpcC0+ZGV2KTsKKwkgKi8KKwlyZXR1cm4gY2hpcC0+ZHJpdmVyX2RhdGE7Cit9CisK
K3N0YXRpYyBpbmxpbmUgdm9pZCBwd21jaGlwX3NldF9kcnZkYXRhKHN0cnVjdCBwd21fY2hpcCAq
Y2hpcCwgdm9pZCAqZGF0YSkKK3sKKwkvKgorCSAqIEFmdGVyIHB3bV9jaGlwIGdvdCBhIGRlZGlj
YXRlZCBzdHJ1Y3QgZGV2aWNlLCB0aGlzIGNhbiBiZSByZXBsYWNlZCBieQorCSAqIGRldl9zZXRf
ZHJ2ZGF0YSgmY2hpcC0+ZGV2LCBkYXRhKTsKKwkgKi8KKwljaGlwLT5kcml2ZXJfZGF0YSA9IGRh
dGE7Cit9CisKICNpZiBJU19FTkFCTEVEKENPTkZJR19QV00pCiAvKiBQV00gdXNlciBBUElzICov
CiBpbnQgcHdtX2FwcGx5X21pZ2h0X3NsZWVwKHN0cnVjdCBwd21fZGV2aWNlICpwd20sIGNvbnN0
IHN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKTsKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
