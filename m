Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC70F784CE4
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 00:38:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64BB6C6B444;
	Tue, 22 Aug 2023 22:38:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8194AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 22:38:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 407FF638A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 22:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932C0C433CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 22:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692743929;
 bh=U15eYY76gsnD/RHRrRp2WW4I4OCWvlLasJey1YPS3bA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jn4NXR0lfbWYS5Bph9NDsU+CUS6oKPixIBuJYm6y13c3Oey4zsZFxl5LEbilQxJik
 FeYi4hk81hW93Pito7BlDOIWLAaYnB0RhnPhbkxJtYjIwxdi5/i0pNyJyNN/nCccuI
 fmY+ssuFxpfa7I30gkLK8YDwU53i5SgxztwwtwOd89uEzAB/wmwwNcI4B7etE38nUX
 1KT94QzqmI87253Kc52MD6Y8fou1jBGiX1pJkpWJMnTdedMpWf+KZdUDC39Y5QFc9X
 pamJJqabcmOvoF7HZyud2tyJQOPli0tj7WP4SaXb0FkLx82tm9eotCxnMBwonE7SUu
 gzqa24AIGrPmA==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so77863641fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 15:38:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YwBiAGBGzyR/ftGbD8l6qrpyB/A0sk8qZkvVnu04KrRU9aL9YtY
 L45KPjM0fScqYsqjJyl2CwpHQ4r/o7hF07d1wg==
X-Google-Smtp-Source: AGHT+IF0JLsyZnXZQBcgCFuF2kEmLMhxys3SoS78ueuZDPswTtorzz1H8NCRQqi/aO+jact/25/WQ07MKCBccdqUsKI=
X-Received: by 2002:a2e:9919:0:b0:2bb:8d96:6041 with SMTP id
 v25-20020a2e9919000000b002bb8d966041mr7975933lji.45.1692743927592; Tue, 22
 Aug 2023 15:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org>
 <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
 <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Aug 2023 17:38:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
Message-ID: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMTo1MOKAr1BNIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZh
ZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCA5OjUz4oCv
UE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBK
dWwgMTQsIDIwMjMgYXQgMTI6NTTigK9QTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCA3OjUx4oCv
UE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBU
aGUgRFQgb2ZfZGV2aWNlLmggYW5kIG9mX3BsYXRmb3JtLmggZGF0ZSBiYWNrIHRvIHRoZSBzZXBh
cmF0ZQo+ID4gPiA+IG9mX3BsYXRmb3JtX2J1c190eXBlIGJlZm9yZSBpdCBhcyBtZXJnZWQgaW50
byB0aGUgcmVndWxhciBwbGF0Zm9ybSBidXMuCj4gPiA+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdl
IHByZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gPiA+ICJ0ZW1w
b3JhcmlseSIgaW5jbHVkZSBlYWNoIG90aGVyLiBUaGV5IGFsc28gaW5jbHVkZSBwbGF0Zm9ybV9k
ZXZpY2UuaAo+ID4gPiA+IGFuZCBvZi5oLiBBcyBhIHJlc3VsdCwgdGhlcmUncyBhIHByZXR0eSBt
dWNoIHJhbmRvbSBtaXggb2YgdGhvc2UgaW5jbHVkZQo+ID4gPiA+IGZpbGVzIHVzZWQgdGhyb3Vn
aG91dCB0aGUgdHJlZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+
ID4gPiByZXBsYWNlIHRoZSBpbXBsaWNpdCBpbmNsdWRlcyB3aXRoIHN0cnVjdCBkZWNsYXJhdGlv
bnMsIHVzZXJzIG5lZWQgdG8KPiA+ID4gPiBleHBsaWNpdGx5IGluY2x1ZGUgdGhlIGNvcnJlY3Qg
aW5jbHVkZXMuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJh
ZmFlbEBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBvciBwbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91
IHdhbnQgbWUgdG8gcGljayB0aGlzIHVwLgo+ID4KPiA+IFNpbmdsZSBwYXRjaCBpbiB5b3VyIHN1
YnN5c3RlbSB3aXRoIG5vIGRlcGVuZGVuY2llcy4gUGxlYXNlIHBpY2sgaXQgdXAuCj4KPiBEb25l
LCB0aGFua3MhCgpJJ20gbm90IHNlZWluZyB0aGlzIGluIGxpbnV4LW5leHQuCgpSb2IKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
