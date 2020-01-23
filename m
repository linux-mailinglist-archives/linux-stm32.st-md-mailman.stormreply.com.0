Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C211473B1
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 23:21:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6FAEC36B0C;
	Thu, 23 Jan 2020 22:21:32 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6504C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 22:21:31 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 483cF65fWcz1rVvM;
 Thu, 23 Jan 2020 23:21:30 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 483cF654Fpz1qql2;
 Thu, 23 Jan 2020 23:21:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id qMBT7xXHgD9X; Thu, 23 Jan 2020 23:21:29 +0100 (CET)
X-Auth-Info: 6ZBYsfcqxYA+jp8vBwwuLtW6C4RkxnXCQL33+f28CBU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 23 Jan 2020 23:21:29 +0100 (CET)
To: Marc Zyngier <maz@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
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
From: Marek Vasut <marex@denx.de>
Message-ID: <e1fffd57-4814-ec36-68b4-4207e3d4ae5d@denx.de>
Date: Thu, 23 Jan 2020 23:21:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cf98f4fd257ba4f34c75fe1656bd341b@kernel.org>
Content-Language: en-US
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMS8yMy8yMCAxMjoxOCBQTSwgTWFyYyBaeW5naWVyIHdyb3RlOgo+IE9uIDIwMjAtMDEtMjMg
MTA6NTIsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+PiBPbiBUaHUsIEphbiAyMywgMjAyMCBh
dCAxMDo0NDowM0FNICswMDAwLCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4+PiBPbiAyMDIwLTAxLTIz
IDEwOjEyLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4+ID4gT24gVGh1LCBKYW4gMjMsIDIw
MjAgYXQgMDk6MjI6NDhBTSArMDAwMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+Pj4gPiA+IE9uIDIw
MjAtMDEtMjMgMDg6MjcsIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+PiA+ID4gPiBPbiAxLzIy
LzIwIDg6MjkgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gPiA+ID4gPiBPbiAxLzIyLzIwIDY6
MTkgUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+PiA+ID4gPiA+Cj4+PiA+ID4gPiA+IEhp
LAo+Pj4gPiA+ID4gPgo+Pj4gPiA+ID4gPiBbLi4uXQo+Pj4gPiA+ID4gPgo+Pj4gPiA+ID4gPiA+
ID4gPiBDb25jZXJuaW5nLCB5b3VyIHF1ZXN0aW9uOgo+Pj4gPiA+ID4gPiA+ID4gPgo+Pj4gPiA+
ID4gPiA+ID4gPiBTZXR0aW5nIHlvdXIgZ3Bpb0MgaW50ZXJydXB0aW9uIGFzICJmYWxsaW5nIGVk
Z2UiIHNob3VsZAo+Pj4gPiA+ID4gPiA+ID4gPiBiZSBlbm91Z2guIE9uCj4+PiA+ID4gPiA+ID4g
PiA+IGdwaW9DeCBmYWxsaW5nIGVkZ2UsIGEgaGlnaC1sZXZlbCBzaWduYWwgaXMgZ2VuZXJhdGVk
IGJ5Cj4+PiA+ID4gPiA+ID4gPiA+IGV4dGkgYW5kIHNlbnQKPj4+ID4gPiA+ID4gPiA+ID4gdG8g
R0lDICh3aGljaCB0cmlnZ2VycyBHSUMgaW50ZXJydXB0KS4gVGhpcyBzaWduYWwKPj4+ID4gPiA+
ID4gPiA+ID4gcmVtYWlucyBoaWdoIHVudGlsCj4+PiA+ID4gPiA+ID4gPiA+IHN0bTMyX2lycV9h
Y2sgaXMgY2FsbGVkLgo+Pj4gPiA+ID4gPiA+ID4gPgo+Pj4gPiA+ID4gPiA+ID4gPiBTbyB5b3Ug
b25seSBuZWVkOiAoZXggZm9yIGdwaW9jIDEpLgo+Pj4gPiA+ID4gPiA+ID4gPgo+Pj4gPiA+ID4g
PiA+ID4gPiBpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvYz47Cj4+PiA+ID4gPiA+ID4gPiA+IGlu
dGVycnVwdHMgPSA8MSBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Owo+Pj4gPiA+ID4gPiA+ID4KPj4+
ID4gPiA+ID4gPiA+IEhvdyBkb2VzIHRoaXMgZGVhbCB3aXRoIHRoZSBjYXNlIHdoZXJlIHRoZSBk
ZXZpY2UgaG9sZHMgdGhlCj4+PiA+ID4gPiA+ID4gPiBpbnRlcnJ1cHQKPj4+ID4gPiA+ID4gPiA+
IGxpbmUgbG93IChzaW5jZSBpdCdzIGxldmVsLXNlbnNpdGl2ZSwgYWN0aXZlIGxvdykgYWZ0ZXIK
Pj4+IHRoZSBkcml2ZXIKPj4+ID4gPiA+ID4gPiA+IGludGVycnVwdCBoYW5kbGVyIGZpbmlzaGVz
ID8gRG9lcyBzdWNoIGNvbmRpdGlvbiBnZW5lcmF0ZQo+Pj4gYW5vdGhlcgo+Pj4gPiA+ID4gPiA+
ID4gaW50ZXJydXB0IGFuZCBjYWxsIHRoZSBkcml2ZXIgaW50ZXJydXB0IGhhbmRsZXIgYWdhaW4g
PyBJCj4+PiA+ID4gPiA+ID4gPiB3b3VsZCBleHBlY3QKPj4+ID4gPiA+ID4gPiA+IHRoZSBhbnN3
ZXIgaXMgbm8sIGJlY2F1c2UgdGhlIGludGVycnVwdCBpcyBlZGdlLXRyaWdnZXJlZAo+Pj4gPiA+
ID4gPiA+ID4gYW5kIHRoZXJlIGlzCj4+PiA+ID4gPiA+ID4gPiBubyBlZGdlLgo+Pj4gPiA+ID4g
PiA+Cj4+PiA+ID4gPiA+ID4gWW91ciBhc3N1bXB0aW9uIGlzIGdvb2QuIElmIHlvdXIgZGV2aWNl
IGNvbnRpbnVlIHRvIGhvbGQgdGhlCj4+PiA+ID4gPiA+ID4gbGluZSB0byBsb3cKPj4+ID4gPiA+
ID4gPiBhdCB0aGUgZW5kIG9mIHlvdXIgaW50ZXJydXB0IGhhbmRsZXIsIG5vIG1vcmUgaW50ZXJy
dXB0Cj4+PiB3aWxsIGJlCj4+PiA+ID4gPiA+ID4gZ2VuZXJhdGVkLgo+Pj4gPiA+ID4gPgo+Pj4g
PiA+ID4gPiBCdXQgZG9lcyB0aGF0IGJhc2ljYWxseSBtZWFuIHRoYXQgc3VjaCBhIGRldmljZSBj
YW5ub3QgYmUKPj4+IHVzZWQgd2l0aAo+Pj4gPiA+ID4gPiBTVE0zMk1QMSBvciBhbSBJIGZ1bmRh
bWVudGFsbHkgbWlzdGFrZW4gYW5kIGRvbid0IHVuZGVyc3RhbmQKPj4+IGhvdyBhCj4+PiA+ID4g
PiA+IGxldmVsLXRyaWdnZXJlZCBpbnRlcnJ1cHQgd29ya3MgPyA6KQo+Pj4gPiA+ID4KPj4+ID4g
PiA+IFlvdSBuZWVkIHRvIHJlbGVhc2UgdGhlIGxpbmUgaW4geW91ciBkZXZpY2UgaW50ZXJydXB0
IGhhbmRsZXIuCj4+PiBJZiBub3QsCj4+PiA+ID4gPiB5ZXMsIHlvdSB3aWxsIG1pc3MgaW50ZXJy
dXB0cyA6JAo+Pj4gPiA+Cj4+PiA+ID4gU28gdG8gc3VtIGl0IHVwLCB0aGlzIFNvQyBkb2Vzbid0
IHN1cHBvcnQgZXh0ZXJuYWwgbGV2ZWwgaW50ZXJydXB0cwo+Pj4gPiA+IG9uIGl0cyBvd24sIGZ1
bGwgc3RvcC4gWW91J2QgbmVlZCBzb21lIGFkZGl0aW9uYWwgZXh0ZXJuYWwgc2FtcGxpbmcKPj4+
ID4gPiBIVyB0byByZXRyaWdnZXIgYW4gZWRnZSBvbiBFT0kuCj4+PiA+Cj4+PiA+IE9yIHlvdSBu
ZWVkIHNvZnR3YXJlIHN1cHBvcnQgdGhhdCBtYXJrcyB0aGUgaXJxIHBlbmRpbmcgYWdhaW4gaWYg
b24KPj4+ID4gdW5tYXNrIHRoZSBpcnEgbGluZSBpcyBzdGlsbCBhY3RpdmUuCj4+Pgo+Pj4gQXNz
dW1pbmcgeW91IGNhbiBhY3R1YWxseSBvYnNlcnZlIHRoZSBzdGF0ZSBvZiB0aGUgbGluZSBkaXJl
Y3RseSwKPj4+IHdpdGhvdXQgaGF2aW5nIHRvIGFkZCBzcGVjaWZpYyBrbm93bGVkZ2Ugb2YgdGhl
IGdlbmVyYXRpbmcgZGV2aWNlLgo+Pgo+PiBBY2ssIHlvdSB3b24ndCB3YW50IHRvIGxvb2sgaW50
byB0aGUgcmVnaXN0ZXJzIG9mIHRoZSBpcnEgZ2VuZXJhdGluZwo+PiBkZXZpY2UgZm9yIHRoYXQu
IEkgYXNzdW1lZCB0aGUgbGluZSdzIHN0YXRlIGlzIG9ic2VydmFibGUgaW4gYW4KPj4gaXJxLWNv
bnRyb2xsZXIgc3BlY2lmaWMgd2F5Lgo+IAo+IFVuZm9ydHVuYXRlbHksIHRoYXQncyBub3QgYWx3
YXlzIHRoZSBjYXNlLiBBbmQgaWYgdGhlIG11eCBoYXMgYmVlbgo+IGRlc2lnbmVkIGZvciBlZGdl
LXNpZ25hbGxpbmcgb25seSwgdGhpcyBwYXJ0aWN1bGFyIGZlYXR1cmUgaXMgdW5saWtlbHkKPiB0
byBleGlzdCBiZWNhdXNlIGl0IG1ha2VzIGxpdHRsZSBzZW5zZSBpbiB0aGlzIGNvbnRleHQgKHRo
ZSBpbnB1dAo+IGV2ZW50cyBhcmUgb25seSB0cmFuc2llbnQsIHNvIHlvdSB3b3VsZG4ndCBvYnNl
cnZlIG11Y2gpLiBJbnN0ZWFkLCB5b3UKPiB3b3VsZCBpbXBsZW1lbnQgYSBzZXQgb2YgbGF0Y2hl
cy4KPiAKPiBCdXQgd2hvIGtub3dzLCBtYXliZSBhcyBhIGRlYnVnIGZlYXR1cmUgKGFsdGhvdWdo
IGxvb2tpbmcgYXQgdGhlIFRSTQo+IGRpZG4ndCBsZWFkIHRvIGFueXRoaW5nIHVzZWZ1bCkuLi4K
PiAKPj4+IERvaW5nIHRoaXMga2luZCBvZiB0cmlja3MgaW4gMjAyMCBpcyBwcmV0dHkgcG9vciBm
b3IgYSBtb2Rlcm4gU29DLgo+Pgo+PiBXaXRoIHRoZSBhYm92ZSBhc3N1bXB0aW9uIGdpdmVuLCBJ
IHRoaW5rIHRoYXQgaXMgb2sgZXZlbiBpbiAyMDIwLiAoQnV0IEkKPj4gd29uZGVyIGFib3V0IFNv
Q3MgaW4gMjAyMCBub3QgYmVpbmcgYWJsZSB0byBoYW5kbGUgbGV2ZWwgc2Vuc2l0aXZlIGlycXMK
Pj4gOi0pCj4gCj4gUXVpdGUuIFNlZW1zIGluY3JlZGlibHkgcmVzdHJpY3RpdmUsIGFuZCB2ZXJ5
IHVuZm9ydHVuYXRlLgoKU28gSSB3b25kZXIsIHRoZSBFWFRJIHNob3VsZCBiZSBhYmxlIHRvIHJl
YWQgdGhlIEdQSU8gbGluZSB3aGljaCBjYXVzZWQKdGhlIGludGVycnVwdCB3aGVuIHRoZSBpbnRl
cnJ1cHQgaGFuZGxlciByZXR1cm5zLCBhbmQgdHJpZ2dlciB0aGUKaW50ZXJydXB0IGFnYWluIGlm
IHRoZSBsaW5lIGlzIHN0aWxsIGxvdy4gVGhpcyBtaWdodCBuZWVkIHNvbWUgcGhhbmRsZQpmcm9t
IHRoZSBFWFRJIHRvIEdQSU8gYmFuayBpbiBEVCwgYnV0IHNob3VsZCBiZSBnZW5lcmFsbHkgZG9h
YmxlLCBubyA/Ckl0J3MgYSBjcnV0Y2ggYWxsIHJpZ2h0LgoKQnV0IEkgc3RpbGwgd29uZGVyLCB3
aGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoZSBFWFRJbXV4IGluIHRoYXQgU29DPwpTaG91bGRuJ3Qg
dGhhdCBwZXJtaXQgcm91dGluZyBHUElPcyBkaXJlY3RseSBpbnRvIEdJQyBTUElzLCB3aGljaCB3
b3VsZAp0aGVuIHBlcm1pdCBkZXRlY3RpbmcgYXQgbGVhc3QgbGV2ZWwtaGlnaCBpbnRlcnJ1cHRz
ID8KCi0tIApCZXN0IHJlZ2FyZHMsCk1hcmVrIFZhc3V0Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
