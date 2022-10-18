Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A54602C55
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Oct 2022 15:05:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B587C64101;
	Tue, 18 Oct 2022 13:05:10 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 910DAC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 13:05:08 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id o22so8528645qkl.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 06:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B3o3vYAk1VZiDmjBJfHdrW7jPj/9+r6RZmm9abHN1X0=;
 b=DaN5yJwvwsxxDpYIFBUMD2MQX5/2QAJ10KZwVOPe4lADHnVJr3OdfVIuCWHeO/Agsh
 raJNoYbT3Phu3NKv3nDDgkIquENaDiXmyloKgzQfMpNG2UIfUfiFz7XVuBPlrkrTsZk7
 pBKVoJveGEAFd5f62cV2hOwqH2gmesDWm0qX2FN1OXD4o+wJPy4HP2EH4xbqC+iClAXr
 OW94OEI70+siWHCXhP193isVhZzjypon3l4KbbgF/A2fI5XEvTAD0FBsBPR3MpCooOYB
 g7CxMmeVw23bGCvu4zujklmTkyMRlYlWoriDusskQ5YmzBc17E+SFqX123Lk+RXhbj52
 UUXQ==
X-Gm-Message-State: ACrzQf33pASLYVY/bhXjS0Qo2epWJC7VgYH5TU+DA6ST2Y+DczBwZ8u7
 zunQnl4nZPCfQixh0AzXJco3IGxbZqlIl1Ws
X-Google-Smtp-Source: AMsMyM6TfVi0kQ5MhDktgUHUZsODL3qttBk5cOd3BU0pm8EPLG3ZvJxiJHjQQ3s1g4s5wZipQyMIyQ==
X-Received: by 2002:a05:620a:2905:b0:6ee:e598:a973 with SMTP id
 m5-20020a05620a290500b006eee598a973mr1767237qkp.338.1666098307281; 
 Tue, 18 Oct 2022 06:05:07 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 w6-20020a05620a444600b006b5c061844fsm2403683qkp.49.2022.10.18.06.05.06
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 06:05:07 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-3560e81aa1dso136383187b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 06:05:06 -0700 (PDT)
X-Received: by 2002:a25:26c1:0:b0:6c3:bdae:c6d6 with SMTP id
 m184-20020a2526c1000000b006c3bdaec6d6mr2457054ybm.36.1666098296216; Tue, 18
 Oct 2022 06:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com>
 <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
 <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
 <Y0UyOWALxSFai2w6@smile.fi.intel.com>
In-Reply-To: <Y0UyOWALxSFai2w6@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 15:04:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
Message-ID: <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 linux-omap@vger.kernel.org, Scott Branden <sbranden@broadcom.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
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
 Orson Zhai <orsonzhai@gmail.com>, Basavaraj Natikar <bnatikar@amd.com>,
 Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
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

SGkgQW5keSwKCk9uIFR1ZSwgT2N0IDExLCAyMDIyIGF0IDExOjA3IEFNIEFuZHkgU2hldmNoZW5r
bwo8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiBPbiBUdWUsIE9j
dCAxMSwgMjAyMiBhdCAxMDo0NjozMEFNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cj4gPiBPbiBUdWUsIE9jdCAxMSwgMjAyMiBhdCA5OjMxIEFNIEJhc2F2YXJhaiBOYXRpa2FyIDxi
bmF0aWthckBhbWQuY29tPiB3cm90ZToKPiA+ID4gT24gMTAvMTEvMjAyMiAxOjQ0IEFNLCBBbmR5
IFNoZXZjaGVua28gd3JvdGU6Cj4KPiA+ID4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvY29yZS5o
Cj4KPiA+ID4gPiAtI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY29uZi5oPgo+ID4gPgo+ID4g
PiBSZW1vdmluZyBwaW5jb25mLmggZnJvbSB0aGUgY29yZS5oIG1heSBjYXVzZSBidWlsZCBmYWls
dXJlIGluIG90aGVyIGZpbGVzCj4gPiA+IGJlY2F1c2Ugd2hlcmUtZXZlciBjb3JlLmggaXMgaW5j
bHVkZWQgdG8gdXNlIOKAnHN0cnVjdCBwaW5jb25mX29wc+KAnSwgdGhlcmUKPiA+ID4gaXMgYSBu
ZWVkIHRvIGluY2x1ZGUgcGluY29uZi5oLgo+ID4KPiA+IEkgY2FuIGNvbmZpcm0gYWRkaW5nCj4g
Pgo+ID4gICAgICNpbmNsdWRlIDxsaW51eC9waW5jdHJsL3BpbmNvbmYuaD4KPiA+Cj4gPiB0byBk
cml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6bjEuYyBhbmQgZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtc2luZ2xlLmMKPiA+IGZpeGVzIHRoZSBpc3N1ZXMgSSB3YXMgc2VlaW5nIHdpdGgg
c2htb2JpbGVfZGVmY29uZmlnIGFuZCAob3V0LW9mLXRyZWUpCj4gPiByZW5lc2FzX2RlZmNvbmZp
Zy4KPgo+IEkgd2lsbCBhZGQgdGhpcywgdGhhbmsgeW91IGZvciByZXBvcnRpbmcuCgpTYW1lIGZv
ciBkcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvcGluY3RybC1zdGFyZml2ZS1qaDcxMDAuYy4KCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
