Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3FA971E5
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 18:06:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 101CAC78034;
	Tue, 22 Apr 2025 16:06:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E821CC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 16:06:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43304438C1;
 Tue, 22 Apr 2025 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745337980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYp1PH84CI/1BjGsz+Aop4wrRagREEsClZGhgLNu8YE=;
 b=AcOXqpIj1Y5WHHcyuArtzMkdreDit/Ps1+jloEHY3T8+Dr2Exj7tcyzpHwaaA2YO+Ay+cu
 XxAKVq4fbXpCOOl28MCp4zejQRvHlKBGqVs97g/a+TWVn0Icll1gkDR7WuHnLFVpVcRMXg
 JV9+8FR/4BEsqO/ZYv5NtF1yZbZIsxMJ27keaFOwbWHZ8cPhxJyN8RG1u/VNYwGedA38TF
 DBMj1aOjXK8xP75F3tyJRltTrN7+6UhCOF3JhzpFY/vbrGHq3olR4PGXK6xtp3jVOe3DVd
 tbHXaIg96rp7ImtFUehKsx3cBRyjLoJIB0w7XvxLlY9WVLQJv9NoH7Kd4znQlQ==
Mime-Version: 1.0
Date: Tue, 22 Apr 2025 18:06:18 +0200
Message-Id: <D9DAOEKXJKQB.HHD75KOLKIW1@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
 <20250422-stmmac_ts-v1-2-b59c9f406041@bootlin.com>
 <aAe2iULNthghEEEt@shell.armlinux.org.uk>
In-Reply-To: <aAe2iULNthghEEEt@shell.armlinux.org.uk>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkeehiefhfeehvefhtdegueelkeehffffffeuvdekkeekuddvueeguefgieeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-kernel@vger.kernel.org, Daniel Machon <daniel.machon@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 2/2] net: stmmac: fix multiplication
 overflow when reading timestamp
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

SGVsbG8gUnVzc2VsbCwKCk9uIFR1ZSBBcHIgMjIsIDIwMjUgYXQgNTozMiBQTSBDRVNULCBSdXNz
ZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4gT24gVHVlLCBBcHIgMjIsIDIwMjUgYXQgMDU6MDc6
MjNQTSArMDIwMCwgQWxleGlzIExvdGhvcsOpIHdyb3RlOgo+PiAgCW5zID0gcmVhZGwocHRwYWRk
ciArIEdNQUNfUFRQX0FUTlIpOwo+PiAtCW5zICs9IHJlYWRsKHB0cGFkZHIgKyBHTUFDX1BUUF9B
VFNSKSAqIE5TRUNfUEVSX1NFQzsKPj4gKwlucyArPSAodTY0KShyZWFkbChwdHBhZGRyICsgR01B
Q19QVFBfQVRTUikpICogTlNFQ19QRVJfU0VDOwo+Cj4gSSdtIG5vdCBzdXJlIHdoYXQgdGhlIGV4
dHJhIHBhcmVucyBhcm91bmQgcmVhZGwoKSBhcmUgYWN0dWFsbHkgdHJ5aW5nIHRvCj4gZG8uIFBs
ZWFzZSBkcm9wIHRoZW0gaWYgdGhleSdyZSBub3QgdXNlZnVsLgoKVGhleSBhcmUgaW5kZWVkIG5v
dCBzcGVjaWZpY2FsbHkgdXNlZnVsIGluIHRoaXMgY2FzZSwgdGhleSB3aWxsIGJlIGRyb3BwZWQK
aW4gdjIuCgpUaGFua3MsCgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
