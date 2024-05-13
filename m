Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 570AC8C4878
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 22:51:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E704C6B476;
	Mon, 13 May 2024 20:51:43 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89666C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 20:51:35 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6203f553e5fso50993157b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 13:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715633494; x=1716238294;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
 b=sUDVDFA8CC+SerVb9xa/LAxNyyAJBZ9vYfyKHU1dqzzQ1BCYOrLkIyNkbH+CymQd3U
 NjNU8ky8A0gONkBxHwZk/+T7P5meOoaav2w9z7Eutpsjl7GcEC4L9+/57fkVXbFhgiiK
 4Cx8AVd32xrZJ7X2b/0LL16hqmkVf5qma/W3Wll+YAYxOUt85OmGjU7V0szLIAnfC/mg
 7Os3S/zb5hPuZkDYOGkzMBY7eLSE1qsJ/Vbik8HHxZUTGT3M/Hdcq7+u6PK7vLj+O2dN
 ClTjKa2VKH5rQ9EIiMjMUGFLltpRp3tJMBX0mGdVVjn3RzEnYW45dF/Xv9SfRM6rnhQn
 fdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715633494; x=1716238294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
 b=L0YvTz64IlpJHExOgnDmZmX8XmwSlKqvhZ9xOhVY/IhXUFJykb/LWCJFrZ1kAQkhvu
 4UVwKs023eEPqbIk32J1R+tXdkRM/wnmm3t8aXEOWM3tzqURn2YQCe4FKXmW+iSIDNph
 ld5Ha6Jev0PmZ5DpfbYQ7G0CMRjOTO7Eu3OxgLygcntrppaZHw4c8OoXJ3KJnIQAknYT
 Gmfrois4WW7b/8WJWo0hMbp0emcu5uw9TBBe0MZKhOb2s0jJ6wPsgiXy6IvuuZw/BTiF
 RCZ5PO13+pyL5gg2QDeknNtbjMvBeBzFfu5OmScs11uGfxzehrFvj7FnL0d3EDigHvyj
 yxbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtpn/vYupFItP+zlf5YugtT1Lpgo/sL0MmiEkWyRIeo2MPizpMQODMpxd13g11fo7X2bwMS+brIduGBT8Zrm+hmXhqdHSfoIHVJinnOIPIEO8CyoE8mK3g
X-Gm-Message-State: AOJu0YyZOWBa+SPZasdXGKrCRRMs6nzX64UhZ/tlo6wgr4dRPjcbR4GV
 2KZOo3AgJPWcUD6bhxHy0nOK2if494g5qDKFZU5+Ku+QJJBGu6Ldo3fAGs+12swBgDAa43plspp
 lHgM04sKTmySZlIBzupj07pPDeZAAMFSJTSb0oQ==
X-Google-Smtp-Source: AGHT+IHIMCINiS4Rm3W7vEHXnxoinnBVVMUXT21CaUFl/K9jprbEih1fz56tIA0O4ev2Ijok+dKJMkYRTsYw4QOpIww=
X-Received: by 2002:a05:690c:ed4:b0:61a:e9f6:2b1b with SMTP id
 00721157ae682-622aff774d9mr145019207b3.8.1715633492884; Mon, 13 May 2024
 13:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:51:21 +0200
Message-ID: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
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
Subject: Re: [Linux-stm32] [PATCH v2 07/20] pinctrl: renesas: Use scope
	based of_node_put() cleanups
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

T24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgMTo1OeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IE9uIFNhdCwgTWF5IDQsIDIwMjQgYXQgMzoxNOKA
r1BNIFBlbmcgRmFuIChPU1MpIDxwZW5nLmZhbkBvc3MubnhwLmNvbT4gd3JvdGU6Cj4gPiBGcm9t
OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KPiA+Cj4gPiBVc2Ugc2NvcGUgYmFzZWQgb2Zf
bm9kZV9wdXQoKSBjbGVhbnVwIHRvIHNpbXBsaWZ5IGNvZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
Cj4KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4KPiBBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4KCkRvZXMgdGhpcyBnbyBpbnRvIHRoZSBSZW5lc2FzIHBhdGNoIHN0YWNrPwoKSSB0aGlu
ayB0aGUgcGF0Y2ggc3RhbmRzIGZpbmUgd2l0aG91dCB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzLgoK
WW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
