Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C35147A4D
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 10:21:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C59FC36B0C;
	Fri, 24 Jan 2020 09:21:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F2CCC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 09:21:38 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB6E72070A;
 Fri, 24 Jan 2020 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579857697;
 bh=4cNLZVtA4Kr2G+KXgOZPyHonpZhsE0n1Tw0ckwGDFic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EMzz82wAkONWL+uoBS+XWyOHUAUkfUxheo39cwESCBjU6QVSKC6KcHIY1Vu160oJb
 uXUqZuuv1WJddIT3S5CpOilxFxpAWNNmxzlHBFajPH7DIlmAeup8Vi8HwnbrMXcRAs
 3Jlobx1UfHuJz/+e3S00AmZE1+eB7v5yk6pxMEIQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1iuv9j-00166l-0c; Fri, 24 Jan 2020 09:21:35 +0000
MIME-Version: 1.0
Date: Fri, 24 Jan 2020 09:21:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <e1fffd57-4814-ec36-68b4-4207e3d4ae5d@denx.de>
References: <20bb72d0-8258-abc0-e729-4d3d5a75c41c@denx.de>
 <d6e02817-2464-51b9-246a-7720b607b8d6@st.com>
 <65a1c5b2-c1b9-322f-338c-e6ff6379d8d1@denx.de>
 <129d04a0-c846-506d-5726-4a1024d977a6@st.com>
 <80db762c-3b3d-f007-2f9b-dadbffd95782@denx.de>
 <360b1adc-32f1-7993-c463-e52c7a5a8a67@st.com>
 <c4f08f59acd31951527ef1d6e9409e6f@kernel.org>
 <20200123101225.nscpc5t4nmlarbw2@pengutronix.de>
 <03fd1cb7b5985b3221f66c6b0058adc8@kernel.org>
 <20200123105214.ru4j76xbisjtbtgw@pengutronix.de>
 <cf98f4fd257ba4f34c75fe1656bd341b@kernel.org>
 <e1fffd57-4814-ec36-68b4-4207e3d4ae5d@denx.de>
