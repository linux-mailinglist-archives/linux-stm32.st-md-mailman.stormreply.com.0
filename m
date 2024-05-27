Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B538D008F
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2024 14:57:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06424C6DD72;
	Mon, 27 May 2024 12:57:13 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EAD3C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 12:57:05 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-df4e40a3cb6so5608492276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716814624; x=1717419424;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJJyP+9frURhdd/ZV2qsiiwzKPVnn0nUZRG4Ztdu5Ds=;
 b=Xqt7dGEaXGGTPov746fDJ+4y2yoOfWwMjsV62Hno/j+CvuAHB9NlvRoaF0CJ1Poiia
 EuyLAZv2t6YyDqxaJlwfM3MRdt8A3nOQK+KxrEIUK1lD6ZjU/XnLxfyH4jixW5HiiiE7
 jeAj5BV5TuZMhM0BdvEluh3Lw4w83KHhVtxnyNsD7sKcBfs671NKL7zX0Gz6zpxlzWPg
 m15IE7QGaGJncRGtzRgKSHqF6z10CiEcQyevKRON9KM5tC6QuvUhX/10npgn6C7rCMfE
 aG9HBu04PvInxUPnBdKvXsCU1VK01vYhRhDgHLkUKxQy/fiviQIzmFFUcJJjD3jbdpzl
 HuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716814624; x=1717419424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJJyP+9frURhdd/ZV2qsiiwzKPVnn0nUZRG4Ztdu5Ds=;
 b=YP+NoFITIS9rTzWMWuHQeovxYwfGIu1BEFOj9xaZNxTAqavECq5+BrNxwHlEp6NrsG
 0WH3fIB+Wwgc2kdST1M519eJJxd/9W+eXL519JAeA2hjJ9AsmcDFO07NKV3BXR0wSeOo
 /ewRO1Om80iSRq/rHqS6yGeIy3WfGltFNZUStKr3it2sA11wjo5Tc4FudmZJZxbg1Ngy
 AYrvXah/dsQFI41SHufS+LNaINe0hAc/ae+Gf6cRPGrs3S9UmHcpgVNVto+U/HUv6hu7
 B760VXl3WAf1ShgCMTmN84MhiewiF+y9SJH/nnzgDB0oErnXju5QVfczwzXAtjXeOWH2
 kiOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMlNPrl9+vK2UB2CYM+KJl1YgluWGsJibnhUK9peWkjzdUhdS2APNTwQW1rrVMkmEx1olRbUtOqjO3QucGFjFC4ItGsU5pI0iqaTaDTSwlFIqEKNuXiamb
X-Gm-Message-State: AOJu0Yx3tA+RnhrnpcoqPAkTmnhFdqHDpO+4fUA7qEvOsQdZAfsidzNx
 xOXLDv38hRo7HGYfuSBVs3LLBBPykcXYqZ6AC5Z3KTc412B8wcfccuQ42EjQW64FzgWGBS0tKN8
 U0UCXoIFVzNYxUyRm8aeWRSyiyJmB30a0C9hiUA==
X-Google-Smtp-Source: AGHT+IHtuitKU1in514NtpJEfJGREAKzOXikcv6xhBvHaqSAyXXF4vYDUv/B437jXNYfH7CNGKFQFe5YOvThvoGTSqk=
X-Received: by 2002:a25:7486:0:b0:dc2:3f75:1f79 with SMTP id
 3f1490d57ef6-df772184c54mr8792593276.23.1716814624064; Mon, 27 May 2024
 05:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:56:53 +0200
Message-ID: <CACRpkdZ+YPAXTNU-kaA8ywBLW0RpGJBpXJqPD7aJ+B1V=axPrg@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
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
 linux-gpio@vger.kernel.org, soc@kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
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
Subject: Re: [Linux-stm32] [PATCH v2 03/20] pinctrl: stm32: Use scope based
	of_node_put() cleanups
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

T24gU2F0LCBNYXkgNCwgMjAyNCBhdCAzOjEz4oCvUE0gUGVuZyBGYW4gKE9TUykgPHBlbmcuZmFu
QG9zcy5ueHAuY29tPiB3cm90ZToKCj4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
Cj4KPiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwIHRvIHNpbXBsaWZ5IGNv
ZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KClBhdGNo
IGFwcGxpZWQuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
