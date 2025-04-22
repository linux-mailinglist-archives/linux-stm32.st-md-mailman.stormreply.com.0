Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB9A96FF2
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 17:07:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84013C78F63;
	Tue, 22 Apr 2025 15:07:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D12D4CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 15:07:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE1EA439F6;
 Tue, 22 Apr 2025 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745334477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sv05jOSJ6xc00eTPXgNHRvsKAXEfKlZvJUZ4OUiKUQs=;
 b=OYwnFVQAZcZEoI+rYV4eM26gGChn+jEPACAHPdCJihqM7V88gUroJFpnBFYkrEFGl5dN2I
 FEBT+F0F3V7QCNarRFhd3EWbNG5uxB8DLAPcqMxv6T9JUFMiy03fNgiEDCuUTjyOlON3rD
 ySU2E6zlyoSop5Dlh0KvSqivEg1Vqmz5yWWjKEK6SAs1yUtaxRqMRk3JmRlQvcsq94uqF6
 nAsaq9tXBn3LTeOOPPBRKRfJatOsq+m58nUFZ085aejv6CUmpLG8bj0T/MjwkM/kb3cJFd
 jIN+aX8RtYSXoYMwp7383VYkT4yOf2zN7EhYkG/Gpjgw9RbGy4rAypeFAxCL3g==
From: Alexis Lothore <alexis.lothore@bootlin.com>
Date: Tue, 22 Apr 2025 17:07:22 +0200
MIME-Version: 1.0
Message-Id: <20250422-stmmac_ts-v1-1-b59c9f406041@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhgvuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefudfhgeegtdekvdeujedugefhhffhfedtgfetffevveekfeelveejfffhjeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: netdev@vger.kernel.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/2] net: stmmac: fix dwmac1000 ptp
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
ciBkd21hYzEwMDAuCgpGaXhlczogMTliOTNiYmIyMGViICgibmV0OiBzdG1tYWM6IEludHJvZHVj
ZSBkd21hYzEwMDAgdGltZXN0YW1waW5nIG9wZXJhdGlvbnMiKQpTaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjMTAwMC5oIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjMTAwMC5oIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMxMDAwLmgKaW5kZXggOTY3YTE2MjEyZmFmMDA4
YmM3YjVlNDMwMzFlMmQ4NTgwMGM1YzQ2Ny4uMGMwMTFhNDdkNWEzZTk4MjgwYTk4ZDI1YjhlZjM2
MTQ2ODRhZTc4YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMxMDAwLmgKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMxMDAwLmgKQEAgLTMyMCw4ICszMjAsOCBAQCBlbnVtIHJ0Y19jb250cm9sIHsKIAogLyog
UFRQIGFuZCB0aW1lc3RhbXBpbmcgcmVnaXN0ZXJzICovCiAKLSNkZWZpbmUgR01BQzNfWF9BVFNO
UyAgICAgICBHRU5NQVNLKDE5LCAxNikKLSNkZWZpbmUgR01BQzNfWF9BVFNOU19TSElGVCAxNgor
I2RlZmluZSBHTUFDM19YX0FUU05TICAgICAgIEdFTk1BU0soMjksIDI1KQorI2RlZmluZSBHTUFD
M19YX0FUU05TX1NISUZUIDI1CiAKICNkZWZpbmUgR01BQ19QVFBfVENSX0FUU0ZDCUJJVCgyNCkK
ICNkZWZpbmUgR01BQ19QVFBfVENSX0FUU0VOMAlCSVQoMjUpCgotLSAKMi40OS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
