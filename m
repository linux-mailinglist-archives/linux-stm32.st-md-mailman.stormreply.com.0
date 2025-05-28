Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D3AC63A5
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 10:06:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6B17C36B30;
	Wed, 28 May 2025 08:06:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79635C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 08:06:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9370A44393;
 Wed, 28 May 2025 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748419586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8Snn3M2Xto80GFCTzGDH4eMJtf9SvjbeLQR53HTuGQ=;
 b=H0WSSbShJ0Gz7Vg8g+HKsOFdUBIafPRnGn2jUS3PRcl77WiUdJ9uR25cfFiY7ItPIDyii/
 gppDVRhJ/E+EiQx2GzxL/QxaIylJmxFNR8xsY5x5UqkpWbQfyAgVLQ0jq7JCE95lsooIL4
 QV0kYkFlCSVo0RDy3BGQK0+36/6pMrHGVySCDuQbk1Z8tJPL/YicoKHGZ0oR4fGJF00K9f
 loiiuW0yTVcTH+XXAI14PJROcA3E1HMWlO4t1VV4x4Y9xSu1negVKjX+EFApwCfZuBQoqb
 akMwK1VWuR5S1uEz1ESV/mFcLaOnDptzmhJrUPbOXs8ueYrooE10alPOZDnmyA==
Mime-Version: 1.0
Date: Wed, 28 May 2025 10:06:23 +0200
Message-Id: <DA7N0K4FSI14.QARGA1ALU2XV@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250527-stmmac_tstamp_div-v2-1-663251b3b542@bootlin.com>
 <20250527183105.7c4bad49@device-24.home>
In-Reply-To: <20250527183105.7c4bad49@device-24.home>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleekheeihfefheevhfdtgeeuleekheffffffuedvkeekkeduvdeugeeugfeiueeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepjhhorggsrhgvuhesshihnhhophhshihsrdgtohhmpdhrtghpthhtoheprghnughrvgifo
 dhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Phil Reid <preid@electromag.com.au>, linux-kernel@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: add explicit check and
 error on invalid PTP clock rate
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

