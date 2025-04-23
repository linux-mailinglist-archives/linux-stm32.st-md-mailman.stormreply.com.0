Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC14A98023
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 09:12:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 994B4C7802F;
	Wed, 23 Apr 2025 07:12:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9336C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 07:12:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2539643A30;
 Wed, 23 Apr 2025 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745392338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TkQ7C8jgkCaEq9rXFk0Vbf3ZVjNr91B4Eok6HCwhjgE=;
 b=OyNIlDDmh31ZODQSRl36ioGEdYX9s/zBp8vjomnpUrxi6KLMPBpOciJcPYeYlRDFgXzvmB
 Sqmbzp4Ip1AzVF7LqCev+ngzZGUMO37gsSTXv8LGmjtO1bxov5rQkxw+UAm2xQrlenzyIC
 2KouizGjb6pKGEMEWHBqsdnPGpHDY1JXnOv3oiDdwV1Y+HIQnfwLazowzsfJ5YGW0BwdE1
 BnBDtvHLaaf7XNWQ7TNRaEiORKJLdBqiA/fq/Et3VM2hRHLe8TXi8r4COp4pRwtrZainc5
 13MkBdwDYsPv/M/2PUTVQJjD+wwFHJgk/4Ftdy2BmevXBYOk2UaTKi5USAfWhw==
From: Alexis Lothore <alexis.lothore@bootlin.com>
Date: Wed, 23 Apr 2025 09:12:08 +0200
Message-Id: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMiSCGgC/22MQQrCMBBFr1JmbSQd20JceQ8pksapHTBJyYSgl
 N7d0LXL9//jbSCUmASuzQaJCgvHUAFPDbjFhhcpflYG1NjrDlFJ9t66RxblEAfbX7QxhFD9NdH
 Mn6N1h0AZxjouLDmm79Ev7XH9SZVWaTX1xpm504Pu2tsUY35zOLvoYdz3/Qd1aoL/qQAAAA==
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhgvuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgleelieejgfelfffgiefhleeijeduueejvdekudeludetleelhfevhffgudeikeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrlhgvgihishdrlhhot
 hhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: netdev@vger.kernel.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 0/2] net: stmmac: fix timestamp
 snapshots on dwmac1000
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

SGVsbG8sCgp0aGlzIGlzIHRoZSB2MiBvZiBhIHNtYWxsIHNlcmllcyBjb250YWluaW5nIHR3byBz
bWFsbCBmaXhlcyBmb3IgdGhlCnRpbWVzdGFtcCBzbmFwc2hvdCBmZWF0dXJlIG9uIHN0bW1hYywg
ZXNwZWNpYWxseSBvbiBkd21hYzEwMDAgdmVyc2lvbi4KVGhvc2UgaXNzdWVzIGhhdmUgYmVlbiBk
ZXRlY3RlZCBvbiBhIHNvY2ZwZ2EgKEN5Y2xvbmUgVikgcGxhdGZvcm0uIFRoZXkKa2luZCBvZiBm
b2xsb3cgdGhlIGJpZyByZXdvcmsgc2VudCBieSBNYXhpbWUgYXQgdGhlIGVuZCBvZiBsYXN0IHll
YXIgdG8KcHJvcGVybHkgc3BsaXQgdGhpcyBmZWF0dXJlIHN1cHBvcnQgYmV0d2VlbiBkaWZmZXJl
bnQgdmVyc2lvbnMgb2YgdGhlCkRXTUFDIElQLgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhv
csOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gZHJv
cCBhZGRpdGlvbmFsIHBhcmVudGhlc2lzCi0gZml4IHdyb25nIGhhc2hlcyBpbiBGaXhlcyB0YWdz
Ci0gYWRkIE1heGltZSdzIFJCIG9uIGZpcnN0IHBhdGNoCi0gTGluayB0byB2MTogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDI1MDQyMi1zdG1tYWNfdHMtdjEtMC1iNTljOWY0MDYwNDFAYm9v
dGxpbi5jb20KCi0tLQpBbGV4aXMgTG90aG9yZSAoMSk6CiAgICAgIG5ldDogc3RtbWFjOiBmaXgg
ZHdtYWMxMDAwIHB0cCB0aW1lc3RhbXAgc3RhdHVzIG9mZnNldAoKQWxleGlzIExvdGhvcsOpICgx
KToKICAgICAgbmV0OiBzdG1tYWM6IGZpeCBtdWx0aXBsaWNhdGlvbiBvdmVyZmxvdyB3aGVuIHJl
YWRpbmcgdGltZXN0YW1wCgogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMxMDAwLmggICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjMTAwMF9jb3JlLmMgIHwgMiArLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX2h3dHN0YW1wLmMgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBjMDNhNDlmMzA5M2E0
OTAzYzhhOTNjOGI1YzlhMjk3YjUzNDNiMTY5CmNoYW5nZS1pZDogMjAyNTA0MjItc3RtbWFjX3Rz
LWMyMjZhNTMwOTllMgoKQmVzdCByZWdhcmRzLAotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNv
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