Message-ID: <53873228b5357a29a8405db55cff7392@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: marex@denx.de, u.kleine-koenig@pengutronix.de,
 alexandre.torgue@st.com, patrick.delaunay@st.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] STM32MP1 level triggered interrupts
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjAyMC0wMS0yMyAyMjoyMSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMS8yMy8yMCAxMjox
OCBQTSwgTWFyYyBaeW5naWVyIHdyb3RlOgo+PiBPbiAyMDIwLTAxLTIzIDEwOjUyLCBVd2UgS2xl
aW5lLUvDtm5pZyB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDIzLCAyMDIwIGF0IDEwOjQ0OjAzQU0g
KzAwMDAsIE1hcmMgWnluZ2llciB3cm90ZToKPj4+PiBPbiAyMDIwLTAxLTIzIDEwOjEyLCBVd2Ug
S2xlaW5lLUvDtm5pZyB3cm90ZToKPj4+PiA+IE9uIFRodSwgSmFuIDIzLCAyMDIwIGF0IDA5OjIy
OjQ4QU0gKzAwMDAsIE1hcmMgWnluZ2llciB3cm90ZToKPj4+PiA+ID4gT24gMjAyMC0wMS0yMyAw
ODoyNywgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4+PiA+ID4gPiBPbiAxLzIyLzIwIDg6Mjkg
UE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+ID4gPiA+ID4gT24gMS8yMi8yMCA2OjE5IFBNLCBB
bGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+Pj4+ID4gPiA+ID4KPj4+PiA+ID4gPiA+IEhpLAo+Pj4+
ID4gPiA+ID4KPj4+PiA+ID4gPiA+IFsuLi5dCj4+Pj4gPiA+ID4gPgo+Pj4+ID4gPiA+ID4gPiA+
ID4gQ29uY2VybmluZywgeW91ciBxdWVzdGlvbjoKPj4+PiA+ID4gPiA+ID4gPiA+Cj4+Pj4gPiA+
ID4gPiA+ID4gPiBTZXR0aW5nIHlvdXIgZ3Bpb0MgaW50ZXJydXB0aW9uIGFzICJmYWxsaW5nIGVk
Z2UiIHNob3VsZAo+Pj4+ID4gPiA+ID4gPiA+ID4gYmUgZW5vdWdoLiBPbgo+Pj4+ID4gPiA+ID4g
PiA+ID4gZ3Bpb0N4IGZhbGxpbmcgZWRnZSwgYSBoaWdoLWxldmVsIHNpZ25hbCBpcyBnZW5lcmF0
ZWQgYnkKPj4+PiA+ID4gPiA+ID4gPiA+IGV4dGkgYW5kIHNlbnQKPj4+PiA+ID4gPiA+ID4gPiA+
IHRvIEdJQyAod2hpY2ggdHJpZ2dlcnMgR0lDIGludGVycnVwdCkuIFRoaXMgc2lnbmFsCj4+Pj4g
PiA+ID4gPiA+ID4gPiByZW1haW5zIGhpZ2ggdW50aWwKPj4+PiA+ID4gPiA+ID4gPiA+IHN0bTMy
X2lycV9hY2sgaXMgY2FsbGVkLgo+Pj4+ID4gPiA+ID4gPiA+ID4KPj4+PiA+ID4gPiA+ID4gPiA+
IFNvIHlvdSBvbmx5IG5lZWQ6IChleCBmb3IgZ3Bpb2MgMSkuCj4+Pj4gPiA+ID4gPiA+ID4gPgo+
Pj4+ID4gPiA+ID4gPiA+ID4gaW50ZXJydXB0LXBhcmVudCA9IDwmZ3Bpb2M+Owo+Pj4+ID4gPiA+
ID4gPiA+ID4gaW50ZXJydXB0cyA9IDwxIElSUV9UWVBFX0VER0VfRkFMTElORz47Cj4+Pj4gPiA+
ID4gPiA+ID4KPj4+PiA+ID4gPiA+ID4gPiBIb3cgZG9lcyB0aGlzIGRlYWwgd2l0aCB0aGUgY2Fz
ZSB3aGVyZSB0aGUgZGV2aWNlIGhvbGRzIHRoZQo+Pj4+ID4gPiA+ID4gPiA+IGludGVycnVwdAo+
Pj4+ID4gPiA+ID4gPiA+IGxpbmUgbG93IChzaW5jZSBpdCdzIGxldmVsLXNlbnNpdGl2ZSwgYWN0
aXZlIGxvdykgYWZ0ZXIKPj4+PiB0aGUgZHJpdmVyCj4+Pj4gPiA+ID4gPiA+ID4gaW50ZXJydXB0
IGhhbmRsZXIgZmluaXNoZXMgPyBEb2VzIHN1Y2ggY29uZGl0aW9uIGdlbmVyYXRlCj4+Pj4gYW5v
dGhlcgo+Pj4+ID4gPiA+ID4gPiA+IGludGVycnVwdCBhbmQgY2FsbCB0aGUgZHJpdmVyIGludGVy
cnVwdCBoYW5kbGVyIGFnYWluID8gSQo+Pj4+ID4gPiA+ID4gPiA+IHdvdWxkIGV4cGVjdAo+Pj4+
ID4gPiA+ID4gPiA+IHRoZSBhbnN3ZXIgaXMgbm8sIGJlY2F1c2UgdGhlIGludGVycnVwdCBpcyBl
ZGdlLXRyaWdnZXJlZAo+Pj4+ID4gPiA+ID4gPiA+IGFuZCB0aGVyZSBpcwo+Pj4+ID4gPiA+ID4g
PiA+IG5vIGVkZ2UuCj4+Pj4gPiA+ID4gPiA+Cj4+Pj4gPiA+ID4gPiA+IFlvdXIgYXNzdW1wdGlv
biBpcyBnb29kLiBJZiB5b3VyIGRldmljZSBjb250aW51ZSB0byBob2xkIHRoZQo+Pj4+ID4gPiA+
ID4gPiBsaW5lIHRvIGxvdwo+Pj4+ID4gPiA+ID4gPiBhdCB0aGUgZW5kIG9mIHlvdXIgaW50ZXJy
dXB0IGhhbmRsZXIsIG5vIG1vcmUgaW50ZXJydXB0Cj4+Pj4gd2lsbCBiZQo+Pj4+ID4gPiA+ID4g
PiBnZW5lcmF0ZWQuCj4+Pj4gPiA+ID4gPgo+Pj4+ID4gPiA+ID4gQnV0IGRvZXMgdGhhdCBiYXNp
Y2FsbHkgbWVhbiB0aGF0IHN1Y2ggYSBkZXZpY2UgY2Fubm90IGJlCj4+Pj4gdXNlZCB3aXRoCj4+
Pj4gPiA+ID4gPiBTVE0zMk1QMSBvciBhbSBJIGZ1bmRhbWVudGFsbHkgbWlzdGFrZW4gYW5kIGRv
bid0IHVuZGVyc3RhbmQKPj4+PiBob3cgYQo+Pj4+ID4gPiA+ID4gbGV2ZWwtdHJpZ2dlcmVkIGlu
dGVycnVwdCB3b3JrcyA/IDopCj4+Pj4gPiA+ID4KPj4+PiA+ID4gPiBZb3UgbmVlZCB0byByZWxl
YXNlIHRoZSBsaW5lIGluIHlvdXIgZGV2aWNlIGludGVycnVwdCBoYW5kbGVyLgo+Pj4+IElmIG5v
dCwKPj4+PiA+ID4gPiB5ZXMsIHlvdSB3aWxsIG1pc3MgaW50ZXJydXB0cyA6JAo+Pj4+ID4gPgo+
Pj4+ID4gPiBTbyB0byBzdW0gaXQgdXAsIHRoaXMgU29DIGRvZXNuJ3Qgc3VwcG9ydCBleHRlcm5h
bCBsZXZlbCBpbnRlcnJ1cHRzCj4+Pj4gPiA+IG9uIGl0cyBvd24sIGZ1bGwgc3RvcC4gWW91J2Qg
bmVlZCBzb21lIGFkZGl0aW9uYWwgZXh0ZXJuYWwgc2FtcGxpbmcKPj4+PiA+ID4gSFcgdG8gcmV0
cmlnZ2VyIGFuIGVkZ2Ugb24gRU9JLgo+Pj4+ID4KPj4+PiA+IE9yIHlvdSBuZWVkIHNvZnR3YXJl
IHN1cHBvcnQgdGhhdCBtYXJrcyB0aGUgaXJxIHBlbmRpbmcgYWdhaW4gaWYgb24KPj4+PiA+IHVu
bWFzayB0aGUgaXJxIGxpbmUgaXMgc3RpbGwgYWN0aXZlLgo+Pj4+IAo+Pj4+IEFzc3VtaW5nIHlv
dSBjYW4gYWN0dWFsbHkgb2JzZXJ2ZSB0aGUgc3RhdGUgb2YgdGhlIGxpbmUgZGlyZWN0bHksCj4+
Pj4gd2l0aG91dCBoYXZpbmcgdG8gYWRkIHNwZWNpZmljIGtub3dsZWRnZSBvZiB0aGUgZ2VuZXJh
dGluZyBkZXZpY2UuCj4+PiAKPj4+IEFjaywgeW91IHdvbid0IHdhbnQgdG8gbG9vayBpbnRvIHRo
ZSByZWdpc3RlcnMgb2YgdGhlIGlycSBnZW5lcmF0aW5nCj4+PiBkZXZpY2UgZm9yIHRoYXQuIEkg
YXNzdW1lZCB0aGUgbGluZSdzIHN0YXRlIGlzIG9ic2VydmFibGUgaW4gYW4KPj4+IGlycS1jb250
cm9sbGVyIHNwZWNpZmljIHdheS4KPj4gCj4+IFVuZm9ydHVuYXRlbHksIHRoYXQncyBub3QgYWx3
YXlzIHRoZSBjYXNlLiBBbmQgaWYgdGhlIG11eCBoYXMgYmVlbgo+PiBkZXNpZ25lZCBmb3IgZWRn
ZS1zaWduYWxsaW5nIG9ubHksIHRoaXMgcGFydGljdWxhciBmZWF0dXJlIGlzIHVubGlrZWx5Cj4+
IHRvIGV4aXN0IGJlY2F1c2UgaXQgbWFrZXMgbGl0dGxlIHNlbnNlIGluIHRoaXMgY29udGV4dCAo
dGhlIGlucHV0Cj4+IGV2ZW50cyBhcmUgb25seSB0cmFuc2llbnQsIHNvIHlvdSB3b3VsZG4ndCBv
YnNlcnZlIG11Y2gpLiBJbnN0ZWFkLCB5b3UKPj4gd291bGQgaW1wbGVtZW50IGEgc2V0IG9mIGxh
dGNoZXMuCj4+IAo+PiBCdXQgd2hvIGtub3dzLCBtYXliZSBhcyBhIGRlYnVnIGZlYXR1cmUgKGFs
dGhvdWdoIGxvb2tpbmcgYXQgdGhlIFRSTQo+PiBkaWRuJ3QgbGVhZCB0byBhbnl0aGluZyB1c2Vm
dWwpLi4uCj4+IAo+Pj4+IERvaW5nIHRoaXMga2luZCBvZiB0cmlja3MgaW4gMjAyMCBpcyBwcmV0
dHkgcG9vciBmb3IgYSBtb2Rlcm4gU29DLgo+Pj4gCj4+PiBXaXRoIHRoZSBhYm92ZSBhc3N1bXB0
aW9uIGdpdmVuLCBJIHRoaW5rIHRoYXQgaXMgb2sgZXZlbiBpbiAyMDIwLiAKPj4+IChCdXQgSQo+
Pj4gd29uZGVyIGFib3V0IFNvQ3MgaW4gMjAyMCBub3QgYmVpbmcgYWJsZSB0byBoYW5kbGUgbGV2
ZWwgc2Vuc2l0aXZlIAo+Pj4gaXJxcwo+Pj4gOi0pCj4+IAo+PiBRdWl0ZS4gU2VlbXMgaW5jcmVk
aWJseSByZXN0cmljdGl2ZSwgYW5kIHZlcnkgdW5mb3J0dW5hdGUuCj4gCj4gU28gSSB3b25kZXIs
IHRoZSBFWFRJIHNob3VsZCBiZSBhYmxlIHRvIHJlYWQgdGhlIEdQSU8gbGluZSB3aGljaCBjYXVz
ZWQKPiB0aGUgaW50ZXJydXB0IHdoZW4gdGhlIGludGVycnVwdCBoYW5kbGVyIHJldHVybnMsIGFu
ZCB0cmlnZ2VyIHRoZQo+IGludGVycnVwdCBhZ2FpbiBpZiB0aGUgbGluZSBpcyBzdGlsbCBsb3cu
IFRoaXMgbWlnaHQgbmVlZCBzb21lIHBoYW5kbGUKPiBmcm9tIHRoZSBFWFRJIHRvIEdQSU8gYmFu
ayBpbiBEVCwgYnV0IHNob3VsZCBiZSBnZW5lcmFsbHkgZG9hYmxlLCBubyA/Cj4gSXQncyBhIGNy
dXRjaCBhbGwgcmlnaHQuCgpUaGF0IGlzIGV4YWN0bHkgd2hhdCBVd2Ugd2FzIHN1Z2dlc3Rpbmcg
YWJvdmUgKGRvaW5nIHRoZSByZXNhbXBsaW5nIGFuZApyZXRyaWdnZXJpbmcgaW4gU1cpLiBJdCBy
ZW1haW5zIHRvIGJlIHNlZW4gd2hldGhlciB0aGUgR1BJTyBibG9jayBvZmZlcnMKYSB3YXkgdG8g
dG8gcmVhZCB0aGUgcmF3IHN0YXRlIG9mIHRoZSB3aXJlLgoKPiBCdXQgSSBzdGlsbCB3b25kZXIs
IHdoYXQgaXMgdGhlIHB1cnBvc2Ugb2YgdGhlIEVYVEltdXggaW4gdGhhdCBTb0M/Cj4gU2hvdWxk
bid0IHRoYXQgcGVybWl0IHJvdXRpbmcgR1BJT3MgZGlyZWN0bHkgaW50byBHSUMgU1BJcywgd2hp
Y2ggd291bGQKPiB0aGVuIHBlcm1pdCBkZXRlY3RpbmcgYXQgbGVhc3QgbGV2ZWwtaGlnaCBpbnRl
cnJ1cHRzID8KClRoZXNlIHRoaW5ncyBhcmUgdXN1YWxseSBjYXJnby1jdWx0ZWQgZnJvbSBvbmUg
U29DIHRvIGFub3RoZXIuIEknbSAKcHJldHR5CnN1cmUgdGhpcyBzdGFydGVkIGFzIGEgd2F5IHRv
IGhhbmRsZSBlZGdlIGludGVycnVwdHMgb24gYSBzbWFsbGVyIApzeXN0ZW0sCmFuZCBlbmRlZCB1
cCBiZWluZyBjb3B5L3Bhc3RlZCBpbiB0aGUgbmV3ZXIgZGVzaWduLgoKT24gbW9kZXJuIHN5c3Rl
bXMsIGludGVycnVwdCBNVVhzIGFyZSBqdXN0IGEgZGlzYXN0ZXI6IHlvdSBjYW4ndCBiYWxhbmNl
CmludGVycnVwdHMgYWNyb3NzIENQVXMsIGFuZCB0aGV5IGNvc3QgY3ljbGVzIHRvIGhhbmRsZS4g
VGhlIG9ubHkgYmVuZWZpdAppcyB0aGF0IHlvdSBkb24ndCBoYXZlIHRvIHJvdXRlIGFsbCBHSUMg
aW5wdXQgc2lnbmFscyB0byB0aGUgR1BJTyBibG9jay4KWW91IGp1c3Qgcm91dGUgYSBzaW5nbGUg
b25lLCBhbmQgc2xhcCB0aGUgbXV4IG5leHQgdG8gaXQuCgpCdXQgaGV5LCB0b28gbGF0ZS4gSG9w
ZWZ1bGx5IHNvbWVvbmUgYXQgU1QgaXMgcmVhZGluZyB0aGlzIGFuZCB3aWxsIGZlZWQKYmFjayB0
byB0aGUgZGVzaWduIHRlYW1zLgoKICAgICAgICAgTS4KLS0gCkphenogaXMgbm90IGRlYWQuIEl0
IGp1c3Qgc21lbGxzIGZ1bm55Li4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
