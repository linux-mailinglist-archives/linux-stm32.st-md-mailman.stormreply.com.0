Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BEFA98A43
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 15:02:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29355C7128A;
	Wed, 23 Apr 2025 13:02:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 098E8C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 13:02:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 056361FCE9;
 Wed, 23 Apr 2025 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745413355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8bMV3NwRcE1hzN4J3o3cRGIKHoOIzyacT+46rTZMrQ=;
 b=cdEUE4gxp1nKhx3LhaZV5bNGMQw2LTagDxZwhXwlyigGUjuYZ+CzjtrJjdGn3hfT0V0ekp
 L8pkeZKfiq1FS6//Jkt1UHLiFNZgmgDt/rJlKerX8KSTuXE7qLXq18Xo0pqM45dbcJMYYV
 Xwo2xKsZ6a64WDQKgKtDQD++Ae/NvoehAJ0IGzbz0No1wMzV50MEOTerP1hfZKf6iCKOVH
 EmJA3gHWC2LIZNKBG8l9yD2xTfTv8IOlvo0AzRdvEy1hoHd6uD/NVORXp3VbvzEZPQqGLr
 DgRDWQIW6KN8j5wbv1vtIBA5ZAk9UaMPQbPKkJV8taEUFn5zp0KT/6LjgroO5g==
Date: Wed, 23 Apr 2025 15:02:33 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Message-ID: <20250423150233.38fb5437@device-40.home>
In-Reply-To: <20250423-stmmac_ts-v2-2-e2cf2bbd61b1@bootlin.com>
References: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
 <20250423-stmmac_ts-v2-2-e2cf2bbd61b1@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeiieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhfefggfdthffghfdvhffhhfetuedtkeetgffhteevheehjeejgfduieduhedunecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopeguvghvihgtvgdqgedtrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrv
 hgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org, Daniel Machon <daniel.machon@microchip.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: fix
 multiplication overflow when reading timestamp
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

T24gV2VkLCAyMyBBcHIgMjAyNSAwOToxMjoxMCArMDIwMApBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gVGhlIGN1cnJlbnQgd2F5IG9mIHJlYWRp
bmcgYSB0aW1lc3RhbXAgc25hcHNob3QgaW4gc3RtbWFjIGNhbiBsZWFkIHRvCj4gaW50ZWdlciBv
dmVyZmxvdywgYXMgdGhlIGNvbXB1dGF0aW9uIGlzIGRvbmUgb24gMzIgYml0cy4gVGhlIGlzc3Vl
IGhhcwo+IGJlZW4gb2JzZXJ2ZWQgb24gYSBkd21hYy1zb2NmcGdhIHBsYXRmb3JtIHJldHVybmlu
ZyBjaGFvdGljIHRpbWVzdGFtcAo+IHZhbHVlcyBkdWUgdG8gdGhpcyBvdmVyZmxvdy4gVGhlIGNv
cnJlc3BvbmRpbmcgbXVsdGlwbGljYXRpb24gaXMgZG9uZQo+IHdpdGggYSBNVUwgaW5zdHJ1Y3Rp
b24sIHdoaWNoIHJldHVybnMgMzIgYml0IHZhbHVlcy4gRXhwbGljaXRseSBjYXN0aW5nCj4gdGhl
IHZhbHVlIHRvIDY0IGJpdHMgcmVwbGFjZWQgdGhlIE1VTCB3aXRoIGEgVU1MQUwsIHdoaWNoIGNv
bXB1dGVzIGFuZAo+IHJldHVybnMgdGhlIHJlc3VsdCBvbiA2NCBiaXRzLCBhbmQgc28gcmV0dXJu
cyBjb3JyZWN0bHkgdGhlIHRpbWVzdGFtcHMuCj4gCj4gUHJldmVudCB0aGlzIG92ZXJmbG93IGJ5
IGV4cGxpY2l0bHkgY2FzdGluZyB0aGUgaW50ZXJtZWRpYXRlIHZhbHVlIHRvCj4gdTY0IHRvIG1h
a2Ugc3VyZSB0aGF0IHRoZSB3aG9sZSBjb21wdXRhdGlvbiBpcyBtYWRlIG9uIHU2NC4gV2hpbGUg
YXQgaXQsCj4gYXBwbHkgdGhlIHNhbWUgY2FzdCBvbiB0aGUgb3RoZXIgZHdtYWMgdmFyaWFudCAo
R01BQzQpIG1ldGhvZCBmb3IKPiBzbmFwc2hvdCByZXRyaWV2YWwuCj4gCj4gRml4ZXM6IDQ3N2Mz
ZTFmNjM2MyAoIm5ldDogc3RtbWFjOiBJbnRyb2R1Y2UgZHdtYWMxMDAwIHRpbWVzdGFtcGluZyBv
cGVyYXRpb25zIikKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Ro
b3JlQGJvb3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IE1heGltZSBDaGV2YWxsaWVyIDxtYXhpbWUu
Y2hldmFsbGllckBib290bGluLmNvbT4KClRoYW5rcywKCk1heGltZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
