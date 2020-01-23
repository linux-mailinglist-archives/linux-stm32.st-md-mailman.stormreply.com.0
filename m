Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B855914667D
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 12:18:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 755A4C36B0C;
	Thu, 23 Jan 2020 11:18:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9FDFC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 11:18:54 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 555D1206D4;
 Thu, 23 Jan 2020 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579778333;
 bh=hK4Y9BS4CgrlrfnKf+xmAnGp1E+lccyITWXpWCmeKeg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ULLMkg1EHI125f83Ya99aCq5rGAGgdakWQ/jz06lLYVY9GJgMjXIjGm4jumwDs/pb
 nncNTNaH3WPzkcjEHV/bHiGh1XaBM9mfFJK10ljGsOOxuyCyDu6ZW0Je8qsL0m2xe0
 4kWanIa6yVf/UmRxM6U8pWUUuFB7ytuX7czs9O20=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1iuaVf-000vmX-HL; Thu, 23 Jan 2020 11:18:51 +0000
MIME-Version: 1.0
Date: Thu, 23 Jan 2020 11:18:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20200123105214.ru4j76xbisjtbtgw@pengutronix.de>
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
Message-ID: <cf98f4fd257ba4f34c75fe1656bd341b@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: u.kleine-koenig@pengutronix.de, marex@denx.de,
 alexandre.torgue@st.com, patrick.delaunay@st.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

