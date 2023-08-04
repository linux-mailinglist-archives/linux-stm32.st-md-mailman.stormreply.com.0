Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D94DB770305
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Aug 2023 16:29:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88201C6B466;
	Fri,  4 Aug 2023 14:29:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F612C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 14:29:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRvm6-0004IB-Ta; Fri, 04 Aug 2023 16:27:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRvlq-0015pr-7N; Fri, 04 Aug 2023 16:27:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRvlp-00AP9T-ET; Fri, 04 Aug 2023 16:27:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Date: Fri,  4 Aug 2023 16:27:05 +0200
Message-Id: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3888;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=WJTkGffvizVTFrYhxlEwf33iXK2vZsfEyb81l68zhLY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkzQq2XhI0XPWVJKyF8jw9e0hP8cj3HpRdpwKrd
 oYg1lISRdWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZM0KtgAKCRCPgPtYfRL+
 TlmxCACDstGNt8tomXEi1DwnNXDEZlZ/KVZke1AiXVnPIS/ZhVJ94U5aOYapSgAJmHQnzwqgK6z
 fFWv33dvGgXeSNfMfc82iKjHC0i9u6CpVTKzbkS7CkjLhfefThMzfQsEY6GCcrMBu/Hi+5qaaif
 ZRymzwLw6Gc4g1La1KPC1OIUlenMjcfHXUKhPwvyeIbrhx8wfU40+IFtYHvBhQqi9/e0I3woRF5
 t77a20hH5LhbiKKLjmZ4ZMWDDvSLhjnPg8HbbOUIIqRM1op7uN5Uog1iEYusHzAGP9NsS1utfon
 xzuuuXTkvCvNrk46p97AVUuT3gZdhE7Ekvy+UO0zlQA3SpbS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Pavel Machek <pavel@ucw.cz>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, Andy Shevchenko <andy@kernel.org>,
 Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, greybus-dev@lists.linaro.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Alexander Shiyan <shc_work@mail.ru>,
 linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Weiss <luca@z3ntu.xyz>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-pwm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Benson Leung <bleung@chromium.org>, asahi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-riscv@lists.infradead.org,
 David Airlie <airlied@gmail.com>, linux-leds@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Sven Peter <sven@svenpeter.dev>, Johan Hovold <johan@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [Linux-stm32] [PATCH v2 0/2] pwm: Manage owner assignment
	implicitly for drivers
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