SGV5IE1heGltZSwKCk9uIFR1ZSBNYXkgMjcsIDIwMjUgYXQgNjozMSBQTSBDRVNULCBNYXhpbWUg
Q2hldmFsbGllciB3cm90ZToKPiBIaSBBbGV4aXMsCj4KPiBPbiBUdWUsIDI3IE1heSAyMDI1IDA4
OjMzOjQ0ICswMjAwCj4gQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNv
bT4gd3JvdGU6CgpbLi4uXQoKPj4gKwlpZiAoIXByaXYtPnBsYXQtPmNsa19wdHBfcmF0ZSkgewo+
PiArCQluZXRkZXZfZXJyKHByaXYtPmRldiwgIkludmFsaWQgUFRQIGNsb2NrIHJhdGUiKTsKPj4g
KwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsJfQo+PiArCj4+ICAJc3RtbWFjX2NvbmZpZ19od190c3Rh
bXBpbmcocHJpdiwgcHJpdi0+cHRwYWRkciwgc3lzdGltZV9mbGFncyk7Cj4+ICAJcHJpdi0+c3lz
dGltZV9mbGFncyA9IHN5c3RpbWVfZmxhZ3M7Cj4KPiBUaGlzIG1heSBiZSBzb21lIG5pdHBpY2sg
dGhhdCBjYW4gYmUgYWRkcmVzc2VkIGF0IGEgbGF0ZXIgcG9pbnQsIGJ1dCB3ZQo+IG5vdyBoYXZl
IGEgZ3VhcmFudGVlIHRoYXQgd2hlbiBzdG1tYWNfcHRwX3JlZ2lzdGVyKCkgZ2V0cyBjYWxsZWQs
Cj4gcHJpdi0+cHRwX2Nsa19yYXRlIGlzIG5vbi16ZXJvLCByaWdodCA/IElmIHNvLCB3ZSBjYW4g
ZHJvcCB0aGUgdGVzdCBpbgo+IHNhaWQgZnVuY3Rpb24gOgo+Cj4gCWlmIChwcml2LT5wbGF0LT5o
YXNfZ21hYzQgJiYgcHJpdi0+cGxhdC0+Y2xrX3B0cF9yYXRlKQo+IAkJcHJpdi0+cGxhdC0+Y2Rj
X2Vycm9yX2FkaiA9ICgyICogTlNFQ19QRVJfU0VDKSAvIHByaXYtPnBsYXQtPmNsa19wdHBfcmF0
ZTsKCllvdSBhcmUgcmlnaHQsIG15IHNlcmllcyBtYWtlcyB0aGlzIGNoZWNrIGEgZHVwbGljYXRl
LCBJJ2xsIHJlbW92ZSBpdC4KCj4gVGhlcmUgaXMgYW5vdGhlciBzcG90IGluIHRoZSBjb2RlLCBs
aWtlIGluIHRoZSBFU1QgaGFuZGxpbmcsIHdoZXJlIHdlCj4gZGl2aWRlIGJ5IHByaXYtPnBsYXQt
PnB0cF9jbGtfcmF0ZSA6Cj4KPiBzdG1tYWNfYWRqdXN0X3RpbWUoLi4uKQo+IAlzdG1tYWNfZXN0
X2NvbmZpZ3VyZShwcml2LCBwcml2LCBwcml2LT5lc3QsCj4gCQkJICAgICBwcml2LT5wbGF0LT5j
bGtfcHRwX3JhdGUpCj4gCQkuZXN0X2NvbmZpZ3VyZSgpCj4gCQkJY3RybCB8PSAoKE5TRUNfUEVS
X1NFQyAvIHB0cF9yYXRlKSBbLi4uXQo+Cj4gTWF5YmUgd2Ugc2hvdWxkIGZhaWwgRVNUIGNvbmZp
Z3VyYXRpb24gYXMgd2VsbCBpZiBwdHBfY2xrX3JhdGUgaXMgMAo+IChwcm9iYWJseSBpbiBzdG1t
YWNfdGMuYydzIHRjX3RhcHJpb19jb25maWd1cmUgb3IgaW4gdGhlCj4gLmVzdF9jb25maWd1cmUp
LiBUaGF0IGNhbiBiZSBhIHN0ZXAgZm9yIGxhdGVyIGFzIHdlbGwsIGFzIEkgZG9uJ3Qga25vdwo+
IGlmIHRoZSBzZXR1cCB5b3UgZm91bmQgdGhpcyBidWcgb24gZXZlbiBzdXBwb3J0cyB0YXByaW8v
RVNULCBhbmQgc2V0dXBzCj4gdGhhdCBkbyBkaWRuJ3Qgc2VlbSB0byBlbmNvdW50ZXIgdGhlIGJ1
ZyB5ZXQuCgpJIGd1ZXNzIHlvdSBhcmUgcmlnaHQgYXMgd2VsbCwgaXQgbWF5IG5vdCBtYWtlIHNl
bnNlIHRvIHRyeSB0byBjb25maWd1cmUKRVNUIGlmIHdlIGhhdmUgYSBib2d1cyBjbGtfcHRwX3Jh
dGUgdmFsdWUuIGVzdF9jb25maWd1cmUgc2VlbXMgdG8gYmUgY2FsbGVkCmluIGJvdGggdGNfdGFw
cmlvX2NvbmZpZ3VyZSBhbmQgc3RtbWFjX2FkanVzdF90aW1lLCBzbyBJJ2xsIGFkZCB0aGUgY2hl
Y2sKaW4gZXN0X2NvbmZpZ3VyZS4KClRoYW5rcywKCkFsZXhpcwoKLS0gCkFsZXhpcyBMb3Rob3LD
qSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
