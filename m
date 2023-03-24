Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3896C7FEE
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 15:34:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B54D7C6A603;
	Fri, 24 Mar 2023 14:34:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8763C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 14:34:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22DF9B8249F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 14:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D784BC4339E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679668454;
 bh=ozq+vH75mAjNkKi3jfaobvjryF3L2Ni1S1Tn6tmagvQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lwiXRb2iEXrDB+SiECZJsaGr+ZPWpvDVobXKSZxI3R/2BonDrW+T45JU8V4ybQXkf
 WpLnx1F2jVOz+eboiDJaGWwG8JzHp+W8OKnzQxEXWIq1g4E1nBUlyqrOn/RqhecPgY
 8pY7Mv53TIN43pmE6/SegvDys/Qur4lldwf0dKGTRHtzggZmldApWpq/M/G0n+eZSg
 A3me5yZQSwEwtxCSVcCpaM+cw+ptQ1Hpv1QKX5CdY4Vd2wKjMnu6uYZht5FGsBTyhF
 OBnRRMLMC5Q1Yns01rzlcZ2fPGF4vchj1Vedc2mx5/hp23hx7F5jOd3WxH/7g7OQ+B
 G2cX5HrcJiQEA==
Received: by mail-pj1-f42.google.com with SMTP id a16so1638212pjs.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 07:34:14 -0700 (PDT)
X-Gm-Message-State: AAQBX9dbymFvxhFvmredFIkulTknVRLVpirOovubF8F4Xfxup55RpZuV
 23pI9PRUXCauS+k57u06X54iCkGRMw3hNNq/jg==
X-Google-Smtp-Source: AKy350Y57cQ3/TzcctMtJeBkZVGy3RaGVnEiqyzqBxcgVPo3gFc72P+HHXJ3tIgI+qnw4mjDX3xPaiNQsV4yB10ee/Y=
X-Received: by 2002:a81:b149:0:b0:543:9065:b225 with SMTP id
 p70-20020a81b149000000b005439065b225mr1122523ywh.5.1679668433642; Fri, 24 Mar
 2023 07:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
 <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
In-Reply-To: <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 24 Mar 2023 09:33:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL+nF_WwZ-EDpUSD2yrxPLZWxaeb=WpTtPnnbpgcXT7qA@mail.gmail.com>
Message-ID: <CAL_JsqL+nF_WwZ-EDpUSD2yrxPLZWxaeb=WpTtPnnbpgcXT7qA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: alsa-devel@alsa-project.org, Sean Wang <sean.wang@kernel.org>,
 Jacky Bai <ping.bai@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, asahi@lists.linux.dev,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Samuel Holland <samuel@sholland.org>, openbmc@lists.ozlabs.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Jeffery <andrew@aj.id.au>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
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

T24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMzo0MOKAr0FNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE1hciAxOCwgMjAyMyBhdCAxMjoz
NuKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPiBDbGVhbnVw
IGJpbmRpbmdzIGRyb3BwaW5nIHVubmVlZGVkIHF1b3Rlcy4gT25jZSBhbGwgdGhlc2UgYXJlIGZp
eGVkLAo+ID4gY2hlY2tpbmcgZm9yIHRoaXMgY2FuIGJlIGVuYWJsZWQgaW4geWFtbGxpbnQuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPgo+IFNo
b3VsZCBJIHF1ZXVlIHRoaXMgcGF0Y2ggYnkgdGhlIHdheSwgb3IgZG8geW91IG5lZWQgaXQgdG8g
Z28gaW50byBzb21lCj4gRFQtcmVsYXRlZCB0cmVlPwoKU3RhbmRzIG9uIGl0cyBvd24uIFlvdSBj
YW4gdGFrZSBpdC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
