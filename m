Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 036379B4C7C
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 15:49:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B11F4C71290;
	Tue, 29 Oct 2024 14:49:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7B7BC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 14:49:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8653460007;
 Tue, 29 Oct 2024 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730213359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FlNVllC/D5JV5n+6Shvus7HZtUjXDU01fqL2ePQhSc=;
 b=dICxjCjwm+um0i4q+atY1uQqjl32KNZ8qxO8kWbplQejYNtXxu2Wud+VHsz7+grDnoXcCJ
 7jxD5wu28OEX6xHBVr+1da9zPR31VEYekHdCecOEpTbIROIeIv1aIjRg37KQ1KoOgYql5X
 lAN0DUVLyiEO419475dlwSIsco1mpDnYWwgGMQ1ipBJq9Ov+TUD1i7u7OhOfCdGk9sU4sb
 HoHlxgjZjsMKBjMvTTGJFeyaxogSzQyp4kcU75nCU3IQY3C0oKPOle0lGghCZYUVZeRpA1
 fLSxDmPUhtlJ8Selj9r9QVHwoS8//S2pV+1tUEwtVpIdvyljnvDYwJGFs19m9w==
Date: Tue, 29 Oct 2024 15:49:16 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Message-ID: <20241029154916.50b5f188@fedora.home>
In-Reply-To: <a905c45d-344b-49e9-a0c9-fb7b6445edad@bootlin.com>
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
 <a905c45d-344b-49e9-a0c9-fb7b6445edad@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/7] Support external snapshots
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

SGkgQWxleGlzLAoKT24gVHVlLCAyOSBPY3QgMjAyNCAxNTo0NTowNyArMDEwMApBbGV4aXMgTG90
aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8gTWF4aW1l
LAo+IAo+IE9uIDEwLzI5LzI0IDEyOjU0LCBNYXhpbWUgQ2hldmFsbGllciB3cm90ZToKPiA+IEhp
LAo+ID4gCj4gPiBUaGlzIHNlcmllcyBpcyBhbm90aGVyIHRha2Ugb24gdGhlIHBlcnZpb3VzIHdv
cmsgWzFdIGRvbmUgYnkKPiA+IEFsZXhpcyBMb3Rob3LDqSwgdGhhdCBmaXhlcyB0aGUgc3VwcG9y
dCBmb3IgZXh0ZXJuYWwgc25hcHNob3RzCj4gPiB0aW1lc3RhbXBpbmcgaW4gR01BQzMtYmFzZWQg
ZGV2aWNlcy4KPiA+ICAgCj4gCj4gWy4uLl0KPiAKPiA+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbmV0ZGV2LzIwMjMwNjE2MTAwNDA5LjE2NDU4My0xLWFsZXhpcy5sb3Rob3JlQGJvb3Rs
aW4uY29tLwo+ID4gCj4gPiBUaGFua3MgQWxleGlzIGZvciBsYXlpbmcgdGhlIGdyb3VuZHdvcmsg
Zm9yIHRoaXMsCj4gPiAKPiA+IEJlc3QgcmVnYXJkcywKPiA+IAo+ID4gTWF4aW1lICAKPiAKPiBU
aGFua3MgZm9yIG1ha2luZyB0aGlzIHRvcGljIG1vdmUgZm9yd2FyZC4gSSBzdXNwZWN0IHRoZSBz
ZXJpZXMgdG8gYmUgbWlzc2luZwo+IHNvbWUgYml0czogaW4gdGhlIGluaXRpYWwgc2VyaWVzIHlv
dSBtZW50aW9uIGluIFsxXSwgSSBhbHNvIHJld29ya2VkCj4gc3RtbWFjX2h3dHN0YW1wX3NldCBp
biBzdG1tYWNfbWFpbi5jLCB3aGljaCBpcyBhbHNvIGN1cnJlbnRseSBhc3N1bWluZyBhIEdNQUM0
Cj4gbGF5b3V0IChbMl0pLiBJIHN1c3BlY3QgdGhhdCBpbiB5b3VyIHNlcmllcyBjdXJyZW50IHN0
YXRlLCBhbnkgbmV3IGNhbGwgdG8KPiBzdG1tYWNfaHd0c3RhbXBfc2V0IHdpbGwgb3ZlcndyaXRl
IGFueSBwcmV2aW91c2x5IGNvbmZpZ3VyZWQgaGFyZHdhcmUgdGltZXN0YW1waW5nLgoKWW91IGFy
ZSBjb3JyZWN0IGluZGVlZCwgSSBtaXNzZWQgdGhpcyBiaXQgaW4gdGhlIHNlcmllcy4gSSdsbCB1
cGRhdGUKdGhhdCBmb3IgdjIuIAoKVGhhbmtzLAoKTWF4aW1lCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
