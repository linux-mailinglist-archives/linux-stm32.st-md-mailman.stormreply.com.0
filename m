Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FEB75B71A
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jul 2023 20:50:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 604E8C6B44D;
	Thu, 20 Jul 2023 18:50:31 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40537C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 18:50:30 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-94ea38c90ccso34166066b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 11:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689879029; x=1690483829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ri7fimkcHumz6u7/WZYeGYX85HXnNnQ+B/CYo4XrX0=;
 b=IdJE5UQJWUgRka2aV/B1o7ibbsxSUiulNLT1F6ZYVrCIkUpzGfJg4KDniFtGvQKXu8
 Ps60vR6Vpi2zbqMPtFZOInObXfaJB8fLfDVmV/XbJMUllkwl0tjNYfzgofMb1+ctU2Rz
 jKb/Yb1grIyJN9akFheAB5xz2yVtph1on60EXcWQvNCE33Jif8WX4BmH3t3OrLKGhjQg
 fOWa/tZqDfFiijBiIskrvJXrVRh9vxkXe8O9NNoVDNWHHQ1zQMCBavJDpiOvaMic9fnm
 sMOENAKDzPNSGASTp8mh8affab7EW6VD09+1C9fIPhK+y6sdBUKMWbcV9XswI5HQ6bVr
 mdQQ==
X-Gm-Message-State: ABy/qLZ3TgmJpQhyEvcsxVEC86J30jZfjRP1yStNwbWcbAICyzKgom2Q
 h+C/9Ln3fEhOZNa4zCBYfcyDDEaQ9oCQ8n0DEBAgAw5Z
X-Google-Smtp-Source: APBJJlHi91lqNeNV5b3NsqRozieOcqVx3nEK9H5IGaNOQgSl+w6cuVzQPslNMDSGV1xCPVo92lepZZT6y5Duc+GvbWI=
X-Received: by 2002:a17:906:7a11:b0:993:d90e:3101 with SMTP id
 d17-20020a1709067a1100b00993d90e3101mr2893837ejo.1.1689879029584; Thu, 20 Jul
 2023 11:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org>
 <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 20 Jul 2023 20:50:18 +0200
Message-ID: <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgOTo1M+KAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NTTigK9QTSBSYWZh
ZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
SnVsIDE0LCAyMDIzIGF0IDc6NTHigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gVGhlIERUIG9mX2RldmljZS5oIGFuZCBvZl9wbGF0Zm9ybS5oIGRh
dGUgYmFjayB0byB0aGUgc2VwYXJhdGUKPiA+ID4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3Jl
IGl0IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiA+ID4gQXMgcGFy
dCBvZiB0aGF0IG1lcmdlIHByZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhl
eQo+ID4gPiAidGVtcG9yYXJpbHkiIGluY2x1ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNvIGluY2x1
ZGUgcGxhdGZvcm1fZGV2aWNlLmgKPiA+ID4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdz
IGEgcHJldHR5IG11Y2ggcmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gPiA+IGZpbGVzIHVz
ZWQgdGhyb3VnaG91dCB0aGUgdHJlZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVy
cyBhbmQKPiA+ID4gcmVwbGFjZSB0aGUgaW1wbGljaXQgaW5jbHVkZXMgd2l0aCBzdHJ1Y3QgZGVj
bGFyYXRpb25zLCB1c2VycyBuZWVkIHRvCj4gPiA+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29y
cmVjdCBpbmNsdWRlcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KPiA+Cj4gPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPgo+ID4KPiA+IG9yIHBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugd2FudCBt
ZSB0byBwaWNrIHRoaXMgdXAuCj4KPiBTaW5nbGUgcGF0Y2ggaW4geW91ciBzdWJzeXN0ZW0gd2l0
aCBubyBkZXBlbmRlbmNpZXMuIFBsZWFzZSBwaWNrIGl0IHVwLgoKRG9uZSwgdGhhbmtzIQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
