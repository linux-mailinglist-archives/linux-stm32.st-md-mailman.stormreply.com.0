Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 238F08545FE
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:35:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9CEBC71287;
	Wed, 14 Feb 2024 09:35:35 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23AEEC71285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:35:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBeq-0004OA-3m; Wed, 14 Feb 2024 10:34:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBek-000f6Z-By; Wed, 14 Feb 2024 10:34:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBek-004Xzr-0a;
 Wed, 14 Feb 2024 10:34:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Corbet <corbet@lwn.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 James Clark <james.clark@arm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
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
 Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>
Date: Wed, 14 Feb 2024 10:30:50 +0100
Message-ID: <9577d6053a5a52536057dc8654ff567181c2da82.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6032;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=koAN/+/23sPZAVIjNYgBDfSOCZNuNAYktJbEIstyjSk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIhOy3rMjR1GdjpQaPyoW0nJ56JzUO/rQmlQs
 ZBM0ZtEf82JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyITgAKCRCPgPtYfRL+
 TicEB/0dPx8EojmTD1h+4X2160QdFmhEtr9DkNcgvD4MXbJwi2AR0WTiisK1rsmV+6tCkIK7tJ3
 ia8xMZ3BnvofoSfLSnXkboz+RdVSIEA7BqEblHXS94KRpF0kJSfkChuZTlsOibS5ccdLl9keCDp
 Ln92glGKIspJhlUYHC5XJS/5WgVuJIs2zBZ0mj9ssy1fRc7GPSOATaja3kUzueYK4sFeE9sRycR
 zgSfTLZglcFmMVV6/V8gfK4IdkOlO88EBryyP7oNNXf0XhDmqRiBNvGBpkzOgQFt0cSSObTgx1d
 uKdMfoMhlp4iXIRqjo0TrOM/JN49b64qgWPy7mfDaS9UVtMr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev, kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH v6 003/164] pwm: Provide pwmchip_alloc()
	function and a devm variant of it
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

VGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMgYSBzdHJ1Y3QgcHdtX2NoaXAgYW5kIGRyaXZlciBkYXRh
LiBDb21wYXJlZCB0bwp0aGUgc3RhdHVzIHF1byB0aGUgc3BsaXQgaW50byBwd21fY2hpcCBhbmQg
ZHJpdmVyIGRhdGEgaXMgbmV3LCBvdGhlcndpc2UKaXQgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcg
cmVsZXZhbnQgKHlldCkuCgpUaGUgaW50ZW50aW9uIGlzIHRoYXQgYWZ0ZXIgYWxsIGRyaXZlcnMg
YXJlIHN3aXRjaGVkIHRvIHVzZSB0aGlzCmFsbG9jYXRpb24gZnVuY3Rpb24sIGl0cyBwb3NzaWJs
ZSB0byBhZGQgYSBzdHJ1Y3QgZGV2aWNlIHRvIHN0cnVjdApwd21fY2hpcCB0byBwcm9wZXJseSB0
cmFjayB0aGUgbGF0dGVyJ3MgbGlmZXRpbWUgd2l0aG91dCB0b3VjaGluZyBhbGwKZHJpdmVycyBh
Z2Fpbi4gUHJvcGVyIGxpZmV0aW1lIHRyYWNraW5nIGlzIGEgbmVjZXNzYXJ5IHByZWNvbmRpdGlv
biB0bwppbnRyb2R1Y2UgY2hhcmFjdGVyIGRldmljZSBzdXBwb3J0IGZvciBQV01zICh0aGF0IGlt
cGxlbWVudHMgYXRvbWljCnNldHRpbmcgYW5kIGRvZXNuJ3Qgc3VmZmVyIGZyb20gdGhlIHN5c2Zz
IG92ZXJoZWFkIG9mIHRoZSAvc3lzL2NsYXNzL3B3bQp1c2Vyc3BhY2Ugc3VwcG9ydCkuCgpUaGUg
bmV3IGZ1bmN0aW9uIHB3bWNoaXBfcHJpdigpIChvYnZpb3VzbHk/KSBvbmx5IHdvcmtzIGZvciBj
aGlwcwphbGxvY2F0ZWQgd2l0aCBwd21jaGlwX2FsbG9jKCkuCgpTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIC4uLi9k
cml2ZXItYXBpL2RyaXZlci1tb2RlbC9kZXZyZXMucnN0ICAgICAgICB8ICAxICsKIERvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9wd20ucnN0ICAgICAgICAgICAgICB8IDExICsrLS0KIGRyaXZlcnMv
cHdtL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDU4ICsrKysrKysrKysrKysr
KysrKysKIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIy
ICsrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2Rl
dnJlcy5yc3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5y
c3QKaW5kZXggYzVmOTlkODM0ZWM1Li5lNGRmNzJjNDA4ZDIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9kcml2ZXItbW9kZWwvZGV2cmVzLnJzdAorKysgYi9Eb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QKQEAgLTQyMCw2ICs0MjAsNyBA
QCBQT1dFUgogICBkZXZtX3JlYm9vdF9tb2RlX3VucmVnaXN0ZXIoKQogCiBQV00KKyAgZGV2bV9w
d21jaGlwX2FsbG9jKCkKICAgZGV2bV9wd21jaGlwX2FkZCgpCiAgIGRldm1fcHdtX2dldCgpCiAg
IGRldm1fZndub2RlX3B3bV9nZXQoKQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL3B3bS5yc3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvcHdtLnJzdAppbmRleCAzYzI4
Y2NjNGI2MTEuLmI0MWIxYzU2NDc3ZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL3B3bS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QKQEAgLTE0
MywxMSArMTQzLDEyIEBAIHRvIGltcGxlbWVudCB0aGUgcHdtXyooKSBmdW5jdGlvbnMgaXRzZWxm
LiBUaGlzIG1lYW5zIHRoYXQgaXQncyBpbXBvc3NpYmxlCiB0byBoYXZlIG11bHRpcGxlIFBXTSBk
cml2ZXJzIGluIHRoZSBzeXN0ZW0uIEZvciB0aGlzIHJlYXNvbiBpdCdzIG1hbmRhdG9yeQogZm9y
IG5ldyBkcml2ZXJzIHRvIHVzZSB0aGUgZ2VuZXJpYyBQV00gZnJhbWV3b3JrLgogCi1BIG5ldyBQ
V00gY29udHJvbGxlci9jaGlwIGNhbiBiZSBhZGRlZCB1c2luZyBwd21jaGlwX2FkZCgpIGFuZCBy
ZW1vdmVkCi1hZ2FpbiB3aXRoIHB3bWNoaXBfcmVtb3ZlKCkuIHB3bWNoaXBfYWRkKCkgdGFrZXMg
YSBmaWxsZWQgaW4gc3RydWN0Ci1wd21fY2hpcCBhcyBhcmd1bWVudCB3aGljaCBwcm92aWRlcyBh
IGRlc2NyaXB0aW9uIG9mIHRoZSBQV00gY2hpcCwgdGhlCi1udW1iZXIgb2YgUFdNIGRldmljZXMg
cHJvdmlkZWQgYnkgdGhlIGNoaXAgYW5kIHRoZSBjaGlwLXNwZWNpZmljCi1pbXBsZW1lbnRhdGlv
biBvZiB0aGUgc3VwcG9ydGVkIFBXTSBvcGVyYXRpb25zIHRvIHRoZSBmcmFtZXdvcmsuCitBIG5l
dyBQV00gY29udHJvbGxlci9jaGlwIGNhbiBiZSBhbGxvY2F0ZWQgdXNpbmcgcHdtY2hpcF9hbGxv
YygpLCB0aGVuCityZWdpc3RlcmVkIHVzaW5nIHB3bWNoaXBfYWRkKCkgYW5kIHJlbW92ZWQgYWdh
aW4gd2l0aCBwd21jaGlwX3JlbW92ZSgpLiBUbyB1bmRvCitwd21jaGlwX2FsbG9jKCkgdXNlIHB3
bWNoaXBfcHV0KCkuIHB3bWNoaXBfYWRkKCkgdGFrZXMgYSBmaWxsZWQgaW4gc3RydWN0Citwd21f
Y2hpcCBhcyBhcmd1bWVudCB3aGljaCBwcm92aWRlcyBhIGRlc2NyaXB0aW9uIG9mIHRoZSBQV00g
Y2hpcCwgdGhlIG51bWJlcgorb2YgUFdNIGRldmljZXMgcHJvdmlkZWQgYnkgdGhlIGNoaXAgYW5k
IHRoZSBjaGlwLXNwZWNpZmljIGltcGxlbWVudGF0aW9uIG9mIHRoZQorc3VwcG9ydGVkIFBXTSBv
cGVyYXRpb25zIHRvIHRoZSBmcmFtZXdvcmsuCiAKIFdoZW4gaW1wbGVtZW50aW5nIHBvbGFyaXR5
IHN1cHBvcnQgaW4gYSBQV00gZHJpdmVyLCBtYWtlIHN1cmUgdG8gcmVzcGVjdCB0aGUKIHNpZ25h
bCBjb252ZW50aW9ucyBpbiB0aGUgUFdNIGZyYW1ld29yay4gQnkgZGVmaW5pdGlvbiwgbm9ybWFs
IHBvbGFyaXR5CmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9jb3JlLmMgYi9kcml2ZXJzL3B3bS9j
b3JlLmMKaW5kZXggODMwYTY5NzgyNmFmLi45ZmM2ZjRmYTcxZDYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvcHdtL2NvcmUuYworKysgYi9kcml2ZXJzL3B3bS9jb3JlLmMKQEAgLTQ1NCw2ICs0NTQsNjQg
QEAgb2ZfcHdtX3NpbmdsZV94bGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIGNvbnN0IHN0cnVj
dCBvZl9waGFuZGxlX2FyZ3MgKmFyZ3MpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChvZl9wd21fc2lu
Z2xlX3hsYXRlKTsKIAorI2RlZmluZSBQV01DSElQX0FMSUdOIEFSQ0hfRE1BX01JTkFMSUdOCisK
K3N0YXRpYyB2b2lkICpwd21jaGlwX3ByaXYoc3RydWN0IHB3bV9jaGlwICpjaGlwKQoreworCXJl
dHVybiAodm9pZCAqKWNoaXAgKyBBTElHTihzaXplb2YoKmNoaXApLCBQV01DSElQX0FMSUdOKTsK
K30KKworLyogVGhpcyBpcyB0aGUgY291bnRlcnBhcnQgdG8gcHdtY2hpcF9hbGxvYyAqLwordm9p
ZCBwd21jaGlwX3B1dChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCit7CisJa2ZyZWUoY2hpcCk7Cit9
CitFWFBPUlRfU1lNQk9MX0dQTChwd21jaGlwX3B1dCk7CisKK3N0cnVjdCBwd21fY2hpcCAqcHdt
Y2hpcF9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsIHVuc2lnbmVkIGludCBucHdtLCBzaXpl
X3Qgc2l6ZW9mX3ByaXYpCit7CisJc3RydWN0IHB3bV9jaGlwICpjaGlwOworCXNpemVfdCBhbGxv
Y19zaXplOworCisJYWxsb2Nfc2l6ZSA9IHNpemVfYWRkKEFMSUdOKHNpemVvZigqY2hpcCksIFBX
TUNISVBfQUxJR04pLCBzaXplb2ZfcHJpdik7CisKKwljaGlwID0ga3phbGxvYyhhbGxvY19zaXpl
LCBHRlBfS0VSTkVMKTsKKwlpZiAoIWNoaXApCisJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwor
CisJY2hpcC0+ZGV2ID0gcGFyZW50OworCWNoaXAtPm5wd20gPSBucHdtOworCisJcHdtY2hpcF9z
ZXRfZHJ2ZGF0YShjaGlwLCBwd21jaGlwX3ByaXYoY2hpcCkpOworCisJcmV0dXJuIGNoaXA7Cit9
CitFWFBPUlRfU1lNQk9MX0dQTChwd21jaGlwX2FsbG9jKTsKKworc3RhdGljIHZvaWQgZGV2bV9w
d21jaGlwX3B1dCh2b2lkICpkYXRhKQoreworCXN0cnVjdCBwd21fY2hpcCAqY2hpcCA9IGRhdGE7
CisKKwlwd21jaGlwX3B1dChjaGlwKTsKK30KKworc3RydWN0IHB3bV9jaGlwICpkZXZtX3B3bWNo
aXBfYWxsb2Moc3RydWN0IGRldmljZSAqcGFyZW50LCB1bnNpZ25lZCBpbnQgbnB3bSwgc2l6ZV90
IHNpemVvZl9wcml2KQoreworCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsKKwlpbnQgcmV0OworCisJ
Y2hpcCA9IHB3bWNoaXBfYWxsb2MocGFyZW50LCBucHdtLCBzaXplb2ZfcHJpdik7CisJaWYgKElT
X0VSUihjaGlwKSkKKwkJcmV0dXJuIGNoaXA7CisKKwlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQocGFyZW50LCBkZXZtX3B3bWNoaXBfcHV0LCBjaGlwKTsKKwlpZiAocmV0KQorCQlyZXR1
cm4gRVJSX1BUUihyZXQpOworCisJcmV0dXJuIGNoaXA7Cit9CitFWFBPUlRfU1lNQk9MX0dQTChk
ZXZtX3B3bWNoaXBfYWxsb2MpOworCiBzdGF0aWMgdm9pZCBvZl9wd21jaGlwX2FkZChzdHJ1Y3Qg
cHdtX2NoaXAgKmNoaXApCiB7CiAJaWYgKCFwd21jaGlwX3BhcmVudChjaGlwKSB8fCAhcHdtY2hp
cF9wYXJlbnQoY2hpcCktPm9mX25vZGUpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3B3bS5o
IGIvaW5jbHVkZS9saW51eC9wd20uaAppbmRleCAyOWE3ZDkxNDBmNzcuLjRhNjU2OGRmZGYzZiAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9wd20uaAorKysgYi9pbmNsdWRlL2xpbnV4L3B3bS5o
CkBAIC00MDMsNiArNDAzLDEwIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwd21fbWlnaHRfc2xlZXAo
c3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIGludCBwd21fY2FwdHVyZShzdHJ1Y3QgcHdtX2Rldmlj
ZSAqcHdtLCBzdHJ1Y3QgcHdtX2NhcHR1cmUgKnJlc3VsdCwKIAkJdW5zaWduZWQgbG9uZyB0aW1l
b3V0KTsKIAordm9pZCBwd21jaGlwX3B1dChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApOworc3RydWN0
IHB3bV9jaGlwICpwd21jaGlwX2FsbG9jKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgdW5zaWduZWQg
aW50IG5wd20sIHNpemVfdCBzaXplb2ZfcHJpdik7CitzdHJ1Y3QgcHdtX2NoaXAgKmRldm1fcHdt
Y2hpcF9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsIHVuc2lnbmVkIGludCBucHdtLCBzaXpl
X3Qgc2l6ZW9mX3ByaXYpOworCiBpbnQgX19wd21jaGlwX2FkZChzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXAsIHN0cnVjdCBtb2R1bGUgKm93bmVyKTsKICNkZWZpbmUgcHdtY2hpcF9hZGQoY2hpcCkgX19w
d21jaGlwX2FkZChjaGlwLCBUSElTX01PRFVMRSkKIHZvaWQgcHdtY2hpcF9yZW1vdmUoc3RydWN0
IHB3bV9jaGlwICpjaGlwKTsKQEAgLTQ3NSw2ICs0NzksMjQgQEAgc3RhdGljIGlubGluZSBpbnQg
cHdtX2NhcHR1cmUoc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAlyZXR1cm4gLUVJTlZBTDsKIH0K
IAorc3RhdGljIGlubGluZSB2b2lkIHB3bWNoaXBfcHV0KHN0cnVjdCBwd21fY2hpcCAqY2hpcCkK
K3sKK30KKworc3RhdGljIGlubGluZSBzdHJ1Y3QgcHdtX2NoaXAgKnB3bWNoaXBfYWxsb2Moc3Ry
dWN0IGRldmljZSAqcGFyZW50LAorCQkJCQkgICAgIHVuc2lnbmVkIGludCBucHdtLAorCQkJCQkg
ICAgIHNpemVfdCBzaXplb2ZfcHJpdikKK3sKKwlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKK30K
Kworc3RhdGljIGlubGluZSBzdHJ1Y3QgcHdtX2NoaXAgKmRldm1fcHdtY2hpcF9hbGxvYyhzdHJ1
Y3QgZGV2aWNlICpwYXJlbnQsCisJCQkJCQkgIHVuc2lnbmVkIGludCBucHdtLAorCQkJCQkJICBz
aXplX3Qgc2l6ZW9mX3ByaXYpCit7CisJcmV0dXJuIHB3bWNoaXBfYWxsb2MocGFyZW50LCBucHdt
LCBzaXplb2ZfcHJpdik7Cit9CisKIHN0YXRpYyBpbmxpbmUgaW50IHB3bWNoaXBfYWRkKHN0cnVj
dCBwd21fY2hpcCAqY2hpcCkKIHsKIAlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
