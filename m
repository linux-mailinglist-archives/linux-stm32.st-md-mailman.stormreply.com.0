Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A4499F120
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 17:26:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F056EC78030;
	Tue, 15 Oct 2024 15:26:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A21FC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 15:26:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0FB1007;
 Tue, 15 Oct 2024 08:26:45 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBA0B3F528;
 Tue, 15 Oct 2024 08:26:13 -0700 (PDT)
Date: Tue, 15 Oct 2024 16:26:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
Cc: Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
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

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMDQ6NDQ6NTZQTSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gT24gVHVlLCAxNSBPY3QgMjAyNCBhdCAxNjozNSwgTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBPY3QgMTUsIDIwMjQgYXQg
MDQ6MjI6MjBQTSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgMTUg
T2N0IDIwMjQgYXQgMTY6MDAsIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMDM6NTE6MDJQTSAr
MDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgT2N0IDE1LCAyMDI0
IGF0IDEyOjI44oCvUE0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPiA+IE9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDAzOjE5OjQ5UE0gKzAyMDAsIENs
ZW1lbnQgTEUgR09GRklDIHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSB0aGluayB3aGF0
J3MgaGFwcGVuaW5nIGhlcmUgaXMgdGhhdCB3aGVuIHN3aXRjaGluZyBmcm9tIHByZXYgdG8gbmV4
dAo+ID4gPiA+ID4gPiBpbiB0aGUgc2NoZWR1bGVyLCB3ZSBzd2l0Y2ggdG8gbmV4dCdzIG1tIGJl
Zm9yZSB3ZSBhY3R1YWxseSBzd2l0Y2ggdG8KPiA+ID4gPiA+ID4gbmV4dCdzIHJlZ2lzdGVyIHN0
YXRlLCBhbmQgdGhlcmUncyBhIHRyYW5zaWVudCB3aW5kb3cgd2hlcmUgcHJldiBpcwo+ID4gPiA+
ID4gPiBleGVjdXRlZCB1c2luZyBuZXh0J3MgbW0uIEFGQUlDVCB3ZSBkb24ndCBtYXAgcHJldidz
IEtBU0FOIHN0YWNrIHNoYWRvdwo+ID4gPiA+ID4gPiBpbnRvIG5leHQncyBtbSBhbnl3aGVyZSwg
YW5kIHNvIGlubGluZWQgS0FTQU5fU1RBQ0sgY2hlY2tzIHJlY3Vyc2l2ZWx5Cj4gPiA+ID4gPiA+
IGZhdWx0IG9uIHRoaXMgdW50aWwgd2Ugc3dpdGNoIHRvIHRoZSBvdmVyZmxvdyBzdGFjay4KPiA+
Cj4gPiBbLi4uXQo+ID4KPiA+ID4gPiA+IFllYWggaXQgbG9va3MgbGlrZSBhIHNwb3Qtb24gaWRl
bnRpZmljYXRpb24gb2YgdGhlIHByb2JsZW0sIEkgY2FuIHRyeSB0bwo+ID4gPiA+ID4gdGhpbmsg
YWJvdXQgaG93IHdlIGNvdWxkIGZpeCB0aGlzIGlmIEkgY2FuIHJlcHJvZHVjZSBpdCwgSSBrZWVw
IHRyeWluZwo+ID4gPiA+ID4gdG8gcHJvdm9rZSB0aGUgY3Jhc2ggOi8KPiA+ID4gPgo+ID4gPiA+
IEl0J3MgYSBiaXQgZ3JvdHR5IC0tIEFGQUlDVCB5b3UnZCBlaXRoZXIgbmVlZCB0byBwcmVmYXVs
dCBpbiB0aGUKPiA+ID4gPiBzcGVjaWZpYyBwYXJ0IG9mIHRoZSB2bWFsbG9jIHNwYWNlIHdoZW4g
c3dpdGNoaW5nIHRhc2tzLCBvciB3ZSdkIG5lZWQgdG8KPiA+ID4gPiBwcmVhbGxvY2F0ZSBhbGwg
dGhlIHNoYXJlZCB2bWFsbG9jIHRhYmxlcyBhdCB0aGUgc3RhcnQgb2YgdGltZSBzbyB0aGF0Cj4g
PiA+ID4gdGhleSdyZSBhbHdheXMgdXAtdG8tZGF0ZS4KPiA+ID4gPgo+ID4gPiA+IFdoaWxlIHdl
IGNvdWxkIGRpc2FibGUgS0FTQU5fU1RBQ0ssIHRoYXQncyBvbmx5IGdvaW5nIHRvIG1hc2sgdGhl
Cj4gPiA+ID4gcHJvYmxlbSB1bnRpbCB0aGlzIGhhcHBlbnMgZm9yIGFueSBvdGhlciB2bWFsbG9j
IHNoYWRvdy4uLgo+ID4gPgo+ID4gPiBJcyB0aGUgb3RoZXIgdm1hbGxvYyBzaGFkb3cgbm90IGNv
dmVyZWQgYnkgdGhlIG9yZGluYXJ5IG9uLWRlbWFuZCBmYXVsdGluZz8KPiA+Cj4gPiBJdCBkZXBl
bmRzIG9uIHdoYXQgdGhlIHZtYWxsb2MgbWVtb3J5IGlzIHVzZWQgZm9yOyBpZiBpdCdzIGFueXRo
aW5nIGVsc2UKPiA+IHVzZWQgaW4gdGhlIGZhdWx0IGhhbmRsaW5nIHBhdGgsIHRoYXQnbGwgZmF1
bHQgcmVjdXJzaXZlbHksIGFuZCBpdCdzCj4gPiBwb3NzaWJsZSB0aGF0J2xsIGhhcHBlbiBpbmRp
cmVjdGx5IHZpYSBvdGhlciBpbnN0cnVtZW50YXRpb24uCj4gPgo+ID4gPiBXaGVuIEkgaW1wbGVt
ZW50ZWQgVk1BUF9TVEFDSyBmb3IgQVJNLCBJIGFkZGVkIGFuIGV4cGxpY2l0IGxvYWQgZnJvbQo+
ID4gPiB0aGUgbmV3IHN0YWNrIHdoaWxlIHN0aWxsIHJ1bm5pbmcgZnJvbSB0aGUgb2xkIG9uZSAo
aW4gX19zd2l0Y2hfdG8pIHNvCj4gPiA+IHRoYXQgdGhlIG9yZGluYXJ5IGZhdWx0aW5nIGNvZGUg
Y2FuIGRlYWwgd2l0aCBpdC4gQ291bGRuJ3Qgd2UgZG8gdGhlCj4gPiA+IHNhbWUgZm9yIHRoZSB2
bWFsbG9jIHNoYWRvdyBvZiB0aGUgbmV3IHN0YWNrPwo+ID4KPiA+IFdlIGNvdWxkIGRvIHNvbWV0
aGluZyBzaW1pbGFyLCBidXQgbm90ZSB0aGF0IGl0J3MgYmFja3dhcmRzOiB3ZSBuZWVkIHRvCj4g
PiBlbnN1cmUgdGhhdCB0aGUgb2xkL2N1cnJlbnQgc3RhY2sgc2hhZG93IHdpbGwgYmUgbWFwcGVk
IGluIHRoZSBuZXcgbW0uCj4gPgo+ID4gU28gdGhlIHVzdWFsIGZhdWx0IGhhbmRsaW5nIGNhbid0
IGhhbmRsZSB0aGF0IGFzLWlzLCBiZWNhdXNlIHlvdSBuZWVkIHRvCj4gPiBmYXVsdC1pbiBwYWdl
cyBmb3IgYW4gbW0gd2hpY2ggaXNuJ3QgeWV0IGluIHVzZS4gVGhhdCBsb2dpYyBjb3VsZCBiZQo+
ID4gZmFjdG9yZWQgb3V0IGFuZCBzaGFyZWQsIHRob3VnaC4KPiAKPiBOb3Qgc3VyZSBJIGZvbGxv
dyB5b3UgaGVyZS4gVGhlIGNyYXNoIGlzIGluIHRoZSBrZXJuZWwsIG5vPwoKWWVwOyBJJ20gcmVm
ZXJyaW5nIHRvIHRoZSB2bWFsbG9jIHNwYWNlIGJlaW5nIGxhemlseSBmYXVsdGVkLWluIGFuZApj
b3BpZWQgZnJvbSBpbml0X21tIGludG8gdGhlIGFjdGl2ZSBwZ2QgdW5kZXIgZG9fdHJhbnNsYXRp
b25fZmF1bHQoKS4KCkxvb2tpbmcgc29tZSBtb3JlLCBJIGRvbid0IHNlZSBob3cgVk1BUF9TVEFD
SyBndWFyYW50ZWVzIHRoYXQgdGhlCm9sZC9hY3RpdmUgc3RhY2sgaXMgbWFwcGVkIGluIHRoZSBu
ZXcgbW0gd2hlbiBzd2l0Y2hpbmcgZnJvbSB0aGUgb2xkIG1tCnRvIHRoZSBuZXcgbW0gKHdoaWNo
IGhhcHBlbnMgYmVmb3JlIF9fc3dpdGNoX3RvKCkpLgoKRWl0aGVyIEknbSBtaXNzaW5nIHNvbWV0
aGluZywgb3Igd2UgaGF2ZSBhIGxhdGVudCBidWcuIE1heWJlIHdlIGhhdmUKc29tZSBleHBsaWNp
dCBjb3B5aW5nL3ByZWZhdWx0aW5nIGVsc2V3aGVyZSBJJ20gbWlzc2luZz8KCldoYXQgaGFwcGVu
cyB3aGVuIHN3aXRjaGluZyBiZXR3ZWVuIHR3byB0YXNrcyB3aG9zZSBzdGFja3MgaGFwcGVuIHRv
IGJlCmluIGRpc3RpbmN0IHN1Yi10cmVlcyBvZiB0aGUgdm1hbGxvYyB0YWJsZXM/Cgo+IFNvIHRo
ZXJlIGlzIG9ubHkgYSBzaW5nbGUgdm1hbGxvYyBzcGFjZSB3aGVyZSBhbGwgdGhlIG1hcHBpbmdz
IHNob3VsZAo+IHJlc2lkZSwgYnV0IGVhY2ggcHJvY2VzcyBoYXMgaXRzIG93biBjb3B5IG9mIHRo
ZSB0b3AgbGV2ZWwgcGFnZSB0YWJsZSwKPiB3aGljaCBuZWVkcyB0byBiZSBzeW5jZWQgdXAgd2hl
biBpdCBnb2VzIHN0YWxlLgoKWWVwIC0tIHRoZSBwcm9ibGVtIGlzIHdoZW4gd2UgY2FuIHNhZmVs
eSBkbyB0aGF0IHN5bmNpbmcgdXAsIHNpbmNlIHRoZQpsYXp5IHN5bmNpbmcgaW4gZG9fdHJhbnNs
YXRpb25fZmF1bHQoKSBjYW4ndCBzYWZlbHkgYmUgdXNlZCB0byBzeW5jCmFueXRoaW5nIHRoYXQn
cyB1c2VkIGR1cmluZyBkb190cmFuc2xhdGlvbl9mYXVsdCgpLCBpbmNsdWRpbmcgdGhlIHN0YWNr
LApldGMuCgpNYXJrLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
