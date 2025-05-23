Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC5FAC23B5
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 15:23:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 069B5C7A82A;
	Fri, 23 May 2025 13:23:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62952C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 13:23:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80E3043E92;
 Fri, 23 May 2025 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748006596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdDU2oRP8k2jUeSve/BOd06ch34w47FFumvJv+pxA64=;
 b=mZbEGMe25lkA6a1/A5PYNbESnCSL60bu6GbmptADGVwaEkiGNBcHGN8VrT72jRA/+HNkP4
 O/QwRUKwwl3xkt4gQ3Mrs7lKrRaKRz4fTUwt/DbNDv7ugEEzoi1dGDejSURTrPhZAOKVZL
 UYuYChVv7ASMlrgAyMynb3Hu9Ovs5zXPwNEjo60hL8sbBVmrDkv74b2ln1iasNoULv1Ksw
 tA2Y1gP38lTQKZNvYVM6ebTePuQP8PIROVBEJmhCXewn1NVtuepbzztVtobDhFgEQBqe6V
 8LOSAQYNXvNBh9HNPCzuX8wiU0bL+1nw3VrunFS4/yawaszCy5VqLmvRqmwd3g==
Date: Fri, 23 May 2025 15:23:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Inki Dae <daeinki@gmail.com>
Message-ID: <20250523152304.5c66e195@booty>
In-Reply-To: <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
 <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekleeiucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepleehpdhrtghpthhtohepuggrvghinhhkihesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhin
 hhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pin-yen Lin <treapking@chromium.org>, Ian Ray <ian.ray@gehealthcare.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Phong LE <ple@baylibre.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.co.uk>,
 linux-doc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Aradhya Bhatia <a-bhatia1@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Liu Ying <victor.liu@nxp.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Andy Yan <andy.yan@rock-chips.com>,
 imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Janne Grunau <j@jannau.net>, "Rob Herring \(Arm\)" <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
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

SGVsbG8gSW5raSwKCk9uIEZyaSwgMjMgTWF5IDIwMjUgMDA6MTE6MjQgKzA5MDAKSW5raSBEYWUg
PGRhZWlua2lAZ21haWwuY29tPiB3cm90ZToKCj4gSGVsbG8gTHVjYSBDZXJlc29saSwKPiAKPiAy
MDI164WEIDXsm5QgMjHsnbwgKOyImCkg7Jik7ZuEIDExOjIzLCBMdWNhIENlcmVzb2xpIDxsdWNh
LmNlcmVzb2xpQGJvb3RsaW4uY29tPuuLmOydtCDsnpHshLE6Cj4gPgo+ID4gSGVsbG8gTWF4aW1l
LCBTaGF3biwgTGl1LCBhbGwsCj4gPgo+ID4gT24gRnJpLCAwOSBNYXkgMjAyNSAxNTo1MzoyNiAr
MDIwMAo+ID4gTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4gd3JvdGU6
Cj4gPiAgCj4gPiA+IGRldm1fZHJtX2JyaWRnZV9hbGxvYygpIFswXSBpcyB0aGUgbmV3IEFQSSB0
byBhbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBhIERSTQo+ID4gPiBicmlkZ2UsIGFuZCB0aGUgb25s
eSBvbmUgc3VwcG9ydGVkIGZyb20gbm93IG9uLiBJdCBpcyB0aGUgZmlyc3QgbWlsZXN0b25lCj4g
PiA+IHRvd2FyZHMgcmVtb3ZhbCBvZiBicmlkZ2VzIGZyb20gYSBzdGlsbCBleGlzdGluZyBEUk0g
cGlwZWxpbmUgd2l0aG91dAo+ID4gPiB1c2UtYWZ0ZXItZnJlZS4gIAo+ID4KPiA+IEkgYXBwbGll
ZCBvbiBkcm0tbWlzYy1uZXh0IHBhdGNoZXMgMy0xNywyMC0yMSBhcyB0aGV5IG1hdGNoIGFsbCB0
aGUKPiA+IGNyaXRlcmlhOgo+ID4gIC0gQXQgbGVhc3QgYSBBY2tlZC1ieSAob3IgUi1ieSBtYWlu
dGFpbmVycykKPiA+ICAtIHBhdGNoIGlzIGZvciBkcm0tbWlzYwo+ID4KPiA+IEJlaW5nIG15IHZl
cnkgZmlyc3QgY29tbWl0cyB0byBkcm0tbWlzYywgSSB0cmllZCB0byBiZSBjYXJlZnVsLCBhbmQK
PiA+IGRvdWJsZSBjaGVja2VkIGFsbCB0aGUgcGF0Y2hlcyB3aXRoIExvdWlzICh0aGFua3MhKS4K
PiA+Cj4gPiBIZXJlIGFyZSB0aGUgcGVuZGluZyBxdWVzdGlvbnMgYW5kIHBsYW4gZm9yIHRoZSBy
ZW1haW5pbmcgcGF0Y2hlcy4KPiA+ICAKPiA+ID4gICAgICAgUmV2ZXJ0ICJkcm0vZXh5bm9zOiBt
aWM6IGNvbnZlcnQgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJIiAgCj4gPgo+ID4gVGhp
cyByZXZlcnRzIHRoZSBjb21taXQgYXBwbGllZCBteSBtaXN0YWtlOgo+ID4gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9taXNjL2tlcm5lbC8tL2NvbW1pdC85MWM1YzdiNWJiMmRk
MDliNDNiMDI1YmNlNmQ3OTBkM2M3OWY0NTE4Cj4gPgo+ID4gTmVpdGhlciB0aGUgIG9yaWdpbmFs
IHBhdGNoIG5vciB0aGUgcmV2ZXJ0IGhhcyBiZWVuIHJldmlld2VkL2Fja2VkLgo+ID4KPiA+IEFz
IHRoZSBjb21taXQgd2FzIGEgbWlzdGFrZSwgSSdtIGFwcGx5aW5nIHRoZSByZXZlcnQgYnkgdGhl
IGVuZCBvZiB0aGlzCj4gPiB3ZWVrIChpLmUuIG9uIEZyaWRheSkgdW5sZXNzIHRoZXJlIGFyZSBi
ZXR0ZXIgaW5zdHJ1Y3Rpb25zLiAgCj4gCj4gUmVhbGx5IHNvcnJ5IGZvciBsYXRlLiBJIHdhcyBt
YWRlIGF3YXJlIG9mIGl0IGxhdGVyIHRocm91Z2ggYQo+IGNvbGxlYWd1ZSdzIHJlbWFyay4gVGhl
cmUgaXMgbm8gbmVlZCB0byBwcm9jZWVkIHdpdGggdGhlIHJldmVydC4KPiBBY2tlZC1ieSA6IElu
a2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBB
cyBhZ3JlZWQgd2l0aCBNYXhpbWUgYW5kIGFwcHJvdmVkIGJ5IHlvdSwgSSdtCmxlYXZpbmcgdGhl
IGNvbW1pdCBhcyBpcywgd2l0aG91dCByZXZlcnRpbmcgYW5kIHJlYXBwbHlpbmcuIFlvdXIKQWNr
ZWQtYnkgaXMgaW4gdGhlIHJlY29yZHMgYW55d2F5LCBzbyBzb21laG93IHJlYWNoYWJsZSBpbiBj
YXNlIG9mIG5lZWQuCgpMdWNhCgotLSAKTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
