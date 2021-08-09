Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B93E4629
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 15:09:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 246BEC57B51;
	Mon,  9 Aug 2021 13:09:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1820C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 13:09:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0141760FF2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628514551;
 bh=YzG7BnFCln4Yyp6LxrxvxeyUMj5GmzMjIhVfIPMKSYc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B8pvYpwPzQ18zhH2+y0BGlUA/OJhSA/B0e0InC/nca080ep3tJvTyYkjw4iA0bIXy
 YJkfsyL7WJqFEvGlYZsDdfkS8W4gkzs2dxMYwyXUt2VpcSaAsgcNhIj8ai/6CAVUZ2
 ldHAUzQEOhshkYgfdQv79fOgiKArwiLUzaIB6uXf33e9Dwx6fJNaNUWADrL3Q2AY27
 Bl9LecINy6PsqQyvEgFzW02xNT9GIlS0Tp9TuaVC5l/yfox0JcJblrMOq9WQey5+Yx
 UjWS8SLAwRaq9m1jBvtg7XtqOaG9lvGylZ+m8LNCf4Md/cmndcHE0D+U5Qp6wYUHub
 B20Q3cXMUBSvw==
Received: by mail-lf1-f47.google.com with SMTP id b6so17450405lff.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Aug 2021 06:09:10 -0700 (PDT)
X-Gm-Message-State: AOAM531h6hUceD5zGvgnsjH6hoHuWtA+fD5cyGb0R5ZpG+oguF3UyP6G
 PE/x1dtoFe9RIFpVxGg2zlFeNsT/HjXxZwWeKg==
X-Google-Smtp-Source: ABdhPJzottn9lR1w4Ou5tspJmaMhExuHvfqLuRluAKs7dQZoer2iHn4k6bWFWu6HusN3FgH38v3t3o0558IoBlRW8NU=
X-Received: by 2002:a17:906:4156:: with SMTP id
 l22mr6919385ejk.75.1628514539014; 
 Mon, 09 Aug 2021 06:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-14-tzimmermann@suse.de>
In-Reply-To: <20210625082222.3845-14-tzimmermann@suse.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 21:08:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Y7VZm2JWtPXVGfsPQ-j72wMULQJHCHdmQEV+a=TyW1Q@mail.gmail.com>
Message-ID: <CAAOTY_8Y7VZm2JWtPXVGfsPQ-j72wMULQJHCHdmQEV+a=TyW1Q@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, emma@anholt.net,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 rodrigo.vivi@intel.com, liviu.dudau@arm.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, michal.simek@xilinx.com,
 Melissa Wen <melissa.srw@gmail.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Russell King <linux@armlinux.org.uk>, mihail.atanassov@arm.com,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, NXP Linux Team <linux-imx@nxp.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 Ben Skeggs <bskeggs@redhat.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Inki Dae <inki.dae@samsung.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, john.stultz@linaro.org,
 jani.nikula@linux.intel.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, amd-gfx@lists.freedesktop.org,
 hyun.kwon@xilinx.com, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Xinhui.Pan@amd.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 kieran.bingham+renesas@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, tiantao6@hisilicon.com,
 Shawn Guo <shawnguo@kernel.org>, brian.starkey@arm.com, zackr@vmware.com,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v4 13/27] drm/mediatek: Don't set struct
	drm_device.irq_enabled
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

SGksIFRob21hczoKClRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiDmlrwg
MjAyMeW5tDbmnIgyNeaXpSDpgLHkupQg5LiL5Y2INDoyMuWvq+mBk++8mgo+Cj4gVGhlIGZpZWxk
IGRybV9kZXZpY2UuaXJxX2VuYWJsZWQgaXMgb25seSB1c2VkIGJ5IGxlZ2FjeSBkcml2ZXJzCj4g
d2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcuIERvbid0IHNldCBpdCBpbiBtZWRpYXRlay4KPgoK
QWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgo+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDYgLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMKPiBpbmRleCBiNDZiZGI4OTg1ZGEuLjliNjBiZWMzM2QzYiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTI3MCwxMiArMjcw
LDYgQEAgc3RhdGljIGludCBtdGtfZHJtX2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0p
Cj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2NvbXBvbmVudF91bmJpbmQ7Cj4gICAgICAgICB9
Cj4KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBXZSBkb24ndCB1c2UgdGhlIGRybV9pcnFfaW5z
dGFsbCgpIGhlbHBlcnMgcHJvdmlkZWQgYnkgdGhlIERSTQo+IC0gICAgICAgICogY29yZSwgc28g
d2UgbmVlZCB0byBzZXQgdGhpcyBtYW51YWxseSBpbiBvcmRlciB0byBhbGxvdyB0aGUKPiAtICAg
ICAgICAqIERSTV9JT0NUTF9XQUlUX1ZCTEFOSyB0byBvcGVyYXRlIGNvcnJlY3RseS4KPiAtICAg
ICAgICAqLwo+IC0gICAgICAgZHJtLT5pcnFfZW5hYmxlZCA9IHRydWU7Cj4gICAgICAgICByZXQg
PSBkcm1fdmJsYW5rX2luaXQoZHJtLCBNQVhfQ1JUQyk7Cj4gICAgICAgICBpZiAocmV0IDwgMCkK
PiAgICAgICAgICAgICAgICAgZ290byBlcnJfY29tcG9uZW50X3VuYmluZDsKPiAtLQo+IDIuMzIu
MAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
