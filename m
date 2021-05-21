Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC438E13D
	for <lists+linux-stm32@lfdr.de>; Mon, 24 May 2021 08:57:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB4BBC58D58;
	Mon, 24 May 2021 06:57:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B1DAC57B69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 May 2021 23:18:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D6B8613F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 May 2021 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621639103;
 bh=Hd7KH/71GldwhXzi4DHrPnVVlwTF8/7LpSIK8f+o37k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=doSxJyE4nO23f5+oE74A09xxktTkwdzbigZe9b3YeN5TGGNX/Nv6IIoUI0F5p1+Mu
 ieYjeN2dLCOUY7nV7U3p8DbBZQs2VjfXLTlBeW0SWYrD0lZx7OGjEUprkiAsRpc9j+
 nK1zf76rbz31ZTg0DVHrVHzqsVc7xwsMK9nyuk9qlKdk9eldQYDTBU0SOLOneqnl+2
 pNEdFY9KRRkYPRYCS8e5/YdI/xV7Uar7Z3BKSCj9EKcPmg+gTSdn0mdGaq93QtakGb
 3ZY7ghsCrw2RrZJLKbfKxTcUxJ9RBPJBHdIFkycWdF7omkT/tBJPUeuBSzMagtpNAS
 ACy5yU4zvVDLQ==
Received: by mail-wr1-f44.google.com with SMTP id c14so20714221wrx.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 May 2021 16:18:23 -0700 (PDT)
X-Gm-Message-State: AOAM530GNQ/+32WkBeGvYby8MWzHBaKnRbiegzjqPsmFhEccKJGZ1ge+
 CFKomU8OyK5zV40cA59+JgSOn2EZQUw4XutRHg==
X-Google-Smtp-Source: ABdhPJwLJlzlmPOVRB7WKK0qZ9/SZhKCK9XRN5xQd6mPkGwxMkeGWm/SWipPm0RU1P626dAzclwFX7nQ2tzbyDx7y90=
X-Received: by 2002:aa7:d550:: with SMTP id u16mr11816867edr.72.1621639091092; 
 Fri, 21 May 2021 16:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 22 May 2021 07:18:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-PKbYrREUccm5ZbTaMawpaZ7c=1zBbQBFfCZqfpu-1Hg@mail.gmail.com>
Message-ID: <CAAOTY_-PKbYrREUccm5ZbTaMawpaZ7c=1zBbQBFfCZqfpu-1Hg@mail.gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Mon, 24 May 2021 06:57:24 +0000
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-sunxi@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 06/11] drm/<driver>:
 drm_gem_plane_helper_prepare_fb is now the default
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

SGksIERhbmllbDoKCkRhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IOaWvCAy
MDIx5bm0NeaciDIx5pelIOmAseS6lCDkuIvljYg1OjEw5a+r6YGT77yaCj4KPiBObyBuZWVkIHRv
IHNldCBpdCBleHBsaWNpdGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IExhdXJlbnRpdSBQYWxjdSA8bGF1cmVudGl1LnBh
bGN1QG9zcy5ueHAuY29tPgo+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5k
ZT4KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgo+IENjOiBTYXNjaGEgSGF1
ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFt
IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdt
YWlsLmNvbT4KPiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+IENjOiBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBQYXVsIENlcmN1ZWls
IDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1
QGtlcm5lbC5vcmc+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5j
b20+Cj4gQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBDYzog
S2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KPiBDYzogSmVyb21lIEJydW5ldCA8
amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gQ2M6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54
LmRlPgo+IENjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiBDYzogU2FuZHkgSHVh
bmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KPiBDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250
ZWNoLmRlPgo+IENjOiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+
Cj4gQ2M6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbT4KPiBDYzog
QmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6IE1h
eGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPiBDYzogQWxleGFuZHJl
IFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogTWF4aW1lIFJpcGFy
ZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+
Cj4gQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+Cj4gQ2M6IEp5
cmkgU2FyaGEgPGp5cmkuc2FyaGFAaWtpLmZpPgo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9tYmFA
a2VybmVsLm9yZz4KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
Q2M6IGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4g
Q2M6IGxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1zdW54aUBsaXN0cy5saW51
eC5kZXYKCkZvciBNZWRpYXRlaywKQWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
