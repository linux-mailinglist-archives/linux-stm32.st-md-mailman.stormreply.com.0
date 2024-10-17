Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A91319A1F7F
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 12:10:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5090CC78032;
	Thu, 17 Oct 2024 10:10:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C931C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:10:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 775E9FEC;
 Thu, 17 Oct 2024 03:10:45 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0D5D3F71E;
 Thu, 17 Oct 2024 03:10:13 -0700 (PDT)
Date: Thu, 17 Oct 2024 11:09:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
Message-ID: <ZxDh9biUbf9W8gNN@J2N7QTR9R3>
References: <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
 <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
 <Zw6X9KQT0-z7r7SY@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
 <Zw9_imsl2KLf7_GY@J2N7QTR9R3>
 <CACRpkda8tO=QLF_zznoNjdNfNZJVntY_3+247E=qK6zNqRnVSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda8tO=QLF_zznoNjdNfNZJVntY_3+247E=qK6zNqRnVSA@mail.gmail.com>
Cc: Kees Cook <kees@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMDk6MDA6MjJQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBXZWQsIE9jdCAxNiwgMjAyNCBhdCAxMDo1NeKAr0FNIE1hcmsgUnV0bGFuZCA8
bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+IAo+ID4gSSBiZWxpZXZlIHRoYXQncyBuZWNl
c3NhcnkgZm9yIHRoZSBsYXp5IFRMQiBzd2l0Y2gsIGF0IGxlYXN0IGZvciBTTVA6Cj4gPgo+ID4g
ICAgICAgICAvLyBDUFUgMCAgICAgICAgICAgICAgICAgICAgICAgIC8vIENQVSAxCj4gPgo+ID4g
ICAgICAgICA8PCBzd2l0Y2hlcyB0byB0YXNrIFgncyBtbSA+Pgo+ID4KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8PCBjcmVhdGVzIGt0aHJlYWQgdGFzayBZID4+
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDwgbWFwcyB0YXNr
IFkncyBuZXcgc3RhY2sgPj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8PCBtYXBzIHRhc2sgWSdzIG5ldyBzaGFkb3cgPj4KPiA+Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gWSBzd2l0Y2hlZCBvdXQKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250ZXh0X3N3aXRjaCguLi4sIFksIC4u
LiwgLi4uKTsKPiA+Cj4gPiAgICAgICAgIC8vIFN3aXRjaCBmcm9tIFggdG8gWQo+ID4gICAgICAg
ICBjb250ZXh0X3N3aXRjaCguLi4sIFgsIFksIC4uLikgewo+ID4gICAgICAgICAgICAgICAgIC8v
IHByZXYgPSBYCj4gPiAgICAgICAgICAgICAgICAgLy8gbmV4dCA9IFkKPiA+Cj4gPiAgICAgICAg
ICAgICAgICAgaWYgKCFuZXh0LT5tbSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLy8g
WSBoYXMgbm8gbW0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIC8vIE5vIHN3aXRjaF9tbSgp
IGhlcmUKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIC8vIC4uLiBzbyBubyBjaGVja192bWFs
bG9jX3NlcSgpCj4gPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIC8vIG5vdCB0YWtlbgo+ID4gICAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAg
ICAgICAgICAgICAgLi4uCj4gPgo+ID4gICAgICAgICAgICAgICAgIC8vIFgncyBtbSBzdGlsbCBs
YWNrcyBZJ3Mgc3RhY2sgKyBzaGFkb3cgaGVyZQo+ID4KPiA+ICAgICAgICAgICAgICAgICBzd2l0
Y2hfdG8ocHJldiwgbmV4dCwgcHJldik7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAuLi4gc28gcHJv
YmFibHkgd29ydGggYSBjb21tZW50IHRoYXQgd2UncmUgZmF1bHRpbmcgaW4gdGhlIG5ldwo+ID4g
c3RhY2src2hhZG93IGZvciBmb3IgbGF6eSB0bGIgd2hlbiBzd2l0Y2hpbmcgdG8gYSB0YXNrIHdp
dGggbm8gbW0/Cj4gCj4gU3dpdGNoaW5nIHRvIGEgdGFzayB3aXRoIG5vIG1tID09IHN3aXRjaGlu
ZyB0byBhIGtlcm5lbCBkYWVtb24uCgpBIGNvbW1vbiBtaXNjb25jZXB0aW9uLCBidXQgbm90IGFs
d2F5cyB0cnVlOgoKKiBBIGtlcm5lbCB0aHJlYWQgY2FuIGhhdmUgYW4gbW06IHNlZSBrdGhyZWFk
X3VzZV9tbSgpIGFuZAogIGt0aHJlYWRfdW51c2VfbW0oKS4KCiogQSB1c2VyIHRocmVhZCBjYW4g
bG9zZSBpdHMgbW0gd2hpbGUgZXhpdGluZzogc2VlIGhvdyBkb19leGl0KCkgY2FsbHMKICBleGl0
X21tKCksIGFuZCBob3cgaHRlIHRhc2sgcmVtYWlucyBwcmVlbXB0aWJsZSBmb3IgYSB3aGlsZQog
IHRoZXJlYWZ0ZXIuCgouLi4gc28gd2UgcmVhbGx5IGRvIGp1c3QgbWVhbiAiYSB0YXNrIHdpdGgg
bm8gbW0iLgoKPiBBbmQgdGhvc2Ugb25seSB1c2UgdGhlIGtlcm5lbCBtZW1vcnkgYW5kIHJlbGll
cyBvbiB0aGF0IGFsd2F5cwo+IGJlaW5nIG1hcHBlZCBpbiBhbnkgcHJldmlvdXMgbW0gY29udGV4
dCwgcmlnaHQuCgpBIHRhc2sgd2l0aCBubyBtbSBvbmx5IHVzZXMga2VybmVsIG1lbW9yeS4gQW55
dGhpbmcgaXQgdXNlcyBtdXN0IGJlCm1hcHBlZCBpbiBpbml0X21tLCBidXQgKm1pZ2h0KiBub3Qg
aGF2ZSBiZWVuIGNvcGllZCBpbnRvIGV2ZXJ5IG90aGVyIG1tLAphbmQgaGVuY2UgbWlnaHQgbm90
IGJlIGluIHRoZSBwcmV2aW91cyBtbSBjb250ZXh0IGFzIHBlciB0aGUgZXhhbXBsZQphYm92ZS4K
Cj4gQnV0IHdoZXJlIGRvIHdlIHB1dCB0aGF0IGNvbW1lbnQ/IEluIGtlcm5lbC9zY2hlZC9jb3Jl
LmMKPiBjb250ZXh0X3N3aXRjaCgpPwoKSSB3YXMgdHJ5aW5nIHRvIHN1Z2dlc3Qgd2UgdXBkYXRl
IHRoZSBleGlzdGluZyBjb21tZW50IGluIHN3aXRjaF90bygpIHRvCmJlIG1vcmUgZXhwbGljaXQu
IGUuZy4gZXhwYW5kIHRoZSBleGlzdGluZyBjb21tZW50OgoKCUAKCUAgRG8gYSBkdW1teSByZWFk
IGZyb20gdGhlIG5ldyBzdGFjayB3aGlsZSBydW5uaW5nIGZyb20gdGhlIG9sZCBvbmUgc28KCUAg
dGhhdCB3ZSBjYW4gcmVseSBvbiBkb190cmFuc2xhdGlvbl9mYXVsdCgpIHRvIGZpeCB1cCBhbnkg
c3RhbGUgUE1ECglAIGVudHJpZXMgY292ZXJpbmcgdGhlIHZtYWxsb2MgcmVnaW9uLgoJQAoKLi4u
IHdpdGg6CgoJQAoJQCBGb3IgYSBub24tbGF6eSBtbSBzd2l0Y2gsIGNoZWNrX3ZtYWxsb2Nfc2Vx
KCkgaGFzIGVuc3VyZWQgdGhhdAoJQCB0aGF0IHRoZSBhY3RpdmUgbW0ncyBwYWdlIHRhYmxlcyBo
YXZlIG1hcHBpbmdzIGZvciB0aGUgcHJldgoJQCB0YXNrJ3Mgc3RhY2sgYW5kIHRoZSBuZXh0IHRh
c2sncyBzdGFjay4KCUAKCUAgRm9yIGEgbGF6eSBtbSBzd2l0Y2ggdGhlIGFjdGl2ZSBtbSdzIHBh
Z2UgdGFibGVzIGhhdmUgbWFwcGluZ3MKCUAgZm9yIHRoZSBwcmV2IHRhc2sncyBzdGFjayBidXQg
bWlnaHQgbm90IGhhdmUgbWFwcGluZ3MgZm9yIHRoZQoJQCBuZXcgdGFrcyBzdGFjay4gRG8gYSBk
dW1teSByZWFkIGZyb20gdGhlIG5ldyBzdGFjayB3aGlsZQoJQCBydW5uaW5nIGZyb20gdGhlIG9s
ZCBzdGFjayBzbyB0aGF0IHdlIGNhbiByZWx5IG9uCglAIGRvX3RyYW5zbGF0aW9uX2ZhdWx0KCkg
dG8gZml4IHVwIGFueSBzdGFsZSBQTUQgZW50cmllcwoJQCBjb3ZlcmluZyB0aGUgdm1hbGxvYyBy
ZWdpb24uCglACgpBcmQsIGRvZXMgdGhhdCBzb3VuZCBnb29kIHRvIHlvdT8KCk1hcmsuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
