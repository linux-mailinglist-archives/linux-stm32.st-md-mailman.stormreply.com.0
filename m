Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B863676EBD4
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 16:08:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A361C6A5F2;
	Thu,  3 Aug 2023 14:08:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C847FC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Aug 2023 14:08:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyZ-0006mV-Nr; Thu, 03 Aug 2023 16:06:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyN-000rBF-In; Thu, 03 Aug 2023 16:06:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyM-00A9kB-Jk; Thu, 03 Aug 2023 16:06:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Thu,  3 Aug 2023 16:06:30 +0200
Message-Id: <20230803140633.138165-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fUIfC654WxtfT7CEJ8mGT4DHYTt22edc6EeQOO0mgBU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBky7RhOm8jkQTlEYB5GsZS8El0/H9apHFEdsZFO
 x8y+5Ja40OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMu0YQAKCRCPgPtYfRL+
 TsJcB/90L6hN+ip+TjX3AzflYEmXfAvsD7DvqLlndSD4q7tLpczaexF3R7J6u81XciSqOUe2jgL
 ZFH92dwUdpov0xdqiWraRK+aZJ+b0W4jpGsrqqlhoMdolr0pAB7fIFytPguywOKD62dbKy1CvL1
 Dhl29UAwsXqsIV7jcTR/3lRLsFUwN9/STI8/IVeD4JJHoLv16c1Q61uVC/I22L/ivskcK9F/YQX
 7it5vFhz9lfLpr79GuNQ3+d+atoBJRDfjCnDak/HWaR9JRk7b7F8pb+oq6ih+R2INrvw1jlBxDW
 1b3cg6OWSLaXTh/Y3/NSkgaZz/kG8/JbVRjAFD6tfDS0KfZO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-riscv@lists.infradead.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Michael Walle <michael@walle.cc>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Sven Peter <sven@svenpeter.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Alex Elder <elder@kernel.org>, Alexander Shiyan <shc_work@mail.ru>,
 Scott Branden <sbranden@broadcom.com>, greybus-dev@lists.linaro.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 Hector Martin <marcan@marcan.st>, Heiko Stuebner <heiko@sntech.de>,
 Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-rpi-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] pwm: Manage owner assignment implicitly
	for drivers
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

