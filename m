Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 211ABAC648D
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 10:33:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB9E8C36B30;
	Wed, 28 May 2025 08:33:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9F1DC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 08:33:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E62F842EF2;
 Wed, 28 May 2025 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748421229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehqDeg13oyew9TLKS5grv38vFykrmlLsB/LhIMhZ56Y=;
 b=S2tjY6dnzn6uI6BqR7uuGXs1v0QN/q3+dw5WAfvcPMBbi3o5zTiPQWklaseNVwhYmmWdBC
 HrR05Iy36DmnH/Zt50lppYOrfJybzQYti9JSWPkFaa4AZVNaSv0Di17YCfxBOto/8L0ojW
 QAdzmUCLWrtb+vHfP1pdM1G2MaPjiVJ+8T6v/jQ8yofbS9S3tw0WEypnDag9Ur3xTXJvbJ
 iDjzCfTsbDlzrsFgF1NCQJ8KniHV4cj7hyJEoBlP6oz8ieduUrtAv8uKol2YUf3Eab8vZM
 5L1sMy6aIQ8RV+/S8JFcprtZMAqknDFyD9V5nQogY8qeMpN/oPI77iV5yNhAtA==
Mime-Version: 1.0
Date: Wed, 28 May 2025 10:33:46 +0200
Message-Id: <DA7NLJ1CKSFM.3FWBC90NACTRV@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Jose Abreu"
 <joabreu@synopsys.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Richard Cochran"
 <richardcochran@gmail.com>, "Phil Reid" <preid@electromag.com.au>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
 <20250528-stmmac_tstamp_div-v3-1-b525ecdfd84c@bootlin.com>
In-Reply-To: <20250528-stmmac_tstamp_div-v3-1-b525ecdfd84c@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvvefofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedugfevhfevueeggedutefhgfevhfeltefgieejjeeijeejveegtdehgeefkefhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehjohgrsghrvghusehshihnohhpshihshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvt
 hguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] net: stmmac: make sure that
 ptp_rate is not 0 before configuring timestamping
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

