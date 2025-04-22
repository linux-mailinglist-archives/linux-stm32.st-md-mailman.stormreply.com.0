Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9CA97210
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 18:11:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64D64C78034;
	Tue, 22 Apr 2025 16:11:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5C1CC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 16:11:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6506D43A46;
 Tue, 22 Apr 2025 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745338279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRoJLlC7A12/TR2Wz8V+c+670ziWaCSA92DtyIsQ39c=;
 b=BL+N8Q5Fn6rdiqBn6OmTsxXoJ9Hmwb4+Cp9EPmNsArEyLxUBWFVxrjkUHAF0kIsavPM6XX
 diCJtu+5Ly9c8KpN6G8x6k6lDFpyCYNdFdmJbLzqvILAA2E461zP6Vl5aQnWM52I1ZKFjb
 URv4AQLYjPslN6FYm//6sL4cTinqbdZ0ozPAQ8e/3iB+TBYuQf2hdfFevjXWgqw3IDHG8/
 uY3oRLwfCgKhdSGVb6x4CH2T0ogBE6yTmirNGCqLE14+OuS7xL/NOa3//AO+jRjVas+IZt
 Do7zVrHIg0pSTNgvl5tNaYZYAfY7atWN0Xxx+Tu4ztV+/zEpRVIM3rCNf3Da9w==
Mime-Version: 1.0
Date: Tue, 22 Apr 2025 18:11:18 +0200
Message-Id: <D9DAS80VMYAW.3JALOQIHS2B0W@bootlin.com>
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
 <20250422-stmmac_ts-v1-1-b59c9f406041@bootlin.com>
 <20250422174934.309a1309@fedora.home>
In-Reply-To: <20250422174934.309a1309@fedora.home>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvfevuffhofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekgfffhfehhfefgeekhfffudfhheekveffleeuhfelgfefueevhedvkeduhfehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhto
 hepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-kernel@vger.kernel.org, Daniel Machon <daniel.machon@microchip.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/2] net: stmmac: fix dwmac1000 ptp
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

SGkgTWF4aW1lLAoKT24gVHVlIEFwciAyMiwgMjAyNSBhdCA1OjQ5IFBNIENFU1QsIE1heGltZSBD
aGV2YWxsaWVyIHdyb3RlOgo+IEhpIEFsZXhpcywKPgo+IE9uIFR1ZSwgMjIgQXByIDIwMjUgMTc6
MDc6MjIgKzAyMDAKPiBBbGV4aXMgTG90aG9yZSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
IHdyb3RlOgo+Cj4+IFdoZW4gYSBQVFAgaW50ZXJydXB0IG9jY3VycywgdGhlIGRyaXZlciBhY2Nl
c3NlcyB0aGUgd3Jvbmcgb2Zmc2V0IHRvCj4+IGxlYXJuIGFib3V0IHRoZSBudW1iZXIgb2YgYXZh
aWxhYmxlIHNuYXBzaG90cyBpbiB0aGUgRklGTyBmb3IgZHdtYWMxMDAwOgo+PiBpdCBzaG91bGQg
YmUgYWNjZXNzaW5nIGJpdHMgMjkuLjI1LCB3aGlsZSBpdCBpcyBjdXJyZW50bHkgcmVhZGluZyBi
aXRzCj4+IDE5Li4xNiAodGhvc2UgYXJlIGJpdHMgYWJvdXQgdGhlIGF1eGlsaWFyeSB0cmlnZ2Vy
cyB3aGljaCBoYXZlIGdlbmVyYXRlZAo+PiB0aGUgdGltZXN0YW1wcykuIEFzIGEgY29uc2VxdWVu
Y2UsIGl0IGRvZXMgbm90IGNvbXB1dGUgY29ycmVjdGx5IHRoZQo+PiBudW1iZXIgb2YgYXZhaWxh
YmxlIHNuYXBzaG90cywgYW5kIHNvIHBvc3NpYmx5IGRvIG5vdCBnZW5lcmF0ZSB0aGUKPj4gY29y
cmVzcG9uZGluZyBjbG9jayBldmVudHMgaWYgdGhlIGJvZ3VzIHZhbHVlIGVuZHMgdXAgYmVpbmcg
MC4KPj4gCj4+IEZpeCBjbG9jayBldmVudHMgZ2VuZXJhdGlvbiBieSByZWFkaW5nIHRoZSBjb3Jy
ZWN0IGJpdHMgaW4gdGhlIHRpbWVzdGFtcAo+PiByZWdpc3RlciBmb3IgZHdtYWMxMDAwLgo+PiAK
Pj4gRml4ZXM6IDE5YjkzYmJiMjBlYiAoIm5ldDogc3RtbWFjOiBJbnRyb2R1Y2UgZHdtYWMxMDAw
IHRpbWVzdGFtcGluZyBvcGVyYXRpb25zIikKPgo+IExvb2tzIGxpa2UgdGhlIGNvbW1pdCBoYXNo
IGlzIHdyb25nLCBzaG91bGQgYmUgOgo+Cj4gNDc3YzNlMWY2MzYzICgibmV0OiBzdG1tYWM6IElu
dHJvZHVjZSBkd21hYzEwMDAgdGltZXN0YW1waW5nIG9wZXJhdGlvbnMiKQoKWWVzLCB5b3UgYXJl
IGFic29sdXRlbHkgcmlnaHQsIEkgd3JvbmdseSBwaWNrZWQgdGhpcyBoYXNoIGZyb20gYSBjdXN0
b20KYnJhbmNoIHJhdGhlciB0aGFuIGEgc3RhYmxlIGJyYW5jaCAtXy0gVGhhbmtzIGZvciBzcG90
dGluZyB0aGlzLCB3aWxsIGJlCmZpeGVkIGluIHYyLgoKPgo+IE90aGVyIHRoYW4gdGhhdCBJIGFn
cmVlIHdpdGggdGhlIGNoYW5nZSwgdGhlc2Ugb2Zmc2V0IGFyZSB0aGUgcmlnaHQKPiBvbmVzLCB0
aGFua3MuLi4KPgo+IFdpdGggdGhlIEZpeGVzIHRhZyBmaXhlZCwKPgo+IFJldmlld2VkLWJ5OiBN
YXhpbWUgQ2hldmFsbGllciA8bWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+CgpUaGFua3Ms
CgpBbGV4aXMKCgoKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
