Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D9A96FF3
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 17:08:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9328C78F61;
	Tue, 22 Apr 2025 15:08:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 960A8C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 15:07:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7E7543A3E;
 Tue, 22 Apr 2025 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745334478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRcZcJeqXe3bZ8BydUxdPRAg1PRktnOnWrwURyrXOHk=;
 b=IzuQtJHkjpr/eiSJK2AczFT9xNq4AUt+9Db9jV6u/eXqZe/xJVmDCmiAQpDRjnLIbFuBzh
 9VpX5AD5Dq51LK+mevlQazB1jH+55sv2mwwKpX12wHYWJKAP3Pq4RZkG4OM5vLpXJx7XcE
 kquo80h+KxGnpsdyZtVq225Q53uLhqEfJpxrh6UydkMGFjcM1gRqEOSbdEvxjhPLu0+/ST
 BlyHFXozSnRzQhDEjYh9ZO2f9uLL1QOuR5z0NTe4BAODmgoEibM3+9osK2/kUrY6+Yf9pR
 TddWRW8hP0GItWlSq1D2jOvB90wPMYdZknqVapV+Ovps+MvsO9+1EAl6bUEFgg==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Tue, 22 Apr 2025 17:07:23 +0200
MIME-Version: 1.0
Message-Id: <20250422-stmmac_ts-v1-2-b59c9f406041@bootlin.com>
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
In-Reply-To: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeghfetffeuhfehkeekleffffdvuefggfevjefftddvffduheettdeiveetteenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: netdev@vger.kernel.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 2/2] net: stmmac: fix multiplication
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
bnQgKEdNQUM0KSBtZXRob2QgZm9yCnNuYXBzaG90IHJldHJpZXZhbC4KCkZpeGVzOiAxOWI5M2Ji
YjIwZWIgKCJuZXQ6IHN0bW1hYzogSW50cm9kdWNlIGR3bWFjMTAwMCB0aW1lc3RhbXBpbmcgb3Bl
cmF0aW9ucyIpClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMxMDAwX2NvcmUuYyAgfCAyICstCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfaHd0c3RhbXAuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjMTAwMF9jb3JlLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYzEwMDBfY29yZS5jCmluZGV4IGE4YjkwMWNkZjVjYmIzOTVhMGY2YjQ4
MDBhZDZmMDZjNmU4NzAwNzcuLjQzYjJiMzM3NzEzNmYyZDljNzE3Zjg1Y2JhNmE0NTJlN2ExNzhh
ZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
MTAwMF9jb3JlLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMxMDAwX2NvcmUuYwpAQCAtNTUzLDcgKzU1Myw3IEBAIHZvaWQgZHdtYWMxMDAwX2dldF9wdHB0
aW1lKHZvaWQgX19pb21lbSAqcHRwYWRkciwgdTY0ICpwdHBfdGltZSkKIAl1NjQgbnM7CiAKIAlu
cyA9IHJlYWRsKHB0cGFkZHIgKyBHTUFDX1BUUF9BVE5SKTsKLQlucyArPSByZWFkbChwdHBhZGRy
ICsgR01BQ19QVFBfQVRTUikgKiBOU0VDX1BFUl9TRUM7CisJbnMgKz0gKHU2NCkocmVhZGwocHRw
YWRkciArIEdNQUNfUFRQX0FUU1IpKSAqIE5TRUNfUEVSX1NFQzsKIAogCSpwdHBfdGltZSA9IG5z
OwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX2h3dHN0YW1wLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfaHd0c3RhbXAuYwppbmRleCAwZjU5YWE5ODI2MDQwNGJlY2U1MzBmNTA1NTAwZjEzZDM1ODg0
ZDBjLi4xOTUwMTU2ZjZhZjZmNmYxM2ViZGMxYzA0ZjAxYTg2MmI2NjRiYzliIDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfaHd0c3RhbXAuYwor
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfaHd0c3RhbXAu
YwpAQCAtMjIyLDcgKzIyMiw3IEBAIHN0YXRpYyB2b2lkIGdldF9wdHB0aW1lKHZvaWQgX19pb21l
bSAqcHRwYWRkciwgdTY0ICpwdHBfdGltZSkKIAl1NjQgbnM7CiAKIAlucyA9IHJlYWRsKHB0cGFk
ZHIgKyBQVFBfQVROUik7Ci0JbnMgKz0gcmVhZGwocHRwYWRkciArIFBUUF9BVFNSKSAqIE5TRUNf
UEVSX1NFQzsKKwlucyArPSAodTY0KShyZWFkbChwdHBhZGRyICsgUFRQX0FUU1IpKSAqIE5TRUNf
UEVSX1NFQzsKIAogCSpwdHBfdGltZSA9IG5zOwogfQoKLS0gCjIuNDkuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
