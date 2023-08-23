Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5F7857E6
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 14:32:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DE8EC6B44C;
	Wed, 23 Aug 2023 12:32:00 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5486C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 12:31:58 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-570b3ebb3faso367017eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 05:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692793917; x=1693398717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ApOaAU2C11Pn2qOxjg2kIqTJJ7VnWEqUmde/1TenZQ=;
 b=YJoTv35EIgkmqosUzXN4orBaFbhhueraSpXrtSJl5ZJUvIPpgHdHNxhv/rURT8YACj
 HsD1BoeYDvtQTbZnRnkfeMyx7gW6OFatToL09c+h8w5MbyvmQ4bwq20x6LZvRlwapTQq
 4uRORWElaeb5QP9hlzTYKYzZGv2yNnOzQKE9kofFFRoYo2LEQsoAULGuTf3jb6X1pWYj
 iWlX3e0htnqZv+I7alyAF0lYwl2qDXb9P+5ntTb7nBVFfJ4+/8jW6cMbz0rvUhHveIE/
 C5dd84c/ga6mWxjdzr+kf2QHQdP27Rw8rnRrOYkaBAB1J6QAtKh9Of1PZwvoCnbOKKdq
 Inng==
X-Gm-Message-State: AOJu0Yzmc01WIr0Zd4FHI5h5dSUFdXC7FIELCIxqbJ8JlOcAogqZPXxP
 n3GGC46JJ2TCVlWD237PpsU9jzsOOePt4YCXLbU=
X-Google-Smtp-Source: AGHT+IHhMwKmKIBwwvi/YmGkSAgu5efCUMytt4QejM22SViosU4j5VAi4fORzp0+24y420UMM8bLIkI7yh9A1hX+wbo=
X-Received: by 2002:a4a:e741:0:b0:56e:94ed:c098 with SMTP id
 n1-20020a4ae741000000b0056e94edc098mr12003584oov.0.1692793917062; Wed, 23 Aug
 2023 05:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org>
 <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
 <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
 <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
In-Reply-To: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 23 Aug 2023 14:31:44 +0200
Message-ID: <CAJZ5v0j2psZUYF1gYTK3G=+MdrLOg1QhOxENhSvWbvGcjzLizg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Amit Kucheria <amitk@kernel.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
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
 Markus Mayer <mmayer@broadcom.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgMTI6MzjigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDIwLCAyMDIzIGF0IDE6NTDigK9QTSBSYWZh
ZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
SnVsIDE0LCAyMDIzIGF0IDk6NTPigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NTTigK9QTSBSYWZh
ZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo1MeKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQg
b2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gPiA+ID4gPiBvZl9wbGF0
Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8gdGhlIHJlZ3VsYXIgcGxhdGZv
cm0gYnVzLgo+ID4gPiA+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdlIHByZXBwaW5nIEFybSBEVCBz
dXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gPiA+ID4gInRlbXBvcmFyaWx5IiBpbmNsdWRl
IGVhY2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oCj4gPiA+ID4g
PiBhbmQgb2YuaC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCByYW5kb20gbWl4
IG9mIHRob3NlIGluY2x1ZGUKPiA+ID4gPiA+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJl
ZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+ID4gPiA+IHJlcGxh
Y2UgdGhlIGltcGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMg
bmVlZCB0bwo+ID4gPiA+ID4gZXhwbGljaXRseSBpbmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVz
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cj4gPiA+ID4KPiA+ID4gPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJh
ZmFlbEBrZXJuZWwub3JnPgo+ID4gPiA+Cj4gPiA+ID4gb3IgcGxlYXNlIGxldCBtZSBrbm93IGlm
IHlvdSB3YW50IG1lIHRvIHBpY2sgdGhpcyB1cC4KPiA+ID4KPiA+ID4gU2luZ2xlIHBhdGNoIGlu
IHlvdXIgc3Vic3lzdGVtIHdpdGggbm8gZGVwZW5kZW5jaWVzLiBQbGVhc2UgcGljayBpdCB1cC4K
PiA+Cj4gPiBEb25lLCB0aGFua3MhCj4KPiBJJ20gbm90IHNlZWluZyB0aGlzIGluIGxpbnV4LW5l
eHQuCgpmNmE3NTZlOGZiMTIgdGhlcm1hbDogRXhwbGljaXRseSBpbmNsdWRlIGNvcnJlY3QgRFQg
aW5jbHVkZXMKCkl0J3MgdGhlcmUgaW4gbXkgbGludXgtbmV4dCBicmFuY2ggKGFuZCBpbiBteSB0
aGVybWFsIGJyYW5jaCkgYW5kIGl0CnNob3VsZCBiZSB0aGVyZSBpbiBsaW51eC1uZXh0IHRvby4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
