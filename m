Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE51A9B752
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 21:01:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 090FDC78F72;
	Thu, 24 Apr 2025 19:01:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6FF0C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 19:01:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A6C64439D;
 Thu, 24 Apr 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/6Zj+wUweRTx+VHVK1CTlVxOlTH40bx6xBYT/U2MxM=;
 b=gQDDO6peFD+MeoI/74dTBBtnqibz0ajwpOD6hA379Dlwkj8gyJ1ZuG4Joul5jS46/Bcmwe
 6tZhghLt8TzyEA9SQi0+HGiTKpHKM/GWIYwv3tqz2h9qm3bN9y/FLbaSwcxepoGlcUIy+p
 AcIktOmce3cZK3joICgcRsf1c5HGqeUQqvAEcLPXHO3rKvnhH7JePomK23u6cKK27GXoZF
 4i63+MMSbHHZac4oeLP/LHROm8sys3wsU5lOXfpQn9fXZLK3fYA2rjt0brvZBz2tIFIoms
 yrt97216v1rEf1bGQ+5Vyw/QLeWnpqyNTrc7oZ82yNjcr4Oub8dwXSlWv4eD3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:34 +0200
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopegurghvvgdrshhtvghvvghnshhonhesrhgrshhpsggvrhhrhihpihdrtghom
 hdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
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
Subject: [Linux-stm32] [PATCH v2 27/34] drm/vc4: convert to
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
cnJ5cGkuY29tPgoKQ2hhbmdlZCBpbiB2MjoKLSBmaXggZXJyb3IgY29kZSBjaGVja2luZwotLS0K
IGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jIHwgMzQgKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHNpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kc2kuYwppbmRleCBlZmM2ZjYwNzhiMDI2NzY0YzU5Y2ZiMmEz
M2IyOGE4OGI3MDE4YzNhLi40NThlNWQ5ODc5NjQ1ZjE4YmNiY2FlZWI3MWI1ZjEwMzhmOTU4MWRh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kc2kuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9kc2kuYwpAQCAtNTUyLDggKzU1Miw2IEBAIHN0cnVjdCB2YzRfZHNp
IHsKIAlzdHJ1Y3QgdmM0X2VuY29kZXIgZW5jb2RlcjsKIAlzdHJ1Y3QgbWlwaV9kc2lfaG9zdCBk
c2lfaG9zdDsKIAotCXN0cnVjdCBrcmVmIGtyZWY7Ci0KIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2OwogCiAJc3RydWN0IGRybV9icmlkZ2UgKm91dF9icmlkZ2U7CkBAIC0xNjIyLDI5ICsx
NjIwLDExIEBAIHN0YXRpYyB2b2lkIHZjNF9kc2lfZG1hX2NoYW5fcmVsZWFzZSh2b2lkICpwdHIp
CiAJZHNpLT5yZWdfZG1hX2NoYW4gPSBOVUxMOwogfQogCi1zdGF0aWMgdm9pZCB2YzRfZHNpX3Jl
bGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCi17Ci0Jc3RydWN0IHZjNF9kc2kgKmRzaSA9Ci0JCWNv
bnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgdmM0X2RzaSwga3JlZik7Ci0KLQlrZnJlZShkc2kpOwot
fQotCi1zdGF0aWMgdm9pZCB2YzRfZHNpX2dldChzdHJ1Y3QgdmM0X2RzaSAqZHNpKQotewotCWty
ZWZfZ2V0KCZkc2ktPmtyZWYpOwotfQotCi1zdGF0aWMgdm9pZCB2YzRfZHNpX3B1dChzdHJ1Y3Qg
dmM0X2RzaSAqZHNpKQotewotCWtyZWZfcHV0KCZkc2ktPmtyZWYsICZ2YzRfZHNpX3JlbGVhc2Up
OwotfQotCiBzdGF0aWMgdm9pZCB2YzRfZHNpX3JlbGVhc2VfYWN0aW9uKHN0cnVjdCBkcm1fZGV2
aWNlICpkcm0sIHZvaWQgKnB0cikKIHsKIAlzdHJ1Y3QgdmM0X2RzaSAqZHNpID0gcHRyOwogCi0J
dmM0X2RzaV9wdXQoZHNpKTsKKwlkcm1fYnJpZGdlX3B1dCgmZHNpLT5icmlkZ2UpOwogfQogCiBz
dGF0aWMgaW50IHZjNF9kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciwgdm9pZCAqZGF0YSkKQEAgLTE2NTUsNyArMTYzNSw3IEBAIHN0YXRpYyBpbnQgdmM0
X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lk
ICpkYXRhKQogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciA9ICZkc2ktPmVuY29kZXIuYmFz
ZTsKIAlpbnQgcmV0OwogCi0JdmM0X2RzaV9nZXQoZHNpKTsKKwlkcm1fYnJpZGdlX2dldCgmZHNp
LT5icmlkZ2UpOwogCiAJcmV0ID0gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRybSwgdmM0X2Rz
aV9yZWxlYXNlX2FjdGlvbiwgZHNpKTsKIAlpZiAocmV0KQpAQCAtMTgxMCwxNSArMTc5MCwxMiBA
QCBzdGF0aWMgaW50IHZjNF9kc2lfZGV2X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgdmM0X2RzaSAq
ZHNpOwogCi0JZHNpID0ga3phbGxvYyhzaXplb2YoKmRzaSksIEdGUF9LRVJORUwpOwotCWlmICgh
ZHNpKQotCQlyZXR1cm4gLUVOT01FTTsKKwlkc2kgPSBkZXZtX2RybV9icmlkZ2VfYWxsb2MoJnBk
ZXYtPmRldiwgc3RydWN0IHZjNF9kc2ksIGJyaWRnZSwgJnZjNF9kc2lfYnJpZGdlX2Z1bmNzKTsK
KwlpZiAoSVNfRVJSKGRzaSkpCisJCXJldHVybiBQVFJfRVJSKGRzaSk7CiAJZGV2X3NldF9kcnZk
YXRhKGRldiwgZHNpKTsKIAotCWtyZWZfaW5pdCgmZHNpLT5rcmVmKTsKLQogCWRzaS0+cGRldiA9
IHBkZXY7Ci0JZHNpLT5icmlkZ2UuZnVuY3MgPSAmdmM0X2RzaV9icmlkZ2VfZnVuY3M7CiAjaWZk
ZWYgQ09ORklHX09GCiAJZHNpLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKICNlbmRp
ZgpAQCAtMTgzNiw3ICsxODEzLDYgQEAgc3RhdGljIHZvaWQgdmM0X2RzaV9kZXZfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IHZjNF9kc2kgKmRzaSA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwogCiAJbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmRzaV9o
b3N0KTsKLQl2YzRfZHNpX3B1dChkc2kpOwogfQogCiBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHZj
NF9kc2lfZHJpdmVyID0gewoKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
