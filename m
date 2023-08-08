Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8812F773ADE
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 17:10:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A41C6B469;
	Tue,  8 Aug 2023 15:10:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87730C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2g3utr/eujTjRaQIcLvNeTDh3WTi5rEqtO34hdQFdT0=; b=feMXlHseapYWghPVTJHdmZssl3
 eciqABRWVwnQp/E6K8PCedielRvsbcw4dRtXbsJx9wtIOcfBcpecqr/Y96PrFtlqGbw/fvpeARePk
 VrGvx1L8Iwxkwl+oLu6WfXlu3s1MZGJIvGQPEKIlPBx0wBjc8R9IPt+gOkpP/1lxZy9/VtXdc6iHC
 tVaH1INRn4PlNVJyzqGt+Fll1SHqzz/MY1vONsQEelXeVHjjRwLia+738lj2OdLLU41e9LnLmpwCN
 W0VzF58ExqPFfhCeMBahj4E2RyFvg3Q3Ozf5g99pcX/bp7OmeyhlW3uTx4hM6/JqRh312Dn/KsWCn
 8g3m1x+g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47552)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qTOLw-00009S-1Q;
 Tue, 08 Aug 2023 16:10:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qTOLu-0008DC-75; Tue, 08 Aug 2023 16:10:30 +0100
Date: Tue, 8 Aug 2023 16:10:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ZNJa5qyYFngghiGc@shell.armlinux.org.uk>
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
 <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
 <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
 <CAMRc=MczKgBFvuEanKu=mERYX-6qf7oUO2S4B53sPc+hrkYqxg@mail.gmail.com>
 <65b53003-23cf-40fa-b9d7-f0dbb45a4cb2@lunn.ch>
 <CAMRc=MecYHi=rPaT44kuX_XMog=uwB9imVZknSjnmTBW+fb5WQ@mail.gmail.com>
 <xfme5pgj4eqlgao3vmyg6vazaqk6qz2wq6kitgujtorouogjty@cklyof3xz2zm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xfme5pgj4eqlgao3vmyg6vazaqk6qz2wq6kitgujtorouogjty@cklyof3xz2zm>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alex Elder <elder@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] net: stmmac: allow sharing MDIO lines
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

