Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44C5FAEBC
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 10:52:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A59CC640F2;
	Tue, 11 Oct 2022 08:52:26 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E3D3C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 08:52:24 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id bb5so2505812qtb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 01:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RG7je/SPkrUeGbyJflxBun3+ZBOYqWehWXWhY9Ywba0=;
 b=W4SuQOa13V6aV5FA57kP9IMidTSFygfBeRHRhjJcU2keHUNEIH3VXLvxvamc1S9dN2
 UP92VxWDu8CaIHtvWdQUAo3MfMcl6ndT750uWkNuuc9E0740yKbsbrrvLLPpiHqI8+tU
 Am27Flu6sNiYlS6h2CCexDpT3xMG0uD4O31Hwy/Qk+0e0Vu8+Ccp0DPOYGuombrvmZ4b
 pGuceFHJ0qmQ6Bly8dEY6csTbdwxeykZ8VmN1PHrXOgIHnX/ewZe58rqiiSOH0laYojG
 cBRG+DeP+i4l+vd/Ui410Gxo6xz7aRLxcOPrmvBXuy3J2DkZV+FMpiFpHAiCHGdgE9Si
 DrAg==
X-Gm-Message-State: ACrzQf2JbjlzhEW2lijyxeKiw9sprvWbFs0sUc4UI2I4z1ppPWLcevBT
 dFP3XMxTD7ajfAeApFqa1TFEIQ6Qi1Wuzpe6
X-Google-Smtp-Source: AMsMyM57J+eYJMfHIQ26fY2MEgXCilDfPX1FPhH5A1KEjuZASpsYKILpuZ4S2CQQWxW3KPlctzF9sA==
X-Received: by 2002:ac8:5fc7:0:b0:39a:a3c7:4341 with SMTP id
 k7-20020ac85fc7000000b0039aa3c74341mr5956029qta.567.1665478343363; 
 Tue, 11 Oct 2022 01:52:23 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 d21-20020ac84e35000000b003431446588fsm5233274qtw.5.2022.10.11.01.52.22
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 01:52:22 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-3560e81aa1dso121263277b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 01:52:22 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr20151543ywe.283.1665478004869; Tue, 11
 Oct 2022 01:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com>
 <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
In-Reply-To: <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Oct 2022 10:46:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
Message-ID: <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
To: Basavaraj Natikar <bnatikar@amd.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org,
 Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Nancy Yuen <yuenn@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [Linux-stm32] [PATCH v2 36/36] pinctrl: Clean up headers
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

