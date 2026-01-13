Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508AD17E63
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 11:13:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C437CC8F283;
	Tue, 13 Jan 2026 10:13:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD3B2C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 10:13:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D2EFE60122
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 10:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD8DC2BCB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768299215;
 bh=RpOnPNW4xfI0Kz9zhPqicYu/rLC2pTmpoM33Trm+SMg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z29ospbjUQlyrL6uOQA3DzNZmUzIT8K3W46WQr1IeGzjseRsc2jmAtG2m548XWoU8
 LqJwtzqX49nWBDvAc0nmL+1tt4Nhkr/kRsQbLMc5ZY7KRByvFVv4rssz0xP8MP+lSS
 0kD69OdoaS38pvPRIDc3w5aP00L8RL0oFVjpOwI7KfSQrxOK5Te9QUa6CKiImmfmG4
 trKTazffjdOgXuz2Qci/JC9PYc1u2D3Ct8pcwAogFv8iyUJt5o8O6yTsnFyyRP+W+m
 pmen+3WbUsVttm+P0OcTboc9eWQyWw/QNt9HG1STdOz+o90mxokhfSpmXr7MYBYIEd
 rfOL9BJgqfcOQ==
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-78c66bdf675so73141417b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 02:13:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVzJdWGzvFyyLGKMygZn/HWBnA4NG89wmgOAyGDg2FmKhj7TpoMurtMcGwkKYUuw/Ab8yi5d9HF/+dmig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyKBy+MXTHM1tW9GaGGcHxI1K8R3imHZfudQt7bYBbNbBP1HKrf
 paYTZTZCRVFLsolwFPvaLeRUQ9XD5r0YLXIL21QoSHO9RTgKcc8dMiDHG+8KG7IjU18Q3xXWjZr
 TlcfRAm5yinxp/SRA6e+My8hytDRUqtA=
X-Google-Smtp-Source: AGHT+IEjXK4zNU3B8MFfoIndGOeB/FKQBt1cyG91VMuMhesDC6zUrt9ZhhHY6gJ4lWXzCFjcVvXXmBBHZkq1dqdQ1TU=
X-Received: by 2002:a05:690e:1442:b0:644:51a4:4f1a with SMTP id
 956f58d0204a3-64716c67be2mr17455597d50.46.1768299214202; Tue, 13 Jan 2026
 02:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Jan 2026 11:13:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLkBKcK9eKOCfry2H1DzG=5Z93w2U-SRwHf2dkRBhyxQRw@mail.gmail.com>
X-Gm-Features: AZwV_Qgxd8O6AeWZ_24rr74gIMc3R8RlMUxlB-x9t8krXDZ9OpAu7ZlluLqPS50
Message-ID: <CAD++jLkBKcK9eKOCfry2H1DzG=5Z93w2U-SRwHf2dkRBhyxQRw@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kursad Oney <kursad.oney@broadcom.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Longbin Li <looong.bin@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Huacai Chen <chenhuacai@kernel.org>, Carlos Song <carlos.song@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <dlechner@baylibre.com>, linux-sunxi@lists.linux.dev,
 Hang Zhou <929513338@qq.com>, Anand Gore <anand.gore@broadcom.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
 Sven Peter <sven@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Haixu Cui <quic_haixcui@quicinc.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Luis de Arquer <luis.dearquer@inertim.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Vladimir Oltean <olteanv@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lixu Zhang <lixu.zhang@intel.com>, linux-aspeed@lists.ozlabs.org,
 David Rhodes <david.rhodes@cirrus.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Vishwaroop A <va@nvidia.com>, Samuel Holland <samuel.holland@sifive.com>,
 Andi Shyti <andi.shyti@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Shiji Yang <yangshiji66@outlook.com>,
 linux-rockchip@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Ray Liu <ray.liu@airoha.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org,
 Chen-Yu Tsai <wens@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 CL Wang <cl634@andestech.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rosen Penev <rosenp@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Jun Guo <jun.guo@cixtech.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Jonathan Marek <jonathan@marek.ca>, Darshan R <rathod.darshan.0896@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Ray Jui <rjui@broadcom.com>,
 James Clark <james.clark@linaro.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Sergio Perez Gonzalez <sperezglz@gmail.com>,
 Darshan Rathod <darshanrathod475@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Li-hao Kuo <lhjeff911@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@gmail.com>, Aaron Kling <webgeek1234@gmail.com>,
 asahi@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Patrick Venture <venture@google.com>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Gabor Juhos <j4g8y7@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Sunny Luo <sunny.luo@amlogic.com>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 virtualization@lists.linux.dev,
 Alessandro Grassi <alessandro.grassi@mailbox.org>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Han Xu <han.xu@nxp.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yang Shen <shenyang39@huawei.com>, patches@opensource.cirrus.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 Haotian Zhang <vulab@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 openbmc@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] spi: Make SPI core to take care of
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgOTozNeKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gSXQgc2VlbXMgYWxsIG9mIHRo
ZSBTUEkgZHJpdmVycyB3YW50IHRvIHByb3BhZ2F0ZSBmd25vZGUgKG9yIG9mX25vZGUpCj4gb2Yg
dGhlIHBoeXNpY2FsIGRldmljZSB0byB0aGUgU1BJIGRldmljZS4gTWFrZSBzdXJlIHdlIGRvbid0
IGR1cGxpY2F0ZQo+IGl0IG92ZXIgYW5kIG92ZXIgaW4gZWFjaCBuZXcgZHJpdmVyICgrMiBpbiB0
aGlzIGN5Y2xlKSBieSBtYWtpbmcgY29yZQo+IHRvIHRha2UgY2FyZSBvZiB0aGF0LiBOb3RlLCBz
aW1pbGFyIGlzIGRvbmUgYWxyZWFkeSBieSBJSU8gYW5kCj4gScKyQyBzdWJzeXN0ZW1zLgo+Cj4g
VGhlcmUgaXMgb25lIG5vdGljZWFibGUgYW5kIHF1aXRlIHNwZWNpZmljIGNhc2UgdGhhdCBpcyB0
YWtlbiBjYXJlIGluCj4gdGhlIGZpcnN0IHBhdGNoIGFuZCBub3cgd2UgaGF2ZSBhIGNvbmZpcm1h
dGlvbiBmcm9tIENpcnJ1cyB0aGF0IGV2ZXJ5dGhpbmcKPiBpcyBva2F5LiAgVGhlIHJlc3QgaXMg
anVzdCBhIG1lY2hhbmljYWwgY29udmVyc2lvbiBhZnRlciBjaGVja2luZyB0aGF0Cj4gdGhlIHBh
cmVudCBkZXZpY2UgaXMgYXNzaWduZWQgdG8gdGhlIHNhbWUgdGhhdCBwcm92aWRlcyB0aGUgcmVz
cGVjdGl2ZQo+IGZ3bm9kZS4KClRoaXMgaXMgY2xlYXJseSBtYWtpbmcgdGhlIGtlcm5lbCBhIGJl
dHRlciBwbGFjZS4KClRoZSBzZXJpZXM6ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
c3dAa2VybmVsLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
