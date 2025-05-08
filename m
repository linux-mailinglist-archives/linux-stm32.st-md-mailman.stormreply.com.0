Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C39AAFC0F
	for <lists+linux-stm32@lfdr.de>; Thu,  8 May 2025 15:51:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 399F3C7A821;
	Thu,  8 May 2025 13:51:18 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75A1DC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=JDTh6xkMM8HQxsVT5/rBVpuKgI4QSLUTTTY/Sbbvo5Q=; b=2C
 VR4VQ2M62NZxPSLLzrUzNUTFYv9AQDDuYnZtykMx5Wkgz7KgENeQqbaOZ3Tkvf3vIsYyee7AkfSPH
 qknald7sN5FwxwrNmN2hgWFZFR8SdW8BJGMAHQxrXO4rY6OD6gW9q0yEOtGgAGyo5cx2TJnPuERO7
 0q30G1rVlRaaAsA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uD1eZ-00C0VV-Ov; Thu, 08 May 2025 15:51:11 +0200
Date: Thu, 8 May 2025 15:51:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Goran Radenovic <goran.radni@gmail.com>
Message-ID: <1281b9c4-ff94-4dfc-a531-45e3dbee3dfe@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
 <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] ARM: dts: stm32: add initial
 support for stm32mp157-ultra-fly-sbc board
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

T24gVGh1LCBNYXkgMDgsIDIwMjUgYXQgMDM6MTA6MDlQTSArMDIwMCwgR29yYW4gUmFkZW5vdmlj
IHdyb3RlOgo+IEhpIEFuZHJldywKPiAKPiB0aGFuayBZb3Ugb25jZSBhZ2FpbiBmb3IgaGVscGZ1
bCBoaW50Lgo+IAo+IEFuZHJldyBMdW5uIHdyb3RlOgo+ID4gPiA+ID4gKwlwaHktaGFuZGxlID0g
PCZwaHkxPjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJbWRpbyB7Cj4gPiA+ID4gPiArCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPiA+ID4gPiA+ICsJCSNzaXplLWNlbGxzID0gPDA+Owo+ID4gPiA+
ID4gKwkJY29tcGF0aWJsZSA9ICJzbnBzLGR3bWFjLW1kaW8iOwo+ID4gPiA+ID4gKwkJcGh5MTog
ZXRoZXJuZXQtcGh5QDEgewo+ID4gPiA+ID4gKwkJCXJlZyA9IDwxPjsKPiA+ID4gPiA+ICsJCQlp
bnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvZD47Cj4gPiA+ID4gPiArCQkJaW50ZXJydXB0cyA9IDww
IElSUV9UWVBFX0VER0VfRkFMTElORz47Cj4gPiA+ID4gUEhZIGludGVycnVwdHMgYXJlIDk5JSB0
aW1lIGxldmVsLCBub3QgZWRnZS4KPiA+ID4gVGhhdCBpcyBjb3JyZWN0LCBidXQgSSBhbSBmYWNp
bmcgc3RyYW5nZSBiZWhhdmlvciwgd2hlbiBJIHNldAo+ID4gPiBJUlFfVFlQRV9MRVZFTF9MT1cu
Cj4gPiA+IE15IGJvYXJkIHN0b3BzIGJvb3RpbmcgYXQ6Cj4gPiA+IAo+ID4gPiBbICAgIDIuMzQz
MjMzXSBXYWl0aW5nIGZvciByb290IGRldmljZSAvZGV2L21tY2JsazBwNC4uLgo+ID4gPiBbICAg
MTIuNjM4ODE4XSBwbGF0Zm9ybSA1YTAwNjAwMC51c2JwaHljOiBkZWZlcnJlZCBwcm9iZSBwZW5k
aW5nCj4gPiA+IFsgICAxMi42NDMxOTJdIHBsYXRmb3JtIDQ5MDAwMDAwLnVzYi1vdGc6IGRlZmVy
cmVkIHByb2JlIHBlbmRpbmcKPiA+ID4gWyAgIDEyLjY0OTAyOV0gcGxhdGZvcm0gNDgwMDMwMDAu
YWRjOiBkZWZlcnJlZCBwcm9iZSBwZW5kaW5nCj4gPiA+IFsgICAxMi42NTQyNzddIHBsYXRmb3Jt
IDU4MDBkMDAwLnVzYjogZGVmZXJyZWQgcHJvYmUgcGVuZGluZwo+ID4gPiBbICAgMTIuNjU5NzQ0
XSBwbGF0Zm9ybSA1ODAwYzAwMC51c2I6IGRlZmVycmVkIHByb2JlIHBlbmRpbmcKPiA+ID4gWyAg
IDEyLjY2NTA4OV0gYW1iYSA1ODAwNTAwMC5tbWM6IGRlZmVycmVkIHByb2JlIHBlbmRpbmcKPiA+
ID4gWyAgIDEyLjY3MDIzOV0gYW1iYSA1ODAwNzAwMC5tbWM6IGRlZmVycmVkIHByb2JlIHBlbmRp
bmcKPiA+ID4gWyAgIDEyLjY3NTE4NV0gcGxhdGZvcm0gNTAwMjUwMDAudnJlZmJ1ZjogZGVmZXJy
ZWQgcHJvYmUgcGVuZGluZwo+ID4gPiAKPiA+ID4gSSBtdXN0IGludmVzdGlnYXRlIHRoaXMuIElm
IFlvdSBoYXZlIGFueSBpZGVhLCBZb3UgYXJlIHdlbGNvbWUgdG8gc2hhcmUgaXQuCj4gPiBDb3Vs
ZCBiZSBhbiBpbnRlcnJ1cHQgc3Rvcm0uIFRoZSBpbnRlcnJ1cHQgaXMgbm90IGdldHRpbmcgY2xl
YXJlZAo+ID4gYmVjYXVzZSBvZiBzb21ldGhpbmcgbWlzc2luZyBpbiB0aGUgUEhZIGRyaXZlciwg
c28gaXQganVzdCBmaXJlcyBhZ2Fpbgo+ID4gYW5kIGFnYWluLgo+IAo+IEFmdGVyIGEgYnJpZWYg
aW52ZXN0aWdhdGlvbiwgSSB0ZW5kIHRvIGFncmVlIHdpdGggeW91ciBhc3Nlc3NtZW50IHRoYXQg
dGhlCj4gaXNzdWUgbGllcyBpbiB0aGUgZHJpdmVy4oCUbGlrZWx5IHRoZSBzdG1tYWMgZHJpdmVy
IOKAlCB3aGljaCBpcyBvdXRzaWRlIHRoZQo+IHNjb3BlIG9mIG15IGNoYW5nZXMuCj4gCj4gVGhl
cmVmb3JlLCBJIHdvdWxkIHN1Z2dlc3Qga2VlcGluZyBJUlFfVFlQRV9FREdFX0ZBTExJTkcgZm9y
IG5vdywgb3IKPiBhbHRlcm5hdGl2ZWx5IG5vdCB1c2luZyBhIGhhcmR3YXJlIElSUSBhdCBhbGwg
YW5kIGZhbGxpbmcgYmFjayB0byBwb2xsaW5nLAo+IGFzIGRvbmUgaW4gc3RtMzJtcDE1eHgtZGt4
LmR0c2kuCgpTaW5jZSBlZGdlIGlzIHdyb25nLCBwbGVhc2UgdXNlIHBvbGxpbmcuCgoJQW5kcmV3
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
