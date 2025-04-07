Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 449FBA7ECE8
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 21:27:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6461C78F97;
	Mon,  7 Apr 2025 19:27:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89946C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 19:27:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37D604421F;
 Mon,  7 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744054065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjEt/IPzaAdKLiLHC8nJ5ihJ1fjZFnzeMJstnBzp7XQ=;
 b=Gi+8MJKk54bvu0U11jHOJw08NvtnpAzunZzJXO4mlFlnzsLVy8DFQIv5f1cwemOl31f/in
 yXq1Um8EF62nuW+7K5/FANGhJKfIDt3FpxkAeF2Uw52NGHGgsgSLt5hId5UF1i3v6U7LiQ
 QV71SvnJzRB4Bv9Y0pBT6LtPqcjAci3aXj9uPyPUUIhwMeK2lXlaYCBe0svd+nHK7Htak4
 /9HotCk7aCwdmAu+N82j0bdVIG/9XNextLdkUXD3MPHCRUDF3rNzBb5f+B2kzx0rN1agcB
 y2M7EU6B7HGxiOcK1BDKg9fGTg+UZIk8/GVGNr8AJuzWT4pQ2/Cw+JF6m2DEKA==
Date: Mon, 7 Apr 2025 21:27:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Message-ID: <20250407212739.1e991b6a@booty>
In-Reply-To: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
 <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeefpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, LKML <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 02/34] platform: arm64: acer-aspire1-ec:
 convert to devm_drm_bridge_alloc() API
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

