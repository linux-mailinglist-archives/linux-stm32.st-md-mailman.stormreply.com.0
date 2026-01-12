Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6829FD153E1
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 21:35:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06799C57A51;
	Mon, 12 Jan 2026 20:35:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7251C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 20:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768250152; x=1799786152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=REqCyoJrIpewtMdGURz7oYk9zmr7BJajQXuF1TakMwI=;
 b=TyuTtnyQvmTyxhohp0FEYfNTsNdR+oiZQfT5NJizK++/HwYR5T64GsHn
 Yf/WnZhr7YmzMCsHU0PBhtayJAjsTzVV/VzkfNxCJdUnJoW1/M2QUMYVv
 Mrk1+baoYwsp43WMx2M0C3gjxzpBnheZSXFOg9HhUK2/WYmBX0adMm998
 EXzZTSO5BSYrW/ttoG65oXtX+gWXgxHitG7QaeJ4abWubT9Xq+BkYwgtH
 m2ojX2t3smPQZ6fglOlY23uL6o3ZGJ6zuFCaj/PRQ/31SMiusZU51tB1i
 XDmHrslFv/grpDBWlAnISJPTSsTEvVWSB4XW0ShyS1kD5olrroFissLKs g==;
X-CSE-ConnectionGUID: TmkB5gNvSo+Xhgr7Barddw==
X-CSE-MsgGUID: Z8Ai17J4Sc2SX+HOvGdHXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80173660"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80173660"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:35:49 -0800
X-CSE-ConnectionGUID: qrF+XUj5Smmcrdyy5Dee6Q==
X-CSE-MsgGUID: pPBsBLFtQSOQR4pxhpa//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="208707588"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 12:35:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 6841594; Mon, 12 Jan 2026 21:35:37 +0100 (CET)
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
Date: Mon, 12 Jan 2026 21:21:22 +0100
Message-ID: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
Subject: [Linux-stm32] [PATCH v2 0/4] spi: Make SPI core to take care of
	fwnode assignment
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

