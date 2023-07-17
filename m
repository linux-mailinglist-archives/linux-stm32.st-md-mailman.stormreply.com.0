Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB43175664A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jul 2023 16:27:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95CA7C6B457;
	Mon, 17 Jul 2023 14:27:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E556C6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 14:27:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A2A56105D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 14:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E094C433C8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689604065;
 bh=rkLKjJGA9W9V1hgJstWBCmZrxpmjuvUsbHV5ieMMp8c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tbqM5G1Bre2zBYNYlSaGpYvtGMUIHymVMKeK/TzG0KjBzCmaAHwEaXmM+fnWr8QHf
 A5IwGR12akMgYWcxzwUULBkB0mekTRl4kMKQRSfx+pzkXO2wU5OR+OPuWWdNpyb/9Y
 27H/XVZnsbuLv2tvpMFxcyKcBrfhw24Ct3Dtn6k2jIwf9fiUxfMZRE5qGgbeygcQZ2
 vy5S/pTq31758S5Um6WTDPfgsWL212q22eKGrybewvdX7t97Q3XcLfmDw1+8j8e8ow
 KnsnOeGJcjyYNIZVOv3JTTaB9YED46K0NRnfA2+aAkAVdCs2rPfSquk+go0eGVrLFe
 3iKfcFajgoGdg==
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so48066975e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 07:27:45 -0700 (PDT)
X-Gm-Message-State: ABy/qLbaKgXA7fWRY6+qck3fOENzOK5L6MfxC5H13631SraSpeMb7aGM
 p1dVTkRwYy0E9NmmU7gzR/eCISHZvEeGDSGBsQ==
X-Google-Smtp-Source: APBJJlFSY1EKmbumZhe1Fkfe0qsodiNyBdGN/d2gmlGF1ZwWgImoQ1RpodF7t1ooNJHJiRju6eg8DIGKKeloqUgo0eo=
X-Received: by 2002:a2e:8945:0:b0:2b9:48f1:b195 with SMTP id
 b5-20020a2e8945000000b002b948f1b195mr576527ljk.44.1689604043579; Mon, 17 Jul
 2023 07:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174545.4056287-1-robh@kernel.org>
 <114500369.nniJfEyVGO@phil>
In-Reply-To: <114500369.nniJfEyVGO@phil>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 08:27:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
Message-ID: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>,
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
 Daniel Vetter <daniel@ffwll.ch>, Tomi Valkeinen <tomba@kernel.org>,
 linux-sunxi@lists.linux.dev,
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Purism Kernel Team <kernel@puri.sm>,
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMzoyNuKAr0FNIEhlaWtvIFN0dWVibmVyIDxoZWlrb0Bz
bnRlY2guZGU+IHdyb3RlOgo+Cj4gQW0gRnJlaXRhZywgMTQuIEp1bGkgMjAyMywgMTk6NDU6MzQg
Q0VTVCBzY2hyaWViIFJvYiBIZXJyaW5nOgo+ID4gVGhlIERUIG9mX2RldmljZS5oIGFuZCBvZl9w
bGF0Zm9ybS5oIGRhdGUgYmFjayB0byB0aGUgc2VwYXJhdGUKPiA+IG9mX3BsYXRmb3JtX2J1c190
eXBlIGJlZm9yZSBpdCBhcyBtZXJnZWQgaW50byB0aGUgcmVndWxhciBwbGF0Zm9ybSBidXMuCj4g
PiBBcyBwYXJ0IG9mIHRoYXQgbWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQgMTMgeWVhcnMg
YWdvLCB0aGV5Cj4gPiAidGVtcG9yYXJpbHkiIGluY2x1ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNv
IGluY2x1ZGUgcGxhdGZvcm1fZGV2aWNlLmgKPiA+IGFuZCBvZi5oLiBBcyBhIHJlc3VsdCwgdGhl
cmUncyBhIHByZXR0eSBtdWNoIHJhbmRvbSBtaXggb2YgdGhvc2UgaW5jbHVkZQo+ID4gZmlsZXMg
dXNlZCB0aHJvdWdob3V0IHRoZSB0cmVlLiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBoZWFk
ZXJzIGFuZAo+ID4gcmVwbGFjZSB0aGUgaW1wbGljaXQgaW5jbHVkZXMgd2l0aCBzdHJ1Y3QgZGVj
bGFyYXRpb25zLCB1c2VycyBuZWVkIHRvCj4gPiBleHBsaWNpdGx5IGluY2x1ZGUgdGhlIGNvcnJl
Y3QgaW5jbHVkZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiA+IC0tLQo+Cj4gWy4uLl0KPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMKPiA+IGluZGV4IDkxN2U3OTk1MWFhYy4uMjc0
NGQ4ZjRhNmZhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1p
cGktZHNpLXJvY2tjaGlwLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1t
aXBpLWRzaS1yb2NrY2hpcC5jCj4gPiBAQCAtMTIsNyArMTIsOSBAQAo+ID4gICNpbmNsdWRlIDxs
aW51eC9tZmQvc3lzY29uLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gICNp
bmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZv
cm0uaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+
ID4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPgo+IEknbSBub3Qgc3VyZSBpZiBJJ20ganVz
dCBtaXNyZWFkaW5nIHNvbWV0aGluZywgYnV0IGluIGFsbCBvdGhlciBwbGFjZXMKPiBvZl9kZXZp
Y2UuaCBnZXRzIHJlbW92ZWQgd2hpbGUgaGVyZSBpcyBzdGF5cyBhcyBhbiBpbmNsdWRlLiBJcyB0
aGlzCj4gY29ycmVjdCB0aGlzIHdheT8KClllcywgYmVjYXVzZSBvZl9tYXRjaF9kZXZpY2UoKSBp
cyB1c2VkLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
