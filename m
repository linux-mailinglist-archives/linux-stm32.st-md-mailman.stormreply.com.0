Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C69917E61
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 12:40:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CD04C71287;
	Wed, 26 Jun 2024 10:40:59 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBC4CC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 10:40:51 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dff02b8a956so5833081276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719398451; x=1720003251;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
 b=oSiKUc7v7cTjHj3+GWod41eh6RYROC+XkEESZK2q5sVukKcLfnV6mhdala4YZYnR5i
 UgvnAuEfY6tJWlqaLJoNT9wHwXcRBye9ESwfYZ9dVIJRmiZ499LRdTp4ILy21yjznpc0
 SgtoFIfau8CXTto2ySGBaCpoTZQjNOb6YUsSOuzvo1rkGK75+VBuBrjbI586WtYCpyCy
 lh9KEvWL5w/oP2m1i6I5Z9S3ZIFd/Ag1WzpBCLxwIzFYxIZviWBal2y0KBJC/myBozVJ
 sAHQmFPSe4hF4Tax00+za5AbPOsoMyh5xoWZ+cgH+R3ZwRE1a/UzZSkPkZba2CpxvOzL
 +LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719398451; x=1720003251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
 b=LCSt1C7FMxA8bSSA4pljfgoMH6CbfyIauItAw0BwgyFcmw2TB+J2Q5735Me2ljOZFX
 7qFwiNGw9UL6YfDomzNE5dqQBwKEKH92sDVtLRqAR4UC3oD6MM0B/QAIPrE6hQYo5yab
 hptY3cHovP/HI+l2Yq0c+ENH8b+/egcwBNvco+Rl36HX4T76a7f+eO7kEvG36cs5q8I7
 VUXFNIOK3/D6Pduk+g2f8myos6eVUTrAyfghwsWryDtVN+62eBvIxZrIt5eFe1A/3Fy/
 INfs48UCVOPbPLU8l3U9EsAxKHT3VYjBjLmIpiUI+Fi3IBvtRoX/q4xbIjzfARrcpAMv
 T68Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Xhqt0wBHCrZ+oiMbqTssK0B4hqwO1X99GpqSonjTzVYBqwA52hwlWIR3mezbKvFrJcIyRB2OGQ7peVy6bXIW8mPfUhlaeqMqL2tw8Wlv0bfXwI7UROne
X-Gm-Message-State: AOJu0YzDJf+QMAR3CKCT1zbHnLInYXw5ty3qCItnJEiRSXbUgV1sMuQF
 RNsLrRq+UIWl+c41zfSM6xD3xspsYFbCU+cAWFQojRab4PteT6q36y0JzFhqizWcXNQkdgobEaP
 ZFjGu7RT8rjaES5+ucjD4SpSjXUnG8QZfWsORkw==
X-Google-Smtp-Source: AGHT+IGAQdQECALwFQiRgkrKA/rZBEJOAnkCpPbedoTQq7/jt7W9vOb6wQcj2qKoWUKoPCAEcM15HUQq3HQFJjgWzyA=
X-Received: by 2002:a25:c553:0:b0:dfa:6e39:95b0 with SMTP id
 3f1490d57ef6-e030107f616mr10069878276.49.1719398450656; Wed, 26 Jun 2024
 03:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
 <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
In-Reply-To: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:40:36 +0200
Message-ID: <CACRpkdastCME_0BWjcaNc0Fw8qsLAGgoQUMi7g8sEP+xT=T_tQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-gpio@vger.kernel.org,
 soc@kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v2 20/20] pinctrl: samsung: Use
 scope based of_node_put() cleanups
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

T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgMTI6MjLigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+IE9uIFNhdCwgMDQgTWF5IDIw
MjQgMjE6MjA6MTggKzA4MDAsIFBlbmcgRmFuIChPU1MpIHdyb3RlOgo+ID4gVXNlIHNjb3BlIGJh
c2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cCB0byBzaW1wbGlmeSBjb2RlLgo+ID4KPiA+Cj4KPiBB
cHBsaWVkLCB0aGFua3MhCj4KPiBbMjAvMjBdIHBpbmN0cmw6IHNhbXN1bmc6IFVzZSBzY29wZSBi
YXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCj4gICAgICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3BpbmN0cmwvc2Ftc3VuZy9jLzcwNzgwN2Y0YzExMjhlMzk0NDI1MTllODQ5ZTRjZTBiN2My
OWIxMTAKCk9LIEkgZHJvcHBlZCBpdCBmcm9tIG15IHF1ZXVlIQoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
