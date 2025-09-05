Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE5B45072
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 09:56:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD36AC36B3C;
	Fri,  5 Sep 2025 07:56:34 +0000 (UTC)
Received: from flow-a4-smtp.messagingengine.com
 (flow-a4-smtp.messagingengine.com [103.168.172.139])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE5F0C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 07:56:33 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailflow.phl.internal (Postfix) with ESMTP id 820DD1380159;
 Fri,  5 Sep 2025 03:56:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Fri, 05 Sep 2025 03:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1757058992;
 x=1757066192; bh=KXUoaaH+PV1RudhFs2J2lVTbxM4uje+tSmH6gtbu+Nw=; b=
 QaTEQEmjGTJeSxeiah6pwWZmjZ/MZs5T6DwWq8Nmr7oHpYFT9j95C72yMyBcZ5nz
 u3cXjVlnWCc6V75Dwc83w5se6RUX0cgy2r6hhn8896BD1N9niWfNBDEsX5z3bbZh
 580Lxh1wJduGFt3iTeOOmO1kuUcf+UmbfmLmVrhi303staCq+82oOHT6v6FtLJ0q
 KUmIN0sVOTWfm9OO4IWePH36nTPtiHUbxCP6V5sCpCoy7ecX5fAcARL2bBp1+hYX
 meum9lsc6nxtc9bJfoYbWnrGaAyGJmjEbDgf28gHFpwuN2s7fsfyePI14fKiGSKO
 +KWH0qpxAXjQsFF5TvJk4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757058992; x=
 1757066192; bh=KXUoaaH+PV1RudhFs2J2lVTbxM4uje+tSmH6gtbu+Nw=; b=Y
 0cf+H8iNJvMgyddoNtlWXiFqcl4IGVll81T+/QLuu0VNzM2Tdl4Dututnx+WBVfY
 ZUAq036GCT8hJkBvo1Xuxdbdn01HtUdgUk4Ofv3efStIQ3nE14kAyA73FHfb4fjf
 KOwQB+75cW2V3GGZKDUuIfX594V3wr1n+Z2P2+qfVHB3QqrZG4ssbRrH1By1GbCD
 TRIW/OdNehrErechp8kPDk8rijxMDklBtf55Ic7ogPHsHFoI0ZeeNpUdQIUyNFBc
 8OZXytKiVrvaFoIX8swMPQV8EFgUKFbS92QjUo575ehIJo8Op3B6lZAJqKd3TDxm
 YaTlavtRtgFLUQVaVcOvQ==
X-ME-Sender: <xms:rJe6aPT4hEQwkAeohLnFC7wamjbvAr7niwm9b31Yo5zEex0vYFN_jg>
 <xme:rJe6aPCqpHI9uJ68XId1Qna7oWm5iyUGoAQPsu1kx2oN2qHjsCp2dNoZI4nTxFNl9
 MurlN6lVZ1a7ntIgiI>
X-ME-Received: <xmr:rJe6aO_r3H0kGSKS2fH0hEtRAmpG1wYDXGxPnza4nmiPk8yaDQHgreHxbUoYRRqeSVYYMKGdX0I7aNFWxHyOdN0DhlU70pWKyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
 ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
 gthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheetheek
 keegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrght
 vggthhdrshgvpdhnsggprhgtphhtthhopeeihedpmhhouggvpehsmhhtphhouhhtpdhrtg
 hpthhtohepiihhrghordigihgthhgrohesvhhivhhordgtohhmpdhrtghpthhtohepjhgu
 vghlvhgrrhgvsehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhigsehrohgvtghkqd
 hushdrnhgvthdprhgtphhtthhopehjihgtvdefsehkvghrnhgvlhdrohhrghdprhgtphht
 thhopegulhgvtghhnhgvrhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepnhhunh
 hordhsrgesrghnrghlohhgrdgtohhmpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdr
 ohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrh
 hnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:rJe6aLaJP6Xj2rkulgEos-3PuobS8mQKjatGJJBMK7inm3Pq7Gp2Vg>
 <xmx:rJe6aNF7-pW6bVrecDyimGuFt4rFKlRaO80vk9U-M3x2Osc7wCA6DA>
 <xmx:rJe6aLeryKtg2eNLenz4G8c7nPW0XLHn41W-YUcd9nAafvGlUomGZw>
 <xmx:rJe6aID5jwH-KTo0RNYmn7aS7aHdvvvDvzZsp7Xrs_Dh-FuDrHloig>
 <xmx:sJe6aL5VH3NVRImO0zXqWNKt1X3K9WtPu7YT5fkHwr7N4ubXrLHaDEMN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 03:56:27 -0400 (EDT)
Date: Fri, 5 Sep 2025 09:56:25 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Xichao Zhao <zhao.xichao@vivo.com>
Message-ID: <20250905075625.GA1852264@ragnatech.se>
References: <20250905072423.368123-1-zhao.xichao@vivo.com>
 <20250905072423.368123-2-zhao.xichao@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250905072423.368123-2-zhao.xichao@vivo.com>
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 David Lechner <dlechner@baylibre.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Guenter Roeck <linux@roeck-us.net>, Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Eduardo Valentin <edubezval@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Talel Shenhar <talel@amazon.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>, Andy Shevchenko <andy@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Keerthy <j-keerthy@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 01/12] thermal: of: Add error handling in
 devm_thermal_*_register()
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