T24gVHVlLCBPY3QgMTEsIDIwMjIgYXQgOTozMSBBTSBCYXNhdmFyYWogTmF0aWthciA8Ym5hdGlr
YXJAYW1kLmNvbT4gd3JvdGU6Cj4gT24gMTAvMTEvMjAyMiAxOjQ0IEFNLCBBbmR5IFNoZXZjaGVu
a28gd3JvdGU6Cj4gPiBUaGVyZSBpcyBhIGZldyB0aGluZ3MgZG9uZToKPiA+IC0gaW5jbHVkZSBv
bmx5IHRoZSBoZWFkZXJzIHdlIGFyZSBkaXJlY3QgdXNlciBvZgo+ID4gLSB3aGVuIHBvaW50ZXIg
aXMgaW4gdXNlLCBwcm92aWRlIGEgZm9yd2FyZCBkZWNsYXJhdGlvbgo+ID4gLSBhZGQgbWlzc2Vk
IGhlYWRlcnMKPiA+IC0gZ3JvdXAgZ2VuZXJpYyBoZWFkZXJzIGFuZCBzdWJzeXN0ZW0gaGVhZGVy
cwo+ID4gLSBzb3J0IGVhY2ggZ3JvdXAgYWxwaGFiZXRpY2FsbHkKPiA+Cj4gPiBXaGlsZSBhdCBp
dCwgZml4IHNvbWUgYXdrd2FyZCBpbmRlbnRhdGlvbnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvY29yZS5jICAgICAgICAgICAgICAgICAgfCAxOSArKysr
KysrKy0tLS0tLS0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvY29yZS5oICAgICAgICAgICAgICAgICAg
fCAxMiArKysrKysrKystCj4gPiAgZHJpdmVycy9waW5jdHJsL2RldmljZXRyZWUuaCAgICAgICAg
ICAgIHwgIDYgKysrKysKPiA+ICBkcml2ZXJzL3BpbmN0cmwvcGluY29uZi5oICAgICAgICAgICAg
ICAgfCAxMCArKysrKysrKwo+ID4gIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXV0aWxzLmggICAg
ICAgICB8ICA1ICsrKysKPiA+ICBkcml2ZXJzL3BpbmN0cmwvcGlubXV4LmMgICAgICAgICAgICAg
ICAgfCAxNyArKysrKysrKy0tLS0tLQo+ID4gIGRyaXZlcnMvcGluY3RybC9waW5tdXguaCAgICAg
ICAgICAgICAgICB8IDExICsrKysrKysrKwo+ID4gIGluY2x1ZGUvbGludXgvcGluY3RybC9jb25z
dW1lci5oICAgICAgICB8IDMxICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiA+ICBpbmNsdWRl
L2xpbnV4L3BpbmN0cmwvZGV2aW5mby5oICAgICAgICAgfCAgNiArKystLQo+ID4gIGluY2x1ZGUv
bGludXgvcGluY3RybC9tYWNoaW5lLmggICAgICAgICB8ICA4ICsrKystLS0KPiA+ICBpbmNsdWRl
L2xpbnV4L3BpbmN0cmwvcGluY29uZi1nZW5lcmljLmggfCAyMyArKysrKysrKysrLS0tLS0tLS0K
PiA+ICBpbmNsdWRlL2xpbnV4L3BpbmN0cmwvcGluY3RybC5oICAgICAgICAgfCAxOCArKysrKysr
LS0tLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvcGluY3RybC9waW5tdXguaCAgICAgICAgICB8ICA1
ICsrLS0KPiA+ICAxMyBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9jb3JlLmMgYi9kcml2
ZXJzL3BpbmN0cmwvY29yZS5jCj4gPiBpbmRleCA5ZTU3ZjRjNjJlNjAuLjY1NWY5NTAyZTczZiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
cGluY3RybC9jb3JlLmMKPiA+IEBAIC0xMiwxOSArMTIsMjEgQEAKPiA+ICAgKi8KPiA+ICAjZGVm
aW5lIHByX2ZtdChmbXQpICJwaW5jdHJsIGNvcmU6ICIgZm10Cj4gPgo+ID4gLSNpbmNsdWRlIDxs
aW51eC9rZXJuZWwuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgva3JlZi5oPgo+ID4gLSNpbmNsdWRl
IDxsaW51eC9leHBvcnQuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ID4gKyNpbmNs
dWRlIDxsaW51eC9kZWJ1Z2ZzLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ID4g
LSNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ID4g
KyNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgva3JlZi5o
Pgo+ID4gICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+Cj4gPiAtI2luY2x1ZGUgPGxpbnV4L2RlYnVn
ZnMuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgo+ID4gKwo+ID4gICNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+
Cj4gPiAtI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY3RybC5oPgo+ID4gKyNpbmNsdWRlIDxs
aW51eC9waW5jdHJsL2RldmluZm8uaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGluY3RybC9tYWNo
aW5lLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY3RybC5oPgo+ID4KPiA+ICAj
aWZkZWYgQ09ORklHX0dQSU9MSUIKPiA+ICAjaW5jbHVkZSAiLi4vZ3Bpby9ncGlvbGliLmgiCj4g
PiBAQCAtMzMsOSArMzUsOCBAQAo+ID4KPiA+ICAjaW5jbHVkZSAiY29yZS5oIgo+ID4gICNpbmNs
dWRlICJkZXZpY2V0cmVlLmgiCj4gPiAtI2luY2x1ZGUgInBpbm11eC5oIgo+ID4gICNpbmNsdWRl
ICJwaW5jb25mLmgiCj4gPiAtCj4gPiArI2luY2x1ZGUgInBpbm11eC5oIgo+ID4KPiA+ICBzdGF0
aWMgYm9vbCBwaW5jdHJsX2R1bW15X3N0YXRlOwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BpbmN0cmwvY29yZS5oIGIvZHJpdmVycy9waW5jdHJsL2NvcmUuaAo+ID4gaW5kZXggODQwMTAz
YzQwYzE0Li40ZDBiZGI5ZmI5OWIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvY29y
ZS5oCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvY29yZS5oCj4gPiBAQCAtOSwxMiArOSwyMiBA
QAo+ID4gICAqLwo+ID4KPiA+ICAjaW5jbHVkZSA8bGludXgva3JlZi5oPgo+ID4gKyNpbmNsdWRl
IDxsaW51eC9saXN0Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+Cj4gPiAgI2luY2x1
ZGUgPGxpbnV4L3JhZGl4LXRyZWUuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgvcGluY3RybC9waW5j
b25mLmg+Cj4KPiBSZW1vdmluZyBwaW5jb25mLmggZnJvbSB0aGUgY29yZS5oIG1heSBjYXVzZSBi
dWlsZCBmYWlsdXJlIGluIG90aGVyIGZpbGVzCj4gYmVjYXVzZSB3aGVyZS1ldmVyIGNvcmUuaCBp
cyBpbmNsdWRlZCB0byB1c2Ug4oCcc3RydWN0IHBpbmNvbmZfb3Bz4oCdLCB0aGVyZQo+IGlzIGEg
bmVlZCB0byBpbmNsdWRlIHBpbmNvbmYuaC4KCkkgY2FuIGNvbmZpcm0gYWRkaW5nCgogICAgI2lu
Y2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY29uZi5oPgoKdG8gZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGluY3RybC1yem4xLmMgYW5kIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXNpbmdsZS5jCmZp
eGVzIHRoZSBpc3N1ZXMgSSB3YXMgc2VlaW5nIHdpdGggc2htb2JpbGVfZGVmY29uZmlnIGFuZCAo
b3V0LW9mLXRyZWUpCnJlbmVzYXNfZGVmY29uZmlnLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
