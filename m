Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E60F1A98024
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 09:12:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A619BC78F63;
	Wed, 23 Apr 2025 07:12:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2EB3C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 07:12:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CDFF43A36;
 Wed, 23 Apr 2025 07:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745392339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkjBpj7wvMxsVfxHzks1lri0zffcvGGh+bHSb8/6KeA=;
 b=MpXO5NI0S0uqAIOfOq71TlNJIo/ygPFDHO68GFpxyoc+MkBSWP1roW4BBVRB5QMozRNtUA
 tNC14wqLbfYp9xTUPJuOjj+D66+tRFwKDk1K1rBDmrWThhWIYIU+ZMauyR2tMOIgbDGlkr
 kJaq+33VxEAiW+KUdP8ofRE/TGBs3oO7rWkdVbGyo+/q8ECIZMVjdgHz/+sJiAitHXY87u
 +ZQnwDRwDTb53AiplHwtX4Sva+gEWY4ZGZ+Tj1FDmJTfheYZcu1SURL5rASsw0e1SaHM3W
 82mjxbVNmpNKEFQGzBhFlVmqioeSuevcwPp5u5YL4BsF5xQVudZeBSk9kke/Pw==
From: Alexis Lothore <alexis.lothore@bootlin.com>
Date: Wed, 23 Apr 2025 09:12:09 +0200
MIME-Version: 1.0
Message-Id: <20250423-stmmac_ts-v2-1-e2cf2bbd61b1@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhgvuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefudfhgeegtdekvdeujedugefhhffhfedtgfetffevveekfeelveejfffhjeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdhmrggthhhonhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhug
 iesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: netdev@vger.kernel.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 1/2] net: stmmac: fix dwmac1000 ptp
 timestamp status offset
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

V2hlbiBhIFBUUCBpbnRlcnJ1cHQgb2NjdXJzLCB0aGUgZHJpdmVyIGFjY2Vzc2VzIHRoZSB3cm9u
ZyBvZmZzZXQgdG8KbGVhcm4gYWJvdXQgdGhlIG51bWJlciBvZiBhdmFpbGFibGUgc25hcHNob3Rz
IGluIHRoZSBGSUZPIGZvciBkd21hYzEwMDA6Cml0IHNob3VsZCBiZSBhY2Nlc3NpbmcgYml0cyAy
OS4uMjUsIHdoaWxlIGl0IGlzIGN1cnJlbnRseSByZWFkaW5nIGJpdHMKMTkuLjE2ICh0aG9zZSBh
cmUgYml0cyBhYm91dCB0aGUgYXV4aWxpYXJ5IHRyaWdnZXJzIHdoaWNoIGhhdmUgZ2VuZXJhdGVk
CnRoZSB0aW1lc3RhbXBzKS4gQXMgYSBjb25zZXF1ZW5jZSwgaXQgZG9lcyBub3QgY29tcHV0ZSBj
b3JyZWN0bHkgdGhlCm51bWJlciBvZiBhdmFpbGFibGUgc25hcHNob3RzLCBhbmQgc28gcG9zc2li
bHkgZG8gbm90IGdlbmVyYXRlIHRoZQpjb3JyZXNwb25kaW5nIGNsb2NrIGV2ZW50cyBpZiB0aGUg
Ym9ndXMgdmFsdWUgZW5kcyB1cCBiZWluZyAwLgoKRml4IGNsb2NrIGV2ZW50cyBnZW5lcmF0aW9u
IGJ5IHJlYWRpbmcgdGhlIGNvcnJlY3QgYml0cyBpbiB0aGUgdGltZXN0YW1wCnJlZ2lzdGVyIGZv
ciBkd21hYzEwMDAuCgpGaXhlczogNDc3YzNlMWY2MzYzICgibmV0OiBzdG1tYWM6IEludHJvZHVj
ZSBkd21hYzEwMDAgdGltZXN0YW1waW5nIG9wZXJhdGlvbnMiKQpTaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgpSZXZpZXdlZC1ieTogTWF4
aW1lIENoZXZhbGxpZXIgPG1heGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29tPgotLS0KIGRyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjMTAwMC5oIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjMTAwMC5oIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMxMDAwLmgKaW5kZXggOTY3YTE2MjEy
ZmFmMDA4YmM3YjVlNDMwMzFlMmQ4NTgwMGM1YzQ2Ny4uMGMwMTFhNDdkNWEzZTk4MjgwYTk4ZDI1
YjhlZjM2MTQ2ODRhZTc4YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMxMDAwLmgKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMxMDAwLmgKQEAgLTMyMCw4ICszMjAsOCBAQCBlbnVtIHJ0Y19jb250cm9sIHsK
IAogLyogUFRQIGFuZCB0aW1lc3RhbXBpbmcgcmVnaXN0ZXJzICovCiAKLSNkZWZpbmUgR01BQzNf
WF9BVFNOUyAgICAgICBHRU5NQVNLKDE5LCAxNikKLSNkZWZpbmUgR01BQzNfWF9BVFNOU19TSElG
VCAxNgorI2RlZmluZSBHTUFDM19YX0FUU05TICAgICAgIEdFTk1BU0soMjksIDI1KQorI2RlZmlu
ZSBHTUFDM19YX0FUU05TX1NISUZUIDI1CiAKICNkZWZpbmUgR01BQ19QVFBfVENSX0FUU0ZDCUJJ
VCgyNCkKICNkZWZpbmUgR01BQ19QVFBfVENSX0FUU0VOMAlCSVQoMjUpCgotLSAKMi40OS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
