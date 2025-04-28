Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C09A9F45A
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 17:25:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66DB8C78011;
	Mon, 28 Apr 2025 15:25:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 707F6CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 15:25:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC76741E0D;
 Mon, 28 Apr 2025 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745853912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hN9Ynenyf1lRwHEK1Ce+hj/6WjWz5+RthwslvM5GjFo=;
 b=LV0tZSB62q9TVFOERPpjO3INFWfz2QMz0oWE+LlhDcLv9EgOWZ7NQ5eLzpn3F8Mzrgl1e3
 nNK9OtTJ1ht4xvXuIW7jZkttywFk7xJK1wXH6DeT9gKSLK2Iyur1Jw275KFjuE/jAOm7BB
 cCMTHsvVHX4v2dGFMoRyVfT4/iThms1irlOHZt3KTM9ytNFzFkn6gljWTBL7iqNte8EpZ4
 SfF39hJSM8ArCDoKhd8wPfZUWZ2CTfqqjd0JKkWt49+2kE4Y9h8iMDRWSwQDWeEgqA0jhC
 H8khpWMEI7piNFV0f0373e9AG1/Pz9kSsOS/Q/sXMeefskBk4KQMnNoOb4YfMQ==
Date: Mon, 28 Apr 2025 17:24:57 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>
Message-ID: <20250428172457.23e23df5@booty>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtkedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Anusha Srivatsa <asrivats@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 Inki Dae <inki.dae@samsung.com>, Pin-yen Lin <treapking@chromium.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>, Christoph Fritz <chf.fritz@googlemail.com>,
 freedreno@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.co.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Helge Deller <deller@gmx.de>, Paul Kocialkowski <paulk@sys-base.io>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Ian Ray <ian.ray@ge.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 "Rob Herring \(Arm\)" <robh@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 imx@lists.linux.dev, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Adam Ford <aford173@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Janne Grunau <j@jannau.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Russell King <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v2 00/34] drm: convert all bridges to
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

