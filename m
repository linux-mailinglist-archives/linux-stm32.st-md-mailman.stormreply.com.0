Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1045D600ECA
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 14:16:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A00CFC640F5;
	Mon, 17 Oct 2022 12:16:29 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC68BC63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 12:16:28 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id w3so7504367qtv.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 05:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
 b=G4XBw7OtjlEVYhvq3ujakfFtUjrlMIkd5uVVPI4L3fSHgn9r2dYLTBKR1DSk55qy8/
 vjDDH2t4lQErUrsZ81N0WmnCPAq1TAG4psbIGjoQRhntN5Cmq1aF/T5qp0/euyInLZPZ
 /K8bnHyxQYrmvZCrh75klmy5Bz15Y/XvsM73Xs3LGuMo2izmCHPf5UYpUMbW37BEsOEV
 sVucDgXlyB1YZt4pqPGa9U7E85eMuIK9JN+tGTbAMfTNB3gqhaNnxWOxBOHdWu8HWlhw
 4OAFcfWlF4Cka/k2IMLMYdJ1w8Emhfeq9FKglqB57GbZ26ff4iD6Qp74edFo/4+10u7I
 pv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
 b=BdhI7VctkcLRP2iTNN6ea3TzWPCkULssVvhVwbpcZm26xTcx80q8cMyjE/f0kx+UHA
 ZUylhM9halDXeOjvTL7Bzpoh6mpYK7QkrfavxcMGik99BtkFqVWDbW4VAi4wWEOW/IH0
 XdmB/VlPlVteQXd13swHrSZiKCkrG4eECoZ4ZpIiG5clMQmUjoNdz9fHtPtEemmBfQ2y
 F3+S+DWwcTiZAVedSS7itq7534IW1VfHb2YjNqSTakDbG8Nh4+nPbqRXstoSFYquUEk+
 nwFbmEkqnqvEU7jkWCgygDy6iab84LqeqW7D+ozvPuxSSDCpoeuO8kfFx5MIJzNpM9uu
 X8jg==
X-Gm-Message-State: ACrzQf2HOUh5psupLqv1QXZ2dxPtMf3XvCFaiiaTXGsmSqI4xqtBuP8s
 cooJ7vWyFHz8DP0FABfVC0gd2PjJJ4Q2aGTG22c=
X-Google-Smtp-Source: AMsMyM5ONAbRwJ0mRV8lFkFN/+yOIGgrHcLBILWbhUW8XaqfnSolfxdkiScuiVdMZUaqcXP+J2a9nYR4SqM8sa8eRyQ=
X-Received: by 2002:a05:622a:1045:b0:39c:e2e1:dc59 with SMTP id
 f5-20020a05622a104500b0039ce2e1dc59mr7379719qte.195.1666008987610; Mon, 17
 Oct 2022 05:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com>
 <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
In-Reply-To: <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Oct 2022 15:15:51 +0300
Message-ID: <CAHp75VftkwPB-+jhCrhCdPRN0hLm5DLADMyAO45eBTRFfxiNuQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
 Claudiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org,
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
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/36] gpiolib: tegra186: Add missed
	header(s)
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

T24gTW9uLCBPY3QgMTcsIDIwMjIgYXQgMTI6MzUgUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cj4gT24gTW9uLCBPY3QgMTcsIDIwMjIgYXQgMTA6NTIgQU0gTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPj7Ct09uIE1vbiwg
T2N0IDEwLCAyMDIyIGF0IDEwOjE1IFBNIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5zaGV2
Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBEbyBub3QgaW1wbHkgdGhh
dCBzb21lIG9mIHRoZSBnZW5lcmljIGhlYWRlcnMgbWF5IGJlIGFsd2F5cyBpbmNsdWRlZC4KPiA+
ID4gSW5zdGVhZCwgaW5jbHVkZSBleHBsaWNpdGx5IHdoYXQgd2UgYXJlIGRpcmVjdCB1c2VyIG9m
Lgo+ID4gPgo+ID4gPiBXaGlsZSBhdCBpdCwgc29ydCBoZWFkZXJzIGFscGhhYmV0aWNhbGx5Lgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKPiBBbmR5OiBhcmUgeW91IGdvaW5nIHRvIHNlbmQg
aXQgdG9nZXRoZXIgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBwaW5jdHJsCj4gY2hhbmdlcyBpbiBh
IHNlcGFyYXRlIFBSPwoKWWVzLCB0aGlzIGlzIHRoZSBwbGFuLCBidXQgSSB3YW50IGZpcnN0IHRv
IHB1c2ggaXQgdG8gTGludXggTmV4dCAodmlhCm15IHRyZWUpIGZvciBhIGNvdXBsZSBvZiBkYXlz
LCBzbyB3ZSB3aWxsIGJlIHN1cmUgdGhlcmUgYXJlIG5vCmNvbXBpbGF0aW9uIGlzc3Vlcy4KCi0t
IApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
