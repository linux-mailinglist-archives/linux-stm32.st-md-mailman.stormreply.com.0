Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6FA75B82F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jul 2023 21:42:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4968AC6B44D;
	Thu, 20 Jul 2023 19:42:25 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B2BAC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 19:42:24 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-cc7863e7b82so1066758276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689882143; x=1690486943;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
 b=Is+h2NeaSzJfFfsZ98ro8BWc2npdTi8/mAPrWVvtpsxb716Whq2DsR1nkUJ5zX14Xz
 79qaflwC3BG2VYXCeK0ijBZtmZDQ1AwFmwaxjZDd/vn/AKdit/VHpHHNt7ZvyrLIlMK1
 rAvvaKIi1pdCGIE6T6PamxnnJ1xdepfGuegPYvjWZ/2v5uqSbyOmvOqKrH1HZMZxxQ9u
 TipBUYHRAcaq7G2V/lDcSoviQy3dB4LjRa8c+TMTdx5eHkXHMxyv/6aRPA0MgnDthZDb
 /qNXdFoMB9q33L3QYVfMXu7JSq0qiwBR5arRe8VeAjZhX1/RRVS46BZipMLM8QxKUS/8
 /7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689882143; x=1690486943;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
 b=DTmcHX9gtwViqUqcs9Yv9d/Mcb8gEgtPguBJd5fEAKa7ztMxPGGtfwL+5jBpQEb8A5
 5jckI2WhoV8Ge7a00gjL/Kv64BQVEvgl/rMNzyrGoogVE0PejJg3q+85ooEtkTeETgZM
 ss5O53kXDvIVhUQdszmFvXuk7lKQRS55VdvD4mmY/K2XTGO68IEyO2178XktgQ8v5WVm
 DPU8lpHV6fneP7/+xEiqeRYNDCmIdAAKppy5NY49AJ5uc/8R+NpP+fw8aU7FZSYoOwCi
 D+Cvqy2KRcjc/G3S3OMm22IYohSqoyLjdPJpckK5bbnG5iuZvg3S+UqRccYMuu1KGcNA
 Iayg==
X-Gm-Message-State: ABy/qLb0p1SzCljjzafW6tM4YZRI6c2ZPG3VVXCYgGnKdpTAlDPrdHpU
 YxgiXb1/taa7I+XPJhX8r60BP4P2Mi/fjzzOP8dTog==
X-Google-Smtp-Source: APBJJlE7cBabIqsDgOVse9OOZ6aTjmPoq/DJCfwfg6nCOEVEXRqRJUSYnSIJLuoYJ0UvKAptp1crbwCoFVPdkqeY7hY=
X-Received: by 2002:a25:c50b:0:b0:cdd:6635:a1f8 with SMTP id
 v11-20020a25c50b000000b00cdd6635a1f8mr5819173ybe.15.1689882143201; Thu, 20
 Jul 2023 12:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Jul 2023 21:42:12 +0200
Message-ID: <CACRpkdYe9b4ZpvYZqkcMq0Jjni_VD_75Zt5oKv4+v9f3pmJbVA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Tomasz Figa <tomasz.figa@gmail.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-sunxi@lists.linux.dev,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Chester Lin <clin@suse.com>,
 linux-gpio@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, soc@kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>,
 linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Explicitly include correct DT
	includes
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo0OeKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgoKPiBUaGUgRFQgb2ZfZGV2aWNlLmggYW5kIG9mX3BsYXRmb3JtLmggZGF0
ZSBiYWNrIHRvIHRoZSBzZXBhcmF0ZQo+IG9mX3BsYXRmb3JtX2J1c190eXBlIGJlZm9yZSBpdCBh
cyBtZXJnZWQgaW50byB0aGUgcmVndWxhciBwbGF0Zm9ybSBidXMuCj4gQXMgcGFydCBvZiB0aGF0
IG1lcmdlIHByZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ICJ0ZW1w
b3JhcmlseSIgaW5jbHVkZSBlYWNoIG90aGVyLiBUaGV5IGFsc28gaW5jbHVkZSBwbGF0Zm9ybV9k
ZXZpY2UuaAo+IGFuZCBvZi5oLiBBcyBhIHJlc3VsdCwgdGhlcmUncyBhIHByZXR0eSBtdWNoIHJh
bmRvbSBtaXggb2YgdGhvc2UgaW5jbHVkZQo+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJl
ZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiByZXBsYWNlIHRoZSBp
bXBsaWNpdCBpbmNsdWRlcyB3aXRoIHN0cnVjdCBkZWNsYXJhdGlvbnMsIHVzZXJzIG5lZWQgdG8K
PiBleHBsaWNpdGx5IGluY2x1ZGUgdGhlIGNvcnJlY3QgaW5jbHVkZXMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKSXQgc3RpbGwgYXBwbGllZCBjbGVh
bmx5IHNvIEkganVzdCBhcHBsaWVkIGl0LgoKVGhhbmtzIGZvciBhdHRlbnRpb24gdG8gZGV0YWls
LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