SGkgTWF4aW1lLCBvdGhlciBEUk0gbWFpbnRhaW5lcnMsCgpPbiBUaHUsIDI0IEFwciAyMDI1IDIw
OjU5OjA3ICswMjAwCkx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IHdy
b3RlOgoKPiBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBbMF0gaXMgdGhlIG5ldyBBUEkgdG8gYWxs
b2NhdGUgYW5kIGluaXRpYWxpemUgYSBEUk0KPiBicmlkZ2UsIGFuZCB0aGUgb25seSBvbmUgc3Vw
cG9ydGVkIGZyb20gbm93IG9uLiBJdCBpcyBhbHNvIG5lY2Vzc2FyeSBmb3IKPiBpbXBsZW1lbnRp
bmcgcmVmZXJlbmNlIGNvdW50aW5nIGFuZCB0aHVzIG5lZWRlZCB0byBzdXBwb3J0IHJlbW92YWwg
b2YKPiBicmlkZ2VzIGZyb20gYSBzdGlsbCBleGlzdGluZyBEUk0gcGlwZWxpbmUgd2l0aG91dCB1
c2UtYWZ0ZXItZnJlZS4KPiAKPiBUaGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgRFJNIGJyaWRnZXMg
dG8gdGhlIG5ldyBBUEkuCj4gCj4gUGF0Y2ggMSB1c2VzIGEgY29jY2luZWxsZSBzZW1hbnRpYyBw
YXRjaCB0byBtYXNzLWNvbnZlcnQgc29tZSBvZiB0aG9zZQo+IGRyaXZlcnMgLS0gdGhhbmtzIE1h
eGltZSBmb3IgaGF2aW5nIHN1Z2dlc3RlZCB0aGUgcGF0Y2ggdGhhdCBzZXJ2ZWQgYXMgYQo+IHN0
YXJ0aW5nIHBvaW50IGZvciBtZS4gSSB3YXMgdW5hYmxlIHRvIGNvbWUgdXAgd2l0aCBhIGJldHRl
ciBwYXRjaAo+IGNvbnZlcnRpbmcgbW9yZSBkcml2ZXJzIHRob3VnaCwgc28gSSBjb252ZXJ0ZWQg
YWxsIG90aGVycyBtYW51YWxseS4gTW9zdCBvZgo+IHRoZW0gd2VyZSB0cml2aWFsLiBJIGxlZnQg
dGhlIG5vbi10cml2aWFsIG9uZXMgYXQgdGhlIGVuZCBvZiB0aGUgc2VyaWVzIHRvCj4gaGVscCBy
ZXZpZXdlcnMga25vdyB3aGVyZSB0byBsb29rIGF0IG1vcmUgY2FyZWZ1bGx5Lgo+IAo+IER1ZSB0
byB0aGUgbGFyZ2UgbnVtYmVyIG9mIHRvdWNoZWQgZmlsZXMsIHRoZSBsaXN0IG9mIHJlY2lwaWVu
dHMgZ2VuZXJhdGVkCj4gYnkgZ2V0X21haW50YWluZXJzIChiNCBhY3R1YWxseSkgd2FzIGh1Z2Us
IDYwfjcwIHBlb3BsZSAobm90IGNvdW50aW5nCj4gbWFpbGluZyBsaXN0cyksIHNvIEkgdG9vayB0
aGUgbGliZXJ0eSBvZiB0cmltbWluZyB0aGUgbGlzdCBhcyByZWFzb25hYmx5IGFzCj4gSSBjb3Vs
ZCB0byBEUk0gbWFpbnRhaW5lcnMgYW5kIGZyZXF1ZW50IGNvbnRyaWJ1dG9ycywgYW5kIGFkZGVk
IGFsbCBvdGhlcgo+IHJlY2lwaWVudHMgaW5kaXZpZHVhbGx5IHBlci1wYXRjaC4gSSBob3BlIHRo
aXMgaXMgZmluZS4gRG9uJ3QgaGVzaXRhdGUgdG8KPiBzdWdnZXN0IG1vcmUgcGVvcGxlIHdoaWNo
IHNob3VsZCBiZSBDYy1lZCBpbiBhIGZ1dHVyZSBzZXJpZXMsIG9yIGEgYmV0dGVyCj4gQ2MgcG9s
aWN5Lgo+IAo+IEN1cnJlbnQgcGxhbiBhbmQgc3RhdHVzIG9mIHRoZSBEUk0gYnJpZGdlIHJlZmNv
dW50aW5nIHdvcms6Cj4gCj4gIEEuIOKclCBhZGQgbmV3IGFsbG9jIEFQSSBhbmQgcmVmY291bnRp
bmcgLT4gKG5vdyBpbiBkcm0tbWlzYy1uZXh0KQo+ICBCLiDinpwgY29udmVydCBhbGwgYnJpZGdl
IGRyaXZlcnMgdG8gbmV3IEFQSSAodGhpcyBzZXJpZXMpCj4gIEMuIOKApiBkb2N1bWVudGF0aW9u
LCBrdW5pdCB0ZXN0cywgZGVidWdmcyBpbXByb3ZlbWVudHMgKHYxIHVuZGVyIGRpc2N1c3Npb24p
Cj4gIEQuIGFmdGVyIChCKSwgYWRkIGdldC9wdXQgdG8gZHJtX2JyaWRnZV9hZGQvcmVtb3ZlKCkg
KyBhdHRhY2gvZGV0ZWNoKCkKPiAgRS4gYWZ0ZXIgKEIpLCBjb252ZXJ0IGFjY2Vzc29yczsgdGhp
cyBpcyBhIGxhcmdlIHdvcmsgYW5kIGNhbiBiZSBkb25lCj4gICAgIGluIGNodW5rcwo+IAo+IEx1
Y2EKPiAKPiBbMF0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9taXNjL2tlcm5l
bC8tL2NvbW1pdC8wY2M2YWFkZDdmYzFlNjI5YjcxNWVhM2QxYmE1MzdlZjJkYTk1ZWVjCj4gCj4g
U2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4K
Ck1haW50YWluaW5nIHRoaXMgbG9uZyBzZXJpZXMgaXMgcXVpdGUgcGFpbmZ1bC4gRG8geW91IHRo
aW5rIGF0IGxlYXN0CnBhdGNoZXMgd2l0aCBhIFItYnkgb3IgVC1ieSB0YWcgY291bGQgYmUgbWVy
Z2VkIGJlZm9yZSBJIHNlbmQgdjMsIHNvIHdlCmNhbiByZWxpZXZlIHRoZSBtYWludGVuYW5jZSBl
ZmZvcnQsIG1haWwgc2VydmVycywgYW5kIGV2ZXJ5Ym9keSdzCmluYm94ZXM/CgpPdGhlcndpc2Ug
SSBjb3VsZCBzcGxpdCB0aGlzIHNlcmllcyBpbiBwYXJ0cyBzb21ld2hhdCBhcmJpdHJhcmlseSwg
YnV0CnRoYXQgaXMgYW4gYWRkaXRpb25hbCB3b3JrIG9uIGl0cyBvd24gYW5kIGlzIG5vdCBhIHBl
cmZlY3Qgc29sdXRpb24gYXMKaXQgd291bGQgbm90IHByb3ZpZGUgdGhlIGJpZyBwaWN0dXJlLgoK
QmVzdCByZWdhcmRzLApMdWNhCgotLSAKTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
