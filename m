Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C8A9F5E6
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 18:34:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 773BBC78011;
	Mon, 28 Apr 2025 16:34:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F1D5CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 16:34:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F39DA43962;
 Mon, 28 Apr 2025 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745858053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+W4uodyxoQUQ7gTcLqHUOqlDvIcEkj4yx+1gWHy3Mc=;
 b=A5vI5CPAhG7Ec31vAslCrct99yDYQUT4yEVpjGag1L5A3ypdDOeM06X6a2NpNi4YWnE6mC
 2NyQNklaS4GH5N+Y0O0KorENjPo6XmIKRUe43hr2bljZ9KcS30qPhwmXIPUFXXOTPm5XIu
 n26mA6Au7+KoHn580KonEgnc/bZs1s5A97JkVcqC4ISpJzXNYjj+t+twS22sMPY2EzjhQZ
 iio59hjvBN4KHAeTHadmXNHM9e/08/R+WKLujQCoy1O7rhd/OkZ8uYxTFLAP+7H0ewrqHT
 6PMrAxpgk6up77rZyTiJAqPjC9S4tcckhsI1eEGu3LR+due+PAeNxJSMadl6Qw==
Date: Mon, 28 Apr 2025 18:33:58 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20250428183358.4d28ca6a@booty>
In-Reply-To: <20250428-colossal-fiery-alpaca-8c5fee@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250428172457.23e23df5@booty>
 <20250428-colossal-fiery-alpaca-8c5fee@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtkedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmr
 ghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Herve Codina <herve.codina@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Inki Dae <inki.dae@samsung.com>, Pin-yen Lin <treapking@chromium.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>, Christoph Fritz <chf.fritz@googlemail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Guenter Roeck <groeck@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Helge Deller <deller@gmx.de>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Ian Ray <ian.ray@ge.com>, Dharma Balasubiramani <dharma.b@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-amlogic@lists.infradead.org, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Aleksandr Mishin <amishin@t-argos.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Janne Grunau <j@jannau.net>, Russell King <linux@armlinux.org.uk>,
 "Rob Herring \(Arm\)" <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
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

