Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F64AC647F
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 10:30:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D6C9C36B38;
	Wed, 28 May 2025 08:30:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AC82C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 08:30:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CC0243181;
 Wed, 28 May 2025 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748421001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shTq+LjK5kytOL+ZAGqX+p9U+O+5+OqX6NmjbEioOnk=;
 b=Fmb4isi5ctT5G4E+PxA6NLD0Xpn3HwwowHzMR32KwsKIs8h/3/Go/bVkp1nRAB4j3AGowP
 Sd6nwUDcOGwYPI1XHQIvGONvbWBBjM5cX397cAKYTOcH5JrfnJLEI4lsrAT26qKTUrFytp
 Ti4iipv9XjTMmffc//RSLPQF+DKMbrrTXcO9dYxa4R8ZQlGY4JEYiOwtRwui8NyqzjTjIc
 jZmpaACJWnfoIMPt43Hzp7buEHV1CgLRSFO7R87xnJbYq7+qBstPmy/5Ya7GW2fyPSWw1l
 au2OcxFZOjlE4tQCv/TZBT95gVBILNLC5dfVkO10nFXa3ZHvDhDQXnNl0tO8Hw==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 28 May 2025 10:29:51 +0200
MIME-Version: 1.0
Message-Id: <20250528-stmmac_tstamp_div-v3-2-b525ecdfd84c@bootlin.com>
References: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
In-Reply-To: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Phil Reid <preid@electromag.com.au>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhin
 hdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvth
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/2] net: stmmac: make sure that ptp_rate
 is not 0 before configuring EST
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

SWYgdGhlIHB0cF9yYXRlIHJlY29yZGVkIGVhcmxpZXIgaW4gdGhlIGRyaXZlciBoYXBwZW5zIHRv
IGJlIDAsIHRoaXMKYm9ndXMgdmFsdWUgd2lsbCBwcm9wYWdhdGUgdXAgdG8gRVNUIGNvbmZpZ3Vy
YXRpb24sIHdoZXJlIGl0IHdpbGwKdHJpZ2dlciBhIGRpdmlzaW9uIGJ5IDAuCgpQcmV2ZW50IHRo
aXMgZGl2aXNpb24gYnkgMCBieSBhZGRpbmcgdGhlIGNvcnJlc3BvbmRpbmcgY2hlY2sgYW5kIGVy
cm9yCmNvZGUuCgpTdWdnZXN0ZWQtYnk6IE1heGltZSBDaGV2YWxsaWVyIDxtYXhpbWUuY2hldmFs
bGllckBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4KRml4ZXM6IDg1NzJhZWMzZDBkYyAoIm5ldDogc3RtbWFjOiBB
ZGQgYmFzaWMgRVNUIHN1cHBvcnQgZm9yIFhHTUFDIikKLS0tCkNoYW5nZXMgaW4gdjM6Ci0gbmV3
IHBhdGNoCi0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX2Vz
dC5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19lc3QuYyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19lc3QuYwppbmRleCBjOTY5
M2Y3N2UxZjYxZmU1YzkyZjk1ZjVlNTQ0MzcxNDQ1NjI2YzRkLi5hYzZmMmUzYTNmY2QyZjlhZTIx
OTEzODQ1MjgyZmYwMTVjZDJmN2VjIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfZXN0LmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX2VzdC5jCkBAIC0zMiw2ICszMiwxMSBAQCBzdGF0aWMgaW50IGVz
dF9jb25maWd1cmUoc3RydWN0IHN0bW1hY19wcml2ICpwcml2LCBzdHJ1Y3Qgc3RtbWFjX2VzdCAq
Y2ZnLAogCWludCBpLCByZXQgPSAwOwogCXUzMiBjdHJsOwogCisJaWYgKCFwdHBfcmF0ZSkgewor
CQluZXRkZXZfd2Fybihwcml2LT5kZXYsICJJbnZhbGlkIFBUUCByYXRlIik7CisJCXJldHVybiAt
RUlOVkFMOworCX0KKwogCXJldCB8PSBlc3Rfd3JpdGUoZXN0X2FkZHIsIEVTVF9CVFJfTE9XLCBj
ZmctPmJ0clswXSwgZmFsc2UpOwogCXJldCB8PSBlc3Rfd3JpdGUoZXN0X2FkZHIsIEVTVF9CVFJf
SElHSCwgY2ZnLT5idHJbMV0sIGZhbHNlKTsKIAlyZXQgfD0gZXN0X3dyaXRlKGVzdF9hZGRyLCBF
U1RfVEVSLCBjZmctPnRlciwgZmFsc2UpOwoKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
