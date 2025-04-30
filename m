Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D37AA503B
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 17:30:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B0C8C78032;
	Wed, 30 Apr 2025 15:30:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B56B3C78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 15:30:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 755091FCE8;
 Wed, 30 Apr 2025 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746027019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MWTikn/fQ2RO7hkcmPhgG/ZXL82CYY7laDHZMAqZbk4=;
 b=Uir+I69QY6ooynZyuoSsowjneB2XH3l3Jk31xfvPk7NfkeG0T4UNGi5tZv+hSgbjL48SIT
 9a/pXrag0U0RuVm9Y+XN1GZ5Ka+8SLhalf7X5Lp3hvzRqzhczzNO2E5VpaxWuLITE/ZUBu
 f4bSIVCD3keI9rqPgY0L8j76IhX1bQsYC1pUyone7YHiu4mB/uk93Z5Xy8StTQtsjvNNXt
 SVrVpp3+N8Fbq+6rC5hT95fFKdIUe2vOip5g5CiLSuDbzMUGQJ6OOpBxLVqT56Lyz/sqxM
 KcEaKhuNA1cWG2UBLpWqeFrSV9D2KwzRaYA3mEAqSXFsbNlDzr8QJvYjPNsKwA==
Message-ID: <207e2908-62ce-470f-9077-c5709d3e1a6a@bootlin.com>
Date: Wed, 30 Apr 2025 17:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Ripard <mripard@kernel.org>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
 <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
 <efcf3798-9ac1-42a7-8a12-24d931cbf771@bootlin.com>
 <20250430-scorpion-of-majestic-argument-7f59b4@houat>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250430-scorpion-of-majestic-argument-7f59b4@houat>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefftdduueetheejledvkeetjeekudfhffduvdeugfevfeeifeehieffjeetfefgveenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepleekpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmp
 dhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Herve Codina <herve.codina@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jani Nikula <jani.nikula@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Pin-yen Lin <treapking@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Phong LE <ple@baylibre.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>,
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
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Liu Ying <victor.liu@nxp.com>
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

