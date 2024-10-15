Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844899EFAF
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 16:36:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC4EBC78030;
	Tue, 15 Oct 2024 14:36:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F234C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:35:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53B29FEC;
 Tue, 15 Oct 2024 07:36:25 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6F993F71E;
 Tue, 15 Oct 2024 07:35:53 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:35:51 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
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

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMDQ6MjI6MjBQTSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gT24gVHVlLCAxNSBPY3QgMjAyNCBhdCAxNjowMCwgTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBPY3QgMTUsIDIwMjQgYXQg
MDM6NTE6MDJQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+ID4gT24gVHVlLCBPY3Qg
MTUsIDIwMjQgYXQgMTI6MjjigK9QTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29t
PiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIE9jdCAxNCwgMjAyNCBhdCAwMzoxOTo0OVBNICswMjAw
LCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPiA+ID4KPiA+ID4gPiBJIHRoaW5rIHdoYXQncyBo
YXBwZW5pbmcgaGVyZSBpcyB0aGF0IHdoZW4gc3dpdGNoaW5nIGZyb20gcHJldiB0byBuZXh0Cj4g
PiA+ID4gaW4gdGhlIHNjaGVkdWxlciwgd2Ugc3dpdGNoIHRvIG5leHQncyBtbSBiZWZvcmUgd2Ug
YWN0dWFsbHkgc3dpdGNoIHRvCj4gPiA+ID4gbmV4dCdzIHJlZ2lzdGVyIHN0YXRlLCBhbmQgdGhl
cmUncyBhIHRyYW5zaWVudCB3aW5kb3cgd2hlcmUgcHJldiBpcwo+ID4gPiA+IGV4ZWN1dGVkIHVz
aW5nIG5leHQncyBtbS4gQUZBSUNUIHdlIGRvbid0IG1hcCBwcmV2J3MgS0FTQU4gc3RhY2sgc2hh
ZG93Cj4gPiA+ID4gaW50byBuZXh0J3MgbW0gYW55d2hlcmUsIGFuZCBzbyBpbmxpbmVkIEtBU0FO
X1NUQUNLIGNoZWNrcyByZWN1cnNpdmVseQo+ID4gPiA+IGZhdWx0IG9uIHRoaXMgdW50aWwgd2Ug
c3dpdGNoIHRvIHRoZSBvdmVyZmxvdyBzdGFjay4KClsuLi5dCgo+ID4gPiBZZWFoIGl0IGxvb2tz
IGxpa2UgYSBzcG90LW9uIGlkZW50aWZpY2F0aW9uIG9mIHRoZSBwcm9ibGVtLCBJIGNhbiB0cnkg
dG8KPiA+ID4gdGhpbmsgYWJvdXQgaG93IHdlIGNvdWxkIGZpeCB0aGlzIGlmIEkgY2FuIHJlcHJv
ZHVjZSBpdCwgSSBrZWVwIHRyeWluZwo+ID4gPiB0byBwcm92b2tlIHRoZSBjcmFzaCA6Lwo+ID4K
PiA+IEl0J3MgYSBiaXQgZ3JvdHR5IC0tIEFGQUlDVCB5b3UnZCBlaXRoZXIgbmVlZCB0byBwcmVm
YXVsdCBpbiB0aGUKPiA+IHNwZWNpZmljIHBhcnQgb2YgdGhlIHZtYWxsb2Mgc3BhY2Ugd2hlbiBz
d2l0Y2hpbmcgdGFza3MsIG9yIHdlJ2QgbmVlZCB0bwo+ID4gcHJlYWxsb2NhdGUgYWxsIHRoZSBz
aGFyZWQgdm1hbGxvYyB0YWJsZXMgYXQgdGhlIHN0YXJ0IG9mIHRpbWUgc28gdGhhdAo+ID4gdGhl
eSdyZSBhbHdheXMgdXAtdG8tZGF0ZS4KPiA+Cj4gPiBXaGlsZSB3ZSBjb3VsZCBkaXNhYmxlIEtB
U0FOX1NUQUNLLCB0aGF0J3Mgb25seSBnb2luZyB0byBtYXNrIHRoZQo+ID4gcHJvYmxlbSB1bnRp
bCB0aGlzIGhhcHBlbnMgZm9yIGFueSBvdGhlciB2bWFsbG9jIHNoYWRvdy4uLgo+IAo+IElzIHRo
ZSBvdGhlciB2bWFsbG9jIHNoYWRvdyBub3QgY292ZXJlZCBieSB0aGUgb3JkaW5hcnkgb24tZGVt
YW5kIGZhdWx0aW5nPwoKSXQgZGVwZW5kcyBvbiB3aGF0IHRoZSB2bWFsbG9jIG1lbW9yeSBpcyB1
c2VkIGZvcjsgaWYgaXQncyBhbnl0aGluZyBlbHNlCnVzZWQgaW4gdGhlIGZhdWx0IGhhbmRsaW5n
IHBhdGgsIHRoYXQnbGwgZmF1bHQgcmVjdXJzaXZlbHksIGFuZCBpdCdzCnBvc3NpYmxlIHRoYXQn
bGwgaGFwcGVuIGluZGlyZWN0bHkgdmlhIG90aGVyIGluc3RydW1lbnRhdGlvbi4KCj4gV2hlbiBJ
IGltcGxlbWVudGVkIFZNQVBfU1RBQ0sgZm9yIEFSTSwgSSBhZGRlZCBhbiBleHBsaWNpdCBsb2Fk
IGZyb20KPiB0aGUgbmV3IHN0YWNrIHdoaWxlIHN0aWxsIHJ1bm5pbmcgZnJvbSB0aGUgb2xkIG9u
ZSAoaW4gX19zd2l0Y2hfdG8pIHNvCj4gdGhhdCB0aGUgb3JkaW5hcnkgZmF1bHRpbmcgY29kZSBj
YW4gZGVhbCB3aXRoIGl0LiBDb3VsZG4ndCB3ZSBkbyB0aGUKPiBzYW1lIGZvciB0aGUgdm1hbGxv
YyBzaGFkb3cgb2YgdGhlIG5ldyBzdGFjaz8KCldlIGNvdWxkIGRvIHNvbWV0aGluZyBzaW1pbGFy
LCBidXQgbm90ZSB0aGF0IGl0J3MgYmFja3dhcmRzOiB3ZSBuZWVkIHRvCmVuc3VyZSB0aGF0IHRo
ZSBvbGQvY3VycmVudCBzdGFjayBzaGFkb3cgd2lsbCBiZSBtYXBwZWQgaW4gdGhlIG5ldyBtbS4K
ClNvIHRoZSB1c3VhbCBmYXVsdCBoYW5kbGluZyBjYW4ndCBoYW5kbGUgdGhhdCBhcy1pcywgYmVj
YXVzZSB5b3UgbmVlZCB0bwpmYXVsdC1pbiBwYWdlcyBmb3IgYW4gbW0gd2hpY2ggaXNuJ3QgeWV0
IGluIHVzZS4gVGhhdCBsb2dpYyBjb3VsZCBiZQpmYWN0b3JlZCBvdXQgYW5kIHNoYXJlZCwgdGhv
dWdoLgoKTWFyay4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
