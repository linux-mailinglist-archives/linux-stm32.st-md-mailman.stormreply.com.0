Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE9DB18EA8
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Aug 2025 15:26:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF69DC36B15;
	Sat,  2 Aug 2025 13:26:55 +0000 (UTC)
Received: from flow-a5-smtp.messagingengine.com
 (flow-a5-smtp.messagingengine.com [103.168.172.140])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28E7FC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 13:26:54 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailflow.phl.internal (Postfix) with ESMTP id A87BC1380608;
 Sat,  2 Aug 2025 09:26:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Sat, 02 Aug 2025 09:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1754141212;
 x=1754148412; bh=bmI1hYqjksR+DRa8JSQk6MVH64W5+sLipA6UwCtocJY=; b=
 qqNUWLHW5NkgMWC7l9Ppuzcw0TRZVKBalVrpuNL2tWkSX16V+CaL/WD3GPRevH/3
 cOaqYuZWVehBMlqwkuJTQ3+7ee7mvoCmm57l/9y3kSLOhYi/j9UZL0baYRp5JOQM
 j4yp2XwkBPHkkHrQr9G2kPmFqob1bo+ge9yICVt/dsRrLU+xuJA6h9g8SW4qJPa0
 AHQH8Vz64gEdgI7kQ+1DTmePAvNbJQJxnWkGkDSZF/paCkDAzfIwxTUg+JfaHIca
 2uCTiijQTVgzLiuE6qwTC/es2iaY0ak3Q1yInsTplxnRcKjgCrvxpj+WvGFL/Gkm
 HIx11r/lg4cei6lIenYP+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754141212; x=
 1754148412; bh=bmI1hYqjksR+DRa8JSQk6MVH64W5+sLipA6UwCtocJY=; b=C
 LzPCjtSlWjEpgC9nck7IIN+a6VWM2T9KzMBiWo4CFmbf/c8EsbwRuyBR6zo43jFD
 hvyIbMP0zgOcLL+h4kub0bXZEqehHtgFY6sV9cwlFjffv+lGsEsKcJttU2+8fn3b
 kRALXojkwbX6H2IOxV2soFJHVIcKk6LuRbHAbjPhMXvWGeT7KA2Mau0LJLy4HAji
 lfgiUMmK9spCDs/oe1YGLozfqCHtXvx0XyirO7dloL77Fyd05IG6lp0ZwH1pUgeh
 FNabC3mgBC+9qZ25Drxy58dz8xR3lKKGectSGWS0hTtARs2FRFJmAX2nfNB3fKxO
 c360wFl1nKo7iNibIdOnQ==
X-ME-Sender: <xms:FhKOaIqzIVCCzZqyPT8S-Kuyp75Ghz90bD-sNWC1Ynb1xWuDhB2fgA>
 <xme:FhKOaAAM51hB_nYlCo1hgXLgPrXfAQsJTzEzSK29ONCez_BVzRWEnZ7YYfmVPVSd4
 mYWvtLYdmS8g_-J1io>
X-ME-Received: <xmr:FhKOaKNy3dovqvqjcZlMlmNulu_odOhDUh_OuI4TialffSqjpk1dXSXjcgxfsuv77hx6_icSG8wxq9Qphv3aDtPfT18v805RrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdeiieelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
 shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
 htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
 heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
 rghtvggthhdrshgvpdhnsggprhgtphhtthhopedutdehpdhmohguvgepshhmthhpohhuth
 dprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgt
 ohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 epuggvvhgrrhhshhhtsehtihdrtghomhdprhgtphhtthhopegsphgrrhhrohhtsehtihdr
 tghomhdprhgtphhtthhopehhvhgvrhhkuhhilheskhgvrhhnvghlrdhorhhgpdhrtghpth
 htohepihhsvghlhiesphhosghogidrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhp
 ihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohephhgrnh
 hsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrrhhthhhisggrnhdrvhgvvghr
 rghsohhorhgrnhesmhhitghrohgthhhiphdrtghomh