SXQgc2VlbXMgYWxsIG9mIHRoZSBTUEkgZHJpdmVycyB3YW50IHRvIHByb3BhZ2F0ZSBmd25vZGUg
KG9yIG9mX25vZGUpCm9mIHRoZSBwaHlzaWNhbCBkZXZpY2UgdG8gdGhlIFNQSSBkZXZpY2UuIE1h
a2Ugc3VyZSB3ZSBkb24ndCBkdXBsaWNhdGUKaXQgb3ZlciBhbmQgb3ZlciBpbiBlYWNoIG5ldyBk
cml2ZXIgKCsyIGluIHRoaXMgY3ljbGUpIGJ5IG1ha2luZyBjb3JlCnRvIHRha2UgY2FyZSBvZiB0
aGF0LiBOb3RlLCBzaW1pbGFyIGlzIGRvbmUgYWxyZWFkeSBieSBJSU8gYW5kCknCskMgc3Vic3lz
dGVtcy4KClRoZXJlIGlzIG9uZSBub3RpY2VhYmxlIGFuZCBxdWl0ZSBzcGVjaWZpYyBjYXNlIHRo
YXQgaXMgdGFrZW4gY2FyZSBpbgp0aGUgZmlyc3QgcGF0Y2ggYW5kIG5vdyB3ZSBoYXZlIGEgY29u
ZmlybWF0aW9uIGZyb20gQ2lycnVzIHRoYXQgZXZlcnl0aGluZwppcyBva2F5LiAgVGhlIHJlc3Qg
aXMganVzdCBhIG1lY2hhbmljYWwgY29udmVyc2lvbiBhZnRlciBjaGVja2luZyB0aGF0CnRoZSBw
YXJlbnQgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIHRoZSBzYW1lIHRoYXQgcHJvdmlkZXMgdGhlIHJl
c3BlY3RpdmUKZndub2RlLgoKQ2hhbmdlbG9nIHYyOgotIGNvbGxlY3RlZCB0YWdzCi0gZml4ZWQg
Vz0xIHdhcm5pbmcgKHVudXNlZCB2YXJpYWJsZSkgaW4gc3BpLWRsbjIuYyAoTEtQKQoKdjE6IDIw
MjYwMTA4MjAzMDA0LjM1Mzg0NDktMS1hbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20K
CkFuZHkgU2hldmNoZW5rbyAoNCk6CiAgc3BpOiBQcm9wYWdhdGUgZGVmYXVsdCBmd25vZGUgdG8g
dGhlIFNQSSBjb250cm9sbGVyIGRldmljZQogIHNwaTogRHJvcCBkdXBsaWNhdGUgb2Zfbm9kZSBh
c3NpZ25tZW50CiAgc3BpOiBEcm9wIGR1cGxpY2F0ZSBmd25vZGUgYXNzaWdubWVudAogIHNwaTog
RHJvcCBkdXBsaWNhdGUgZGV2aWNlX3NldF9ub2RlKCkgY2FsbAoKIGRyaXZlcnMvc3BpL2F0bWVs
LXF1YWRzcGkuYyAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWFpcm9oYS1zbmZpLmMg
ICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYWx0ZXJhLXBsYXRmb3JtLmMgICAgfCAyIC0t
CiBkcml2ZXJzL3NwaS9zcGktYW1sb2dpYy1zcGlmYy1hMS5jICAgfCAxIC0KIGRyaXZlcnMvc3Bp
L3NwaS1hbWxvZ2ljLXNwaXNnLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWFwcGxlLmMg
ICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYXI5MzR4LmMgICAgICAgICAgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1hcm1hZGEtMzcwMC5jICAgICAgICB8IDQgKy0tLQogZHJp
dmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkt
YXRjc3BpMjAwLmMgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1hdGg3OS5jICAgICAg
ICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWF0bWVsLmMgICAgICAgICAgICAgIHwgMSAt
CiBkcml2ZXJzL3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYyAgICAgfCAxIC0KIGRyaXZlcnMvc3Bp
L3NwaS1iY20tcXNwaS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWJjbTI4MzUu
YyAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYmNtMjgzNWF1eC5jICAgICAgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1iY202M3h4LWhzc3BpLmMgICAgICB8IDEgLQogZHJpdmVy
cy9zcGkvc3BpLWJjbTYzeHguYyAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYmNt
YmNhLWhzc3BpLmMgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGku
YyAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jICAgICAgIHwgMSAtCiBk
cml2ZXJzL3NwaS9zcGktY2FkZW5jZS5jICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3Nw
aS1jYXZpdW0tb2N0ZW9uLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWNhdml1bS10aHVu
ZGVyeC5jICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktY2xwczcxMXguYyAgICAgICAgICAgfCAx
IC0KIGRyaXZlcnMvc3BpL3NwaS1jczQybDQzLmMgICAgICAgICAgICB8IDggKysrKysrKysKIGRy
aXZlcnMvc3BpL3NwaS1kYXZpbmNpLmMgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3Bp
LWRsbjIuYyAgICAgICAgICAgICAgIHwgMyAtLS0KIGRyaXZlcnMvc3BpL3NwaS1kdy1jb3JlLmMg
ICAgICAgICAgICB8IDIgLS0KIGRyaXZlcnMvc3BpL3NwaS1lcDkzeHguYyAgICAgICAgICAgICB8
IDEgLQogZHJpdmVycy9zcGkvc3BpLWZhbGNvbi5jICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJz
L3NwaS9zcGktZnNsLWRzcGkuYyAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1mc2wt
ZXNwaS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWZzbC1saWIuYyAgICAgICAg
ICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktZnNsLWxwc3BpLmMgICAgICAgICAgfCAxIC0KIGRy
aXZlcnMvc3BpL3NwaS1nZW5pLXFjb20uYyAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3Bp
LWdwaW8uYyAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktZ3hwLmMgICAgICAg
ICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1oaXNpLWt1bnBlbmcuYyAgICAgICB8IDEg
LQogZHJpdmVycy9zcGkvc3BpLWltZy1zcGZpLmMgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3Nw
aS9zcGktaW14LmMgICAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1pbmdlbmlj
LmMgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWxhbnRpcS1zc2MuYyAgICAgICAg
IHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbGpjYS5jICAgICAgICAgICAgICAgfCAxIC0KIGRyaXZl
cnMvc3BpL3NwaS1sb29uZ3Nvbi1jb3JlLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWxw
ODg0MS1ydGMuYyAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYyAg
ICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGlmYy5jICAgICAgICB8IDEgLQog
ZHJpdmVycy9zcGkvc3BpLW1pY3JvY2hpcC1jb3JlLXNwaS5jIHwgMSAtCiBkcml2ZXJzL3NwaS9z
cGktbXBjNTEyeC1wc2MuYyAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC1w
c2MuYyAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC5jICAgICAgICAgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tcGZzLmMgICAgICAgICAgICAgICB8IDEgLQogZHJpdmVy
cy9zcGkvc3BpLW10NjV4eC5jICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbXQ3
NjIxLmMgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tdGstbm9yLmMgICAgICAg
ICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW10ay1zbmZpLmMgICAgICAgICAgIHwgMSAtCiBk
cml2ZXJzL3NwaS9zcGktbXV4LmMgICAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3Nw
aS1teGljLmMgICAgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW5wY20tZml1LmMg
ICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbnBjbS1wc3BpLmMgICAgICAgICAgfCAx
IC0KIGRyaXZlcnMvc3BpL3NwaS1ueHAtZnNwaS5jICAgICAgICAgICB8IDIgLS0KIGRyaXZlcnMv
c3BpL3NwaS1ueHAteHNwaS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW9jLXRp
bnkuYyAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktb3Jpb24uYyAgICAgICAgICAg
ICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1wbDAyMi5jICAgICAgICAgICAgICB8IDEgLQogZHJp
dmVycy9zcGkvc3BpLXB4YTJ4eC5jICAgICAgICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3Bp
LXFjb20tcXNwaS5jICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5j
ICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1xdXAuYyAgICAgICAgICAgICAgICB8IDEg
LQogZHJpdmVycy9zcGkvc3BpLXJiNHh4LmMgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3Nw
aS9zcGktcmVhbHRlay1ydGwtc25hbmQuYyAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1yZWFsdGVr
LXJ0bC5jICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXJvY2tjaGlwLXNmYy5jICAgICAg
IHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktcm9ja2NoaXAuYyAgICAgICAgICAgfCAxIC0KIGRyaXZl
cnMvc3BpL3NwaS1yc3BpLmMgICAgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXJ6
djJoLXJzcGkuYyAgICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLXJ6djJtLWNzaS5jICAg
ICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLXMzYzY0eHguYyAgICAgICAgICAgIHwgMSAt
CiBkcml2ZXJzL3NwaS9zcGktc2MxOGlzNjAyLmMgICAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3Nw
aS9zcGktc2cyMDQ0LW5vci5jICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1zaC1oc3Bp
LmMgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXNoLW1zaW9mLmMgICAgICAgICAg
IHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktc2lmaXZlLmMgICAgICAgICAgICAgfCAxIC0KIGRyaXZl
cnMvc3BpL3NwaS1zbGF2ZS1tdDI3eHguYyAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXNu
LWYtb3NwaS5jICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktc3ByZC1hZGkuYyAgICAg
ICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1zcHJkLmMgICAgICAgICAgICAgICB8IDEgLQog
ZHJpdmVycy9zcGkvc3BpLXN0bTMyLW9zcGkuYyAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9z
cGktc3RtMzItcXNwaS5jICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi5jICAg
ICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXN1bjRpLmMgICAgICAgICAgICAgIHwg
MSAtCiBkcml2ZXJzL3NwaS9zcGktc3VuNmkuYyAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMv
c3BpL3NwaS1zdW5wbHVzLXNwNzAyMS5jICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXN5bnF1
YWNlci5jICAgICAgICAgIHwgMyAtLS0KIGRyaXZlcnMvc3BpL3NwaS10ZWdyYTExNC5jICAgICAg
ICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXRlZ3JhMjAtc2ZsYXNoLmMgICAgIHwgMSAtCiBk
cml2ZXJzL3NwaS9zcGktdGVncmEyMC1zbGluay5jICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3Nw
aS10ZWdyYTIxMC1xdWFkLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXRpLXFzcGkuYyAg
ICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktdW5pcGhpZXIuYyAgICAgICAgICAgfCAx
IC0KIGRyaXZlcnMvc3BpL3NwaS12aXJ0aW8uYyAgICAgICAgICAgICB8IDIgLS0KIGRyaXZlcnMv
c3BpL3NwaS13cGNtLWZpdS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXhjb21t
LmMgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkteGlsaW54LmMgICAgICAgICAg
ICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS14bHAuYyAgICAgICAgICAgICAgICB8IDEgLQogZHJp
dmVycy9zcGkvc3BpLXh0ZW5zYS14dGZwZ2EuYyAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGku
YyAgICAgICAgICAgICAgICAgICAgfCAzICsrKwogMTA4IGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDEyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjUwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