SGVsbG8sCgooaW1wbGljaXQpIHYxIG9mIHRoaXMgc2VyaWVzIGNhbiBiZSBmb3VuZCBhdApodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1wd20vMjAyMzA4MDMxNDA2MzMuMTM4MTY1LTEtdS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIC4KCkNoYW5nZXMgc2luY2UgdGhlbiBvbmx5IGFm
ZmVjdCBkb2N1bWVudGF0aW9uIHRoYXQgSSBtaXNzZWQgdG8gYWRhcHQgYmVmb3JlLgpUaGFua3Mg
dG8gTGF1cmVudCBmb3IgY2F0Y2hpbmcgdGhhdAoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWlu
ZS1Lw7ZuaWcgKDIpOgogIHB3bTogTWFuYWdlIG93bmVyIGFzc2lnbm1lbnQgaW1wbGljaXRseSBm
b3IgZHJpdmVycwogIHB3bTogY3JjOiBBbGxvdyBjb21waWxhdGlvbiBhcyBtb2R1bGUgYW5kIHdp
dGggQ09NUElMRV9URVNUCgogZHJpdmVycy9ncGlvL2dwaW8tbXZlYnUuYyAgICAgICAgICAgICB8
ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCAgMSAtCiBkcml2
ZXJzL2xlZHMvcmdiL2xlZHMtcWNvbS1scGcuYyAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcHdtL2NvcmUuYyAgICAg
ICAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvcHdt
L3B3bS1hYjg1MDAuYyAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tYXBwbGUu
YyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWF0bWVsLWhsY2RjLmMgICAg
ICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC10Y2IuYyAgICAgICAgICAgfCAgMSAt
CiBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9w
d20vcHdtLWJjbS1pcHJvYy5jICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1iY20t
a29uYS5jICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tYmNtMjgzNS5jICAgICAg
ICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWJlcmxpbi5jICAgICAgICAgICAgICB8ICAx
IC0KIGRyaXZlcnMvcHdtL3B3bS1icmNtc3RiLmMgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJz
L3B3bS9wd20tY2xrLmMgICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWNs
cHM3MTF4LmMgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1jcmMuYyAgICAgICAg
ICAgICAgICAgfCAgNSArKysrLQogZHJpdmVycy9wd20vcHdtLWNyb3MtZWMuYyAgICAgICAgICAg
ICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1kd2MuYyAgICAgICAgICAgICAgICAgfCAgMSAtCiBk
cml2ZXJzL3B3bS9wd20tZXA5M3h4LmMgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20v
cHdtLWZzbC1mdG0uYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1oaWJ2dC5j
ICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20taW1nLmMgICAgICAgICAgICAg
ICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWlteC10cG0uYyAgICAgICAgICAgICB8ICAxIC0K
IGRyaXZlcnMvcHdtL3B3bS1pbXgxLmMgICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3
bS9wd20taW14MjcuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWludGVs
LWxnbS5jICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1pcXM2MjBhLmMgICAgICAg
ICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tano0NzQwLmMgICAgICAgICAgICAgIHwgIDEg
LQogZHJpdmVycy9wd20vcHdtLWtlZW1iYXkuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMv
cHdtL3B3bS1scDM5NDMuYyAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tbHBj
MTh4eC1zY3QuYyAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLWxwYzMyeHguYyAgICAg
ICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1scHNzLmMgICAgICAgICAgICAgICAgfCAg
MSAtCiBkcml2ZXJzL3B3bS9wd20tbWVkaWF0ZWsuYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVy
cy9wd20vcHdtLW1lc29uLmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1t
aWNyb2NoaXAtY29yZS5jICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tbXRrLWRpc3AuYyAg
ICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLW14cy5jICAgICAgICAgICAgICAgICB8
ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1udHhlYy5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2
ZXJzL3B3bS9wd20tb21hcC1kbXRpbWVyLmMgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdt
LXBjYTk2ODUuYyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1weGEuYyAgICAg
ICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tcmFzcGJlcnJ5cGktcG9lLmMgICAg
IHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXJjYXIuYyAgICAgICAgICAgICAgICB8ICAxIC0KIGRy
aXZlcnMvcHdtL3B3bS1yZW5lc2FzLXRwdS5jICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9w
d20tcm9ja2NoaXAuYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXJ6LW10dTMu
YyAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zYW1zdW5nLmMgICAgICAgICAg
ICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgICAgICAgICAgICAgIHwgIDEgLQog
ZHJpdmVycy9wd20vcHdtLXNsMjhjcGxkLmMgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdt
L3B3bS1zcGVhci5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc3ByZC5j
ICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXN0aS5jICAgICAgICAgICAg
ICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jICAgICAgICAgICAgfCAgMSAt
CiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9w
d20vcHdtLXN0bXBlLmMgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvcHdtL3B3bS1zdW40
aS5jICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tc3VucGx1cy5jICAgICAg
ICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXRlZ3JhLmMgICAgICAgICAgICAgICB8ICAx
IC0KIGRyaXZlcnMvcHdtL3B3bS10aWVjYXAuYyAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJz
L3B3bS9wd20tdGllaHJwd20uYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9wd20vcHdtLXR3
bC1sZWQuYyAgICAgICAgICAgICB8ICAyIC0tCiBkcml2ZXJzL3B3bS9wd20tdHdsLmMgICAgICAg
ICAgICAgICAgIHwgIDIgLS0KIGRyaXZlcnMvcHdtL3B3bS12aXNjb250aS5jICAgICAgICAgICAg
fCAgMSAtCiBkcml2ZXJzL3B3bS9wd20tdnQ4NTAwLmMgICAgICAgICAgICAgIHwgIDEgLQogZHJp
dmVycy9wd20vcHdtLXhpbGlueC5jICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3B3bS5jICAgICAgICAgfCAgMSAtCiBpbmNsdWRlL2xpbnV4L3B3bS5oICAgICAg
ICAgICAgICAgICAgIHwgMTAgKysrKysrLS0tLQogNzAgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKSwgODUgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDNjY2IxNzlhYTQwZDkzMWVi
MDBlZjg5MTBkN2I4MTJhOTU2NTk1NjMKLS0gCjIuNDAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
