Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B1BAC7AB1
	for <lists+linux-stm32@lfdr.de>; Thu, 29 May 2025 11:07:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EF5BC32E92;
	Thu, 29 May 2025 09:07:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 641A3C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 09:07:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E708A43302;
 Thu, 29 May 2025 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748509654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vP+cBqQl4oU5V6STKgR9qkSDk+GPXxR/Qkbrnuthsrw=;
 b=PZJP+2eq8AeMj9IpLi1meIJZZuysN3MuFx2xm06qM+HGf2PTvo6TxHv/bDeAj9wfwkrT+4
 qOeKetKK88G6R7XEcZ4+H75HCJNDD5oyiOkntMNUAo7taylJN5voJdDlIA9SXKx5rwEctb
 vEqeQxdyePpEXp9h3AcnbZpHfxosPP3PmI3qhz4FJ2Vq5mI0Y2lCrmgt9Sp8Ptp95QIK6A
 S6yDLki2Y+ole9CwHpj6YLcWDUc9i9Mrfgxhxaw5BhULSTTObgVM0EA2InCtlgZkcK6rgB
 1r3yHRVkd7Mg/wZsxYsSsGFSgwAQxwIgxo382G4YHjE6DptAmUr9z9ztWhfPbQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Thu, 29 May 2025 11:07:24 +0200
MIME-Version: 1.0
Message-Id: <20250529-stmmac_tstamp_div-v4-2-d73340a794d5@bootlin.com>
References: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
In-Reply-To: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvheejfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrvddtkegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 ehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplfhoshgvrdetsghrvghusehshihnohhpshihshdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhhorggsrhgvuhesshihnhhophhshihsrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 Yanteng Si <si.yanteng@linux.dev>, linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/2] net: stmmac: make sure that ptp_rate
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
ZGQgYmFzaWMgRVNUIHN1cHBvcnQgZm9yIFhHTUFDIikKLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gcmVi
YXNlZCBvbiBuZXQvbWFpbgpDaGFuZ2VzIGluIHYzOgotIG5ldyBwYXRjaAotLS0KIGRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19lc3QuYyB8IDUgKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfZXN0LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfZXN0LmMKaW5kZXggYzk2OTNmNzdlMWY2MWZlNWM5MmY5NWY1
ZTU0NDM3MTQ0NTYyNmM0ZC4uYWM2ZjJlM2EzZmNkMmY5YWUyMTkxMzg0NTI4MmZmMDE1Y2QyZjdl
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X2VzdC5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19l
c3QuYwpAQCAtMzIsNiArMzIsMTEgQEAgc3RhdGljIGludCBlc3RfY29uZmlndXJlKHN0cnVjdCBz
dG1tYWNfcHJpdiAqcHJpdiwgc3RydWN0IHN0bW1hY19lc3QgKmNmZywKIAlpbnQgaSwgcmV0ID0g
MDsKIAl1MzIgY3RybDsKIAorCWlmICghcHRwX3JhdGUpIHsKKwkJbmV0ZGV2X3dhcm4ocHJpdi0+
ZGV2LCAiSW52YWxpZCBQVFAgcmF0ZSIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKIAlyZXQg
fD0gZXN0X3dyaXRlKGVzdF9hZGRyLCBFU1RfQlRSX0xPVywgY2ZnLT5idHJbMF0sIGZhbHNlKTsK
IAlyZXQgfD0gZXN0X3dyaXRlKGVzdF9hZGRyLCBFU1RfQlRSX0hJR0gsIGNmZy0+YnRyWzFdLCBm
YWxzZSk7CiAJcmV0IHw9IGVzdF93cml0ZShlc3RfYWRkciwgRVNUX1RFUiwgY2ZnLT50ZXIsIGZh
bHNlKTsKCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
