Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E2A7E110
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 16:24:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D64EC78F9C;
	Mon,  7 Apr 2025 14:24:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A38CC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 14:24:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A7CB442B9;
 Mon,  7 Apr 2025 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744035847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PtT82CTCAJi7GIQsdFWvOD88JDJ6rvOOMJtHFDPWzVk=;
 b=CdOix076zY2dsvoFeunrgd4LWuCU+L4H3Kr5x9w+AJ+6d64WjgTuaKyPvgk0JwZNaNSuc1
 Yk6J6XTdlCKxt2ZgfvPQtWq4DgO+p/J9UiTe5mstIGQL3jcq73dgQP4RBzJJZEmQ55wCS5
 vnnvGgCPKhW6w1KZVJhxX5Yu7bSG+SAzSY4MzpyLi9W355Y6Q3EXApH8j53+A6+dyqYHu7
 km4pLGPQF+NzfHn37BZr5vYFnnGn8kyj0FmVBrOW0E5Ds+O8pZIhdZLdzcWqJVe5lLL7Sh
 pU4jW53itNYhKW2eR8sJqhRLwvbaKYoLVCRpTsAFMM4tKFD3F8ZU4WPzGBRS1g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:17 +0200
MIME-Version: 1.0
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeegpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
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
Subject: [Linux-stm32] [PATCH 02/34] platform: arm64: acer-aspire1-ec:
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KClNpZ25lZC1v
ZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+CgotLS0KCkNj
OiAiQnJ5YW4gTydEb25vZ2h1ZSIgPGJyeWFuLm9kb25vZ2h1ZUBsaW5hcm8ub3JnPgpDYzogIkls
cG8gSsOkcnZpbmVuIiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0vYXJtNjQv
YWNlci1hc3BpcmUxLWVjLmMgfCA3ICsrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9hcm02
NC9hY2VyLWFzcGlyZTEtZWMuYyBiL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvYWNlci1hc3BpcmUx
LWVjLmMKaW5kZXggOTU4ZmUxYmY1Zjg1YmI2OWFjNzk2MmYyMTdkZTlmMGI0MGNkZTlhMS4uNDM4
NTMyYTA0N2U2ODc5OWFjNTNhMTZhNGM4MTNmYzE2YmU5OTdiOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wbGF0Zm9ybS9hcm02NC9hY2VyLWFzcGlyZTEtZWMuYworKysgYi9kcml2ZXJzL3BsYXRmb3Jt
L2FybTY0L2FjZXItYXNwaXJlMS1lYy5jCkBAIC00NTIsOSArNDUyLDkgQEAgc3RhdGljIGludCBh
c3BpcmVfZWNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAlpbnQgcmV0OwogCXU4
IHRtcDsKIAotCWVjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCplYyksIEdGUF9LRVJORUwp
OwotCWlmICghZWMpCi0JCXJldHVybiAtRU5PTUVNOworCWVjID0gZGV2bV9kcm1fYnJpZGdlX2Fs
bG9jKGRldiwgc3RydWN0IGFzcGlyZV9lYywgYnJpZGdlLCAmYXNwaXJlX2VjX2JyaWRnZV9mdW5j
cyk7CisJaWYgKElTX0VSUihlYykpCisJCXJldHVybiBQVFJfRVJSKGVjKTsKIAogCWVjLT5jbGll
bnQgPSBjbGllbnQ7CiAJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgZWMpOwpAQCAtNDk3LDcg
KzQ5Nyw2IEBAIHN0YXRpYyBpbnQgYXNwaXJlX2VjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpCiAJZndub2RlID0gZGV2aWNlX2dldF9uYW1lZF9jaGlsZF9ub2RlKGRldiwgImNvbm5l
Y3RvciIpOwogCWlmIChmd25vZGUpIHsKIAkJSU5JVF9XT1JLKCZlYy0+d29yaywgYXNwaXJlX2Vj
X2JyaWRnZV91cGRhdGVfaHBkX3dvcmspOwotCQllYy0+YnJpZGdlLmZ1bmNzID0gJmFzcGlyZV9l
Y19icmlkZ2VfZnVuY3M7CiAJCWVjLT5icmlkZ2Uub2Zfbm9kZSA9IHRvX29mX25vZGUoZndub2Rl
KTsKIAkJZWMtPmJyaWRnZS5vcHMgPSBEUk1fQlJJREdFX09QX0hQRDsKIAkJZWMtPmJyaWRnZS50
eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX1VTQjsKCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
