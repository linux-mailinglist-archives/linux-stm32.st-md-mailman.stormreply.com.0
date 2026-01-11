Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C55ADD0E176
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 06:52:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60570C8F291;
	Sun, 11 Jan 2026 05:52:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0C24C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 05:52:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 96B376016E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 05:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584C4C2BCB7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 05:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768110722;
 bh=gFOqW5EllA9fOAMNFfoSxTnUWA45XGayQuA1pDHkobg=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=EaG/5oDAR9smlSfbzttjy3FKgAcfmuUQr5RohlvPT82k8gDogNTuPeVkhnNnUzN1Q
 PUOYV9pyWf373DPlkm8bWa7AsjFvsbAbUFYXOSuK0uzvYWRb876UbNBjf7MUQ5hkon
 bUFWMcwSnyeeICSZEdVry0FTr34MGTriVAUR5JZOHnEWo7WtKX1Zar86vjFoWEP31k
 gk+I+morpNnQnEeEmDnBg7M0hgwxAV8m2Ct2Z/e+uEEtP48pakFbj9avoda79dJcxD
 ypgQlN9Ed8KhEcF7CrAD1jQYrdgMLb/QRKIT7Zjo8LxcnbiYvQXEigeCDsGKtRwxxs
 vQTRaVoQZ/NFg==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59b8364e4ccso2160823e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jan 2026 21:52:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWH3Uu1X8fsbVOkYBbYF4T8DEz3S7cuLmlr3qNYJTbTDE03vU8BEH6I33oqYTlAkGdgoefRiidBXgYETA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0QhqCXm89Q9UG9dKHwv3pUjBWTOPNy2K1ra1UsEDnSmf4Dm1I
 R/f8gXEbX1Xkn1DLlYYMuR8Cn9w2PBrdhURurjVW8lSLgb0NYFlH2mMF2doo5XksciRR7dARNje
 5QxJ+GliFQxWbNawC9sg4Uq/j6BiLpQc=
X-Google-Smtp-Source: AGHT+IHdx8MpFefSjShCgzPfxBNx4mIFIm/zyAePE38bdBhjZyOXA6x69rTwWZ2pdG4l9l0f7a6WNZMxH5DhWbEqc7E=
X-Received: by 2002:a05:6512:31cd:b0:59b:6853:f085 with SMTP id
 2adb3069b0e04-59b6ef04985mr5236958e87.16.1768110718798; Sat, 10 Jan 2026
 21:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
 <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 11 Jan 2026 13:51:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v640nT=+g6bVuROizSG5Qb-upfQefs0-j9X0BnOHf9NYMg@mail.gmail.com>
X-Gm-Features: AZwV_QjlNyXyyBCLSJ5be_kfqm-PbzUe8msaEi6oZsEaSVwRVLe_bhZOZe6iKv4
Message-ID: <CAGb2v640nT=+g6bVuROizSG5Qb-upfQefs0-j9X0BnOHf9NYMg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kursad Oney <kursad.oney@broadcom.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Longbin Li <looong.bin@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
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
 Daire McNamara <daire.mcnamara@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Luis de Arquer <luis.dearquer@inertim.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Vladimir Oltean <olteanv@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lixu Zhang <lixu.zhang@intel.com>, linux-aspeed@lists.ozlabs.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Vishwaroop A <va@nvidia.com>, Samuel Holland <samuel.holland@sifive.com>,
 Andi Shyti <andi.shyti@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Shiji Yang <yangshiji66@outlook.com>, linux-rockchip@lists.infradead.org,
 asahi@lists.linux.dev, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>,
 linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 CL Wang <cl634@andestech.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rosen Penev <rosenp@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, imx@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Jun Guo <jun.guo@cixtech.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Benjamin Fair <benjaminfair@google.com>, Jonathan Marek <jonathan@marek.ca>,
 Darshan R <rathod.darshan.0896@gmail.com>,
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
 Avi Fishman <avifishman70@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@gmail.com>, Aaron Kling <webgeek1234@gmail.com>,
 Ray Liu <ray.liu@airoha.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Patrick Venture <venture@google.com>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Gabor Juhos <j4g8y7@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
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
 Paul Walmsley <pjw@kernel.org>, openbmc@lists.ozlabs.org,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH v1 2/4] spi: Drop duplicate of_node
	assignment
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCA0OjMw4oCvQU0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gVGhlIFNQSSBjb3JlIHByb3Zp
ZGVzIHRoZSBkZWZhdWx0IG9mX25vZGUgZm9yIHRoZSBjb250cm9sbGVyLAo+IGluaGVyaXRlZCBm
cm9tIHRoZSBhY3R1YWwgKHBhcmVudCkgZGV2aWNlLiBObyBuZWVkIHRvIHJlcGVhdCBpdAo+IGlu
IHRoZSBkcml2ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KWy4uLl0KCj4gIGRyaXZlcnMvc3BpL3Nw
aS1zdW40aS5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL3NwaS9zcGktc3VuNmkuYyAg
ICAgICAgICAgICAgfCAxIC0KCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVsLm9y
Zz4gIyBzdW40aSwgc3VuNmkKClsuLi5dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
