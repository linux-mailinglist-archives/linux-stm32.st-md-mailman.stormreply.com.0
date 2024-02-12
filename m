Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AC9851C1E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 18:53:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A35FC71285;
	Mon, 12 Feb 2024 17:53:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34047C71284
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 17:53:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F233C0005;
 Mon, 12 Feb 2024 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1707760424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gU11AbgjtFz5RC8B4oWWKuN/o3wR/cYTDZ0PY2ujtQ=;
 b=Wf+FWb25cxP3y/kxWLOxq/1UDuAUYDpVbftVo/1d1BRY46DHlcaXRJVoYy0Ij6Fr1T16Mr
 mJq6/1RYBo/fJjjWoFvnhBoqTtYdmcQ35phNdfZ15RtlTJ4MY2BtcLhLLRM7RCTavQVnbO
 LoXbd5LEeRXPEDPQxMXpX6a9zZ6e3KvTj3TTn/f+WPkQiEDvtU2H7DhHaKi6riC2p+50oi
 XuUyw97uMmPC6l5Wj3WRsIpBrZw4ljluorhRI1KUhg/z9qNWgxExwoewyplm6UhWmnMLaZ
 AYXcYAYgZz38l9Ba67MTO6if0nBxVZ52ph57tGMHTP/EX+DcNePRKxRhys+PMw==
Date: Mon, 12 Feb 2024 18:53:32 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240212185332.2ebf2935@device-28.home>
In-Reply-To: <20240212-rxc_bugfix-v3-7-e9f2eb6b3b05@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
 <20240212-rxc_bugfix-v3-7-e9f2eb6b3b05@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 7/7] net: pcs: rzn1-miic: Init
 RX clock early if MAC requires it
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

SGkgUm9tYWluLAoKT24gTW9uLCAxMiBGZWIgMjAyNCAxNzo0MjoxNCArMDEwMApSb21haW4gR2Fu
dG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGUgR01BQzEgY29u
dHJvbGxlciBpbiB0aGUgUlpOMSBJUCByZXF1aXJlcyB0aGUgUlggTUlJIGNsb2NrIHNpZ25hbCB0
byBiZQo+IHN0YXJ0ZWQgYmVmb3JlIGl0IGluaXRpYWxpemVzIGl0cyBvd24gaGFyZHdhcmUsIHRo
dXMgYmVmb3JlIGl0IGNhbGxzCj4gcGh5bGlua19zdGFydC4KPiAKPiBDaGVjayB0aGUgcnhjX2Fs
d2F5c19vbiBwY3MgZmxhZyBhbmQgZW5hYmxlIHRoZSBjbG9jayBzaWduYWwgZHVyaW5nIHRoZQo+
IGxpbmsgdmFsaWRhdGlvbiBwaGFzZS4KCkl0IGxvb2tzIGxpa2UgdGhpcyBjb21taXQgbG9nIGRv
ZXNuJ3QgbWF0Y2ggdGhlIGNvbnRlbnQgb2YgdGhlIGNvbW1pdC4KCj4gUmVwb3J0ZWQtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjMwMTE2MTAzOTI2LjI3Njg2OS00
LWNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20vCj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIEdhbnRv
aXMgPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9wY3Mv
cGNzLXJ6bjEtbWlpYy5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3Bjcy9wY3MtcnpuMS1taWljLmMgYi9kcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEtbWlpYy5jCj4g
aW5kZXggZDkzZjg0ZmJiMWZkLi5iMGQ5NzM2YzY3OGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9u
ZXQvcGNzL3Bjcy1yem4xLW1paWMuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1t
aWljLmMKPiBAQCAtMjc5LDEwICsyNzksMzcgQEAgc3RhdGljIGludCBtaWljX3ZhbGlkYXRlKHN0
cnVjdCBwaHlsaW5rX3BjcyAqcGNzLCB1bnNpZ25lZCBsb25nICpzdXBwb3J0ZWQsCj4gIAlyZXR1
cm4gLUVJTlZBTDsKPiAgfQo+ICAKPiArc3RhdGljIGludCBtaWljX3ByZV9pbml0KHN0cnVjdCBw
aHlsaW5rX3BjcyAqcGNzKQo+ICt7Cj4gKwlzdHJ1Y3QgbWlpY19wb3J0ICptaWljX3BvcnQgPSBw
aHlsaW5rX3Bjc190b19taWljX3BvcnQocGNzKTsKPiArCXN0cnVjdCBtaWljICptaWljID0gbWlp
Y19wb3J0LT5taWljOwo+ICsJdTMyIHZhbDsKPiArCj4gKwkvKiBTdGFydCBSWCBjbG9jayBpZiBy
ZXF1aXJlZCAqLwo+ICsJaWYgKHBjcy0+cnhjX2Fsd2F5c19vbikgewo+ICsJCS8qIEluIE1JSSB0
aHJvdWdoIG1vZGUsIHRoZSBjbG9jayBzaWduYWxzIHdpbGwgYmUgZHJpdmVuIGJ5IHRoZQo+ICsJ
CSAqIGV4dGVybmFsIFBIWSwgd2hpY2ggbWlnaHQgbm90IGJlIGluaXRpYWxpemVkIHlldC4gU2V0
IFJNSUkKPiArCQkgKiBhcyBkZWZhdWx0IG1vZGUgdG8gZW5zdXJlIHRoYXQgYSByZWZlcmVuY2Ug
Y2xvY2sgc2lnbmFsIGlzCj4gKwkJICogZ2VuZXJhdGVkLgo+ICsJCSAqLwo+ICsJCW1paWNfcG9y
dC0+aW50ZXJmYWNlID0gUEhZX0lOVEVSRkFDRV9NT0RFX1JNSUk7CgpUaGVyZSdzIHRoaXMgY2hl
Y2sgaW4gbWlpY19jb25maWcgOgoKCWlmIChpbnRlcmZhY2UgIT0gbWlpY19wb3J0LT5pbnRlcmZh
Y2UpIHsKCQl2YWwgfD0gRklFTERfUFJFUChNSUlDX0NPTlZDVFJMX0NPTlZfU1BFRUQsIHNwZWVk
KTsKCQltYXNrIHw9IE1JSUNfQ09OVkNUUkxfQ09OVl9TUEVFRDsKCQltaWljX3BvcnQtPmludGVy
ZmFjZSA9IGludGVyZmFjZTsKCX0KCkFzIHlvdSBzZXQgdGhlIGludGVyZmFjZSB0byBSTUlJIGFu
ZCBzZXQgdGhlIENPTlZfTU9ERSBiZWxvdyB3aXRob3V0CnJlYWxseSBsb29raW5nIGF0IHRoZSBz
cGVlZCwgaXMgdGhlcmUgYW55IHJpc2sgb2YgYSBtaXNtYXRjaCBiZXR3ZWVuCnRoZSBjb25maWd1
cmVkIG1vZGUgYW5kIHRoZSBzcGVlZCA/CgpUaGFua3MsCgpNYXhpbWUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