CgpMZSAzMC8wNC8yMDI1IMOgIDEyOjM5LCBNYXhpbWUgUmlwYXJkIGEgw6ljcml0wqA6Cj4gT24g
V2VkLCBBcHIgMzAsIDIwMjUgYXQgMTA6MjE6NDhBTSArMDIwMCwgTG91aXMgQ2hhdXZldCB3cm90
ZToKPj4KPj4KPj4gTGUgMjkvMDQvMjAyNSDDoCAxNjo0MiwgRG1pdHJ5IEJhcnlzaGtvdiBhIMOp
Y3JpdMKgOgo+Pj4gT24gVHVlLCBBcHIgMjksIDIwMjUgYXQgMTE6Mjc6NTFBTSArMDIwMCwgTG91
aXMgQ2hhdXZldCB3cm90ZToKPj4+Pgo+Pj4+IE9uIFRodSwgMjQgQXByIDIwMjUgMjA6NTk6MDcg
KzAyMDAsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6Cj4+Pj4+IGRldm1fZHJtX2JyaWRnZV9hbGxvYygp
IFswXSBpcyB0aGUgbmV3IEFQSSB0byBhbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBhIERSTQo+Pj4+
PiBicmlkZ2UsIGFuZCB0aGUgb25seSBvbmUgc3VwcG9ydGVkIGZyb20gbm93IG9uLiBJdCBpcyBh
bHNvIG5lY2Vzc2FyeSBmb3IKPj4+Pj4gaW1wbGVtZW50aW5nIHJlZmVyZW5jZSBjb3VudGluZyBh
bmQgdGh1cyBuZWVkZWQgdG8gc3VwcG9ydCByZW1vdmFsIG9mCj4+Pj4+IGJyaWRnZXMgZnJvbSBh
IHN0aWxsIGV4aXN0aW5nIERSTSBwaXBlbGluZSB3aXRob3V0IHVzZS1hZnRlci1mcmVlLgo+Pj4+
Pgo+Pj4+PiBUaGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgRFJNIGJyaWRnZXMgdG8gdGhlIG5ldyBB
UEkuCj4+Pj4+Cj4+Pj4+IFsuLi5dCj4+Pj4KPj4+PiBBcHBsaWVkLCB0aGFua3MhCj4+Pj4KPj4+
Cj4+PiBbLi4uXQo+Pj4KPj4+PiBbMTYvMzRdIGRybS9tc20vZHA6IGNvbnZlcnQgdG8gZGV2bV9k
cm1fYnJpZGdlX2FsbG9jKCkgQVBJCj4+Pj4gICAgICAgICAgIGNvbW1pdDogYjJhYWJlNWM2YjY1
NTE2ZDg4MjE0YWJhNGIxMmNlMmNhNzhiYWM2Ywo+Pj4+IFsxNy8zNF0gZHJtL21zbS9kc2k6IGNv
bnZlcnQgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJCj4+Pj4gICAgICAgICAgIGNvbW1p
dDogZmZmYzg4NDc3NDNlNDU2MDRjNDQ3OGY1NTRkNjI4NDgxYjk4NTU1Ngo+Pj4+IFsxOC8zNF0g
ZHJtL21zbS9oZG1pOiBjb252ZXJ0IHRvIGRldm1fZHJtX2JyaWRnZV9hbGxvYygpIEFQSQo+Pj4+
ICAgICAgICAgICBjb21taXQ6IGUxMTUzMmJlODdlNDM3NjQ4NTIxYThlZDUzNThjNTZkZjExOTMz
YjQKPj4+Cj4+PiBXaHk/IFRoZXNlIGRyaXZlcnMgYXJlIGV4cGxpY2l0bHkgaGFuZGxlZCBvdXRz
aWRlIG9mIGRybS1taXNjLiBQbGVhc2UgYmUKPj4+IG1vcmUgY2FyZWZ1bCBuZXh0IHRpbWUuCj4+
Pgo+Pgo+PiBTb3JyeSwgSSB3YXMgbm90IGF3YXJlIHRoYXQgbXNtIGFsc28gaGF2ZSBoaXMgb3du
IHJlcG9zaXRvcnkuCj4+Cj4+IFRCSCwgSSB3YXMgbm90IGF3YXJlIHRoYXQgb3RoZXIgcmVwb3Np
dG9yaWVzIGV4aXN0ZWQgZm9yIGRybSAoSSBzaG91bGQgaGF2ZQo+PiBsb29rZWQgYXQgTUFJTlRB
SU5FUlMsIGl0IGlzIHRvdGFsbHkgbXkgZmF1bHQpLiBESU0gYW5kIGRvY1sxXSBvbmx5IGxpc3QK
Pj4gZHJtLCBkcm0tbWlzYywgZHJtLXhlLCBkcm0taW50ZWwsIHNvIEkganVzdCB0b3VnaCAiaW50
ZWwgaXMgc3BlY2lhbCIsIG5vdAo+PiAiZHJtIGlzIGRpdmlkZWQgaW4gbWFueSByZXBvc2l0b3Jp
ZXMiLgo+IAo+IEl0J3MgbWVudGlvbmVkIGluIHRoZSBkcm0tbWlzYyBzZWN0aW9uOgo+IAo+IGh0
dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL3JlcG9zaXRv
cmllcy9kcm0tbWlzYy5odG1sCj4gCj4+IFRoaXMgcmVwb3NpdG9yeSBjb25zaXN0cyBtb3N0bHkg
b2YgdGhlIGNvcmUgZHJtIGNvZGUgYXMgd2VsbCBhcyBEUk0KPj4gZHJpdmVycyB0aGF0IGRvIG5v
dCBoYXZlIGEgZGVkaWNhdGVkIHJlcG9zaXRvcnkuCiA+Cj4gRmVlbCBmcmVlIHRvIHNlbmQgYSBw
YXRjaCB0byBpbXByb3ZlIHRoZSBkb2MuIElmIHlvdSBtaXNzZWQgaXQsIHNvbWVvbmUKPiBlbHNl
IHdpbGwuCgpEb25lIDogCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWFpbnRh
aW5lci10b29scy8tL21lcmdlX3JlcXVlc3RzLzc3I2MzMDQzNjhkZTAyZDc0MGNhNzUxZjU4MTJk
ZGNkMGNmYWM0MGQxNjIKCkkgYWRkZWQgbW9yZSBkZXRhaWxzIGZvciB0aGUgcHVzaCBwcm9jZXNz
LCBjbGFyaWZpZWQgdGhlIGV4aXN0aW5nIGRybSAKcmVwb3NpdG9yaWVzIGFuZCBhZGRlZCBhIHNt
YWxsIGNoZWNrIGluIGRpbSB0byB3YXJuIHVzZXIgaWYgdGhlIHB1c2hlZCAKY29tbWl0cyBkb2Vz
IG5vdCBiZWxvbmcgdG8gdGhlIHRhcmdldGVkIGJyYWNoLgoKPiBNYXhpbWUKCi0tIApMb3VpcyBD
aGF1dmV0LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