SGVsbG8gWGljaGFvLAoKVGhhbmtzIGZvciB5b3VyIHdvcmsuCgpPbiAyMDI1LTA5LTA1IDE1OjIz
OjUzICswODAwLCBYaWNoYW8gWmhhbyB3cm90ZToKPiBkZXZtX3RoZXJtYWxfb2Zfem9uZV9yZWdp
c3RlcigpIGRvZXMgbm90IHByaW50IGFueSBlcnJvciBtZXNzYWdlCj4gd2hlbiByZWdpc3Rlcmlu
ZyBhIHRoZXJtYWwgem9uZSB3aXRoIGEgZGV2aWNlIG5vZGUgc2Vuc29yIGZhaWxzCj4gYW5kIGFs
bG9jYXRpbmcgZGV2aWNlIHJlc291cmNlIGRhdGEgZmFpbHMuCj4gCj4gVGhpcyBmb3JjZXMgZWFj
aCBkcml2ZXIgdG8gaW1wbGVtZW50IHJlZHVuZGFudCBlcnJvciBsb2dnaW5nLgo+IEFkZGl0aW9u
YWxseSwgd2hlbiB1cHBlci1sYXllciBmdW5jdGlvbnMgcHJvcGFnYXRlIHRoZXNlIGVycm9ycwo+
IHdpdGhvdXQgbG9nZ2luZywgY3JpdGljYWwgZGVidWdnaW5nIGluZm9ybWF0aW9uIGlzIGxvc3Qu
Cj4gCj4gQWRkIGRldl9lcnJfcHJvYmUoKSBpbiBkZXZtX3RoZXJtYWxfb2Zfem9uZV9yZWdpc3Rl
cigpIHRvIHVuaWZ5Cj4gZXJyb3IgcmVwb3J0aW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpY2hh
byBaaGFvIDx6aGFvLnhpY2hhb0B2aXZvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy90aGVybWFsL3Ro
ZXJtYWxfb2YuYyB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL3RoZXJtYWxf
b2YuYyBiL2RyaXZlcnMvdGhlcm1hbC90aGVybWFsX29mLmMKPiBpbmRleCAxYTUxYTRkMjQwZmYu
LjhmZTBhZDQwMjU3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvdGhlcm1hbF9vZi5j
Cj4gKysrIGIvZHJpdmVycy90aGVybWFsL3RoZXJtYWxfb2YuYwo+IEBAIC00NzUsMTEgKzQ3NSwx
NSBAQCBzdHJ1Y3QgdGhlcm1hbF96b25lX2RldmljZSAqZGV2bV90aGVybWFsX29mX3pvbmVfcmVn
aXN0ZXIoc3RydWN0IGRldmljZSAqZGV2LCBpbgo+ICAKPiAgCXB0ciA9IGRldnJlc19hbGxvYyhk
ZXZtX3RoZXJtYWxfb2Zfem9uZV9yZWxlYXNlLCBzaXplb2YoKnB0ciksCj4gIAkJCSAgIEdGUF9L
RVJORUwpOwo+IC0JaWYgKCFwdHIpCj4gKwlpZiAoIXB0cikgewo+ICsJCWRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIGFsbG9jYXRlIGRldmljZSByZXNvdXJjZSBkYXRhXG4iKTsKPiAgCQlyZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsKPiArCX0KPiAgCj4gIAl0emQgPSB0aGVybWFsX29mX3pvbmVfcmVn
aXN0ZXIoZGV2LT5vZl9ub2RlLCBzZW5zb3JfaWQsIGRhdGEsIG9wcyk7Cj4gIAlpZiAoSVNfRVJS
KHR6ZCkpIHsKPiArCQlkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUih0emQpLAo+ICsJCQkgICAg
ICAiRmFpbGVkIHRvIHJlZ2lzdGVyIHRoZXJtYWwgem9uZSBzZW5zb3JbJWRdXG4iLCBzZW5zb3Jf
aWQpOwoKRG9uJ3QgdGhlcm1hbF9vZl96b25lX3JlZ2lzdGVyKCkgYWxyZWFkeSBwcmludCBhbiBl
cnJvciBtZXNzYWdlIGZvciAKZmFpbHVyZSBjYXNlcz8gSWYgbm90IGNhbiB0aGlzIHByaW50IGJl
IG1vdmVkIHRoZXJlPyBUaGF0IHdvdWxkIGFsbG93IAp0aGUgY2hhbmdlIHlvdSBtYWtlIGluIFIt
Q2FyIGRyaXZlcnMgdG8gcmVtb3ZlIHRoZSBwcmF0aW5nIGNvbXBsZXRlbHksIApub3QganVzdCBm
b3IgdGhlIGRldm1fKiBjYXNlcy4KCj4gIAkJZGV2cmVzX2ZyZWUocHRyKTsKPiAgCQlyZXR1cm4g
dHpkOwo+ICAJfQo+IC0tIAo+IDIuMzQuMQo+IAoKLS0gCktpbmQgUmVnYXJkcywKTmlrbGFzIFPD
tmRlcmx1bmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