X-ME-Proxy: <xmx:FhKOaHAoXiF7NV692VGvUlBtEKV8Ppc7HpktTEwZStXxvUIyFnrhjw>
 <xmx:FhKOaIXbJEGFB6MyMI6SEvkY_tAqtZmQdwpF1CyYAg0cU-whIhajXA>
 <xmx:FhKOaOXdPk75wbqe7BRIpcNiWjQWCtbKZe7Hw0Dw9yRuHK1wn0wJ9A>
 <xmx:FhKOaA4w1OKh4y5m73fZ4TocrIIXqTtdAsWzkrmS8EjZZidpBDEFUw>
 <xmx:HBKOaGfprgDP-C4pCZ_BqeXWMGw4oENfGJWvHSy-BbRaGSp473jMOr6M>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Aug 2025 09:26:45 -0400 (EDT)
Date: Sat, 2 Aug 2025 15:26:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Message-ID: <20250802132643.GA1848717@ragnatech.se>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-17-eb140ddd6a9d@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250802-media-private-data-v1-17-eb140ddd6a9d@ideasonboard.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Steve Longerbeam <slongerbeam@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Nas Chung <nas.chung@chipsnmedia.com>, Andy Walls <awalls@md.metrocast.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-usb@vger.kernel.org,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Ming Qian <ming.qian@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-doc@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Dongliang Mu <dzm91@hust.edu.cn>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jerome Brunet <jbrunet@baylibre.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 linux-media@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, imx@lists.linux.dev,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Mike Isely <isely@pobox.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bin Liu <bin.liu@mediatek.com>,
 mjpeg-users@lists.sourceforge.net,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>, Tomasz Figa <tfiga@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Alex Shi <alexs@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 17/65] media: rcar-vin: Do not set
	file->private_data
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

SGkgSmFjb3BvLAoKVGhhbmtzIGZvciB5b3VyIGVmZm9ydCB0aWR5aW5nIHRoaW5ncyB1cCEKCk9u
IDIwMjUtMDgtMDIgMTE6MjI6MzkgKzAyMDAsIEphY29wbyBNb25kaSB3cm90ZToKPiBUaGUgUi1D
YXIgVklOIGRyaXZlciBzZXRzIGZpbGUtPnByaXZhdGVfZGF0YSB0byB0aGUgZHJpdmVyLXNwZWNp
ZmljCj4gc3RydWN0dXJlLCBidXQgdGhlIGZvbGxvd2luZyBjYWxsIHRvIHY0bDJfZmhfb3Blbigp
IG92ZXJ3cml0ZXMgaXQKPiB3aXRoIGEgcG9pbnRlciB0byB0aGUganVzdCBhbGxvY2F0ZWQgdjRs
Ml9maC4KPiAKPiBSZW1vdmUgdGhlIG1pcy1sZWFkaW5nIGFzc2lnbm1lbnQgaW4gdGhlIGRyaXZl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wby5tb25kaUBpZGVhc29u
Ym9hcmQuY29tPgoKUmV2aWV3ZWQtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJs
dW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPgoKPiAtLS0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9yZW5lc2FzL3JjYXItdmluL3JjYXItdjRsMi5jIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9y
ZW5lc2FzL3JjYXItdmluL3JjYXItdjRsMi5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5l
c2FzL3JjYXItdmluL3JjYXItdjRsMi5jCj4gaW5kZXggNjJlZGRmM2EzNWZjOTE0MzRjYjJlNTg0
YTAxODE5MzgwYTdhNmRkOC4uMDc5ZGJhZjAxNmMyNTEzOWUyYWM4MmJlNjNkOGZjZTBkMTFmZDIw
OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhci12aW4v
cmNhci12NGwyLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhci12
aW4vcmNhci12NGwyLmMKPiBAQCAtNTg4LDggKzU4OCw2IEBAIHN0YXRpYyBpbnQgcnZpbl9vcGVu
KHN0cnVjdCBmaWxlICpmaWxlKQo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl9wbTsKPiAgCj4g
LQlmaWxlLT5wcml2YXRlX2RhdGEgPSB2aW47Cj4gLQo+ICAJcmV0ID0gdjRsMl9maF9vcGVuKGZp
bGUpOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl91bmxvY2s7Cj4gCj4gLS0gCj4gMi40OS4w
Cj4gCgotLSAKS2luZCBSZWdhcmRzLApOaWtsYXMgU8O2ZGVybHVuZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
