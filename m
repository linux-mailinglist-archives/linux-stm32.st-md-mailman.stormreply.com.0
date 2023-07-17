Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F5768DB9
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8CFFC6C83A;
	Mon, 31 Jul 2023 07:17:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DCCCC6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 15:40:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A19961155
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 15:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDC4C611A7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689608405;
 bh=tF/K12dcb1AtR13XQY0pq3bgmoCAiVfZHpGq03H1+sk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mX8RhJfEol8SKSIZYImvm3vgYGg2QOjrhEImVy70eQw9yFGHJhacPYnLrSEjLcXVH
 lsK1foH9DnVkOrz0XgrZvShJMkw35zdZXkm28OGXKxZAPZQPWjnMqmD7u1K/6wWyrF
 KESSOxDGgUcHfAUMGWeNgAp8rP61IeLKmYc7IOGocR2yzizGnLQn+2LOPOUV3VN8RI
 nXJsuiRAgYTOZFEMemZolvUrK9EbLD+pNe2um6lCwrS0nGmoypnFT87DTWspO0tENT
 6g2YWD6p/fpzoiD+byVvvn8YboH7BuhPrNAUEc3aLc7yE8lROrZtFeZkeMUjss/bxz
 8gUvf0rnNUAvw==
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-1b0748bc78dso3632428fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 08:40:05 -0700 (PDT)
X-Gm-Message-State: ABy/qLajU6sik54Bp+sNtuaCIXjIDEuVgcRDW73HhtHRNrOPUnS/sLwe
 xoyy7M/Z3F3ZuLEX7byLVYRE3Bf2pCqsNdejQgwoWQ==
X-Google-Smtp-Source: APBJJlHs9bNlVGErzzDkG3ITNYPrBi9bcbK5hB2pZ5ku9OA6MncccRQ7QQDddVXbZVn5Z/tCXP76UHYBqks/PFSJBmQ=
X-Received: by 2002:a17:90b:1095:b0:263:3567:f99 with SMTP id
 gj21-20020a17090b109500b0026335670f99mr13011407pjb.15.1689608384033; Mon, 17
 Jul 2023 08:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174545.4056287-1-robh@kernel.org>
 <114500369.nniJfEyVGO@phil>
 <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
In-Reply-To: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 17 Jul 2023 17:39:32 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5wOhptw4PgP2etkC5KYh_5cfOXZuVhsN6YCMiqn15hog@mail.gmail.com>
Message-ID: <CAN6tsi5wOhptw4PgP2etkC5KYh_5cfOXZuVhsN6YCMiqn15hog@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Icenowy Zheng <icenowy@aosc.io>, freedreno@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, lima@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liu Ying <victor.liu@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 Tian Tao <tiantao6@hisilicon.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, xen-devel@lists.xenproject.org,
 Tomi Valkeinen <tomba@kernel.org>, linux-sunxi@lists.linux.dev,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Ondrej Jirman <megous@megous.com>, linux-stm32@st-md-mailman.stormreply.com,
 Emma Anholt <emma@anholt.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Purism Kernel Team <kernel@puri.sm>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH] drm: Explicitly include correct DT
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgNDoyN+KAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMzoyNuKAr0FNIEhlaWtv
IFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4KPiA+IEFtIEZyZWl0YWcsIDE0
LiBKdWxpIDIwMjMsIDE5OjQ1OjM0IENFU1Qgc2NocmllYiBSb2IgSGVycmluZzoKPiA+ID4gVGhl
IERUIG9mX2RldmljZS5oIGFuZCBvZl9wbGF0Zm9ybS5oIGRhdGUgYmFjayB0byB0aGUgc2VwYXJh
dGUKPiA+ID4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0IGFzIG1lcmdlZCBpbnRvIHRo
ZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiA+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdlIHByZXBw
aW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gPiAidGVtcG9yYXJpbHki
IGluY2x1ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNvIGluY2x1ZGUgcGxhdGZvcm1fZGV2aWNlLmgK
PiA+ID4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2ggcmFuZG9t
IG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gPiA+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJl
ZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+ID4gcmVwbGFjZSB0
aGUgaW1wbGljaXQgaW5jbHVkZXMgd2l0aCBzdHJ1Y3QgZGVjbGFyYXRpb25zLCB1c2VycyBuZWVk
IHRvCj4gPiA+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRlcy4KPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+ID4g
LS0tCj4gPgo+ID4gWy4uLl0KPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCj4gPiA+IGluZGV4IDkxN2U3OTk1MWFhYy4uMjc0NGQ4
ZjRhNmZhIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlw
aS1kc2ktcm9ja2NoaXAuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHct
bWlwaS1kc2ktcm9ja2NoaXAuYwo+ID4gPiBAQCAtMTIsNyArMTIsOSBAQAo+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51
eC9vZl9wbGF0Zm9ybS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KPiA+ID4g
KyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51
eC9wbV9ydW50aW1lLmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gPgo+ID4g
SSdtIG5vdCBzdXJlIGlmIEknbSBqdXN0IG1pc3JlYWRpbmcgc29tZXRoaW5nLCBidXQgaW4gYWxs
IG90aGVyIHBsYWNlcwo+ID4gb2ZfZGV2aWNlLmggZ2V0cyByZW1vdmVkIHdoaWxlIGhlcmUgaXMg
c3RheXMgYXMgYW4gaW5jbHVkZS4gSXMgdGhpcwo+ID4gY29ycmVjdCB0aGlzIHdheT8KPgo+IFll
cywgYmVjYXVzZSBvZl9tYXRjaF9kZXZpY2UoKSBpcyB1c2VkLgo+Cj4gUm9iCj4KCkZvciBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlLwoKQWNrZWQtYnk6IFJvYmVydCBGb3NzIDxyZm9zc0BrZXJuZWwu
b3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
