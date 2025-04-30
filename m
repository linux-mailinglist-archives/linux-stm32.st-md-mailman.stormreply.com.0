Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FCAA51D2
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 18:42:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD583C78032;
	Wed, 30 Apr 2025 16:42:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1982AC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 16:42:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BA1E43B4C;
 Wed, 30 Apr 2025 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746031343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpjn8puFQ4rZGChqXBtSZDUYu+Gnq25CP/ziHwcqLbg=;
 b=R78+NOp5gZIYtuRu5VllzkmYwx7C4ExRP6oGMuj+y1Pous6ww+7Ql2UM7ZVR3eAlcgxjhe
 EL8gclRNV+2dQKCHLAwdz+o8e56pdOmAiN7cV69NhlIZ1Qg0rsw+h7L9j1342ejfKdHVKD
 uE60s+5+nsGoETsCeR1S1VmV/agvwj5nqxaJnNF7Lp4/7VVVRHJA5YBJi9V4npOFPIuj/Y
 GYnhX6Vi++Zo8p3uGplK/jU12s6/vcqsRHpTUVKPOD8igRoMeiILoeJRB7IcyZ7wXP/otR
 dWt4vNk84a/q5dbz7ZmTEiiyrfsjSALHZCtQKQ9krgHLd9WIsAwh58D1xVRdnQ==
Date: Wed, 30 Apr 2025 18:42:14 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20250430184214.0b53dc6b@booty>
In-Reply-To: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
 <20250430123557.3d8b1de4@booty>
 <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieekpdhrtghpthhtohepughirghnuggvrhhssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghru
 geskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vitalii Mordan <mordan@ispras.ru>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Paul Kocialkowski <paulk@sys-base.io>, platform-driver-x86@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Simona Vetter <simona@ffwll.ch>, chrome-platform@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Janne Grunau <j@jannau.net>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Phong LE <ple@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jesse Van Gavere <jesseevg@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Christoph Fritz <chf.fritz@googlemail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>
Subject: Re: [Linux-stm32] [PATCH v2 01/34] drm: convert many bridge drivers
 from devm_kzalloc() to devm_drm_bridge_alloc() API
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

SGVsbG8gRG91ZywKCk9uIFdlZCwgMzAgQXByIDIwMjUgMDg6NTE6NTIgLTA3MDAKRG91ZyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKCj4gSGksCj4gCj4gT24gV2VkLCBB
cHIgMzAsIDIwMjUgYXQgMzozNuKAr0FNIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9v
dGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IEhlbGxvIERvdWcsCj4gPgo+ID4gT24gTW9uLCAyOCBB
cHIgMjAyNSAxMzo1OTo1MCAtMDcwMAo+ID4gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21p
dW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBbLi4uXQo+ID4gIAo+ID4gPiBSZXZpZXdlZC1ieTogRG91
Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiAjIHBhcmFkZS1wczg2NDAKPiA+
ID4gVGVzdGVkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+ICMg
cGFyYWRlLXBzODY0MCAgCj4gPgo+ID4gVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyEKPiA+Cj4g
PiBIb3dldmVyIEknbGwgYmUgc2VuZGluZyB2MyB3aXRoIHNvbWUgZGlmZmVyZW5jZXMgdy5yLnQu
IHYyLCBpbiBvcmRlciB0bwo+ID4gZml4IHRoZSAzIGJ1Z3MgcmVwb3J0ZWQgYnkgQW5keSBZYW4g
cGx1cyBhIHNpbWlsYXIgb25lIEkgc3BvdHRlZC4gVGhlCj4gPiBmaXgganVzdCBpcyByZXBsYWNp
bmcgUFRSX0VSUigpIHdpdGggRVJSX0NBU1QoKSBpbiB0aGUgNCBjYXNlcyB3aGVyZSB0aGUKPiA+
IGludm9sdmVkIGZ1bmN0aW9uIGlzIHJldHVybmluZyBhIHBvaW50ZXIgaW5zdGVhZCBvZiBhbiBp
bnQuCj4gPgo+ID4gWW91ciByZXZpZXcvdGVzdCB0YWdzIGFwcGVhciBnbG9iYWwgdG8gdGhlIHdo
b2xlIHBhdGNoLCB0aHVzIGJlaW5nIHRoZQo+ID4gcGF0Y2ggZGlmZmVyZW50IEkgdGhpbmsgSSBj
YW5ub3QgaW5jbHVkZSB5b3VyIHRhZ3MgaW4gdjMuCj4gPgo+ID4gTGV0IG1lIGtub3cgaWYgeW91
IHRoaW5rIEkgc2hvdWxkIGRvIGRpZmZlcmVudGx5Lgo+ID4KPiA+IFNvcnJ5IGFib3V0IHRoYXQu
ICAKPiAKPiBJdCdzIGZpbmUgaWYgeW91IHdhbnQgdG8gZHJvcCBteSB0YWcuIEkgZGlkbid0IGhh
dmUgdGltZSB0byByZXZpZXcgdGhlCj4gd2hvbGUgdGhpbmcgYnV0IEkgZmVsdCBsaWtlIEkgc2hv
dWxkIGF0IGxlYXN0IHJldmlldyB0aGUgZHJpdmVycyBJJ20KPiBzaWduZWQgdXAgYXMgYSByZXZp
ZXdlciBmb3IuIFRoYXQgYmVpbmcgc2FpZCwgSSdtIG5vdCBjb3VudGluZyB0YWdzIG9yCj4gYW55
dGhpbmcgc28gSSdtIG5vdCBvZmZlbmRlZCBpZiB0aGV5J3JlIGRyb3BwZWQuCj4gCj4gTXkgdW5k
ZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBoYXNodGFnIGF0IHRoZSBlbmQgaXMgYXQgbGVhc3QgYQo+
IHNlbWktc3RhbmRhcmQgd2F5IHRvIHNheSB0aGF0IG15IHRhZyBvbmx5IGFwcGxpZXMgdG8gYSBz
bWFsbCBwYXJ0IG9mCj4gdGhlIHBhdGNoLCBzbyBpdCBzZWVtcyBsaWtlIGl0IHdvdWxkIGJlIE9L
IHRvIGNhcnJ5IGl0LCB0aG91Z2guLi4KCk9oIGRlYXIuIEkgd2FzIHNvIHN0dXBpZC4gSSBoYWQg
bm90IHNlZW4gdGhlIGNvbW1lbnQgaW4geW91ciB0YWcKbGluZXMuLi4gOi18CgpTbyBpdCdzIGZp
bmUsIEknbGwga2VlcCB5b3VyIHRhZ3MgYXMgdGhlIHBhcmFkZSBkcml2ZXIgaXMgbm90IG1vZGlm
aWVkCmluIHYzLgoKU29ycnkgYWJvdXQgdGhlIG5vaXNlLgoKTHVjYQoKLS0gCkx1Y2EgQ2VyZXNv
bGksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