SGkgTWF4aW1lLAoKT24gTW9uLCAyOCBBcHIgMjAyNSAxNzo0Mjo0NiArMDIwMApNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBNb24sIEFwciAyOCwgMjAyNSBh
dCAwNToyNDo1N1BNICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOgo+ID4gSGkgTWF4aW1lLCBv
dGhlciBEUk0gbWFpbnRhaW5lcnMsCj4gPiAKPiA+IE9uIFRodSwgMjQgQXByIDIwMjUgMjA6NTk6
MDcgKzAyMDAKPiA+IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IHdy
b3RlOgo+ID4gICAKPiA+ID4gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgWzBdIGlzIHRoZSBuZXcg
QVBJIHRvIGFsbG9jYXRlIGFuZCBpbml0aWFsaXplIGEgRFJNCj4gPiA+IGJyaWRnZSwgYW5kIHRo
ZSBvbmx5IG9uZSBzdXBwb3J0ZWQgZnJvbSBub3cgb24uIEl0IGlzIGFsc28gbmVjZXNzYXJ5IGZv
cgo+ID4gPiBpbXBsZW1lbnRpbmcgcmVmZXJlbmNlIGNvdW50aW5nIGFuZCB0aHVzIG5lZWRlZCB0
byBzdXBwb3J0IHJlbW92YWwgb2YKPiA+ID4gYnJpZGdlcyBmcm9tIGEgc3RpbGwgZXhpc3Rpbmcg
RFJNIHBpcGVsaW5lIHdpdGhvdXQgdXNlLWFmdGVyLWZyZWUuCj4gPiA+IAo+ID4gPiBUaGlzIHNl
cmllcyBjb252ZXJ0cyBhbGwgRFJNIGJyaWRnZXMgdG8gdGhlIG5ldyBBUEkuCj4gPiA+IAo+ID4g
PiBQYXRjaCAxIHVzZXMgYSBjb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoIHRvIG1hc3MtY29udmVy
dCBzb21lIG9mIHRob3NlCj4gPiA+IGRyaXZlcnMgLS0gdGhhbmtzIE1heGltZSBmb3IgaGF2aW5n
IHN1Z2dlc3RlZCB0aGUgcGF0Y2ggdGhhdCBzZXJ2ZWQgYXMgYQo+ID4gPiBzdGFydGluZyBwb2lu
dCBmb3IgbWUuIEkgd2FzIHVuYWJsZSB0byBjb21lIHVwIHdpdGggYSBiZXR0ZXIgcGF0Y2gKPiA+
ID4gY29udmVydGluZyBtb3JlIGRyaXZlcnMgdGhvdWdoLCBzbyBJIGNvbnZlcnRlZCBhbGwgb3Ro
ZXJzIG1hbnVhbGx5LiBNb3N0IG9mCj4gPiA+IHRoZW0gd2VyZSB0cml2aWFsLiBJIGxlZnQgdGhl
IG5vbi10cml2aWFsIG9uZXMgYXQgdGhlIGVuZCBvZiB0aGUgc2VyaWVzIHRvCj4gPiA+IGhlbHAg
cmV2aWV3ZXJzIGtub3cgd2hlcmUgdG8gbG9vayBhdCBtb3JlIGNhcmVmdWxseS4KPiA+ID4gCj4g
PiA+IER1ZSB0byB0aGUgbGFyZ2UgbnVtYmVyIG9mIHRvdWNoZWQgZmlsZXMsIHRoZSBsaXN0IG9m
IHJlY2lwaWVudHMgZ2VuZXJhdGVkCj4gPiA+IGJ5IGdldF9tYWludGFpbmVycyAoYjQgYWN0dWFs
bHkpIHdhcyBodWdlLCA2MH43MCBwZW9wbGUgKG5vdCBjb3VudGluZwo+ID4gPiBtYWlsaW5nIGxp
c3RzKSwgc28gSSB0b29rIHRoZSBsaWJlcnR5IG9mIHRyaW1taW5nIHRoZSBsaXN0IGFzIHJlYXNv
bmFibHkgYXMKPiA+ID4gSSBjb3VsZCB0byBEUk0gbWFpbnRhaW5lcnMgYW5kIGZyZXF1ZW50IGNv
bnRyaWJ1dG9ycywgYW5kIGFkZGVkIGFsbCBvdGhlcgo+ID4gPiByZWNpcGllbnRzIGluZGl2aWR1
YWxseSBwZXItcGF0Y2guIEkgaG9wZSB0aGlzIGlzIGZpbmUuIERvbid0IGhlc2l0YXRlIHRvCj4g
PiA+IHN1Z2dlc3QgbW9yZSBwZW9wbGUgd2hpY2ggc2hvdWxkIGJlIENjLWVkIGluIGEgZnV0dXJl
IHNlcmllcywgb3IgYSBiZXR0ZXIKPiA+ID4gQ2MgcG9saWN5Lgo+ID4gPiAKPiA+ID4gQ3VycmVu
dCBwbGFuIGFuZCBzdGF0dXMgb2YgdGhlIERSTSBicmlkZ2UgcmVmY291bnRpbmcgd29yazoKPiA+
ID4gCj4gPiA+ICBBLiDinJQgYWRkIG5ldyBhbGxvYyBBUEkgYW5kIHJlZmNvdW50aW5nIC0+IChu
b3cgaW4gZHJtLW1pc2MtbmV4dCkKPiA+ID4gIEIuIOKenCBjb252ZXJ0IGFsbCBicmlkZ2UgZHJp
dmVycyB0byBuZXcgQVBJICh0aGlzIHNlcmllcykKPiA+ID4gIEMuIOKApiBkb2N1bWVudGF0aW9u
LCBrdW5pdCB0ZXN0cywgZGVidWdmcyBpbXByb3ZlbWVudHMgKHYxIHVuZGVyIGRpc2N1c3Npb24p
Cj4gPiA+ICBELiBhZnRlciAoQiksIGFkZCBnZXQvcHV0IHRvIGRybV9icmlkZ2VfYWRkL3JlbW92
ZSgpICsgYXR0YWNoL2RldGVjaCgpCj4gPiA+ICBFLiBhZnRlciAoQiksIGNvbnZlcnQgYWNjZXNz
b3JzOyB0aGlzIGlzIGEgbGFyZ2Ugd29yayBhbmQgY2FuIGJlIGRvbmUKPiA+ID4gICAgIGluIGNo
dW5rcyAgCj4gPgo+ID4gTWFpbnRhaW5pbmcgdGhpcyBsb25nIHNlcmllcyBpcyBxdWl0ZSBwYWlu
ZnVsLiBEbyB5b3UgdGhpbmsgYXQgbGVhc3QKPiA+IHBhdGNoZXMgd2l0aCBhIFItYnkgb3IgVC1i
eSB0YWcgY291bGQgYmUgbWVyZ2VkIGJlZm9yZSBJIHNlbmQgdjMsIHNvCj4gPiB3ZSBjYW4gcmVs
aWV2ZSB0aGUgbWFpbnRlbmFuY2UgZWZmb3J0LCBtYWlsIHNlcnZlcnMsIGFuZCBldmVyeWJvZHkn
cwo+ID4gaW5ib3hlcz8gIAo+IAo+IFllcz8KPiAKPiBXaGF0J3Mgc3RvcHBpbmcgeW91IHRob3Vn
aD8gWW91IGhhdmUgYXQgbGVhc3QgYSBjb2xsZWFndWUgdGhhdCBjYW4gYXBwbHkKPiB0aGVtLCBh
bmQgeW91IGNvdWxkIGp1c3QgYXMgd2VsbCBhcHBseSBmb3IgY29tbWl0IHJpZ2h0cyB5b3Vyc2Vs
Zi4KCk9LLCB0aGFua3MuIFdpbGwgZG8uCgpUaGUgcmVhc29uIEkgaGF2ZW4ndCBkb25lIGl0IGlz
IHRoaXMgcG9saWN5IGluIERSTSBzdGlsbCBhcHBlYXJzIGEgYml0CnVudXN1YWwgdG8gbWUsIGJ1
dCBpZiBpdCB3b3JrcyBmb3IgRFJNIEknbSBPSyB3aXRoIGl0LiBPbmx5LCBpbiBjYXNlIG9mCmRv
dWJ0LCBJIGRpZG4ndCB3YW50IHRvIHJpc2sgYWJ1c2luZyBvZiB0aGUgY29tbWl0IHJpZ2h0cy4K
CkJlc3QgcmVnYXJkcywKTHVjYQoKLS0gCkx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
