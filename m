Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA301CED69
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 08:59:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CAA1C36B3A;
	Tue, 12 May 2020 06:59:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5C43C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 06:59:27 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A607E20006;
 Tue, 12 May 2020 06:59:24 +0000 (UTC)
Date: Tue, 12 May 2020 08:59:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200512085922.3fc3e4dd@xps13>
In-Reply-To: <49c51a13-96a1-0241-f4d1-c5ff7d52921d@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-5-git-send-email-christophe.kerello@st.com>
 <20200511223900.030fe5f4@xps13>
 <49c51a13-96a1-0241-f4d1-c5ff7d52921d@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 04/10] mtd: rawnand: stm32_fmc2: cleanup
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
LmNvbT4gd3JvdGUgb24gVHVlLCAxMiBNYXkKMjAyMCAwODo0OTo1NCArMDIwMDoKCj4gSGkgTWlx
dWVsLAo+IAo+IE9uIDUvMTEvMjAgMTA6MzkgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiAK
PiA+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGUg
b24gV2VkLCA2IE1heSAyMDIwCj4gPiAxMToxMToxMyArMDIwMDoKPiA+ICAgCj4gPj4gVGhpcyBw
YXRjaCByZW5hbWVzIGZ1bmN0aW9ucyBhbmQgbG9jYWwgdmFyaWFibGVzLgo+ID4+IFRoaXMgY2xl
YW51cCBpcyBkb25lIHRvIGdldCBhbGwgZnVuY3Rpb25zIHN0YXJ0aW5nIGJ5IHN0bTMyX2ZtYzJf
bmZjCj4gPj4gaW4gdGhlIEZNQzIgcmF3IE5BTkQgZHJpdmVyIHdoZW4gYWxsIGZ1bmN0aW9ucyB3
aWxsIHN0YXJ0IGJ5Cj4gPj4gc3RtMzJfZm1jMl9lYmkgaW4gdGhlIEZNQzIgRUJJIGRyaXZlci4K
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5r
ZXJlbGxvQHN0LmNvbT4KPiA+PiBSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gIAo+ID4gCj4gPiBBcHBsaWVkIHRvIG5hbmQvbmV4dCBhcyB3ZWxs
IGJ1dCBmb3IgYW4gdW5rbm93biByZWFzb24gSSBoYWQgdG8gZG8gaXQKPiA+IGJ5IGhhbmQgYmVj
YXVzZSB0aGUgcGF0Y2ggd291bGQgbm90IGFwcGx5Lgo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1
w6hsCj4gPiAgIAo+IFRoaXMgaXMgc3RyYW5nZSwgSSBjYW4gYXBwbHkgdGhpcyBwYXRjaCBvbiBt
eSB0cmVlIHdpdGhvdXQgYW55IGNvbmZsaWN0cy4KPiBUaGVyZSBpcyBhIGNvbXBpbGF0aW9uIGlz
c3VlIGxpbmUgMTMwMS4KPiAKPiBAQCAtMTMwMiw0NCArMTI5OCw0NSBAQCBzdGF0aWMgdm9pZCBz
dG0zMl9mbWMyX3dyaXRlX2RhdGEoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3Qgdm9pZCAq
YnVmLAo+IAo+ICAgCWlmIChmb3JjZV84Yml0ICYmIGNoaXAtPm9wdGlvbnMgJiBOQU5EX0JVU1dJ
RFRIXzE2KQo+ICAgCQkvKiBSZWNvbmZpZ3VyZSBidXMgd2lkdGggdG8gMTYtYml0ICovCj4gLQkJ
c3RtMzJfZm1jMl9zZXRfYnVzd2lkdGhfMTYoZm1jMiwgdHJ1ZSk7Cj4gKwkJc3RtMzJfZm1jMl9u
ZmNfc2V0X2J1c3dpZHRoXzE2KG5mYywgdHJ1ZSk7Cj4gICB9Cj4gCj4gSSB3aWxsIHJlYmFzZSBv
biB0b3Agb2YgbmFuZC9uZXh0IHRvZGF5IHRvIGNoZWNrIHRoYXQgdGhlcmUgaXMgbm8gaXNzdWVz
IHdpdGggdGhlIGRyaXZlci4KCkkgaGFkIHRvIGRvIHNvbWUgY2hhbmdlcyBtYW51YWxseSwgbWFp
YmUgSSBtaXNzZWQgdGhpcyBvbmUsIGJ1dCBJIGRvbid0CnJlbWVtYmVyIHRvdWNoaW5nIHRoaXMg
aGVscGVyLgoKQW55d2F5LCBJIGp1c3QgZHJvcHBlZCB0aGUgdHdvIGxhc3QgcGF0Y2hlcyBvZiB5
b3VyIHNlcmllcywgcGxlYXNlCnJlYmEmc2Ugbm93IG9uIG5hbmQvbmV4dCBhbmQganVzdCByZXNl
bmQgcGF0Y2hlcyA0IGFuZCA1LgoKQWxzbywgd2hpbGUgYXQgaXQsIHdvdWxkIHlvdSBtaW5kIGNo
YW5naW5nIHRoZSBjb21taXQgdGl0bGUgdG8Kc29tZXRoaW5nIG1vcmUgbWVhbmluZ2Z1bD8gImNs
ZWFudXAiIGlzIGEgYml0IHZhZ3VlIGFuZCBub3QgdmVyeQphY2N1cmF0ZS4gTWF5YmUgc29tZXRo
aW5nIGxpa2UgIkNvc21ldGljIGNoYW5nZSB0byB1c2UgbmZjIGluc3RlYWQgb2YKZm1jMiB3aGVy
ZSByZWxldmFudCIuCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
