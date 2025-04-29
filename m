Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A642AA0BDC
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 14:41:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3A7CC78F63;
	Tue, 29 Apr 2025 12:41:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE25CC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 12:41:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 868F21FCE7;
 Tue, 29 Apr 2025 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745930513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+hOrEAhno7m4cQKlwlJmGm8Rj/tVEl/GuIX19J6c9EU=;
 b=fsC7jfN2Zzf6DQkEjpRic8pWM7yzcLOC/nuVX8wuoLYV8lJ6JT8vJzjRggXFLv3DaY5M+g
 bKS9DTcgGQb6UFWXFJadK88/OXkYFQ0U257kEblOQ+ZHiUU6v4GoGzvtCq8PumjxlHSYuc
 27ApFm3NfD1iUBHANI+nm1UTwLeB63hANnKucJ5eLvejapXSWgCWmG0dssIzqyuKQ59h5S
 HslL9buypFCZSx47sMrgoblrGoGYuvWptn/IPXPm1+L43A8deYah1v6XYWbtfzGRyj0VMv
 1J9LTFX3WHkiEUsuimis6TvaKT2VKjtodkvxzEc8KB6E/9Pu/RNom5r5TdqJLg==
Message-ID: <832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com>
Date: Tue, 29 Apr 2025 14:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeefjeevtedvgfeiueeuudegudetvdejvdeujeelhfefvdevkeduheettedtveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtledprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpt
 hhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
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
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 imx@lists.linux.dev, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: Re: [Linux-stm32] (subset) [PATCH v2 00/34] drm: convert all
 bridges to devm_drm_bridge_alloc()
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