T24gV2VkIE1heSAyOCwgMjAyNSBhdCAxMDoyOSBBTSBDRVNULCBBbGV4aXMgTG90aG9yw6kgd3Jv
dGU6Cj4gVGhlIHN0bW1hYyBwbGF0Zm9ybSBkcml2ZXJzIHRoYXQgZG8gbm90IG9wZW4tY29kZSB0
aGUgY2xrX3B0cF9yYXRlIHZhbHVlCj4gYWZ0ZXIgaGF2aW5nIHJldHJpZXZlZCB0aGUgZGVmYXVs
dCBvbmUgZnJvbSB0aGUgZGV2aWNlLXRyZWUgY2FuIGVuZCB1cAo+IHdpdGggMCBpbiBjbGtfcHRw
X3JhdGUgKGFzIGNsa19nZXRfcmF0ZSBjYW4gcmV0dXJuIDApLiBJdCB3aWxsCj4gZXZlbnR1YWxs
eSBwcm9wYWdhdGUgdXAgdG8gUFRQIGluaXRpYWxpemF0aW9uIHdoZW4gYnJpbmdpbmcgdXAgdGhl
Cj4gaW50ZXJmYWNlLCBsZWFkaW5nIHRvIGEgZGl2aWRlIGJ5IDA6Cj4KPiAgRGl2aXNpb24gYnkg
emVybyBpbiBrZXJuZWwuCj4gIENQVTogMSBVSUQ6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBO
b3QgdGFpbnRlZCA2LjEyLjMwLTAwMDAxLWc0ODMxM2JkNTc2OGEgIzIyCj4gIEhhcmR3YXJlIG5h
bWU6IFNUTTMyIChEZXZpY2UgVHJlZSBTdXBwb3J0KQo+ICBDYWxsIHRyYWNlOgo+ICAgdW53aW5k
X2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHgxOC8weDFjCj4gICBzaG93X3N0YWNrIGZyb20g
ZHVtcF9zdGFja19sdmwrMHg2Yy8weDhjCj4gICBkdW1wX3N0YWNrX2x2bCBmcm9tIExkaXYwXzY0
KzB4OC8weDE4Cj4gICBMZGl2MF82NCBmcm9tIHN0bW1hY19pbml0X3RzdGFtcF9jb3VudGVyKzB4
MTkwLzB4MWE0Cj4gICBzdG1tYWNfaW5pdF90c3RhbXBfY291bnRlciBmcm9tIHN0bW1hY19od19z
ZXR1cCsweGMxYy8weDExMWMKPiAgIHN0bW1hY19od19zZXR1cCBmcm9tIF9fc3RtbWFjX29wZW4r
MHgxOGMvMHg0MzQKPiAgIF9fc3RtbWFjX29wZW4gZnJvbSBzdG1tYWNfb3BlbisweDNjLzB4YmMK
PiAgIHN0bW1hY19vcGVuIGZyb20gX19kZXZfb3BlbisweGY0LzB4MWFjCj4gICBfX2Rldl9vcGVu
IGZyb20gX19kZXZfY2hhbmdlX2ZsYWdzKzB4MWNjLzB4MjI0Cj4gICBfX2Rldl9jaGFuZ2VfZmxh
Z3MgZnJvbSBkZXZfY2hhbmdlX2ZsYWdzKzB4MjQvMHg2MAo+ICAgZGV2X2NoYW5nZV9mbGFncyBm
cm9tIGlwX2F1dG9fY29uZmlnKzB4MmU4LzB4MTFhMAo+ICAgaXBfYXV0b19jb25maWcgZnJvbSBk
b19vbmVfaW5pdGNhbGwrMHg4NC8weDMzYwo+ICAgZG9fb25lX2luaXRjYWxsIGZyb20ga2VybmVs
X2luaXRfZnJlZWFibGUrMHgxYjgvMHgyMTQKPiAgIGtlcm5lbF9pbml0X2ZyZWVhYmxlIGZyb20g
a2VybmVsX2luaXQrMHgyNC8weDE0MAo+ICAga2VybmVsX2luaXQgZnJvbSByZXRfZnJvbV9mb3Jr
KzB4MTQvMHgyOAo+ICBFeGNlcHRpb24gc3RhY2soMHhlMDgxNWZiMCB0byAweGUwODE1ZmY4KQo+
Cj4gUHJldmVudCB0aGlzIGRpdmlzaW9uIGJ5IDAgYnkgYWRkaW5nIGFuIGV4cGxpY2l0IGNoZWNr
IGFuZCBlcnJvciBsb2cKPiBhYm91dCB0aGUgYWN0dWFsIGlzc3VlLiBXaGlsZSBhdCBpdCwgcmVt
b3ZlIHRoZSBzYW1lIGNoZWNrIGZyb20KPiBzdG1tYWNfcHRwX3JlZ2lzdGVyLCB3aGljaCB0aGVu
IGJlY29tZXMgZHVwbGljYXRlCj4KPiBGaXhlczogMTlkODU3YzkwMzhlICgic3RtbWFjOiBGaXgg
Y2FsY3VsYXRpb25zIGZvciBwdHAgY291bnRlcnMgd2hlbiBjbG9jayBpbnB1dCA9IDUwTWh6LiIp
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGlu
LmNvbT4KCkkgcmVhbGl6ZSB0aGF0IEkgZm9yZ290IHRvIGNvbGxlY3QgWWFudGVuZydzIGFuZCBN
YXhpbWUncyBSQiBvbiB0aGlzIHBhdGNoLAphbmQgSSBndWVzcyB0aGV5IHJlbWFpbiByZWxldmFu
dCBkZXNwaXRlIHRoZSBzZWNvbmQgbmV3IHBhdGNoLCBteSBiYWQuIEknbGwKcmVtZW1iZXIgdG8g
YWRkIHRoZW0gaWYgdGhpcyBuZWVkcyBhIG5ldyByZXZpc2lvbi4KCkFsZXhpcwoKCgoKLS0gCkFs
ZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