SGVsbG8sCgp3aGlsZSB3b3JraW5nIG9uIHRoZSBwd20gY29yZSBJIG5vdGljZWQgdGhhdCBwd20t
Y3JjIGRvZXNuJ3QgYXNzaWduCi5vd25lciBpbiBpdHMgcHdtX29wcyBzdHJ1Y3R1cmUuIFRoaXMg
aXNuJ3QgYSBwcm9ibGVtIGluIHByYWN0aXNlIHRob3VnaAphcyB0aGlzIGRyaXZlciBjYW4gb25s
eSBiZSBjb21waWxlZCBidWlsdC1pbiAodXAgdG8gbm93KS4KClN0aWxsIHByZXZlbnQgZnV0dXJl
IHB3bSBkcml2ZXJzIG5vdCBhc3NpZ25pbmcgLm93bmVyIGJ5IHdyYXBwaW5nCnB3bWNoaXBfYWRk
KCkgaW4gYSBtYWNybyB0aGF0IGF1dG9tYXRlcyBvd25lciBoYW5kbGluZyBzaW1wbGlmeWluZyBl
YWNoCmRyaXZlciBhICh0aW55KSBiaXQuCgpJIGFsc28gZm91bmQgdGhhdCB0aGVyZSBpcyBubyBo
YXJkIHJlYXNvbiB0byBvbmx5IGNvbXBpbGUgcHdtLWNyYyBhcyBhCmJ1aWx0LWluIG9uIHg4Niwg
c28gdGhpcyBsaW1pdGF0aW9uIGlzIGxpZnRlZCBpbiB0aGUgc2Vjb25kIHBhdGNoLgoKQmVzdCBy
ZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDIpOgogIHB3bTogTWFuYWdlIG93bmVyIGFz
c2lnbm1lbnQgaW1wbGljaXRseSBmb3IgZHJpdmVycwogIHB3bTogY3JjOiBBbGxvdyBjb21waWxh
dGlvbiBhcyBtb2R1bGUgYW5kIHdpdGggQ09NUElMRV9URVNUCgogZHJpdmVycy9ncGlvL2dwaW8t
bXZlYnUuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242
NWRzaTg2LmMgfCAgMSAtCiBkcml2ZXJzL2xlZHMvcmdiL2xlZHMtcWNvbS1scGcuYyAgICAgIHwg
IDEgLQogZHJpdmVycy9wd20vS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRy
aXZlcnMvcHdtL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrKysrKysrKy0tLS0t
LS0tLQogZHJpdmVycy9wd20vcHdtLWFiODUwMC5jICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZl
cnMvcHdtL3B3bS1hcHBsZS5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20t
YXRtZWwtaGxjZGMuYyAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWF0bWVsLXRjYi5j
ICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC5jICAgICAgICAgICAgICAg
fCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tYmNtLWlwcm9jLmMgICAgICAgICAgIHwgIDEgLQogZHJp
dmVycy9wd20vcHdtLWJjbS1rb25hLmMgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3
bS1iY20yODM1LmMgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tYmVybGluLmMg
ICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWJyY21zdGIuYyAgICAgICAgICAg
ICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1jbGsuYyAgICAgICAgICAgICAgICAgfCAgMSAtCiBk
cml2ZXJzL3B3bS9wd20tY2xwczcxMXguYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20v
cHdtLWNyYy5jICAgICAgICAgICAgICAgICB8ICA1ICsrKystCiBkcml2ZXJzL3B3bS9wd20tY3Jv
cy1lYy5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWR3Yy5jICAgICAgICAg
ICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1lcDkzeHguYyAgICAgICAgICAgICAgfCAg
MSAtCiBkcml2ZXJzL3B3bS9wd20tZnNsLWZ0bS5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVy
cy9wd20vcHdtLWhpYnZ0LmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1p
bWcuYyAgICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20taW14LXRwbS5jICAg
ICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWlteDEuYyAgICAgICAgICAgICAgICB8
ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1pbXgyNy5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2
ZXJzL3B3bS9wd20taW50ZWwtbGdtLmMgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdt
LWlxczYyMGEuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1qejQ3NDAuYyAg
ICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20ta2VlbWJheS5jICAgICAgICAgICAg
IHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWxwMzk0My5jICAgICAgICAgICAgICB8ICAxIC0KIGRy
aXZlcnMvcHdtL3B3bS1scGMxOHh4LXNjdC5jICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9w
d20tbHBjMzJ4eC5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWxwc3MuYyAg
ICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1tZWRpYXRlay5jICAgICAgICAg
ICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyAgICAgICAgICAgICAgIHwgIDEgLQog
ZHJpdmVycy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdt
L3B3bS1tdGstZGlzcC5jICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tbXhzLmMg
ICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLW50eGVjLmMgICAgICAgICAg
ICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1vbWFwLWRtdGltZXIuYyAgICAgICAgfCAgMSAt
CiBkcml2ZXJzL3B3bS9wd20tcGNhOTY4NS5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9w
d20vcHdtLXB4YS5jICAgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1yYXNw
YmVycnlwaS1wb2UuYyAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tcmNhci5jICAgICAgICAg
ICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXJlbmVzYXMtdHB1LmMgICAgICAgICB8ICAx
IC0KIGRyaXZlcnMvcHdtL3B3bS1yb2NrY2hpcC5jICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJz
L3B3bS9wd20tcnotbXR1My5jICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXNh
bXN1bmcuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyAgICAg
ICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc2wyOGNwbGQuYyAgICAgICAgICAgIHwg
IDEgLQogZHJpdmVycy9wd20vcHdtLXNwZWFyLmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZl
cnMvcHdtL3B3bS1zcHJkLmMgICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20t
c3RpLmMgICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMg
ICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jICAgICAgICAgICAgICAg
fCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc3RtcGUuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJp
dmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3
bS1zdW5wbHVzLmMgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tdGVncmEuYyAg
ICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAgICAgICAgICAg
ICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS10aWVocnB3bS5jICAgICAgICAgICAgfCAgMSAtCiBk
cml2ZXJzL3B3bS9wd20tdHdsLWxlZC5jICAgICAgICAgICAgIHwgIDIgLS0KIGRyaXZlcnMvcHdt
L3B3bS10d2wuYyAgICAgICAgICAgICAgICAgfCAgMiAtLQogZHJpdmVycy9wd20vcHdtLXZpc2Nv
bnRpLmMgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS12dDg1MDAuYyAgICAgICAg
ICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20teGlsaW54LmMgICAgICAgICAgICAgIHwgIDEg
LQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgICAgICAgICB8ICAxIC0KIGluY2x1ZGUv
bGludXgvcHdtLmggICAgICAgICAgICAgICAgICAgfCAgOCArKysrKy0tLQogNzAgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgODMgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDNj
Y2IxNzlhYTQwZDkzMWViMDBlZjg5MTBkN2I4MTJhOTU2NTk1NjMKLS0gCjIuMzkuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
