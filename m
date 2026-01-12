Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA3D15400
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 21:36:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FD34C5F1D4;
	Mon, 12 Jan 2026 20:36:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41CC1C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 20:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768250164; x=1799786164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qUj8niNVfX9+vDdYMcQmMtutkkFc8vAbK8eRfRuvapk=;
 b=fEuCxzcaRNaeA+aOe+lo+bQKLIx07zULbDZ+4IbvDXmQ8OGf/G9ZpGH9
 EX/JHJXo32H52XG43jYH1ceLBCVrjwYYIGS8XBueBHL9HXDxtPaZbUh+c
 TEZapHCr8JADFgT6rZ+37r5ZgwzE7VeQfOmYwBNG4aXIjVLUEUSLYTbXB
 QgCpjlT5oM666lZ6mZtQzNkAZRvxqtIifmoVgUMCdaFuyjl3h5xfFkE4y
 BfLycIbNbbg2rMN+Ix/kP7qlpF7eHE4n/HiKaXFOi9XKW1hsshpEDhpU4
 1CJCXCxcyiOyD7mimsWlhFmqMwe6f9aaDExf/tOvdes9sGJTkxx0sMzMm A==;
X-CSE-ConnectionGUID: ujlH6V+ASXqvu9wJ383+VA==
X-CSE-MsgGUID: F70jzYWORo6yVSV/nnikHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69515952"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="69515952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:36:02 -0800
X-CSE-ConnectionGUID: KbqM50wVTBi9mkZFufPllA==
X-CSE-MsgGUID: EmIaMJEFQ0yXjAOlv7xnIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="209262148"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP; 12 Jan 2026 12:35:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 8AD1A9D; Mon, 12 Jan 2026 21:35:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haotian Zhang <vulab@iscas.ac.cn>, Sunny Luo <sunny.luo@amlogic.com>,
 Janne Grunau <j@jannau.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chen-Yu Tsai <wens@kernel.org>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 CL Wang <cl634@andestech.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Heiko Stuebner <heiko@sntech.de>,
 William Zhang <william.zhang@broadcom.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 David Lechner <dlechner@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>,
 Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
 Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
 Sergio Perez Gonzalez <sperezglz@gmail.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>,
 Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Rosen Penev <rosenp@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Luis de Arquer <luis.dearquer@inertim.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 Alessandro Grassi <alessandro.grassi@mailbox.org>,
 Darshan R <rathod.darshan.0896@gmail.com>,
 Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>,
 Haixu Cui <quic_haixcui@quicinc.com>,
 Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Date: Mon, 12 Jan 2026 21:21:26 +0100
Message-ID: <20260112203534.4186261-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
References: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Kursad Oney <kursad.oney@broadcom.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lixu Zhang <lixu.zhang@intel.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Frank Li <Frank.Li@nxp.com>, David Rhodes <david.rhodes@cirrus.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Li-hao Kuo <lhjeff911@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ryan Wanner <ryan.wanner@microchip.com>, Anand Gore <anand.gore@broadcom.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Han Xu <han.xu@nxp.com>, Sven Peter <sven@kernel.org>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Yang Shen <shenyang39@huawei.com>,
 Neal Gompa <neal@gompa.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Samuel Holland <samuel.holland@sifive.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Ray Liu <ray.liu@airoha.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Subject: [Linux-stm32] [PATCH v2 4/4] spi: Drop duplicate device_set_node()
	call
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

