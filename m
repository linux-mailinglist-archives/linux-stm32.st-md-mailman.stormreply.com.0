Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BFF6D63A0
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 15:44:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A18CBC6A606;
	Tue,  4 Apr 2023 13:44:39 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FA40C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 13:44:37 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id i6so38737642ybu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680615877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
 b=YoKEFBnF4R/KLVFNoyxiZPhJmsqA79Ywp7c5w9VoTLbxOHPkU2UC3C6r9llU7auOt2
 itjfCCAlEVj9pzFONUJdlZR26DS+6eTnTItG8/BdsRaJG+jnGN8Mar9S9nT8YJ6YbIvt
 PczIEgFKHpzSiJdwEFeV5bQ6D7RX1kxyHOzWUeUHZxaA2y7tu1cxjyIo01gmk0ySlvUZ
 2ItBXfsRfASPgjZS7NTX/6Gf1VUStSpHFkFEFZGlN6IDFrz+MYZjApX3UW6qF8oUnIFx
 zKX/hy1RXkULjEErSDvMl/vL0BBq9FAoK0R7e10J9U08+BUnKq4oXitONkTYlPsXrglz
 sC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
 b=k/c2WZDOLkhJ0zXEToAaVVL2Zf0oGPpDxj7sGTEA24fAH8xdyE4cNG4B+ecqX2D7dx
 0Y2eaBNg15Mo0CVEvyE+C8MtiAmv9VKLwghfak5Jbhl1A3E3/oanNyjmije09ZfkirPe
 yUp1w/g1Z4R5jOmrivOE66Uz7CLysaxx+ygWg0Q3GtNeYCFVQ0dVW7A2Fp+ihdqVm0+d
 MPVSgpb9dqoNgggMjzWmeUbuQj/fj1WeDn78ONhF8DdtS2qXkgh5TbUqLSpMbV0bbma+
 my1lndd6UJV/yzgxXOApUbwMPZgBeE/YJ0bFUJMfxtpmwtkqC36GnmLm8gxE0wGxEM99
 0txg==
X-Gm-Message-State: AAQBX9dWrpbM7LFvxDnhI3iXvHDnlS4bmzaffR3kfsIDkSQOyav6RCYW
 U2R4W54YBERCcvpB4Lrie5qBg4PX2t/oPK2bZq1tlQ==
X-Google-Smtp-Source: AKy350ZS+8XVi9C6uhFr1kyc6XrkkRM+FluRwKkVz9PMLEz3Sm01NQlNpsxUuoJH/tcqHDQrLl5d34Nf5Z8uV0fle0E=
X-Received: by 2002:a25:df10:0:b0:b75:8ac3:d5d2 with SMTP id
 w16-20020a25df10000000b00b758ac3d5d2mr1901844ybg.4.1680615876928; Tue, 04 Apr
 2023 06:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Apr 2023 15:44:25 +0200
Message-ID: <CACRpkdYcHaUBG1qFVb=mi40SyEp=VyYzPmxNn-Zrmpqs1QH+kQ@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3 34/65] clk: ux500: prcmu: Add a
	determine_rate hook
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

T24gVHVlLCBBcHIgNCwgMjAyMyBhdCAyOjQ14oCvUE0gTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNl
cm5vLnRlY2g+IHdyb3RlOgoKPiBUaGUgVVg1MDAgUFJDTVUgImNsa291dCIgY2xvY2sgaW1wbGVt
ZW50cyBhIG11eCB3aXRoIGEgc2V0X3BhcmVudCBob29rLAo+IGJ1dCBkb2Vzbid0IHByb3ZpZGUg
YSBkZXRlcm1pbmVfcmF0ZSBpbXBsZW1lbnRhdGlvbi4KPgo+IFRoaXMgaXMgYSBiaXQgb2RkLCBz
aW5jZSBzZXRfcGFyZW50KCkgaXMgdGhlcmUgdG8sIGFzIGl0cyBuYW1lIGltcGxpZXMsCj4gY2hh
bmdlIHRoZSBwYXJlbnQgb2YgYSBjbG9jay4gSG93ZXZlciwgdGhlIG1vc3QgbGlrZWx5IGNhbmRp
ZGF0ZSB0bwo+IHRyaWdnZXIgdGhhdCBwYXJlbnQgY2hhbmdlIGlzIGEgY2FsbCB0byBjbGtfc2V0
X3JhdGUoKSwgd2l0aAo+IGRldGVybWluZV9yYXRlKCkgZmlndXJpbmcgb3V0IHdoaWNoIHBhcmVu
dCBpcyB0aGUgYmVzdCBzdWl0ZWQgZm9yIGEKPiBnaXZlbiByYXRlLgoKTm90IGV2ZW4gdGhhdC4K
ClRoZSBwYXJlbnQgaXMgc2VsZWN0ZWQgZnJvbSB0aGUgc2Vjb25kIGNlbGwgb2YgdGhlIGRldmlj
ZSB0cmVlCnNwZWNpZmllciwgYW5kIHRoZSBkaXZpc29yIGZyb20gdGhlIHRoaXJkIGNlbGwuIFNl
ZToKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0ZXJpY3Nzb24sdTg1
MDAtY2xrcy55YW1sCgpTbyB0aGlzIGRlZmluaXRlbHkgZG9lcyBub3QgcmVwYXJlbnQuCgpZb3Vy
cywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
