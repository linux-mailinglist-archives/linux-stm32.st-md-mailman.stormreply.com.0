Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACBAC647D
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 10:30:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BF54C36B30;
	Wed, 28 May 2025 08:30:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB39DC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 08:29:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A2A743153;
 Wed, 28 May 2025 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748420999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NdtCm4KeLnVfdZbdleEEAwUOA4JSpjcY4XsOVNaCHbA=;
 b=P7aRpHv7sMWWrZgOxiKy1icjDjdNKPlrhclj5/VB53qk4dbSNWVQoiwJRhv8erY0AQcw1D
 I4VB4G1QvEcmKyuxr9+CNXY/N/IkfahRsO70dhKZIo7AvRTMUHIhlcyrgfsxE+X+N6fvNS
 kPWL9uB0+1RclnJDiq/3XiSiGjGivFgDLf7JBujpLMw2zeaLZ99v905KZlEVsdwGMEqrYV
 zbFbwyG6IVPGuB9n+FZ4OyM3m0JkCWwLI5gakTFl3bSTTxGg/dd3CesKN5CZy0SihhDSJL
 9dskNPfyLFiJtnMcb4DCDmxTZOPtqu+Td0sI/q8V7yBqy7BIATfIn/qW5S5qiw==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 28 May 2025 10:29:49 +0200
Message-Id: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH3JNmgC/23N0QrCIBTG8VcZXmfocW7VVe8RMdS5dqDNoSLF2
 LvnBkHBLv8fnN+ZSbAebSCXYibeJgzoxhziUBDTq/FhKba5CTCQTALQEIdBmSaGqIapaTHRTkr
 OoWMVgzPJd5O3Hb4283bP3WOIzr+3F4mv61cTO1rilFNt1ElJJVRZ11ftXHzieDRuIKuX4Neo9
 wzIRlUJkFwLLUv4N5Zl+QDThLVm+AAAAA==
X-Change-ID: 20250522-stmmac_tstamp_div-f55112f06029
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffefvdelledtfeekudelvdekvdeuffduieevkedviedtgeefueehgfdvuedthfeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrv
 gessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvght
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/2] net: stmmac: prevent div by 0
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

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGFpbXMgdG8gZml4IGEgc21hbGwgc3BsYXQgSSBhbSBv
YnNlcnZpbmcgb24gYSBTVE0zMk1QMTU3CnBsYXRmb3JtIGF0IGJvb3QgKHNlZSBjb21taXQgMSkg
ZHVlIHRvIGEgZGl2aXNpb24gYnkgMC4gVGhpcyBuZXcKcmV2aXNpb24gYWRkIHRoZSBzYW1lIGNo
ZWNrIGluIGFub3RoZXIgY29kZSBwYXRoIHBvc3NpYmx5IGFmZmVjdGVkIGJ5CnRoZSBzYW1lIGlz
c3VlLCBhcyBkaXNjdXNzZWQgaW4gdjIuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kg
PGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSByZW1vdmUg
bm93IGR1cGxpY2F0ZSBjaGVjawotIGFkZCBwdHBfcmF0ZSBjaGVjayBpbiBlc3RfY29uZmlndXJl
Ci0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUyNy1zdG1tYWNf
dHN0YW1wX2Rpdi12Mi0xLTY2MzI1MWIzYjU0MkBib290bGluLmNvbQoKQ2hhbmdlcyBpbiB2MjoK
LSBBZGQgRml4ZXMgdGFnCi0gUmV3b3JkIGNvbW1pdCBtZXNzYWdlIHRvIGNsYXJpZnkgdGhlIHRy
aWdnZXJpbmcgY2F1c2Ugb2YgdGhlIGlzc3VlCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI1MDUyMy1zdG1tYWNfdHN0YW1wX2Rpdi12MS0xLWJjYThhNWEzYTQ3N0Bi
b290bGluLmNvbQoKLS0tCkFsZXhpcyBMb3Rob3LDqSAoMik6CiAgICAgIG5ldDogc3RtbWFjOiBt
YWtlIHN1cmUgdGhhdCBwdHBfcmF0ZSBpcyBub3QgMCBiZWZvcmUgY29uZmlndXJpbmcgdGltZXN0
YW1waW5nCiAgICAgIG5ldDogc3RtbWFjOiBtYWtlIHN1cmUgdGhhdCBwdHBfcmF0ZSBpcyBub3Qg
MCBiZWZvcmUgY29uZmlndXJpbmcgRVNUCgogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX2VzdC5jICB8IDUgKysrKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCA1ICsrKysrCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmMgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0tLQpiYXNlLWNvbW1pdDogZTBlMmY3ODI0MzM4
NWU3MTg4YTU3ZmNmY2ViNmExOWY3MjNmMWRmZgpjaGFuZ2UtaWQ6IDIwMjUwNTIyLXN0bW1hY190
c3RhbXBfZGl2LWY1NTExMmYwNjAyOQoKQmVzdCByZWdhcmRzLAotLSAKQWxleGlzIExvdGhvcsOp
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
