Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAD2A7E14E
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 16:25:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3E8DC78F9C;
	Mon,  7 Apr 2025 14:25:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A29AFC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 14:25:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ED98442B9;
 Mon,  7 Apr 2025 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744035927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/X88yeD1voD1ZKSu14DhZwpptFTgIWDAW6qq25rOxI=;
 b=IdnM/FzWiqmeC4QLFNCoiaAiunvmEJdv+JOhvr+KgITXbyea9Nb/myky8AH7792qyUIAKb
 GXChJ406E5DOWWT80omvrh/feLFLi+aIk58+t+KBfm0z03mJHu+hEYqrKl/aTnrBFlJVvc
 c8aqvDV6iPYgcQdNwZnwCugnaTUqZ0LDtS6pxqLPV5WCbQoCVRsy9JT8jtJj26+iTmD/VD
 yRqkLdUZGexZAY0xUGoYauDk71Y8kWnmJPldCFLXcjnL4IPlbbO2bbe5DNxNtTqDS8broP
 LLAbNMf78c2dwGGtF/1WDG75gmA8KnHEDd1366lJq5e9VN3RWurZpRmJ0H3fFQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:42 +0200
MIME-Version: 1.0
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-27-42113ff8d9c0@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeegpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 freedreno@lists.freedesktop.org
Subject: [Linux-stm32] [PATCH 27/34] drm/vc4: convert to
	devm_drm_bridge_alloc() API
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KClRoaXMgZHJp
dmVyIGFscmVhZHkgaW1wbGVtZW50cyByZWZjb3VudGluZyBvZiB0aGUgc3RydWN0IHZjNF9kc2ks
IHdoaWNoCmVtYmVkcyBzdHJ1Y3QgZHJtX2JyaWRnZS4gTm93IHRoaXMgaXMgYSBkdXBsaWNhdGUg
b2YgdGhlIHJlZmNvdW50aW5nCmltcGxlbWVudGVkIGJ5IHRoZSBEUk0gYnJpZGdlIGNvcmUsIHNv
IGNvbnZlcnQgdGhlIHZjNF9kc2lfZ2V0L3B1dCgpIGNhbGxzCmludG8gZHJtX2JyaWRnZV9nZXQv
cHV0KCkgY2FsbHMgYW5kIGdldCByaWQgb2YgdGhlIGRyaXZlci1zcGVjaWZpYwpyZWZjb3VudGlu
ZyBpbXBsZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+CgotLS0KCkNjOiAiTWHDrXJhIENhbmFsIiA8bWNhbmFsQGlnYWxp
YS5jb20+CkNjOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29t
PgpDYzogUmFzcGJlcnJ5IFBpIEtlcm5lbCBNYWludGVuYW5jZSA8a2VybmVsLWxpc3RAcmFzcGJl
cnJ5cGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jIHwgMzAgKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9k
c2kuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCmluZGV4IGVmYzZmNjA3OGIwMjY3
NjRjNTljZmIyYTMzYjI4YTg4YjcwMThjM2EuLjMwNzFmYTM2ZmRmYThlM2Y0NDg1MDE5YTY0ZDgz
ZWY2OWZhYzczYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCkBAIC01NTIsOCArNTUyLDYgQEAgc3Ry
dWN0IHZjNF9kc2kgewogCXN0cnVjdCB2YzRfZW5jb2RlciBlbmNvZGVyOwogCXN0cnVjdCBtaXBp
X2RzaV9ob3N0IGRzaV9ob3N0OwogCi0Jc3RydWN0IGtyZWYga3JlZjsKLQogCXN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXY7CiAKIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqb3V0X2JyaWRnZTsKQEAg
LTE2MjIsMjkgKzE2MjAsMTEgQEAgc3RhdGljIHZvaWQgdmM0X2RzaV9kbWFfY2hhbl9yZWxlYXNl
KHZvaWQgKnB0cikKIAlkc2ktPnJlZ19kbWFfY2hhbiA9IE5VTEw7CiB9CiAKLXN0YXRpYyB2b2lk
IHZjNF9kc2lfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikKLXsKLQlzdHJ1Y3QgdmM0X2RzaSAq
ZHNpID0KLQkJY29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCB2YzRfZHNpLCBrcmVmKTsKLQotCWtm
cmVlKGRzaSk7Ci19Ci0KLXN0YXRpYyB2b2lkIHZjNF9kc2lfZ2V0KHN0cnVjdCB2YzRfZHNpICpk
c2kpCi17Ci0Ja3JlZl9nZXQoJmRzaS0+a3JlZik7Ci19Ci0KLXN0YXRpYyB2b2lkIHZjNF9kc2lf
cHV0KHN0cnVjdCB2YzRfZHNpICpkc2kpCi17Ci0Ja3JlZl9wdXQoJmRzaS0+a3JlZiwgJnZjNF9k
c2lfcmVsZWFzZSk7Ci19Ci0KIHN0YXRpYyB2b2lkIHZjNF9kc2lfcmVsZWFzZV9hY3Rpb24oc3Ry
dWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqcHRyKQogewogCXN0cnVjdCB2YzRfZHNpICpkc2kg
PSBwdHI7CiAKLQl2YzRfZHNpX3B1dChkc2kpOworCWRybV9icmlkZ2VfcHV0KCZkc2ktPmJyaWRn
ZSk7CiB9CiAKIHN0YXRpYyBpbnQgdmM0X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQpAQCAtMTY1NSw3ICsxNjM1LDcgQEAgc3Rh
dGljIGludCB2YzRfZHNpX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpt
YXN0ZXIsIHZvaWQgKmRhdGEpCiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyID0gJmRzaS0+
ZW5jb2Rlci5iYXNlOwogCWludCByZXQ7CiAKLQl2YzRfZHNpX2dldChkc2kpOworCWRybV9icmlk
Z2VfZ2V0KCZkc2ktPmJyaWRnZSk7CiAKIAlyZXQgPSBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQo
ZHJtLCB2YzRfZHNpX3JlbGVhc2VfYWN0aW9uLCBkc2kpOwogCWlmIChyZXQpCkBAIC0xODEwLDE1
ICsxNzkwLDEyIEBAIHN0YXRpYyBpbnQgdmM0X2RzaV9kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVj
dCB2YzRfZHNpICpkc2k7CiAKLQlkc2kgPSBremFsbG9jKHNpemVvZigqZHNpKSwgR0ZQX0tFUk5F
TCk7CisJZHNpID0gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCZwZGV2LT5kZXYsIHN0cnVjdCB2YzRf
ZHNpLCBicmlkZ2UsICZ2YzRfZHNpX2JyaWRnZV9mdW5jcyk7CiAJaWYgKCFkc2kpCiAJCXJldHVy
biAtRU5PTUVNOwogCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGRzaSk7CiAKLQlrcmVmX2luaXQoJmRz
aS0+a3JlZik7Ci0KIAlkc2ktPnBkZXYgPSBwZGV2OwotCWRzaS0+YnJpZGdlLmZ1bmNzID0gJnZj
NF9kc2lfYnJpZGdlX2Z1bmNzOwogI2lmZGVmIENPTkZJR19PRgogCWRzaS0+YnJpZGdlLm9mX25v
ZGUgPSBkZXYtPm9mX25vZGU7CiAjZW5kaWYKQEAgLTE4MzYsNyArMTgxMyw2IEBAIHN0YXRpYyB2
b2lkIHZjNF9kc2lfZGV2X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0
cnVjdCB2YzRfZHNpICpkc2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAogCW1pcGlfZHNpX2hv
c3RfdW5yZWdpc3RlcigmZHNpLT5kc2lfaG9zdCk7Ci0JdmM0X2RzaV9wdXQoZHNpKTsKIH0KIAog
c3RydWN0IHBsYXRmb3JtX2RyaXZlciB2YzRfZHNpX2RyaXZlciA9IHsKCi0tIAoyLjQ5LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