VGhlIFNQSSBjb3JlIHByb3ZpZGVzIHRoZSBkZWZhdWx0IGZ3bm9kZSBmb3IgdGhlIGNvbnRyb2xs
ZXIsCmFzc2lnbmVkIGJ5IGRldmljZV9zZXRfbm9kZSgpLiBObyBuZWVkIHRvIHJlcGVhdCBpdCBp
biB0aGUgZHJpdmVyLgoKVGVzdGVkLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9v
dGxpbi5jb20+ICMgZHcgbW9iaWxleWUKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+ICMgcmVuZXNhcwpTaWduZWQtb2ZmLWJ5OiBBbmR5IFNo
ZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L3NwaS9zcGktYWlyb2hhLXNuZmkuYyAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWRsbjIu
YyAgICAgICAgICAgICAgfCAzIC0tLQogZHJpdmVycy9zcGkvc3BpLWR3LWNvcmUuYyAgICAgICAg
ICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9zcGktZXA5M3h4LmMgICAgICAgICAgICB8IDEgLQogZHJp
dmVycy9zcGkvc3BpLWdwaW8uYyAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1s
amNhLmMgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbG9vbmdzb24tY29yZS5j
ICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW1wYzUxMngtcHNjLmMgICAgICAgfCAyIC0tCiBk
cml2ZXJzL3NwaS9zcGktbXBjNTJ4eC1wc2MuYyAgICAgICB8IDIgLS0KIGRyaXZlcnMvc3BpL3Nw
aS1ueHAtZnNwaS5jICAgICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLXB4YTJ4eC5jICAg
ICAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9zcGktcmVhbHRlay1ydGwtc25hbmQuYyB8IDEg
LQogZHJpdmVycy9zcGkvc3BpLXJ6djJoLXJzcGkuYyAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3Nw
aS9zcGktcnp2Mm0tY3NpLmMgICAgICAgICB8IDIgLS0KIGRyaXZlcnMvc3BpL3NwaS1zYzE4aXM2
MDIuYyAgICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLXN1bnBsdXMtc3A3MDIxLmMgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS12aXJ0aW8uYyAgICAgICAgICAgIHwgMiAtLQogMTcgZmls
ZXMgY2hhbmdlZCwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3Bp
LWFpcm9oYS1zbmZpLmMgYi9kcml2ZXJzL3NwaS9zcGktYWlyb2hhLXNuZmkuYwppbmRleCA3MDMy
N2FlYmMyNmIuLjdiNmMwOWY5MWZlZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLWFpcm9o
YS1zbmZpLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLWFpcm9oYS1zbmZpLmMKQEAgLTExMjQsNyAr
MTEyNCw2IEBAIHN0YXRpYyBpbnQgYWlyb2hhX3NuYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJY3RybC0+Yml0c19wZXJfd29yZF9tYXNrID0gU1BJX0JQV19NQVNLKDgp
OwogCWN0cmwtPm1vZGVfYml0cyA9IFNQSV9SWF9EVUFMOwogCWN0cmwtPnNldHVwID0gYWlyb2hh
X3NuYW5kX3NldHVwOwotCWRldmljZV9zZXRfbm9kZSgmY3RybC0+ZGV2LCBkZXZfZndub2RlKGRl
dikpOwogCiAJZXJyID0gYWlyb2hhX3NuYW5kX25maV9pbml0KGFzX2N0cmwpOwogCWlmIChlcnIp
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktZGxuMi5jIGIvZHJpdmVycy9zcGkvc3BpLWRs
bjIuYwppbmRleCAyMDEzYmM1NmRlZDguLmQ5MDI4Mjk2MGFiNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zcGkvc3BpLWRsbjIuYworKysgYi9kcml2ZXJzL3NwaS9zcGktZGxuMi5jCkBAIC02ODIsMTUg
KzY4MiwxMiBAQCBzdGF0aWMgaW50IGRsbjJfc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJc3RydWN0IHNwaV9jb250cm9sbGVyICpob3N0OwogCXN0cnVjdCBkbG4yX3Nw
aSAqZGxuMjsKIAlzdHJ1Y3QgZGxuMl9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IGRldl9nZXRfcGxh
dGRhdGEoJnBkZXYtPmRldik7Ci0Jc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlp
bnQgcmV0OwogCiAJaG9zdCA9IHNwaV9hbGxvY19ob3N0KCZwZGV2LT5kZXYsIHNpemVvZigqZGxu
MikpOwogCWlmICghaG9zdCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlkZXZpY2Vfc2V0X25vZGUo
Jmhvc3QtPmRldiwgZGV2X2Z3bm9kZShkZXYpKTsKLQogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBk
ZXYsIGhvc3QpOwogCiAJZGxuMiA9IHNwaV9jb250cm9sbGVyX2dldF9kZXZkYXRhKGhvc3QpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWR3LWNvcmUuYyBiL2RyaXZlcnMvc3BpL3NwaS1k
dy1jb3JlLmMKaW5kZXggOWViZjI0NDI5NGY4Li4wZDU5YzE0MWJlYjAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvc3BpL3NwaS1kdy1jb3JlLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLWR3LWNvcmUuYwpA
QCAtOTM2LDggKzkzNiw2IEBAIGludCBkd19zcGlfYWRkX2NvbnRyb2xsZXIoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgZHdfc3BpICpkd3MpCiAJaWYgKCFjdGxyKQogCQlyZXR1cm4gLUVOT01F
TTsKIAotCWRldmljZV9zZXRfbm9kZSgmY3Rsci0+ZGV2LCBkZXZfZndub2RlKGRldikpOwotCiAJ
ZHdzLT5jdGxyID0gY3RscjsKIAlkd3MtPmRtYV9hZGRyID0gKGRtYV9hZGRyX3QpKGR3cy0+cGFk
ZHIgKyBEV19TUElfRFIpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktZXA5M3h4LmMg
Yi9kcml2ZXJzL3NwaS9zcGktZXA5M3h4LmMKaW5kZXggZTFkMDk3MDkxOTI1Li45MGQ1ZjNlYTY1
MDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1lcDkzeHguYworKysgYi9kcml2ZXJzL3Nw
aS9zcGktZXA5M3h4LmMKQEAgLTY4OSw3ICs2ODksNiBAQCBzdGF0aWMgaW50IGVwOTN4eF9zcGlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkvKiBtYWtlIHN1cmUgdGhhdCB0
aGUgaGFyZHdhcmUgaXMgZGlzYWJsZWQgKi8KIAl3cml0ZWwoMCwgZXNwaS0+bW1pbyArIFNTUENS
MSk7CiAKLQlkZXZpY2Vfc2V0X25vZGUoJmhvc3QtPmRldiwgZGV2X2Z3bm9kZSgmcGRldi0+ZGV2
KSk7CiAJZXJyb3IgPSBkZXZtX3NwaV9yZWdpc3Rlcl9jb250cm9sbGVyKCZwZGV2LT5kZXYsIGhv
c3QpOwogCWlmIChlcnJvcikgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVn
aXN0ZXIgU1BJIGhvc3RcbiIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWdwaW8uYyBi
L2RyaXZlcnMvc3BpL3NwaS1ncGlvLmMKaW5kZXggYzhkYWRiNTMyYzQwLi4wNzIxMjdhMzhmYWQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1ncGlvLmMKKysrIGIvZHJpdmVycy9zcGkvc3Bp
LWdwaW8uYwpAQCAtMzUxLDcgKzM1MSw2IEBAIHN0YXRpYyBpbnQgc3BpX2dwaW9fcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAlpZiAoZndu
b2RlKSB7Ci0JCWRldmljZV9zZXRfbm9kZSgmaG9zdC0+ZGV2LCBmd25vZGUpOwogCQlob3N0LT51
c2VfZ3Bpb19kZXNjcmlwdG9ycyA9IHRydWU7CiAJfSBlbHNlIHsKIAkJc3RhdHVzID0gc3BpX2dw
aW9fcHJvYmVfcGRhdGEocGRldiwgaG9zdCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGkt
bGpjYS5jIGIvZHJpdmVycy9zcGkvc3BpLWxqY2EuYwppbmRleCAzZjQxMmNmOGYxY2QuLjBjNmU2
MjQ4ZDhiYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLWxqY2EuYworKysgYi9kcml2ZXJz
L3NwaS9zcGktbGpjYS5jCkBAIC0yMzgsNyArMjM4LDYgQEAgc3RhdGljIGludCBsamNhX3NwaV9w
cm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4ZGV2LAogCWNvbnRyb2xsZXItPmF1dG9f
cnVudGltZV9wbSA9IGZhbHNlOwogCWNvbnRyb2xsZXItPm1heF9zcGVlZF9oeiA9IExKQ0FfU1BJ
X0JVU19NQVhfSFo7CiAKLQlkZXZpY2Vfc2V0X25vZGUoJmxqY2Ffc3BpLT5jb250cm9sbGVyLT5k
ZXYsIGRldl9md25vZGUoJmF1eGRldi0+ZGV2KSk7CiAJYXV4aWxpYXJ5X3NldF9kcnZkYXRhKGF1
eGRldiwgY29udHJvbGxlcik7CiAKIAlyZXQgPSBzcGlfcmVnaXN0ZXJfY29udHJvbGxlcihjb250
cm9sbGVyKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1sb29uZ3Nvbi1jb3JlLmMgYi9k
cml2ZXJzL3NwaS9zcGktbG9vbmdzb24tY29yZS5jCmluZGV4IGI0NmYwNzJhMDM4Ny4uZjUwNDIz
YzNkYjRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktbG9vbmdzb24tY29yZS5jCisrKyBi
L2RyaXZlcnMvc3BpL3NwaS1sb29uZ3Nvbi1jb3JlLmMKQEAgLTIxMCw3ICsyMTAsNiBAQCBpbnQg
bG9vbmdzb25fc3BpX2luaXRfY29udHJvbGxlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19p
b21lbSAqcmVncykKIAljb250cm9sbGVyLT51bnByZXBhcmVfbWVzc2FnZSA9IGxvb25nc29uX3Nw
aV91bnByZXBhcmVfbWVzc2FnZTsKIAljb250cm9sbGVyLT5zZXRfY3MgPSBsb29uZ3Nvbl9zcGlf
c2V0X2NzOwogCWNvbnRyb2xsZXItPm51bV9jaGlwc2VsZWN0ID0gNDsKLQlkZXZpY2Vfc2V0X25v
ZGUoJmNvbnRyb2xsZXItPmRldiwgZGV2X2Z3bm9kZShkZXYpKTsKIAlkZXZfc2V0X2RydmRhdGEo
ZGV2LCBjb250cm9sbGVyKTsKIAogCXNwaSA9IHNwaV9jb250cm9sbGVyX2dldF9kZXZkYXRhKGNv
bnRyb2xsZXIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW1wYzUxMngtcHNjLmMgYi9k
cml2ZXJzL3NwaS9zcGktbXBjNTEyeC1wc2MuYwppbmRleCAzYzE2MzhiYTViZWUuLmExYWViNTQw
M2E3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1wYzUxMngtcHNjLmMKKysrIGIvZHJp
dmVycy9zcGkvc3BpLW1wYzUxMngtcHNjLmMKQEAgLTQ4MCw4ICs0ODAsNiBAQCBzdGF0aWMgaW50
IG1wYzUxMnhfcHNjX3NwaV9vZl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CWhvc3QtPnVzZV9ncGlvX2Rlc2NyaXB0b3JzID0gdHJ1ZTsKIAlob3N0LT5jbGVhbnVwID0gbXBj
NTEyeF9wc2Nfc3BpX2NsZWFudXA7CiAKLQlkZXZpY2Vfc2V0X25vZGUoJmhvc3QtPmRldiwgZGV2
X2Z3bm9kZShkZXYpKTsKLQogCXRlbXBwID0gZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBf
cmVzb3VyY2UocGRldiwgMCwgTlVMTCk7CiAJaWYgKElTX0VSUih0ZW1wcCkpCiAJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUih0ZW1wcCksICJjb3VsZCBub3QgaW9yZW1hcCBJL08g
cG9ydCByYW5nZVxuIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC1wc2Mu
YyBiL2RyaXZlcnMvc3BpL3NwaS1tcGM1Mnh4LXBzYy5jCmluZGV4IDNiYmViOGQ1YmZiOC4uNzNk
MjM4MzQ2MWNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC1wc2MuYworKysg
Yi9kcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC1wc2MuYwpAQCAtMzE5LDggKzMxOSw2IEBAIHN0YXRp
YyBpbnQgbXBjNTJ4eF9wc2Nfc3BpX29mX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJaG9zdC0+dHJhbnNmZXJfb25lX21lc3NhZ2UgPSBtcGM1Mnh4X3BzY19zcGlfdHJhbnNm
ZXJfb25lX21lc3NhZ2U7CiAJaG9zdC0+Y2xlYW51cCA9IG1wYzUyeHhfcHNjX3NwaV9jbGVhbnVw
OwogCi0JZGV2aWNlX3NldF9ub2RlKCZob3N0LT5kZXYsIGRldl9md25vZGUoZGV2KSk7Ci0KIAlt
cHMtPnBzYyA9IGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAs
IE5VTEwpOwogCWlmIChJU19FUlIobXBzLT5wc2MpKQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIFBUUl9FUlIobXBzLT5wc2MpLCAiY291bGQgbm90IGlvcmVtYXAgSS9PIHBvcnQgcmFuZ2Vc
biIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW54cC1mc3BpLmMgYi9kcml2ZXJzL3Nw
aS9zcGktbnhwLWZzcGkuYwppbmRleCA1MGE3ZTQ5MTZhNjAuLjMyMGIzZDkzZGY1NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9zcGkvc3BpLW54cC1mc3BpLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLW54
cC1mc3BpLmMKQEAgLTEzODMsOCArMTM4Myw2IEBAIHN0YXRpYyBpbnQgbnhwX2ZzcGlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAllbHNlCiAJCWN0bHItPm1lbV9jYXBzID0g
Jm54cF9mc3BpX21lbV9jYXBzOwogCi0JZGV2aWNlX3NldF9ub2RlKCZjdGxyLT5kZXYsIGZ3bm9k
ZSk7Ci0KIAlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBueHBfZnNwaV9jbGVh
bnVwLCBmKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
cGkvc3BpLXB4YTJ4eC5jIGIvZHJpdmVycy9zcGkvc3BpLXB4YTJ4eC5jCmluZGV4IGVjNzExN2E5
NGQ1Zi4uNzhjMzk5ZTk1ZWYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMK
KysrIGIvZHJpdmVycy9zcGkvc3BpLXB4YTJ4eC5jCkBAIC0xMjkwLDggKzEyOTAsNiBAQCBpbnQg
cHhhMnh4X3NwaV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzc3BfZGV2aWNlICpz
c3AsCiAJZHJ2X2RhdGEtPmNvbnRyb2xsZXJfaW5mbyA9IHBsYXRmb3JtX2luZm87CiAJZHJ2X2Rh
dGEtPnNzcCA9IHNzcDsKIAotCWRldmljZV9zZXRfbm9kZSgmY29udHJvbGxlci0+ZGV2LCBkZXZf
Zndub2RlKGRldikpOwotCiAJLyogVGhlIHNwaS0+bW9kZSBiaXRzIHVuZGVyc3Rvb2QgYnkgdGhp
cyBkcml2ZXI6ICovCiAJY29udHJvbGxlci0+bW9kZV9iaXRzID0gU1BJX0NQT0wgfCBTUElfQ1BI
QSB8IFNQSV9DU19ISUdIIHwgU1BJX0xPT1A7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3Nw
aS1yZWFsdGVrLXJ0bC1zbmFuZC5jIGIvZHJpdmVycy9zcGkvc3BpLXJlYWx0ZWstcnRsLXNuYW5k
LmMKaW5kZXggNzQxY2YyYWYzZTkxLi43ZDU4NTNkMjAyYzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
c3BpL3NwaS1yZWFsdGVrLXJ0bC1zbmFuZC5jCisrKyBiL2RyaXZlcnMvc3BpL3NwaS1yZWFsdGVr
LXJ0bC1zbmFuZC5jCkBAIC00MDAsNyArNDAwLDYgQEAgc3RhdGljIGludCBydGxfc25hbmRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAljdHJsLT5tZW1fb3BzID0gJnJ0bF9z
bmFuZF9tZW1fb3BzOwogCWN0cmwtPmJpdHNfcGVyX3dvcmRfbWFzayA9IFNQSV9CUFdfTUFTSyg4
KTsKIAljdHJsLT5tb2RlX2JpdHMgPSBTUElfUlhfRFVBTCB8IFNQSV9SWF9RVUFEIHwgU1BJX1RY
X0RVQUwgfCBTUElfVFhfUVVBRDsKLQlkZXZpY2Vfc2V0X25vZGUoJmN0cmwtPmRldiwgZGV2X2Z3
bm9kZShkZXYpKTsKIAogCXJldHVybiBkZXZtX3NwaV9yZWdpc3Rlcl9jb250cm9sbGVyKGRldiwg
Y3RybCk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktcnp2MmgtcnNwaS5jIGIvZHJp
dmVycy9zcGkvc3BpLXJ6djJoLXJzcGkuYwppbmRleCBhYWU5MTY4ODI5MTUuLjIzZjBlOTJhZTIw
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLXJ6djJoLXJzcGkuYworKysgYi9kcml2ZXJz
L3NwaS9zcGktcnp2MmgtcnNwaS5jCkBAIC03OTcsOCArNzk3LDYgQEAgc3RhdGljIGludCByenYy
aF9yc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWNvbnRyb2xsZXIt
PmRtYV9yeCA9IE5VTEw7CiAJfQogCi0JZGV2aWNlX3NldF9ub2RlKCZjb250cm9sbGVyLT5kZXYs
IGRldl9md25vZGUoZGV2KSk7Ci0KIAlyZXQgPSBkZXZtX3NwaV9yZWdpc3Rlcl9jb250cm9sbGVy
KGRldiwgY29udHJvbGxlcik7CiAJaWYgKHJldCkKIAkJZGV2X2VycihkZXYsICJyZWdpc3RlciBj
b250cm9sbGVyIGZhaWxlZFxuIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktcnp2Mm0t
Y3NpLmMgYi9kcml2ZXJzL3NwaS9zcGktcnp2Mm0tY3NpLmMKaW5kZXggN2MwNDQyODgzYWMwLi41
ZDgwOTM5ZGRkYjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1yenYybS1jc2kuYworKysg
Yi9kcml2ZXJzL3NwaS9zcGktcnp2Mm0tY3NpLmMKQEAgLTYzNCw4ICs2MzQsNiBAQCBzdGF0aWMg
aW50IHJ6djJtX2NzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWNvbnRy
b2xsZXItPnVzZV9ncGlvX2Rlc2NyaXB0b3JzID0gdHJ1ZTsKIAljb250cm9sbGVyLT50YXJnZXRf
YWJvcnQgPSByenYybV9jc2lfdGFyZ2V0X2Fib3J0OwogCi0JZGV2aWNlX3NldF9ub2RlKCZjb250
cm9sbGVyLT5kZXYsIGRldl9md25vZGUoZGV2KSk7Ci0KIAlyZXQgPSBkZXZtX3JlcXVlc3RfaXJx
KGRldiwgaXJxLCByenYybV9jc2lfaXJxX2hhbmRsZXIsIDAsCiAJCQkgICAgICAgZGV2X25hbWUo
ZGV2KSwgY3NpKTsKIAlpZiAocmV0KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXNjMThp
czYwMi5jIGIvZHJpdmVycy9zcGkvc3BpLXNjMThpczYwMi5jCmluZGV4IDE2MjdhYTY2Yzk2NS4u
NzhjNTU4ZTcyMjhlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktc2MxOGlzNjAyLmMKKysr
IGIvZHJpdmVycy9zcGkvc3BpLXNjMThpczYwMi5jCkBAIC0yNTEsOCArMjUxLDYgQEAgc3RhdGlj
IGludCBzYzE4aXM2MDJfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAlpZiAoIWhv
c3QpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JZGV2aWNlX3NldF9ub2RlKCZob3N0LT5kZXYsIGRl
dl9md25vZGUoZGV2KSk7Ci0KIAlodyA9IHNwaV9jb250cm9sbGVyX2dldF9kZXZkYXRhKGhvc3Qp
OwogCiAJLyogYXNzZXJ0IHJlc2V0IGFuZCB0aGVuIHJlbGVhc2UgKi8KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3BpL3NwaS1zdW5wbHVzLXNwNzAyMS5jIGIvZHJpdmVycy9zcGkvc3BpLXN1bnBsdXMt
c3A3MDIxLmMKaW5kZXggMjU2YWUwN2RiNmJlLi43ODliMDkyZmU4YzAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvc3BpL3NwaS1zdW5wbHVzLXNwNzAyMS5jCisrKyBiL2RyaXZlcnMvc3BpL3NwaS1zdW5w
bHVzLXNwNzAyMS5jCkBAIC00MTksNyArNDE5LDYgQEAgc3RhdGljIGludCBzcDcwMjFfc3BpX2Nv
bnRyb2xsZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJY3RsciA9IGRl
dm1fc3BpX2FsbG9jX2hvc3QoZGV2LCBzaXplb2YoKnBzcGltKSk7CiAJaWYgKCFjdGxyKQogCQly
ZXR1cm4gLUVOT01FTTsKLQlkZXZpY2Vfc2V0X25vZGUoJmN0bHItPmRldiwgZGV2X2Z3bm9kZShk
ZXYpKTsKIAljdGxyLT5idXNfbnVtID0gcGRldi0+aWQ7CiAJY3Rsci0+bW9kZV9iaXRzID0gU1BJ
X0NQT0wgfCBTUElfQ1BIQSB8IFNQSV9DU19ISUdIIHwgU1BJX0xTQl9GSVJTVDsKIAljdGxyLT5h
dXRvX3J1bnRpbWVfcG0gPSB0cnVlOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXZpcnRp
by5jIGIvZHJpdmVycy9zcGkvc3BpLXZpcnRpby5jCmluZGV4IDZhYWQ5ZjFmZDAxNi4uOWU2NmM5
MTdmYjc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktdmlydGlvLmMKKysrIGIvZHJpdmVy
cy9zcGkvc3BpLXZpcnRpby5jCkBAIC0zNDQsOCArMzQ0LDYgQEAgc3RhdGljIGludCB2aXJ0aW9f
c3BpX3Byb2JlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQogCXByaXYtPnZkZXYgPSB2ZGV2
OwogCXZkZXYtPnByaXYgPSBwcml2OwogCi0JZGV2aWNlX3NldF9ub2RlKCZjdHJsLT5kZXYsIGRl
dl9md25vZGUoJnZkZXYtPmRldikpOwotCiAJZGV2X3NldF9kcnZkYXRhKCZ2ZGV2LT5kZXYsIGN0
cmwpOwogCiAJdmlydGlvX3NwaV9yZWFkX2NvbmZpZyh2ZGV2KTsKLS0gCjIuNTAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
