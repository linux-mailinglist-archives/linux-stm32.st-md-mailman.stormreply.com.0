Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95FCFEC65
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 17:06:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46918C8F282;
	Wed,  7 Jan 2026 16:06:01 +0000 (UTC)
Received: from mail-244120.protonmail.ch (mail-244120.protonmail.ch
 [109.224.244.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8A3FC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
 s=protonmail2; t=1767801959; x=1768061159;
 bh=3g3VrAehq1DtdyJEabqqf3fDXyycbpVTX+V8NEpPD+w=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=KziO1atL1h1acJHJ/nknbCs7ObEO1ICTzusYp85opcS3th6hdnJOb1o4kr0TijZCW
 gkhu7tFC8I7wgheAOzmlMPheEO3Vn+u63B2Cnp/yXsw6rQNg0wJb6BNYtc3uHZIWsL
 AaxXJS008BZ//21a/Gnj6s0FxhPv2f7lwd5eFndRSDdDpI2VSkakvsqplsOlIHikut
 B5ryQdmRlp1cJ0MAG5WuAAQQneDWMIj4OAPUenerwhgDyj8OIpbDJHEXgMW6CY3VWt
 JF0d4fK0d0qnlJGeqT3/pEwO8waDmIg8sXCwTJBRZ3lFc8G+qzAAnv8dcjiTbTzh5H
 vFaIwAf3sTkGw==
Date: Wed, 07 Jan 2026 16:05:56 +0000
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <fwaodg2ovh7j47ifwjhgeppxs3oiqht5ecbs7bmfbi7j6djejs@shwokpcmutr3>
In-Reply-To: <nwhixocvhii27jvcyg7ex5emewntgfhyxa4ds5vo2dphe7xfe4@ibjsjdd5fgmn>
References: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com>
 <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3>
 <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie>
 <nwhixocvhii27jvcyg7ex5emewntgfhyxa4ds5vo2dphe7xfe4@ibjsjdd5fgmn>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 57d8dde4371b846314f7e2b8b867b714e4f3c48f
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: handle polarity change when
	PWM is enabled
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

SGkgVXdlLAoKT24gV2VkLCBKYW4gMDcsIDIwMjYgYXQgMDQ6NTQ6NDZQTSArMDEwMCwgVXdlIEts
ZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGV5IFNlYW4sCj4gCj4gT24gVHVlLCBKYW4gMDYsIDIwMjYg
YXQgMTE6MzA6MzRBTSArMDAwMCwgU2VhbiBOeWVramFlciB3cm90ZToKPiA+IE9uIFR1ZSwgSmFu
IDA2LCAyMDI2IGF0IDExOjIyOjU3QU0gKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+
ID4gPiBPbiBUdWUsIEphbiAwNiwgMjAyNiBhdCAwODowMTo1N0FNICswMTAwLCBTZWFuIE55ZWtq
YWVyIHdyb3RlOgo+ID4gPiA+IEFmdGVyIGNvbW1pdCA3MzQ2ZTdhMDU4YTIgKCJwd206IHN0bTMy
OiBBbHdheXMgZG8gbGF6eSBkaXNhYmxpbmciKSwKPiA+ID4gPiBwb2xhcml0eSBjaGFuZ2VzIGFy
ZSBpZ25vcmVkLiBVcGRhdGVzIHRvIHRoZSBUSU14X0NDRVIgQ0N4UCBiaXRzIGFyZQo+ID4gPiA+
IGlnbm9yZWQgYnkgdGhlIGhhcmR3YXJlIHdoZW4gdGhlIG1hc3RlciBvdXRwdXQgaXMgZW5hYmxl
ZCB2aWEgdGhlCj4gPiA+ID4gVElNeF9CRFRSIE1PRSBiaXQuCj4gPiA+IFsuLi5dCj4gPiA+IEkg
aGF2ZSBoYXJkd2FyZSB1c2luZyB0aGlzIGRyaXZlciwgd2lsbCBzZXQgaXQgdXAgbGF0ZXIgdGhp
cyB3ZWVrIGZvcgo+ID4gPiB0ZXN0aW5nLgo+ID4gCj4gPiBWZXJ5IGNvb2wsIGxvb2tpbmcgZm9y
d2FyZCB0byBoZWFyIGlmIHlvdSBjYW4gcmUtcHJvZHVjZS4KPiAKPiBJIGNhbm5vdC4gSSBoYXZl
Ogo+IAo+IAkjIHVuYW1lIC1yCj4gCTYuMTEuMC1yYzEtMDAwMjgtZ2ViMTg1MDRjYTVjZi1kaXJ0
eQo+IAo+ICh0aGUgLWRpcnR5IGlzIG9ubHkgZnJvbSBlbmFibGluZyB0aGUgcHdtIGZvciBteSBt
YWNoaW5lLCBubyBkcml2ZXIKPiBjaGFuZ2VzKQo+IAo+IAkjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1
Zy9wd20KPiAJMDogcGxhdGZvcm0vNDAwMDEwMDAudGltZXI6cHdtLCA0IFBXTSBkZXZpY2VzCj4g
CS4uLgo+IAkgcHdtLTMgICAoc3lzZnMgICAgICAgICAgICAgICApOiByZXF1ZXN0ZWQgZW5hYmxl
ZCBwZXJpb2Q6IDMxMzcyMCBucyBkdXR5OiAxMDAwMCBucyBwb2xhcml0eTogbm9ybWFsCj4gCj4g
YW5kIHB1bHNldmlldy9zaWdyb2sgZGV0ZWN0cyAzLjE4NzI1MSUgd2l0aCBhIHBlcmlvZCBvZiAz
MTMuOCDCtXMuCj4gCj4gQWZ0ZXIKPiAKPiAJZWNobyBpbnZlcnNlZCA+IC9zeXMvY2xhc3MvcHdt
L3B3bWNoaXAwL3B3bTMvcG9sYXJpdHkKPiAKPiB0aGUgb3V0cHV0IGNoYW5nZXMgdG8KPiAKPiAJ
IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvcHdtCj4gCTA6IHBsYXRmb3JtLzQwMDAxMDAwLnRpbWVy
OnB3bSwgNCBQV00gZGV2aWNlcwo+IAkuLi4KPiAJIHB3bS0zICAgKHN5c2ZzICAgICAgICAgICAg
ICAgKTogcmVxdWVzdGVkIGVuYWJsZWQgcGVyaW9kOiAzMTM3MjAgbnMgZHV0eTogMTAwMDAgbnMg
cG9sYXJpdHk6IGludmVyc2UKPiAKPiBhbmQgcHVsc2V2aWV3L3NpZ3JvayBjbGFpbXMgOTYuODEy
NzQ5JSB3aXRoIGEgcGVyaW9kIG9mIDMxMy44IMK1cy4KPiBTbyB0aGUgcG9sYXJpdHkgY2hhbmdl
IGhhcHBlbmQgYXMgZXhwZWN0ZWQuCj4gCj4gVGhpcyBpcyBvbiBhbiBzdCxzdG0zMm1wMTM1Zi1k
ayBib2FyZC4KPiAKPiBXaGVyZSBpcyB0aGUgZGlmZmVyZW5jZSB0byB5b3VyIG9ic2VydmF0aW9u
cz8KPiAKClRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayEKSSdtIHVzaW5nIHRoZSBQV00gZm9yIGEg
YmFja2xpZ2h0LiBXaXRoIHRoaXMgWzBdIGluIG15IGR0czoKClswXToKCWJhY2tsaWdodDogYmFj
a2xpZ2h0IHsKCQljb21wYXRpYmxlID0gInB3bS1iYWNrbGlnaHQiOwoJCXB3bXMgPSA8JnB3bTQg
MCAxMjUwMDAgUFdNX1BPTEFSSVRZX0lOVkVSVEVEPjsKCQlicmlnaHRuZXNzLWxldmVscyA9IDwx
MDIgMjM1IDI1NT47CgkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDgwPjsKCQludW0taW50
ZXJwb2xhdGVkLXN0ZXBzID0gPDEwMD47CgkJZW5hYmxlLWdwaW9zID0gPCZncGlvZiAxMiBHUElP
X0FDVElWRV9MT1c+OwoJc3RhdHVzID0gIm9rYXkiOwoJfTsKCk1heWJlIHRoYXQgaXMgZG9pbmcg
c29tZXRoaW5nIGRpZmZlcmVudGx5LgoKL1NlYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
