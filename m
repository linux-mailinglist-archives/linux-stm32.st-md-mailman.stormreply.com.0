Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E0A98025
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 09:12:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1A64C78F72;
	Wed, 23 Apr 2025 07:12:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75EF3C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 07:12:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B21743A53;
 Wed, 23 Apr 2025 07:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745392339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLySCWSlH0Sb9P602cy0L3AE+j4XwAS06FELO6RcWVA=;
 b=bGfCmCgBvq/udV2NrOkw1l1IoijqGAVUUvhC/kg58tPe+68ZZg+XtvprSk+iataEHjYyHm
 0pUkiZctX9u/H3QvrA6zIoi2adTyRoffwWJKjWz28eeBgFRfr7K8Qyf5fjsNwHbW5JuScJ
 d/WcNIS12Y2Zbu/iN9vfM0KdEvgZ6iG+YrPuGZKYRJJF7rVua2iEhUzHAbM3cIdhHr8rFN
 vVQmVwIv0Ti6GkGUfRpL3KgygwWusBeeNt42HxCSyS0Atu3ToeQ1qdDBi1UoTg8EVBUlfv
 PccLM0CIq1MklC53ycV9zGXWiI5LTKuQKxygUoHNzIhv9XNrVv0nmuErV2O5Kw==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 23 Apr 2025 09:12:10 +0200
MIME-Version: 1.0
Message-Id: <20250423-stmmac_ts-v2-2-e2cf2bbd61b1@bootlin.com>
References: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
In-Reply-To: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Daniel Machon <daniel.machon@microchip.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeghfetffeuhfehkeekleffffdvuefggfevjefftddvffduheettdeiveetteenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdhmrggthhhonhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhug
 iesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: netdev@vger.kernel.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: fix multiplication
 overflow when reading timestamp
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

VGhlIGN1cnJlbnQgd2F5IG9mIHJlYWRpbmcgYSB0aW1lc3RhbXAgc25hcHNob3QgaW4gc3RtbWFj
IGNhbiBsZWFkIHRvCmludGVnZXIgb3ZlcmZsb3csIGFzIHRoZSBjb21wdXRhdGlvbiBpcyBkb25l
IG9uIDMyIGJpdHMuIFRoZSBpc3N1ZSBoYXMKYmVlbiBvYnNlcnZlZCBvbiBhIGR3bWFjLXNvY2Zw
Z2EgcGxhdGZvcm0gcmV0dXJuaW5nIGNoYW90aWMgdGltZXN0YW1wCnZhbHVlcyBkdWUgdG8gdGhp
cyBvdmVyZmxvdy4gVGhlIGNvcnJlc3BvbmRpbmcgbXVsdGlwbGljYXRpb24gaXMgZG9uZQp3aXRo
IGEgTVVMIGluc3RydWN0aW9uLCB3aGljaCByZXR1cm5zIDMyIGJpdCB2YWx1ZXMuIEV4cGxpY2l0
bHkgY2FzdGluZwp0aGUgdmFsdWUgdG8gNjQgYml0cyByZXBsYWNlZCB0aGUgTVVMIHdpdGggYSBV
TUxBTCwgd2hpY2ggY29tcHV0ZXMgYW5kCnJldHVybnMgdGhlIHJlc3VsdCBvbiA2NCBiaXRzLCBh
bmQgc28gcmV0dXJucyBjb3JyZWN0bHkgdGhlIHRpbWVzdGFtcHMuCgpQcmV2ZW50IHRoaXMgb3Zl
cmZsb3cgYnkgZXhwbGljaXRseSBjYXN0aW5nIHRoZSBpbnRlcm1lZGlhdGUgdmFsdWUgdG8KdTY0
IHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSB3aG9sZSBjb21wdXRhdGlvbiBpcyBtYWRlIG9uIHU2NC4g
V2hpbGUgYXQgaXQsCmFwcGx5IHRoZSBzYW1lIGNhc3Qgb24gdGhlIG90aGVyIGR3bWFjIHZhcmlh
bnQgKEdNQUM0KSBtZXRob2QgZm9yCnNuYXBzaG90IHJldHJpZXZhbC4KCkZpeGVzOiA0NzdjM2Ux
ZjYzNjMgKCJuZXQ6IHN0bW1hYzogSW50cm9kdWNlIGR3bWFjMTAwMCB0aW1lc3RhbXBpbmcgb3Bl
cmF0aW9ucyIpClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMxMDAwX2NvcmUuYyAgfCAyICstCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfaHd0c3RhbXAuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjMTAwMF9jb3JlLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYzEwMDBfY29yZS5jCmluZGV4IGE4YjkwMWNkZjVjYmIzOTVhMGY2YjQ4
MDBhZDZmMDZjNmU4NzAwNzcuLjU2Yjc2YWFhNThmMDRhNmYwMWViNTZjN2FkNmFhMTM1YTdmNzZj
OTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
MTAwMF9jb3JlLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMxMDAwX2NvcmUuYwpAQCAtNTUzLDcgKzU1Myw3IEBAIHZvaWQgZHdtYWMxMDAwX2dldF9wdHB0
aW1lKHZvaWQgX19pb21lbSAqcHRwYWRkciwgdTY0ICpwdHBfdGltZSkKIAl1NjQgbnM7CiAKIAlu
cyA9IHJlYWRsKHB0cGFkZHIgKyBHTUFDX1BUUF9BVE5SKTsKLQlucyArPSByZWFkbChwdHBhZGRy
ICsgR01BQ19QVFBfQVRTUikgKiBOU0VDX1BFUl9TRUM7CisJbnMgKz0gKHU2NClyZWFkbChwdHBh
ZGRyICsgR01BQ19QVFBfQVRTUikgKiBOU0VDX1BFUl9TRUM7CiAKIAkqcHRwX3RpbWUgPSBuczsK
IH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19od3RzdGFtcC5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X2h3dHN0YW1wLmMKaW5kZXggMGY1OWFhOTgyNjA0MDRiZWNlNTMwZjUwNTUwMGYxM2QzNTg4NGQw
Yy4uZTI4NDBmYTI0MWYyOTEyMWM0ZjA3NDg3MmM0OTg2OTA2MjAxY2I1NyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX2h3dHN0YW1wLmMKKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX2h3dHN0YW1wLmMK
QEAgLTIyMiw3ICsyMjIsNyBAQCBzdGF0aWMgdm9pZCBnZXRfcHRwdGltZSh2b2lkIF9faW9tZW0g
KnB0cGFkZHIsIHU2NCAqcHRwX3RpbWUpCiAJdTY0IG5zOwogCiAJbnMgPSByZWFkbChwdHBhZGRy
ICsgUFRQX0FUTlIpOwotCW5zICs9IHJlYWRsKHB0cGFkZHIgKyBQVFBfQVRTUikgKiBOU0VDX1BF
Ul9TRUM7CisJbnMgKz0gKHU2NClyZWFkbChwdHBhZGRyICsgUFRQX0FUU1IpICogTlNFQ19QRVJf
U0VDOwogCiAJKnB0cF90aW1lID0gbnM7CiB9CgotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