CgpMZSAyOS8wNC8yMDI1IMOgIDExOjI3LCBMb3VpcyBDaGF1dmV0IGEgw6ljcml0wqA6Cj4gCj4g
T24gVGh1LCAyNCBBcHIgMjAyNSAyMDo1OTowNyArMDIwMCwgTHVjYSBDZXJlc29saSB3cm90ZToK
Pj4gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgWzBdIGlzIHRoZSBuZXcgQVBJIHRvIGFsbG9jYXRl
IGFuZCBpbml0aWFsaXplIGEgRFJNCj4+IGJyaWRnZSwgYW5kIHRoZSBvbmx5IG9uZSBzdXBwb3J0
ZWQgZnJvbSBub3cgb24uIEl0IGlzIGFsc28gbmVjZXNzYXJ5IGZvcgo+PiBpbXBsZW1lbnRpbmcg
cmVmZXJlbmNlIGNvdW50aW5nIGFuZCB0aHVzIG5lZWRlZCB0byBzdXBwb3J0IHJlbW92YWwgb2YK
Pj4gYnJpZGdlcyBmcm9tIGEgc3RpbGwgZXhpc3RpbmcgRFJNIHBpcGVsaW5lIHdpdGhvdXQgdXNl
LWFmdGVyLWZyZWUuCj4+Cj4+IFRoaXMgc2VyaWVzIGNvbnZlcnRzIGFsbCBEUk0gYnJpZGdlcyB0
byB0aGUgbmV3IEFQSS4KPj4KPj4gWy4uLl0KPiAKPiBBcHBsaWVkLCB0aGFua3MhCj4gCj4gWzAy
LzM0XSBwbGF0Zm9ybTogYXJtNjQ6IGFjZXItYXNwaXJlMS1lYzogY29udmVydCB0byBkZXZtX2Ry
bV9icmlkZ2VfYWxsb2MoKSBBUEkKPiAgICAgICAgICBjb21taXQ6IDQxMTQ2NWQzNWJjNTY4Nzdj
MzNlMjQ5OGFjNjk3YWNmY2Y0ODRlNmIKPiBbMDMvMzRdIGRybS9icmlkZ2U6IGFuYWxvZ2l4LWFu
eDYzNDU6IGNvbnZlcnQgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJCj4gICAgICAgICAg
Y29tbWl0OiA1M2RkZWIyNTE1OTc4MWIwMjlmZGE0MDQyMjZhZjYwMGU3NmY5NzVmCj4gWzA2LzM0
XSBkcm0vYnJpZGdlOiBkaXNwbGF5LWNvbm5lY3RvcjogY29udmVydCB0byBkZXZtX2RybV9icmlk
Z2VfYWxsb2MoKSBBUEkKPiAgICAgICAgICBjb21taXQ6IDRlOTBhM2Q5NmE2MTg1ZTE0MzA0MTI3
M2Y5ODY3YTEwOTJkZDRhNzEKPiBbMDcvMzRdIGRybS9icmlkZ2U6IGx0OTYxMXV4YzogY29udmVy
dCB0byBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBBUEkKPiAgICAgICAgICBjb21taXQ6IDYyODdm
ZmQ5ZWZmNmVlYTY1ODY1ZTY0YjlkNGM0NWUxMTVmYTVlY2YKPiBbMTEvMzRdIGRybS9icmlkZ2U6
IGR3LWhkbWk6IGNvbnZlcnQgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJCj4gICAgICAg
ICAgY29tbWl0OiBlZDY5ODdiNjc0MTg1ODczZWJlZDdhNjE5YTY0NmRhNmRkMWE3OGZhCj4gWzEy
LzM0XSBkcm0vYnJpZGdlOiB0ZGE5OTh4OiBjb252ZXJ0IHRvIGRldm1fZHJtX2JyaWRnZV9hbGxv
YygpIEFQSQo+ICAgICAgICAgIGNvbW1pdDogN2ZlNThiZjFhOWEyNGI1MzM4NzVjMjYyYTMyMjI1
ODFhM2Y3NTllNAo+IFsxMy8zNF0gZHJtL2JyaWRnZTogdGktc242NWRzaTg2OiBjb252ZXJ0IHRv
IGRldm1fZHJtX2JyaWRnZV9hbGxvYygpIEFQSQo+ICAgICAgICAgIGNvbW1pdDogYTQ3NTRhZTlj
ZmE3NmZiY2U3OWYwMjNjMjY4YTViYWM1NmYzNjMyMQo+IFsxNC8zNF0gZHJtL2V4eW5vczogbWlj
OiBjb252ZXJ0IHRvIGRldm1fZHJtX2JyaWRnZV9hbGxvYygpIEFQSQo+ICAgICAgICAgIGNvbW1p
dDogOTFjNWM3YjViYjJkZDA5YjQzYjAyNWJjZTZkNzkwZDNjNzlmNDUxOAoKSGVsbG8gYWxsLAoK
SSBtYWRlIGEgbWlzdGFrZSB3aGlsZSBhcHBseWluZyB0aG9zZSBwYXRjaGVzLiBJbnN0ZWFkIG9m
IHRha2luZyAKMi0zLDExLTEzLDE1LTE4LDI3LDMxLCBJIHRvb2sgMi0zLDExLTE4LDI3LDMxLCB3
aGljaCBpbmNsdWRlcyB0aGUgcGF0Y2ggMTQuCgpUaGlzIHBhdGNoIGlzIG5vdCBSLWJ5L0EtYnkv
U29CIGJ5IG5vbi1Cb290bGluIHBlb3BsZS4gRm9yIG1lLCB0aGUgcGF0Y2ggCmlzIGNvcnJlY3Qs
IGl0IGRvZXMgbm90IGJyZWFrIHRoZSBidWlsZCBub3IgZ2VuZXJhdGUgd2FybmluZ3MuCgpXaGF0
IHNob3VsZCBJIGRvPyBJcyBteSBTb0Igc3VmZmljaWVudCwgb3Igc2hvdWxkIEkgcmV2ZXJ0IHRo
ZSBwYXRjaCBhbmQgCndhaXQgZm9yIFIvQS1ieSBiZWZvcmUgdGFraW5nIGl0IGFnYWluPwoKU29y
cnkgZm9yIHRoaXMsCkxvdWlzIENoYXV2ZXQKCj4gWzE1LzM0XSBkcm0vbWNkZTogY29udmVydCB0
byBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBBUEkKPiAgICAgICAgICBjb21taXQ6IDQwYzI1Yjll
YzY0MWY0M2JhMTdjN2I3ODhhYzE2ZWMyM2Y4ZGFhYTgKPiBbMTYvMzRdIGRybS9tc20vZHA6IGNv
bnZlcnQgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJCj4gICAgICAgICAgY29tbWl0OiBi
MmFhYmU1YzZiNjU1MTZkODgyMTRhYmE0YjEyY2UyY2E3OGJhYzZjCj4gWzE3LzM0XSBkcm0vbXNt
L2RzaTogY29udmVydCB0byBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBBUEkKPiAgICAgICAgICBj
b21taXQ6IGZmZmM4ODQ3NzQzZTQ1NjA0YzQ0NzhmNTU0ZDYyODQ4MWI5ODU1NTYKPiBbMTgvMzRd
IGRybS9tc20vaGRtaTogY29udmVydCB0byBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBBUEkKPiAg
ICAgICAgICBjb21taXQ6IGUxMTUzMmJlODdlNDM3NjQ4NTIxYThlZDUzNThjNTZkZjExOTMzYjQK
PiBbMjcvMzRdIGRybS92YzQ6IGNvbnZlcnQgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJ
Cj4gICAgICAgICAgY29tbWl0OiA5NTQ1YzkxZWQ3NWZmNjVlMTE0NzYxYTc3MjlkZTBlMWI0NDBh
ZWM2Cj4gWzMxLzM0XSBkcm0vYnJpZGdlOiBpbXg4Ki1sZGI6IGNvbnZlcnQgdG8gZGV2bV9kcm1f
YnJpZGdlX2FsbG9jKCkgQVBJCj4gICAgICAgICAgY29tbWl0OiBlNzRiODRjZDgzOTYyZTM1NzMy
OWE2OTViYTM0OGIzZGZlMzczOTVjCj4gCj4gQmVzdCByZWdhcmRzLAoKLS0gCkxvdWlzIENoYXV2
ZXQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