T24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMDk6NDQ6MTZBTSAtMDUwMCwgQW5kcmV3IEhhbGFuZXkg
d3JvdGU6Cj4gT24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMDQ6MzA6MDVQTSArMDIwMCwgQmFydG9z
eiBHb2xhc3pld3NraSB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDgsIDIwMjMgYXQgNDoyNeKAr1BN
IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gPiBPbiBU
dWUsIEF1ZyAwOCwgMjAyMyBhdCAxMDoxMzowOUFNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tp
IHdyb3RlOgo+ID4gPiA+ID4gPiBPayBzbyB1cG9uIHNvbWUgZnVydGhlciBpbnZlc3RpZ2F0aW9u
LCB0aGUgYWN0dWFsIGN1bHByaXQgaXMgaW4gc3RtbWFjCj4gPiA+ID4gPiA+IHBsYXRmb3JtIGNv
ZGUgLSBpdCBhbHdheXMgdHJpZXMgdG8gcmVnaXN0ZXIgYW4gTURJTyBidXMgLSBpbmRlcGVuZGVu
dAo+ID4gPiA+ID4gPiBvZiB3aGV0aGVyIHRoZXJlIGlzIGFuIGFjdHVhbCBtZGlvIGNoaWxkIG5v
ZGUgLSB1bmxlc3MgdGhlIE1BQyBpcwo+ID4gPiA+ID4gPiBtYXJrZWQgZXhwbGljaXRseSBhcyBo
YXZpbmcgYSBmaXhlZC1saW5rLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXaGVuIEkgZml4ZWQg
dGhhdCwgTUFDMSdzIHByb2JlIGlzIGNvcnJlY3RseSBkZWZlcnJlZCB1bnRpbCBNQUMwIGhhcwo+
ID4gPiA+ID4gPiBjcmVhdGVkIHRoZSBNRElPIGJ1cy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
RXZlbiBzbywgaXNuJ3QgaXQgdXNlZnVsIHRvIGFjdHVhbGx5IHJlZmVyZW5jZSB0aGUgc2hhcmVk
IE1ESU8gYnVzIGluIHNvbWUgd2F5Pwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJZiB0aGUgc2No
ZW1hdGljcyBsb29rIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IC0tLS0tLS0tICAgICAgICAgICAtLS0tLS0tCj4gPiA+ID4gPiA+IHwgTUFDMCB8LS1NRElPLS0t
LS18IFBIWSB8Cj4gPiA+ID4gPiA+IC0tLS0tLS0tIHwgICAgIHwgICAtLS0tLS0tCj4gPiA+ID4g
PiA+ICAgICAgICAgIHwgICAgIHwKPiA+ID4gPiA+ID4gLS0tLS0tLS0gfCAgICAgfCAgIC0tLS0t
LS0KPiA+ID4gPiA+ID4gfCBNQUMxIHwtLSAgICAgLS0tLXwgUEhZIHwKPiA+ID4gPiA+ID4gLS0t
LS0tLS0gICAgICAgICAgIC0tLS0tLS0KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhlbiBpdCB3
b3VsZCBtYWtlIHNlbnNlIHRvIG1vZGVsIGl0IG9uIHRoZSBkZXZpY2UgdHJlZT8KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBTbyBJIHRoaW5rIHdoYXQgeW91J3JlIHNheWluZyBpcyB0aGF0IE1BQzAgYW5k
IE1BQzEncyBoYXZlIE1ESU8gYnVzCj4gPiA+ID4gPiBtYXN0ZXJzLCBhbmQgdGhlIGhhcmR3YXJl
IGRlc2lnbmVyIGRlY2lkZWQgdG8gdGllIGJvdGggdG9nZXRoZXIgdG8KPiA+ID4gPiA+IGEgc2lu
Z2xlIHNldCBvZiBjbG9jayBhbmQgZGF0YSBsaW5lcywgd2hpY2ggdGhlbiBnbyB0byB0d28gUEhZ
cy4KPiA+ID4gPgo+ID4gPiA+IFRoZSBzY2hlbWF0aWNzIEkgaGF2ZSBhcmUgbm90IHZlcnkgY2xl
YXIgb24gdGhhdCwgYnV0IG5vdyB0aGF0IHlvdQo+ID4gPiA+IG1lbnRpb24gdGhpcywgaXQncyBt
b3N0IGxpa2VseSB0aGUgY2FzZS4KPiA+ID4KPiA+ID4gSSBob3BlIG5vdC4gVGhhdCB3b3VsZCBi
ZSB2ZXJ5IGJyb2tlbi4gQXMgUnVzc2VsbCBwb2ludGVkIG91dCwgTURJTyBpcwo+ID4gPiBub3Qg
bXVsdGktbWFzdGVyLiBZb3UgbmVlZCB0byBjaGVjayB3aXRoIHRoZSBoYXJkd2FyZSBkZXNpZ25l
ciBpZiB0aGUKPiA+ID4gc2NoZW1hdGljcyBhcmUgbm90IGNsZWFyLgo+ID4gCj4gPiBTb3JyeSwg
aXQgd2FzIG5vdCB2ZXJ5IGNsZWFyLiBJdCdzIHRoZSBjYXNlIHRoYXQgdHdvIE1ESU8gbWFzdGVy
cwo+ID4gc2hhcmUgdGhlIE1EQyBhbmQgZGF0YSBsaW5lcy4KPiAKPiBJJ2xsIG1ha2UgdGhlIHdh
dGVyIG11ZGRpZXIgKGhvcGVmdWxseSBjbGVhcmVyPykuIEkgaGF2ZSBhY2Nlc3MgdG8gdGhlCj4g
Ym9hcmQgc2NoZW1hdGljIChub3QgU0lQL1NPTSBzdHVmZiB0aG91Z2gpLCBidXQgdGhhdCBzaG91
bGQgaGVscCBoZXJlLgo+IAo+IE1BQzAgb3ducyBpdHMgb3duIE1ESU8gYnVzICh3ZSdsbCBjYWxs
IGl0IE1ESU8wKS4gSXQgaXMgcGlubXV4ZWQgdG8KPiBncGlvOC9ncGlvOSBmb3IgbWRjL21kaW8u
IE1BQzEgb3ducyBpdHMgb3duIGJ1cyAoTURJTzEpIHdoaWNoIGlzCj4gcGlubXV4ZWQgdG8gZ3Bp
bzIxLzIyLgo+IAo+IE9uIE1ESU8wIHRoZXJlIGFyZSB0d28gU0dNSUkgZXRoZXJuZXQgcGh5cy4g
T25lIGlzIGNvbm5lY3RlZCB0byBNQUMwLAo+IG9uZSBpcyBjb25uZWN0ZWQgdG8gTUFDMS4KPiAK
PiBNRElPMSBpcyBub3QgY29ubmVjdGVkIHRvIGFueXRoaW5nIG9uIHRoZSBib2FyZC4gU28gdGhl
cmUgaXMgb25seSBvbmUKPiBNRElPIG1hc3RlciwgTUFDMCBvbiBNRElPMCwgYW5kIGl0IG1hbmFn
ZXMgdGhlIGV0aGVybmV0IHBoeSBmb3IgYm90aAo+IE1BQzAvTUFDMS4KPiAKPiBEb2VzIHRoYXQg
bWFrZSBzZW5zZT8gSSBkb24ndCB0aGluayBmcm9tIGEgaGFyZHdhcmUgZGVzaWduIHN0YW5kcG9p
bnQKPiB0aGlzIGlzIHZpb2xhdGluZyBhbnl0aGluZywgaXQgaXNuJ3QgYSBtdWx0aW1hc3RlciBz
ZXR1cCBvbiBNRElPLgoKVGhhdCBhbGwgc291bmRzIHNhbmUsIHRoYW5rcy4KCi0tIApSTUsncyBQ
YXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hl
cy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZp
dHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
