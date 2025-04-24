Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DADAA9B6EA
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 20:59:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D65B1C78F74;
	Thu, 24 Apr 2025 18:59:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FBF2C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 18:59:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A1A8443AC;
 Thu, 24 Apr 2025 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe9TGbQbkCe+ORWPYOnOFjy2xEDFN3D1DRO+A6gr8d8=;
 b=ENSDT7HqsiyuBMtm9ZWgHDJIwA6rNydfQT3vUAEvINHE3ZilXsEUTxfnJCNzj4K5iyBMeh
 xI5N3QaLx9xdrG+Yi9IP51QPwTzZ6Ev1UA7pUop84y/qoj+OYAHoVq3VaUJu5LF06pLXw4
 tZqMthi2H4aTZGfuoKb3H58kvW2AXXf64vUgps/1fKOPLZ1f6kQ1e4a8I6JNGmz38AOf1d
 eH55cPq+zuOxWvyWyCNGrKg9MjW7cYS6IJP4g/5uc+NJCP8+JjD32U6QSTI7Kw2oF8+hxN
 roVhDODBTmQmSMxk3a9UjodmSmBDv0WJsFRCIKBYAaLgw+6d8deMFipWIUrp0Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:09 +0200
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-2-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
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
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrg
 hgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-arm-msm@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, freedreno@lists.freedesktop.org
Subject: [Linux-stm32] [PATCH v2 02/34] platform: arm64: acer-aspire1-ec:
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KCkFja2VkLWJ5
OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+Ci0tLQoKQ2M6
ICJCcnlhbiBPJ0Rvbm9naHVlIiA8YnJ5YW4ub2Rvbm9naHVlQGxpbmFyby5vcmc+CkNjOiAiSWxw
byBKw6RydmluZW4iIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS9hcm02NC9h
Y2VyLWFzcGlyZTEtZWMuYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL2FybTY0
L2FjZXItYXNwaXJlMS1lYy5jIGIvZHJpdmVycy9wbGF0Zm9ybS9hcm02NC9hY2VyLWFzcGlyZTEt
ZWMuYwppbmRleCA5NThmZTFiZjVmODViYjY5YWM3OTYyZjIxN2RlOWYwYjQwY2RlOWExLi40Mzg1
MzJhMDQ3ZTY4Nzk5YWM1M2ExNmE0YzgxM2ZjMTZiZTk5N2I5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3BsYXRmb3JtL2FybTY0L2FjZXItYXNwaXJlMS1lYy5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0v
YXJtNjQvYWNlci1hc3BpcmUxLWVjLmMKQEAgLTQ1Miw5ICs0NTIsOSBAQCBzdGF0aWMgaW50IGFz
cGlyZV9lY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWludCByZXQ7CiAJdTgg
dG1wOwogCi0JZWMgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmVjKSwgR0ZQX0tFUk5FTCk7
Ci0JaWYgKCFlYykKLQkJcmV0dXJuIC1FTk9NRU07CisJZWMgPSBkZXZtX2RybV9icmlkZ2VfYWxs
b2MoZGV2LCBzdHJ1Y3QgYXNwaXJlX2VjLCBicmlkZ2UsICZhc3BpcmVfZWNfYnJpZGdlX2Z1bmNz
KTsKKwlpZiAoSVNfRVJSKGVjKSkKKwkJcmV0dXJuIFBUUl9FUlIoZWMpOwogCiAJZWMtPmNsaWVu
dCA9IGNsaWVudDsKIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBlYyk7CkBAIC00OTcsNyAr
NDk3LDYgQEAgc3RhdGljIGludCBhc3BpcmVfZWNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCkKIAlmd25vZGUgPSBkZXZpY2VfZ2V0X25hbWVkX2NoaWxkX25vZGUoZGV2LCAiY29ubmVj
dG9yIik7CiAJaWYgKGZ3bm9kZSkgewogCQlJTklUX1dPUksoJmVjLT53b3JrLCBhc3BpcmVfZWNf
YnJpZGdlX3VwZGF0ZV9ocGRfd29yayk7Ci0JCWVjLT5icmlkZ2UuZnVuY3MgPSAmYXNwaXJlX2Vj
X2JyaWRnZV9mdW5jczsKIAkJZWMtPmJyaWRnZS5vZl9ub2RlID0gdG9fb2Zfbm9kZShmd25vZGUp
OwogCQllYy0+YnJpZGdlLm9wcyA9IERSTV9CUklER0VfT1BfSFBEOwogCQllYy0+YnJpZGdlLnR5
cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfVVNCOwoKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