T24gMjAyMC0wMS0yMyAxMDo1MiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gVGh1LCBK
YW4gMjMsIDIwMjAgYXQgMTA6NDQ6MDNBTSArMDAwMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+PiBP
biAyMDIwLTAxLTIzIDEwOjEyLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4gPiBPbiBUaHUs
IEphbiAyMywgMjAyMCBhdCAwOToyMjo0OEFNICswMDAwLCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4+
ID4gPiBPbiAyMDIwLTAxLTIzIDA4OjI3LCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+PiA+ID4g
PiBPbiAxLzIyLzIwIDg6MjkgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiA+ID4gPiA+IE9uIDEv
MjIvMjAgNjoxOSBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4gPiA+ID4gPgo+PiA+ID4g
PiA+IEhpLAo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gWy4uLl0KPj4gPiA+ID4gPgo+PiA+ID4gPiA+
ID4gPiA+IENvbmNlcm5pbmcsIHlvdXIgcXVlc3Rpb246Cj4+ID4gPiA+ID4gPiA+ID4KPj4gPiA+
ID4gPiA+ID4gPiBTZXR0aW5nIHlvdXIgZ3Bpb0MgaW50ZXJydXB0aW9uIGFzICJmYWxsaW5nIGVk
Z2UiIHNob3VsZAo+PiA+ID4gPiA+ID4gPiA+IGJlIGVub3VnaC4gT24KPj4gPiA+ID4gPiA+ID4g
PiBncGlvQ3ggZmFsbGluZyBlZGdlLCBhIGhpZ2gtbGV2ZWwgc2lnbmFsIGlzIGdlbmVyYXRlZCBi
eQo+PiA+ID4gPiA+ID4gPiA+IGV4dGkgYW5kIHNlbnQKPj4gPiA+ID4gPiA+ID4gPiB0byBHSUMg
KHdoaWNoIHRyaWdnZXJzIEdJQyBpbnRlcnJ1cHQpLiBUaGlzIHNpZ25hbAo+PiA+ID4gPiA+ID4g
PiA+IHJlbWFpbnMgaGlnaCB1bnRpbAo+PiA+ID4gPiA+ID4gPiA+IHN0bTMyX2lycV9hY2sgaXMg
Y2FsbGVkLgo+PiA+ID4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiA+ID4gU28geW91IG9ubHkgbmVl
ZDogKGV4IGZvciBncGlvYyAxKS4KPj4gPiA+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4gPiA+IGlu
dGVycnVwdC1wYXJlbnQgPSA8JmdwaW9jPjsKPj4gPiA+ID4gPiA+ID4gPiBpbnRlcnJ1cHRzID0g
PDEgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsKPj4gPiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+ID4g
SG93IGRvZXMgdGhpcyBkZWFsIHdpdGggdGhlIGNhc2Ugd2hlcmUgdGhlIGRldmljZSBob2xkcyB0
aGUKPj4gPiA+ID4gPiA+ID4gaW50ZXJydXB0Cj4+ID4gPiA+ID4gPiA+IGxpbmUgbG93IChzaW5j
ZSBpdCdzIGxldmVsLXNlbnNpdGl2ZSwgYWN0aXZlIGxvdykgYWZ0ZXIgdGhlIGRyaXZlcgo+PiA+
ID4gPiA+ID4gPiBpbnRlcnJ1cHQgaGFuZGxlciBmaW5pc2hlcyA/IERvZXMgc3VjaCBjb25kaXRp
b24gZ2VuZXJhdGUgYW5vdGhlcgo+PiA+ID4gPiA+ID4gPiBpbnRlcnJ1cHQgYW5kIGNhbGwgdGhl
IGRyaXZlciBpbnRlcnJ1cHQgaGFuZGxlciBhZ2FpbiA/IEkKPj4gPiA+ID4gPiA+ID4gd291bGQg
ZXhwZWN0Cj4+ID4gPiA+ID4gPiA+IHRoZSBhbnN3ZXIgaXMgbm8sIGJlY2F1c2UgdGhlIGludGVy
cnVwdCBpcyBlZGdlLXRyaWdnZXJlZAo+PiA+ID4gPiA+ID4gPiBhbmQgdGhlcmUgaXMKPj4gPiA+
ID4gPiA+ID4gbm8gZWRnZS4KPj4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiBZb3VyIGFzc3VtcHRp
b24gaXMgZ29vZC4gSWYgeW91ciBkZXZpY2UgY29udGludWUgdG8gaG9sZCB0aGUKPj4gPiA+ID4g
PiA+IGxpbmUgdG8gbG93Cj4+ID4gPiA+ID4gPiBhdCB0aGUgZW5kIG9mIHlvdXIgaW50ZXJydXB0
IGhhbmRsZXIsIG5vIG1vcmUgaW50ZXJydXB0IHdpbGwgYmUKPj4gPiA+ID4gPiA+IGdlbmVyYXRl
ZC4KPj4gPiA+ID4gPgo+PiA+ID4gPiA+IEJ1dCBkb2VzIHRoYXQgYmFzaWNhbGx5IG1lYW4gdGhh
dCBzdWNoIGEgZGV2aWNlIGNhbm5vdCBiZSB1c2VkIHdpdGgKPj4gPiA+ID4gPiBTVE0zMk1QMSBv
ciBhbSBJIGZ1bmRhbWVudGFsbHkgbWlzdGFrZW4gYW5kIGRvbid0IHVuZGVyc3RhbmQgaG93IGEK
Pj4gPiA+ID4gPiBsZXZlbC10cmlnZ2VyZWQgaW50ZXJydXB0IHdvcmtzID8gOikKPj4gPiA+ID4K
Pj4gPiA+ID4gWW91IG5lZWQgdG8gcmVsZWFzZSB0aGUgbGluZSBpbiB5b3VyIGRldmljZSBpbnRl
cnJ1cHQgaGFuZGxlci4gSWYgbm90LAo+PiA+ID4gPiB5ZXMsIHlvdSB3aWxsIG1pc3MgaW50ZXJy
dXB0cyA6JAo+PiA+ID4KPj4gPiA+IFNvIHRvIHN1bSBpdCB1cCwgdGhpcyBTb0MgZG9lc24ndCBz
dXBwb3J0IGV4dGVybmFsIGxldmVsIGludGVycnVwdHMKPj4gPiA+IG9uIGl0cyBvd24sIGZ1bGwg
c3RvcC4gWW91J2QgbmVlZCBzb21lIGFkZGl0aW9uYWwgZXh0ZXJuYWwgc2FtcGxpbmcKPj4gPiA+
IEhXIHRvIHJldHJpZ2dlciBhbiBlZGdlIG9uIEVPSS4KPj4gPgo+PiA+IE9yIHlvdSBuZWVkIHNv
ZnR3YXJlIHN1cHBvcnQgdGhhdCBtYXJrcyB0aGUgaXJxIHBlbmRpbmcgYWdhaW4gaWYgb24KPj4g
PiB1bm1hc2sgdGhlIGlycSBsaW5lIGlzIHN0aWxsIGFjdGl2ZS4KPj4gCj4+IEFzc3VtaW5nIHlv
dSBjYW4gYWN0dWFsbHkgb2JzZXJ2ZSB0aGUgc3RhdGUgb2YgdGhlIGxpbmUgZGlyZWN0bHksCj4+
IHdpdGhvdXQgaGF2aW5nIHRvIGFkZCBzcGVjaWZpYyBrbm93bGVkZ2Ugb2YgdGhlIGdlbmVyYXRp
bmcgZGV2aWNlLgo+IAo+IEFjaywgeW91IHdvbid0IHdhbnQgdG8gbG9vayBpbnRvIHRoZSByZWdp
c3RlcnMgb2YgdGhlIGlycSBnZW5lcmF0aW5nCj4gZGV2aWNlIGZvciB0aGF0LiBJIGFzc3VtZWQg
dGhlIGxpbmUncyBzdGF0ZSBpcyBvYnNlcnZhYmxlIGluIGFuCj4gaXJxLWNvbnRyb2xsZXIgc3Bl
Y2lmaWMgd2F5LgoKVW5mb3J0dW5hdGVseSwgdGhhdCdzIG5vdCBhbHdheXMgdGhlIGNhc2UuIEFu
ZCBpZiB0aGUgbXV4IGhhcyBiZWVuCmRlc2lnbmVkIGZvciBlZGdlLXNpZ25hbGxpbmcgb25seSwg
dGhpcyBwYXJ0aWN1bGFyIGZlYXR1cmUgaXMgdW5saWtlbHkKdG8gZXhpc3QgYmVjYXVzZSBpdCBt
YWtlcyBsaXR0bGUgc2Vuc2UgaW4gdGhpcyBjb250ZXh0ICh0aGUgaW5wdXQKZXZlbnRzIGFyZSBv
bmx5IHRyYW5zaWVudCwgc28geW91IHdvdWxkbid0IG9ic2VydmUgbXVjaCkuIEluc3RlYWQsIHlv
dQp3b3VsZCBpbXBsZW1lbnQgYSBzZXQgb2YgbGF0Y2hlcy4KCkJ1dCB3aG8ga25vd3MsIG1heWJl
IGFzIGEgZGVidWcgZmVhdHVyZSAoYWx0aG91Z2ggbG9va2luZyBhdCB0aGUgVFJNCmRpZG4ndCBs
ZWFkIHRvIGFueXRoaW5nIHVzZWZ1bCkuLi4KCj4+IERvaW5nIHRoaXMga2luZCBvZiB0cmlja3Mg
aW4gMjAyMCBpcyBwcmV0dHkgcG9vciBmb3IgYSBtb2Rlcm4gU29DLgo+IAo+IFdpdGggdGhlIGFi
b3ZlIGFzc3VtcHRpb24gZ2l2ZW4sIEkgdGhpbmsgdGhhdCBpcyBvayBldmVuIGluIDIwMjAuIChC
dXQgCj4gSQo+IHdvbmRlciBhYm91dCBTb0NzIGluIDIwMjAgbm90IGJlaW5nIGFibGUgdG8gaGFu
ZGxlIGxldmVsIHNlbnNpdGl2ZSBpcnFzCj4gOi0pCgpRdWl0ZS4gU2VlbXMgaW5jcmVkaWJseSBy
ZXN0cmljdGl2ZSwgYW5kIHZlcnkgdW5mb3J0dW5hdGUuCgogICAgICAgICBNLgotLSAKSmF6eiBp
cyBub3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuLi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
