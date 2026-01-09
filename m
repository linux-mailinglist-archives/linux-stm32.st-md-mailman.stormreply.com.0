Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82697D0C3DE
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 22:06:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D72E4C8F292;
	Fri,  9 Jan 2026 21:05:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08EB4C8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 21:05:58 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2a12ebe4b74so45373995ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jan 2026 13:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1767992757; x=1768597557;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+kn0nlzGkQ0BViOYfFFGO8lkUm/rT4hSAopw8yn9RE=;
 b=Rjog5EeASHvOCSWSLibCC6ojAuDzKQJXgd7pyBPNaETB5qOV5WMFbC4wdBk86/23lq
 sMzVDV6C4PmyDSNUCiI7Qq0b78Y4NiG5ZjhYHw8AVHkGnRo5AXekrKoB5o1/tgeo+3cr
 iQ13gUyWcrvxpYqJX/9ux7RVZ4hsKoNQ2abAx6eUPtMr3u+X3VJf2U/4CO+U7GMiJ1nw
 HhyrU3j0VLZJPHPVTruV/6Rnp52jMWA7tV+rqjFaWyR/op01dgcA0Rf6esaRG8gmyHuW
 L14EJYm85RJvGcidIooaGC971ZDY3goUU2/oqfn3OZp1OZW8YfYQIDxVEk9gbco5sGYy
 g0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767992757; x=1768597557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f+kn0nlzGkQ0BViOYfFFGO8lkUm/rT4hSAopw8yn9RE=;
 b=k2T3E7BknR5txaTqXK4wkeIOogE1lRO3+pEsfmqxnlrjOdGi4IWUFo8KqAGD8bdESZ
 QXq3i8utMjPiwelRvr+n/lA0vdZWZNNNXqAijSq82hgBEjRUVSCH1x/OsFT1Ez12MDJn
 VcRaba6sDtf6F04Og7E6hgqn8+vuE/InDLKzn+NHzOumABrSFGDHscjvYEchh/qgEX80
 fazncbo/DfKt5TNULQXWozUNWA7Wy4zGNospbOCPxA+Bfps8xz5aRTtoOF5EuFSDLDAG
 ou7uVxUgZAvqlrfz5DZi8mLONRX5SX9tpyMDC0J8MkTXMAZB95KWqePcs4Xf9uXAHRXL
 k4hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs0IFco6V/rvWfaAp+6TMm8PI4WbP36931piTIB5CK1vocirbaSpn1VhScNLQkKRDh4DxEHzBpI+vbmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzFvuE8US4ujNJxKdnXtwLkVHWA1CYL0/GxPU2OAyQsHlfbtx5J
 S2CDxldvHvQ9SneU/GoNFkXwZD3THhEqnoHdXOLKucJnOis0webE1YYzJ5TzDlPNbUXX2vXgwRv
 PcEGs5Xa7ZCYy84EPi/szO/AentJY3A0=
X-Gm-Gg: AY/fxX6gWIOuFuyRYbwVgxkHpTJMRl53//pwGgapDeyh+Dd/TAQWpJ6OgA2y9jFsAyL
 X4w2H/ywkfhpcQ16NkSmRpEzsTLpl783YPUE6fFqFS73CNvuR+nrtSnBP/25EuC+nlRfGgr9cen
 ydQLFz31/NJYePl/4lOYFuNr0Mxa0Wc2MEKW6GvtHbeZtSJ2MuHbEKnNNTaIX4mXhOro3q8qdMC
 e46m6k5UHOxusIX0b2m0cy6Fp3Q/h8kAzLWQWAaCbHh0msXo6GEDIGix83F6SATSFTmWgSr4Mlj
 aCJ4kyNdE7vYusYph9qz8SScKSlm3NOFOKLY5bg=
X-Google-Smtp-Source: AGHT+IGzEqZSKhDh+mfZnkqq/TwV9IRDJvdndDZXOgFLWIDXGIN31XCilSikaluLQUb1REl5xfFtQyCdyy3ZvPXVWkE=
X-Received: by 2002:a17:903:1acc:b0:295:592f:94a3 with SMTP id
 d9443c01a7336-2a3ee49b5camr115632895ad.48.1767992757127; Fri, 09 Jan 2026
 13:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
 <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 Jan 2026 22:05:46 +0100
X-Gm-Features: AZwV_QgnJP_ucVFfV4UzfxU71gNnGoxRPDRc5QYDA0rdtBqGfiMffeomtdZlKmw
Message-ID: <CAFBinCDzAOC9Sc_LZEbLhtajvPC4zjRiaoq6k9at2iJQnJxwjw@mail.gmail.com>
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
 linux-arm-msm@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA5OjMw4oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gVGhlIFNQSSBjb3JlIHByb3Zp
ZGVzIHRoZSBkZWZhdWx0IG9mX25vZGUgZm9yIHRoZSBjb250cm9sbGVyLAo+IGluaGVyaXRlZCBm
cm9tIHRoZSBhY3R1YWwgKHBhcmVudCkgZGV2aWNlLiBObyBuZWVkIHRvIHJlcGVhdCBpdAo+IGlu
IHRoZSBkcml2ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KWy4uLl0KPiAgZHJpdmVycy9zcGkvc3BpLWFtbG9n
aWMtc3BpZmMtYTEuYyAgIHwgMSAtCj4gIGRyaXZlcnMvc3BpL3NwaS1hbWxvZ2ljLXNwaXNnLmMg
ICAgICB8IDEgLQpbLi4uXQo+ICBkcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYyAgICAgICAg
fCAxIC0KPiAgZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWZjLmMgICAgICAgIHwgMSAtCkZvciB0
aGUgQW1sb2dpYyBhbmQgQW1sb2dpYyBNZXNvbiBkcml2ZXJzOgpSZXZpZXdlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
