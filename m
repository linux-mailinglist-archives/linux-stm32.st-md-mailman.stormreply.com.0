Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC68A96FF1
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 17:07:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7791CC6C83D;
	Tue, 22 Apr 2025 15:07:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D60FCFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 15:07:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72DC843A39;
 Tue, 22 Apr 2025 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745334476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lncP1rgWm9k02UlHRTvf0YUucg0MEeMGEKN5pvhXfVQ=;
 b=Klg4oUbmi7xLuZmCjFNsc05CfSpssVHYxTn25E52mKt2mIoaCeIPzSDpCldl01RURD5NMz
 Bq8pU+hvK91Y8IreCt5mO7mvG0nlnD10upAROk3xG5TI0ZgafSj1AbtX0PDLEZ2o6lAaJy
 F96CJNRTpiZnj0vCoL/clxM5ajLLWkS0C5hgqIg1fGSRjbLTX2dvrpINlo704iIgc3akeQ
 aPYVQxzZy7DauupSzJnRVWvi0KW0I82Rk4973/sXJnramg3tCzf/WQ4vcn0cRCgY3/dbGn
 k7enfcn75Taz1ZAIRW0IydA/DDptU4o9fBVNDicuzrR7WgnPPbS0zQBBssQF6Q==
From: Alexis Lothore <alexis.lothore@bootlin.com>
Date: Tue, 22 Apr 2025 17:07:21 +0200
Message-Id: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKmwB2gC/x3MQQqAIBBA0avErBNsyqCuEhFiU80iC0ciEO+et
 Hzw+QmEApPAWCUI9LDw5QuaugJ3WL+T4rUYUKPRHaKSeJ7WLVGUQ+ytafUwEELp70Abv/9rAk8
 R5pw/kvsRhWAAAAA=
X-Change-ID: 20250422-stmmac_ts-c226a53099e2
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhgvuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeitdejieffgeevteegveefledugfffueeludejffdvteejffdvjeeuvddujeeugfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehli
 hhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: netdev@vger.kernel.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/2] net: stmmac: fix timestamp snapshots
	on dwmac1000
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

SGVsbG8sCgp0aGlzIHNtYWxsIHNlcmllcyBjb250YWlucyB0d28gc21hbGwgZml4ZXMgZm9yIHRo
ZSB0aW1lc3RhbXAgc25hcHNob3QKZmVhdHVyZSBvbiBzdG1tYWMsIGVzcGVjaWFsbHkgb24gZHdt
YWMxMDAwIHZlcnNpb24uIFRob3NlIGlzc3VlcyBoYXZlCmJlZW4gZGV0ZWN0ZWQgb24gYSBzb2Nm
cGdhIChDeWNsb25lIFYpIHBsYXRmb3JtLiBUaGV5IGtpbmQgb2YgZm9sbG93IHRoZQpiaWcgcmV3
b3JrIHNlbnQgYnkgTWF4aW1lIGF0IHRoZSBlbmQgb2YgbGFzdCB5ZWFyIHRvIHByb3Blcmx5IHNw
bGl0IHRoaXMKZmVhdHVyZSBzdXBwb3J0IGJldHdlZW4gZGlmZmVyZW50IHZlcnNpb25zIG9mIHRo
ZSBEV01BQyBJUC4KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhv
cmVAYm9vdGxpbi5jb20+Ci0tLQpBbGV4aXMgTG90aG9yZSAoMSk6CiAgICAgIG5ldDogc3RtbWFj
OiBmaXggZHdtYWMxMDAwIHB0cCB0aW1lc3RhbXAgc3RhdHVzIG9mZnNldAoKQWxleGlzIExvdGhv
csOpICgxKToKICAgICAgbmV0OiBzdG1tYWM6IGZpeCBtdWx0aXBsaWNhdGlvbiBvdmVyZmxvdyB3
aGVuIHJlYWRpbmcgdGltZXN0YW1wCgogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMxMDAwLmggICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjMTAwMF9jb3JlLmMgIHwgMiArLQogZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvc3RtbWFjX2h3dHN0YW1wLmMgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBjMDNhNDlm
MzA5M2E0OTAzYzhhOTNjOGI1YzlhMjk3YjUzNDNiMTY5CmNoYW5nZS1pZDogMjAyNTA0MjItc3Rt
bWFjX3RzLWMyMjZhNTMwOTllMgoKQmVzdCByZWdhcmRzLAotLSAKQWxleGlzIExvdGhvcsOpLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290
bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
