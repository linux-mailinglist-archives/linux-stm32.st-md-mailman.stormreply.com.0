Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F538E2BE
	for <lists+linux-stm32@lfdr.de>; Mon, 24 May 2021 10:52:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8687CC57B6B;
	Mon, 24 May 2021 08:52:10 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5619FC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 May 2021 07:54:40 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0ABD71315;
 Mon, 24 May 2021 09:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621842878;
 bh=nQQLNOZHnWiuc9bVbNIPySsUX8BVfY7zKLqSjjjmqow=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eP/n0p6WGzQZageTDgh+AhAcs/g5Ue1NYt36d3FWKJQJaTvUMj3hrq8+fQwTDYsqg
 Qiwo2GzlBbrg64RXzSwS8WGOPR2HHdLSIbrjQa3SmUmIPz8qikHGRXxlQgTdAuSvZD
 m5qtsfBYdKDyEA1AOMNDxtttFSFlN8wpwtRhKuuM=
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <71ba0c85-be5d-21f9-6817-9848dafde6ea@ideasonboard.com>
Date: Mon, 24 May 2021 10:54:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 May 2021 08:52:09 +0000
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
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
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-sunxi@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjEvMDUvMjAyMSAxMjowOSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBObyBuZWVkIHRvIHNl
dCBpdCBleHBsaWNpdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBMYXVyZW50aXUgUGFsY3UgPGxhdXJlbnRpdS5wYWxj
dUBvc3MubnhwLmNvbT4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+
Cj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KPiBDYzogU2FzY2hhIEhhdWVy
IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8
a2VybmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFp
bC5jb20+Cj4gQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KPiBDYzogUGhp
bGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogUGF1bCBDZXJjdWVpbCA8
cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBr
ZXJuZWwub3JnPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29t
Pgo+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IEtl
dmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+Cj4gQ2M6IEplcm9tZSBCcnVuZXQgPGpi
cnVuZXRAYmF5bGlicmUuY29tPgo+IENjOiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5k
ZT4KPiBDYzogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Cj4gQ2M6IFNhbmR5IEh1YW5n
IDxoamNAcm9jay1jaGlwcy5jb20+Cj4gQ2M6ICJIZWlrbyBTdMO8Ym5lciIgPGhlaWtvQHNudGVj
aC5kZT4KPiBDYzogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+
IENjOiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAZm9zcy5zdC5jb20+Cj4gQ2M6IEJl
bmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBNYXhp
bWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4gQ2M6IEFsZXhhbmRyZSBU
b3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQg
PG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+
IENjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgo+IENjOiBKeXJp
IFNhcmhhIDxqeXJpLnNhcmhhQGlraS5maT4KPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWJhQGtl
cm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBDYzogbGludXgtc3VueGlAbGlzdHMubGludXgu
ZGV2Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1wbGFuZS5jICAgICAg
IHwgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgICAgICAgICAgIHwg
MSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYyAgIHwgMSAt
Cj4gICBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWlwdS5jICAgICAgIHwgMSAtCj4g
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jICAgIHwgMSAtCj4gICBk
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fb3ZlcmxheS5jICAgICAgIHwgMSAtCj4gICBkcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcGxhbmUuYyAgICAgICAgIHwgMSAtCj4gICBkcml2ZXJz
L2dwdS9kcm0vbXhzZmIvbXhzZmJfa21zLmMgICAgICAgICAgIHwgMiAtLQo+ICAgZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8IDEgLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMgICAgICAgICAgICAgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjRpX2xheWVyLmMgICAgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX3VpX2xheWVyLmMgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjhpX3ZpX2xheWVyLmMgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL3RpZHNzL3Rp
ZHNzX3BsYW5lLmMgICAgICAgICB8IDEgLQo+ICAgMTQgZmlsZXMgY2hhbmdlZCwgMTUgZGVsZXRp
b25zKC0pCgpGb3IgdGlkc3M6CgpBY2tlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQGlkZWFzb25ib2FyZC5jb20+CgogIFRvbWkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
