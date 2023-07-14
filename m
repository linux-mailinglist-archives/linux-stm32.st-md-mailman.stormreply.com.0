Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28A75436E
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 21:53:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 906ECC6B44F;
	Fri, 14 Jul 2023 19:53:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA386C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 19:53:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BC5361DDC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 19:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA879C433C9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689364391;
 bh=DnEjVGiuXfP3swFolvK4a+TN59hjw2gEVcLZQUXBvDY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mn87tiPgZ6ilmAUhV977eN8ghu423vnPb3bEQXiueuJFlG6WzckKVMBYgx1XXxNaX
 uZLBgaozxXIxTjMwwZNV48AJ6IMuBYZoVyzOzjRfheSwy+adVIZ73Ma7GMH/LYoiS8
 hcOEgR57LDhoIb4QTvPCf/wCVxc3h7Kvt4VD/k4D0c/wK97+sjzu6mr25aZQsYNWl3
 098AiK51OpiCy2cNMNRiacvZN6BEPN3mg7PfGgRH9OxiHBDW8JTYfTM1FqidsDFTCm
 d1GulW7sULPhNG45eCQXrmcwpCNJF/mD+Y+rb0JwswPdlZCblEQ5fjs6Gv1LtynJYb
 iJzdclHBcYkvA==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b74310566cso36378251fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 12:53:11 -0700 (PDT)
X-Gm-Message-State: ABy/qLaEz7dS0t4GjiSKyviBJ6lq3N7EvjkUSsMNoSGHtvpqWqZehqO+
 h4+6PnoCumb8n21/DTMts9szEZstLqz672/07g==
X-Google-Smtp-Source: APBJJlFIVq6SSfDGp/7zlzMmel1HUM1zDWT3EoUpkE1rCFI61SUoU0+rrNxJc3PIb6p4Jh4x1E4RyP9tWO4eKUbbP0E=
X-Received: by 2002:a2e:9a8a:0:b0:2b4:765b:f6ee with SMTP id
 p10-20020a2e9a8a000000b002b4765bf6eemr4915096lji.41.1689364389871; Fri, 14
 Jul 2023 12:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org>
 <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
In-Reply-To: <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Jul 2023 13:52:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
Message-ID: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Explicitly include correct DT
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NTTigK9QTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFm
YWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo1MeKA
r1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBEVCBv
Zl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4g
PiBvZl9wbGF0Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8gdGhlIHJlZ3Vs
YXIgcGxhdGZvcm0gYnVzLgo+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdlIHByZXBwaW5nIEFybSBE
VCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gInRlbXBvcmFyaWx5IiBpbmNsdWRlIGVh
Y2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oCj4gPiBhbmQgb2Yu
aC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCByYW5kb20gbWl4IG9mIHRob3Nl
IGluY2x1ZGUKPiA+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJlZS4gSW4gb3JkZXIgdG8g
ZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+IHJlcGxhY2UgdGhlIGltcGxpY2l0IGluY2x1
ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0bwo+ID4gZXhwbGljaXRs
eSBpbmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4KPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29j
a2kgPHJhZmFlbEBrZXJuZWwub3JnPgo+Cj4gb3IgcGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSB3
YW50IG1lIHRvIHBpY2sgdGhpcyB1cC4KClNpbmdsZSBwYXRjaCBpbiB5b3VyIHN1YnN5c3RlbSB3
aXRoIG5vIGRlcGVuZGVuY2llcy4gUGxlYXNlIHBpY2sgaXQgdXAuCgpSb2IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
