Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C867836D40
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 18:27:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D67ADC6DD6B;
	Mon, 22 Jan 2024 17:27:12 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CDEDC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=wSKAYF9IlX95zipvf0YSfJnTfG2ghF6yU76cWzKEMrU=; b=OP
 XwlR+s3tYyiMnAuHZeUMC0NgdVyHMwJHz+EXNQn0HiJN/iPHPx/LTEnFdlIEHlQEEhHmbH/QSGyjD
 tbEbEdubSV1aYnmlgzjHQIluTIxYdODhohY1AzSEmnb0pEmfnuFRXgWkEsohIDXFxPseJuRFhqvsh
 QbgyhLla6bf+eBA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rRy4e-005kPU-JS; Mon, 22 Jan 2024 18:27:04 +0100
Date: Mon, 22 Jan 2024 18:27:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <5d36f465-a9fc-434d-a777-bc9833f7d6ba@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556FA040B07F48AFE544680C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <b8510b38-3669-4a04-9ca6-dbe937ecbec3@lunn.ch>
 <TYZPR01MB5556603EA4C5D7BAF9C27C6AC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556603EA4C5D7BAF9C27C6AC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 7/8] arm64: dts: qcom: ipq5018: enable
	ethernet support
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMTE6NTI6MzBQTSArMDgwMCwgWml5YW5nIEh1YW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzEvMjIgMDo0NSwgQW5kcmV3IEx1bm4g5YaZ6YGTOgo+ID4gT24gU3Vu
LCBKYW4gMjEsIDIwMjQgYXQgMDg6NDI6MzZQTSArMDgwMCwgWml5YW5nIEh1YW5nIHdyb3RlOgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaXlhbmcgSHVhbmcgPGh6eWl0Y0BvdXRsb29rLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9xY29tL2lwcTUwMTguZHRzaSB8IDEy
MCArKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMTYg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vaXBxNTAxOC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9xY29tL2lwcTUwMTguZHRzaQo+ID4gPiBpbmRleCBlNTAyYTNlY2Y0YjcuLmIzNmU1YzIxMzZi
NyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL2lwcTUwMTguZHRz
aQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vaXBxNTAxOC5kdHNpCj4gPiA+
IEBAIC05NCw2ICs5NCw2MyBAQCBzb2M6IHNvY0AwIHsKPiA+ID4gICAJCSNzaXplLWNlbGxzID0g
PDE+Owo+ID4gPiAgIAkJcmFuZ2VzID0gPDAgMCAwIDB4ZmZmZmZmZmY+Owo+ID4gPiArCQltZGlv
MDogbWRpb0A4ODAwMCB7Cj4gPiA+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ID4gKwkJ
CSNzaXplLWNlbGxzID0gPDA+Owo+ID4gPiArCQkJY29tcGF0aWJsZSA9ICJxY29tLGlwcTUwMTgt
bWRpbyIsICJxY29tLHFjYS1tZGlvIjsKPiA+ID4gKwkJCXJlZyA9IDwweDg4MDAwIDB4NjQ+Owo+
ID4gPiArCQkJcmVzZXRzID0gPCZnY2MgR0NDX0dFUEhZX01EQ19TV19BUkVTPiwKPiA+ID4gKwkJ
CQkgPCZnY2MgR0NDX0dFUEhZX0RTUF9IV19BUkVTPjsKPiA+IAo+ID4gV2hhdCBkbyB0aGVzZSB0
d28gcmVzZXRzIGRvPyBBbiBNRElPIGJ1cyBjb250cm9sbGVyIGlzIHVubGlrZWx5IHRvCj4gPiBo
YXZlIGEgRFNQIGluIGl0LiBUaGF0IGlzIHNvbWV0aGluZyBhIFBIWSBpcyBtb3JlIGxpa2VseSB0
byBoYXZlLiBBbgo+ID4gTURJTyBidXMgY29udHJvbGxlciBkb2VzIGhhdmUgYW4gTURDIGxpbmUs
IGJ1dCB3aHkgaXMgaXQKPiA+IEdDQ19HRVBIWV9NRENfU1dfQVJFUyBub3QgR0NDX01ESU9fTURD
X1NXX0FSRVM/IFNvIHRoaXMgYWdhaW4gbWFrZXMgbWUKPiA+IHRoaW5rIHRoaXMgaXMgYSBQSFkg
cmVzZXQsIHNvIHNob3VsZCBiZSBpbiB0aGUgUEhZIG5vZGUuCj4gPiAKPiAKPiBJUFE1MDE4IGhh
cyB0d28gbWRpbyBidXMuIG1kaW8wIGlzIGFuIGludGVybmFsIGJ1cyB3aGljaCBvbmx5IGNvbm5l
Y3RzIHRvCj4gaW50ZXJuYWwgUEhZIHdoaWxlIG1kaW8xIGlzIG91dGdvaW5nIGFuZCBjYW4gYmUg
dXNlZCB0byBjb25uZWN0IFBIWSBvcgo+IHN3aXRjaC4KPiAKPiBTbyBJIHRob3VnaHQgR0NDX0dF
UEhZX01EQ19TV19BUkVTIGlzIGZvciBtZGlvMCBhbmQgR0NDX01ESU9fTURDX1NXX0FSRVMgaXMK
PiBmb3IgbWRpbzEuCj4gCj4gR0NDX0dFUEhZX0RTUF9IV19BUkVTIGlzIHNlZW0gbGlrZSBQSFkg
cmVzZXQuIEJ1dCBpZiB3ZSBkb24ndCBkZWFzc2VydCBpdCwKPiB0aGUgcGh5IG5vZGUgY2FuJ3Qg
YmUgc2NhbmVkLiBTbyBJIGFkZCBpdCBoZXJlIGxpa2Ugd2hhdCByZXNldC1ncGlvcyBkbyAtIHRv
Cj4gcmVzZXQgUEhZIG9yIHN3aXRjaC4KPiAKPiA+IEEgZGV2aWNlIHRyZWUgYmluZGluZyB3aWxs
IGhlbHAgc29ydCB0aGlzIG91dC4KPiAKPiBCYXNlIG9uIHRoZSBmdW5jdGlvbnMgSSBleHBsYWlu
ZWQsIEkgY2FuJ3Qgd3JpdGUgdGhlIGFjY3VyYXRlIG5hbWVzIGFuZAo+IG51bWJlciBvZiByZXNl
dHMgaGVyZS4KCldpdGhvdXQgYSBkZXZpY2UgdHJlZSBiaW5kaW5nLCB5b3VyIHBhdGNoIHdpbGwg
bm90IGJlIGFjY2VwdGVkLiBBdAptaW5pbXVtLCB5b3UgbmVlZCB0byBkZXNjcmliZSB5b3VyIHVu
ZGVyc3RhbmRpbmcgb2YgdGhlIGhhcmR3YXJlLCB3aGF0CnlvdSB0aGluayB0aGUgcmVzZXRzIGRv
LgoKU2luY2UgdGhpcyBpcyBhbiBpbnRlcm5hbCBQSFksIHlvdSBrbm93IGV4YWN0bHkgd2hhdCBp
dCBpcy4gU28geW91IGNhbgp1c2UgSUQgdmFsdWVzIGluIHRoZSBjb21wYXRpYmxlIHNvIHRoZSBk
cml2ZXIgbG9hZHMuIFRoZSBkcml2ZXIgY2FuCnRoZW4gZGVhbCB3aXRoIGNsb2NrcyBhbmQgcmVz
ZXRzLiBXaXRoIGNvbXBsZXggc2V0dXBzIGxpa2UgdGhpcywKc2Nhbm5pbmcgaXMgbm90IGFsd2F5
cyBwb3NzaWJsZS4KCiAgICAgQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
