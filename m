Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B50681CD924
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2020 13:59:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 732F0C36B28;
	Mon, 11 May 2020 11:59:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D45FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 11:59:30 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 50DF220006;
 Mon, 11 May 2020 11:59:28 +0000 (UTC)
Date: Mon, 11 May 2020 13:59:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200511135926.3e5c622d@xps13>
In-Reply-To: <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
 <20200511111855.48216940@xps13>
 <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get
 resources from parent node
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gTW9uLCAxMSBNYXkKMjAyMCAxMjoyMTowMyArMDIwMDoKCj4gSGkgTWlx
dWVsLAo+IAo+IE9uIDUvMTEvMjAgMTE6MTggQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBI
aSBDaHJpc3RvcGhlLAo+ID4gCj4gPiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2Vy
ZWxsb0BzdC5jb20+IHdyb3RlIG9uIFdlZCwgNiBNYXkgMjAyMAo+ID4gMTE6MTE6MTkgKzAyMDA6
Cj4gPiAgIAo+ID4+IEZNQzIgRUJJIHN1cHBvcnQgaGFzIGJlZW4gYWRkZWQuIENvbW1vbiByZXNv
dXJjZXMgKHJlZ2lzdGVycyBiYXNlCj4gPj4gYW5kIGNsb2NrKSBhcmUgbm93IHNoYXJlZCBiZXR3
ZWVuIHRoZSAyIGRyaXZlcnMuIEl0IG1lYW5zIHRoYXQgdGhlCj4gPj4gY29tbW9uIHJlc291cmNl
cyBzaG91bGQgbm93IGJlIGZvdW5kIGluIHRoZSBwYXJlbnQgZGV2aWNlIHdoZW4gRUJJCj4gPj4g
bm9kZSBpcyBhdmFpbGFibGUuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtl
cmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4gPj4gLS0tICAKPiA+IAo+ID4gWy4u
Ll0KPiA+ICAgCj4gPj4gKwo+ID4+ICtzdGF0aWMgYm9vbCBzdG0zMl9mbWMyX25mY19jaGVja19m
b3JfcGFyZW50KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gK3sKPiA+PiArCXUz
MiBpOwo+ID4+ICsJaW50IG5iX3Jlc291cmNlcyA9IDA7Cj4gPj4gKwo+ID4+ICsJLyogQ291bnQg
dGhlIG51bWJlciBvZiByZXNvdXJjZXMgaW4gcmVnIHByb3BlcnR5ICovCj4gPj4gKwlmb3IgKGkg
PSAwOyBpIDwgcGRldi0+bnVtX3Jlc291cmNlczsgaSsrKSB7Cj4gPj4gKwkJc3RydWN0IHJlc291
cmNlICpyZXMgPSAmcGRldi0+cmVzb3VyY2VbaV07Cj4gPj4gKwo+ID4+ICsJCWlmIChyZXNvdXJj
ZV90eXBlKHJlcykgPT0gSU9SRVNPVVJDRV9NRU0pCj4gPj4gKwkJCW5iX3Jlc291cmNlcysrOwo+
ID4+ICsJfQo+ID4+ICsKPiA+PiArCS8qIEVhY2ggQ1MgbmVlZHMgMyByZXNvdXJjZXMgZGVmaW5l
ZCAoZGF0YSwgY21kIGFuZCBhZGRyKSAqLwo+ID4+ICsJaWYgKG5iX3Jlc291cmNlcyAlIDMpCj4g
Pj4gKwkJcmV0dXJuIGZhbHNlOwo+ID4+ICsKPiA+PiArCXJldHVybiB0cnVlOwo+ID4+ICt9ICAK
PiA+IAo+ID4gVGhpcyBmdW5jdGlvbiBsb29rcyBmcmFnaWxlLiBXaHkgbm90IGp1c3QgY2hlY2tp
bmcgdGhlIGNvbXBhdGlibGUKPiA+IHN0cmluZyBvZiB0aGUgcGFyZW50IG5vZGU/Cj4gPiAgIAo+
IAo+IFllcywgaXQgaXMgYW5vdGhlciB3YXkgdG8gY2hlY2sgdGhhdCB3ZSBoYXZlIGFuIEVCSSBw
YXJlbnQgbm9kZS4KPiAKPiBJbiB0aGlzIGltcGxlbWVudGF0aW9uLCBJIHdhcyBjaGVja2luZyB0
aGUgbnVtYmVyIG9mIHJlZyB0dXBsZXMuCj4gSW4gY2FzZSB3ZSBoYXZlIDYsIGl0IG1lYW5zIHRo
YXQgdGhlIHJlZ2lzdGVyIGJhc2UgYWRkcmVzcyBpcyBkZWZpbmVkIGluIHRoZSBwYXJlbnQgbm9k
ZSAoRUJJIG5vZGUpLgo+IEluIGNhc2Ugd2UgaGF2ZSA3LCBpdCBtZWFucyB0aGF0IHRoZSByZWdp
c3RlciBiYXNlIGFkZHJlc3MgaXMgZGVmaW5lZCBpbiB0aGUgY3VycmVudCBub2RlIChORkMgbm9k
ZSkuCgpZZXMsIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgZG9pbmcsIGJ1dCBJIGtpbmQgb2Yg
ZGlzbGlrZSB0aGUgbG9naWMuClJlbHlpbmcgb24gdGhlIG51bWJlciBvZiByZWcgdHVwbGVzIGlz
IHNvbWV0aGluZyB0aGF0IGNhbiBiZSBkb25lIChJCnVzZWQgaXQgbXlzZWxmIG9uZSB0aW1lKSwg
YnV0IEkgdGhpbmsgdGhpcyBpcyBtb3JlIGEgaGFjayB0aGF0IHlvdSBkbwp3aGVuIHlvdSBoYXZl
IG5vIG90aGVyIHdheSB0byBkaWZmZXJlbnRpYXRlLiBJIGd1ZXNzIHRoZSBwcm9wZXIgd2F5Cndv
dWxkIGJlIHRvIGxvb2sgYXQgdGhlIHBhcmVudCdzIGNvbXBhdGlibGUuIElmIGl0IG1hdGNoZXMg
d2hhdCB5b3UKZXhwZWN0LCB0aGVuIHlvdSBjYW4gc3RvcmUgdGhlIGRldi0+b2Zfbm9kZS0+cGFy
ZW50LT5kZXYgc29tZXdoZXJlIGluCnlvdXIgY29udHJvbGxlcidzIHN0cnVjdHVyZSBhbmQgdGhl
biB1c2UgaXQgdG8gaW5pdGlhbGl6ZSB0aGUgY2xvY2sgYW5kCnJlZ21hcC4gVGhpcyB3YXkgeW91
IGRvbid0IGhhdmUgdG8gbW92ZSBhbnl0aGluZyBlbHNlIGluIHRoZSBwcm9iZSBwYXRoLgoKClRo
YW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
