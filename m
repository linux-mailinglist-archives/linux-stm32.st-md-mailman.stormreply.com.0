Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525283C247
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 13:14:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD86AC6B444;
	Thu, 25 Jan 2024 12:14:18 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1165C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 12:14:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZH-00049s-NK; Thu, 25 Jan 2024 13:10:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZE-002HRD-5b; Thu, 25 Jan 2024 13:10:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSyZD-007n0n-33;
 Thu, 25 Jan 2024 13:10:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, James Clark <james.clark@arm.com>,
 linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>,
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
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
Date: Thu, 25 Jan 2024 13:09:02 +0100
Message-ID: <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4472;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=Y70kt1S+wDMGZ2Y6dT7JBGkOh38DPB/mz0c9lW1w+go=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9o1J7Qn6pSUgc2O5FQOVH47M2tNWcGfyzpg
 KqN39khZuCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPaAAKCRCPgPtYfRL+
 Tl7sCACDg65PvULF2T57x8s2GOVh8qHAOM4G2fEdFZQeFhZiTply5wW+kG5bIM1JAdU3cAiM96g
 uzfqnkdy2Mt6/lWu6ZhjqOk/xYUO80eOZ5e8cyRhQLGb4VsogRhDSOKSAf4k0fkzTYCdCM3jfwP
 QGXt5GRUeYGJVhDmUC7m1wai9vWlfWG8IXkVbSYnX3LqEAl0A40uaffDMUtp2bFtgHNqtqbGhx6
 bM/vJXjzuqiGa8jiFMTuJ50PRpeh9o/6cre0EhT+nv5GQHpRaGSKnNf/E7Q0CK0tiRGYs7M9t6g
 2w/lsv8+vxgUQ7yjIC7YwrqDMXW1+x7YTS/xwh76REfV7L9/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Douglas Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
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
Subject: [Linux-stm32] [PATCH v5 040/111] pwm: Provide devm_pwmchip_alloc()
	function
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
aGlwcwphbGxvY2F0ZWQgd2l0aCBkZXZtX3B3bWNoaXBfYWxsb2MoKS4KClNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQog
Li4uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QgICAgICAgIHwgIDEgKwogRG9j
dW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QgICAgICAgICAgICAgIHwgMTAgKysrKy0tLS0K
IGRyaXZlcnMvcHdtL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI1ICsrKysr
KysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICsrCiA0IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2Rl
bC9kZXZyZXMucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9kZXZy
ZXMucnN0CmluZGV4IGM1Zjk5ZDgzNGVjNS4uZTRkZjcyYzQwOGQyIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QKKysrIGIvRG9jdW1l
bnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9kZXZyZXMucnN0CkBAIC00MjAsNiArNDIw
LDcgQEAgUE9XRVIKICAgZGV2bV9yZWJvb3RfbW9kZV91bnJlZ2lzdGVyKCkKIAogUFdNCisgIGRl
dm1fcHdtY2hpcF9hbGxvYygpCiAgIGRldm1fcHdtY2hpcF9hZGQoKQogICBkZXZtX3B3bV9nZXQo
KQogICBkZXZtX2Z3bm9kZV9wd21fZ2V0KCkKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9wd20ucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QKaW5kZXgg
M2MyOGNjYzRiNjExLi5jZWU2NmM3ZjAzMzUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9wd20ucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9wd20ucnN0CkBA
IC0xNDMsMTEgKzE0MywxMSBAQCB0byBpbXBsZW1lbnQgdGhlIHB3bV8qKCkgZnVuY3Rpb25zIGl0
c2VsZi4gVGhpcyBtZWFucyB0aGF0IGl0J3MgaW1wb3NzaWJsZQogdG8gaGF2ZSBtdWx0aXBsZSBQ
V00gZHJpdmVycyBpbiB0aGUgc3lzdGVtLiBGb3IgdGhpcyByZWFzb24gaXQncyBtYW5kYXRvcnkK
IGZvciBuZXcgZHJpdmVycyB0byB1c2UgdGhlIGdlbmVyaWMgUFdNIGZyYW1ld29yay4KIAotQSBu
ZXcgUFdNIGNvbnRyb2xsZXIvY2hpcCBjYW4gYmUgYWRkZWQgdXNpbmcgcHdtY2hpcF9hZGQoKSBh
bmQgcmVtb3ZlZAotYWdhaW4gd2l0aCBwd21jaGlwX3JlbW92ZSgpLiBwd21jaGlwX2FkZCgpIHRh
a2VzIGEgZmlsbGVkIGluIHN0cnVjdAotcHdtX2NoaXAgYXMgYXJndW1lbnQgd2hpY2ggcHJvdmlk
ZXMgYSBkZXNjcmlwdGlvbiBvZiB0aGUgUFdNIGNoaXAsIHRoZQotbnVtYmVyIG9mIFBXTSBkZXZp
Y2VzIHByb3ZpZGVkIGJ5IHRoZSBjaGlwIGFuZCB0aGUgY2hpcC1zcGVjaWZpYwotaW1wbGVtZW50
YXRpb24gb2YgdGhlIHN1cHBvcnRlZCBQV00gb3BlcmF0aW9ucyB0byB0aGUgZnJhbWV3b3JrLgor
QSBuZXcgUFdNIGNvbnRyb2xsZXIvY2hpcCBjYW4gYmUgYWxsb2NhdGVkIHVzaW5nIGRldm1fcHdt
Y2hpcF9hbGxvYywgdGhlbiBhZGRlZAordXNpbmcgcHdtY2hpcF9hZGQoKSBhbmQgcmVtb3ZlZCBh
Z2FpbiB3aXRoIHB3bWNoaXBfcmVtb3ZlKCkuIHB3bWNoaXBfYWRkKCkKK3Rha2VzIGEgZmlsbGVk
IGluIHN0cnVjdCBwd21fY2hpcCBhcyBhcmd1bWVudCB3aGljaCBwcm92aWRlcyBhIGRlc2NyaXB0
aW9uIG9mCit0aGUgUFdNIGNoaXAsIHRoZSBudW1iZXIgb2YgUFdNIGRldmljZXMgcHJvdmlkZWQg
YnkgdGhlIGNoaXAgYW5kIHRoZQorY2hpcC1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiBvZiB0aGUg
c3VwcG9ydGVkIFBXTSBvcGVyYXRpb25zIHRvIHRoZSBmcmFtZXdvcmsuCiAKIFdoZW4gaW1wbGVt
ZW50aW5nIHBvbGFyaXR5IHN1cHBvcnQgaW4gYSBQV00gZHJpdmVyLCBtYWtlIHN1cmUgdG8gcmVz
cGVjdCB0aGUKIHNpZ25hbCBjb252ZW50aW9ucyBpbiB0aGUgUFdNIGZyYW1ld29yay4gQnkgZGVm
aW5pdGlvbiwgbm9ybWFsIHBvbGFyaXR5CmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9jb3JlLmMg
Yi9kcml2ZXJzL3B3bS9jb3JlLmMKaW5kZXggMWI0YzNkMGNhYTgyLi5iODIxYTJiMGIxNzIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL2NvcmUuYworKysgYi9kcml2ZXJzL3B3bS9jb3JlLmMKQEAg
LTQ1NCw2ICs0NTQsMzEgQEAgb2ZfcHdtX3NpbmdsZV94bGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXAsIGNvbnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmFyZ3MpCiB9CiBFWFBPUlRfU1lNQk9M
X0dQTChvZl9wd21fc2luZ2xlX3hsYXRlKTsKIAorc3RhdGljIHZvaWQgKnB3bWNoaXBfcHJpdihz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXApCit7CisJcmV0dXJuICh2b2lkICopY2hpcCArIHNpemVvZigq
Y2hpcCk7Cit9CisKK3N0cnVjdCBwd21fY2hpcCAqZGV2bV9wd21jaGlwX2FsbG9jKHN0cnVjdCBk
ZXZpY2UgKnBhcmVudCwgdW5zaWduZWQgaW50IG5wd20sIHNpemVfdCBzaXplb2ZfcHJpdikKK3sK
KwlzdHJ1Y3QgcHdtX2NoaXAgKmNoaXA7CisJc2l6ZV90IGFsbG9jX3NpemU7CisKKwlhbGxvY19z
aXplID0gc2l6ZV9hZGQoc2l6ZW9mKCpjaGlwKSwgc2l6ZW9mX3ByaXYpOworCisJY2hpcCA9IGRl
dm1fa3phbGxvYyhwYXJlbnQsIGFsbG9jX3NpemUsIEdGUF9LRVJORUwpOworCWlmICghY2hpcCkK
KwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CisKKwljaGlwLT5kZXYgPSBwYXJlbnQ7CisJY2hp
cC0+bnB3bSA9IG5wd207CisKKwlwd21jaGlwX3NldF9kcnZkYXRhKGNoaXAsIHB3bWNoaXBfcHJp
dihjaGlwKSk7CisKKwlyZXR1cm4gY2hpcDsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGRldm1fcHdt
Y2hpcF9hbGxvYyk7CisKIHN0YXRpYyB2b2lkIG9mX3B3bWNoaXBfYWRkKHN0cnVjdCBwd21fY2hp
cCAqY2hpcCkKIHsKIAlpZiAoIWNoaXAtPmRldiB8fCAhY2hpcC0+ZGV2LT5vZl9ub2RlKQpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wd20uaCBiL2luY2x1ZGUvbGludXgvcHdtLmgKaW5kZXgg
MmM0OWQyZmUyZmU3Li44YmM3NTA0YWE3ZDQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHdt
LmgKKysrIGIvaW5jbHVkZS9saW51eC9wd20uaApAQCAtNDAzLDYgKzQwMyw4IEBAIHN0YXRpYyBp
bmxpbmUgYm9vbCBwd21fbWlnaHRfc2xlZXAoc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIGludCBw
d21fY2FwdHVyZShzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLCBzdHJ1Y3QgcHdtX2NhcHR1cmUgKnJl
c3VsdCwKIAkJdW5zaWduZWQgbG9uZyB0aW1lb3V0KTsKIAorc3RydWN0IHB3bV9jaGlwICpkZXZt
X3B3bWNoaXBfYWxsb2Moc3RydWN0IGRldmljZSAqcGFyZW50LCB1bnNpZ25lZCBpbnQgbnB3bSwg
c2l6ZV90IHNpemVvZl9wcml2KTsKKwogaW50IF9fcHdtY2hpcF9hZGQoc3RydWN0IHB3bV9jaGlw
ICpjaGlwLCBzdHJ1Y3QgbW9kdWxlICpvd25lcik7CiAjZGVmaW5lIHB3bWNoaXBfYWRkKGNoaXAp
IF9fcHdtY2hpcF9hZGQoY2hpcCwgVEhJU19NT0RVTEUpCiB2b2lkIHB3bWNoaXBfcmVtb3ZlKHN0
cnVjdCBwd21fY2hpcCAqY2hpcCk7Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