SGVsbG8gSWxwbywKCk9uIE1vbiwgNyBBcHIgMjAyNSAxOTo0Njo1OSArMDMwMCAoRUVTVCkKSWxw
byBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gT24g
TW9uLCA3IEFwciAyMDI1LCBMdWNhIENlcmVzb2xpIHdyb3RlOgo+IAo+ID4gVGhpcyBpcyB0aGUg
bmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KPiA+IAo+ID4gLS0t
Cj4gPiAKPiA+IENjOiAiQnJ5YW4gTydEb25vZ2h1ZSIgPGJyeWFuLm9kb25vZ2h1ZUBsaW5hcm8u
b3JnPgo+ID4gQ2M6ICJJbHBvIErDpHJ2aW5lbiIgPGlscG8uamFydmluZW5AbGludXguaW50ZWwu
Y29tPgo+ID4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL3BsYXRmb3JtL2FybTY0L2FjZXItYXNwaXJlMS1lYy5jIHwgNyArKystLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvYWNlci1hc3BpcmUxLWVj
LmMgYi9kcml2ZXJzL3BsYXRmb3JtL2FybTY0L2FjZXItYXNwaXJlMS1lYy5jCj4gPiBpbmRleCA5
NThmZTFiZjVmODViYjY5YWM3OTYyZjIxN2RlOWYwYjQwY2RlOWExLi40Mzg1MzJhMDQ3ZTY4Nzk5
YWM1M2ExNmE0YzgxM2ZjMTZiZTk5N2I5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wbGF0Zm9y
bS9hcm02NC9hY2VyLWFzcGlyZTEtZWMuYwo+ID4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS9hcm02
NC9hY2VyLWFzcGlyZTEtZWMuYwo+ID4gQEAgLTQ1Miw5ICs0NTIsOSBAQCBzdGF0aWMgaW50IGFz
cGlyZV9lY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ID4gIAlpbnQgcmV0Owo+
ID4gIAl1OCB0bXA7Cj4gPiAgCj4gPiAtCWVjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpl
YyksIEdGUF9LRVJORUwpOwo+ID4gLQlpZiAoIWVjKQo+ID4gLQkJcmV0dXJuIC1FTk9NRU07Cj4g
PiArCWVjID0gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKGRldiwgc3RydWN0IGFzcGlyZV9lYywgYnJp
ZGdlLCAmYXNwaXJlX2VjX2JyaWRnZV9mdW5jcyk7Cj4gPiArCWlmIChJU19FUlIoZWMpKQo+ID4g
KwkJcmV0dXJuIFBUUl9FUlIoZWMpOwo+ID4gIAo+ID4gIAllYy0+Y2xpZW50ID0gY2xpZW50Owo+
ID4gIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBlYyk7Cj4gPiBAQCAtNDk3LDcgKzQ5Nyw2
IEBAIHN0YXRpYyBpbnQgYXNwaXJlX2VjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQp
Cj4gPiAgCWZ3bm9kZSA9IGRldmljZV9nZXRfbmFtZWRfY2hpbGRfbm9kZShkZXYsICJjb25uZWN0
b3IiKTsKPiA+ICAJaWYgKGZ3bm9kZSkgewo+ID4gIAkJSU5JVF9XT1JLKCZlYy0+d29yaywgYXNw
aXJlX2VjX2JyaWRnZV91cGRhdGVfaHBkX3dvcmspOwo+ID4gLQkJZWMtPmJyaWRnZS5mdW5jcyA9
ICZhc3BpcmVfZWNfYnJpZGdlX2Z1bmNzOwo+ID4gIAkJZWMtPmJyaWRnZS5vZl9ub2RlID0gdG9f
b2Zfbm9kZShmd25vZGUpOwo+ID4gIAkJZWMtPmJyaWRnZS5vcHMgPSBEUk1fQlJJREdFX09QX0hQ
RDsKPiA+ICAJCWVjLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9VU0I7ICAKPiAK
PiBIaSBMdWNhLAo+IAo+IEl0IHRvb2sgYSB3aGlsZSB0byBsb2NhdGUgd2hlcmUgdGhlIGNvZGUg
Zm9yIHRoZSBuZXcgaGVscGVyIGlzLiBJIHN1Z2dlc3QgCj4gaWYgeW91IG5lZWQgc2VuZCBhbm90
aGVyIHZlcnNpb24gb2YgdGhlIHNlcmllcyBkaXJlY3RseSBsaW5raW5nIHRvIHRoZSAKPiBjb21t
aXQgaW4gdGhlIGNvdmVyIGxldHRlciBzbyB0aGF0IGl0IHdvbid0IHRha2UgbXVsdGlwbGUgaG9v
cHMgdG8gZmluZCBpdCAKPiBpZiBvbmUgd2FudHMgdG8gcmV2aWV3IHRoZSBjb2RlIGFuZCBpcyBu
b3QgaGF2aW5nIGFsbCBkcm0gdHJlZXMgZWFzaWx5IGF0IAo+IGhhbmQuIEhlcmUgaXQgaXMgZm9y
IHRoZSBiZW5lZml0IG9mIG90aGVyIHBkeDg2IHBlb3BsZToKPiAKPiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL21pc2Mva2VybmVsLy0vY29tbWl0LzBjYzZhYWRkN2ZjMWU2Mjli
NzE1ZWEzZDFiYTUzN2VmMmRhOTVlZWMKCkFwb2xvZ2llcywgaW5kZWVkIHlvdSBoYXZlIGEgZ29v
ZCBwb2ludC4gSSBhZGRlZCB0aGUgbGluayB0byB0aGUgY292ZXIKbGV0dGVyIHNvIGl0IHdpbGwg
YmUgaW4gdjIsIGlmIGFueS4KCj4gQWNrZWQtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZp
bmVuQGxpbnV4LmludGVsLmNvbT4KClRoYW5rcyEKCj4gSSBhc3N1bWUgeW91IHdhbnQgdGhpcyB0
byBnbyB0aHJvdWdoIHRoZSBkcm0gdHJlZSB3aGVyZSB0aGUgaGVscGVyIGFscmVhZHkgCj4gaXM/
CgpNWSBiZXN0IGd1ZXNzIGlzIHRoYXQgZHJtLW1pc2MtbmV4dCBpcyB0aGUgYXBwcm9wcmlhdGUg
YnJhbmNoLCBhbmQgaXQKaXMgd2hlcmUgdGhlIGhlbHBlciBpcyBhbHJlYWR5IHByZXNlbnQsIGJ1
dCBJJ2xsIGxldCBtYWludGFpbmVycyBkZWNpZGUKd2hhdCBpcyBtb3N0IGFwcHJvcHJpYXRlLgoK
THVjYQoKLS0gCkx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
