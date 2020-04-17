Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 152971AE15B
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 17:41:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFBF7C36B0D;
	Fri, 17 Apr 2020 15:41:45 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17EABC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 15:41:45 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0920E2A0613;
 Fri, 17 Apr 2020 16:41:43 +0100 (BST)
Date: Fri, 17 Apr 2020 17:41:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200417174140.00456f36@collabora.com>
In-Reply-To: <c69f86f4-5904-3f35-dac1-87080402a096@denx.de>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-4-git-send-email-christophe.kerello@st.com>
 <20200416215328.53982fef@collabora.com>
 <e4a21df4-b01b-1215-7a3b-fea94f099b8f@st.com>
 <c69f86f4-5904-3f35-dac1-87080402a096@denx.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 lee.jones@linaro.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 03/12] bus: stm32-fmc2-ebi: add STM32
 FMC2 EBI controller driver
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

T24gRnJpLCAxNyBBcHIgMjAyMCAxNzozMTo0OSArMDIwMApNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4gd3JvdGU6Cgo+IE9uIDQvMTcvMjAgNToyOSBQTSwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdy
b3RlOgo+ID4gCj4gPiAKPiA+IE9uIDQvMTYvMjAgOTo1MyBQTSwgQm9yaXMgQnJlemlsbG9uIHdy
b3RlOiAgCj4gPj4gT24gV2VkLCAxNSBBcHIgMjAyMCAxNzo1NzoyNyArMDIwMAo+ID4+IENocmlz
dG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGU6Cj4gPj4gIAo+
ID4+PiBUaGUgZHJpdmVyIGFkZHMgdGhlIHN1cHBvcnQgZm9yIHRoZSBTVE1pY3JvZWxlY3Ryb25p
Y3MgRk1DMiBFQkkKPiA+Pj4gY29udHJvbGxlcgo+ID4+PiBmb3VuZCBvbiBTVE0zMk1QIFNPQ3Mu
Cj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3Bo
ZS5rZXJlbGxvQHN0LmNvbT4KPiA+Pj4gVGVzdGVkLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4KPiA+Pj4gLS0tCj4gPj4+IENoYW5nZXMgaW4gdjI6Cj4gPj4+IMKgIC0gY2FsbCAyIEFQ
SXMgdG8gbWFuYWdlIEZNQzIgZW5hYmxlL2Rpc2FibGUgaW5zdGVhZCBvZiBvcHMKPiA+Pj4gwqAg
LSBjYWxsIDIgQVBJcyB0byBtYW5hZ2UgRk1DMiBOV0FJVCBzaGFyZWQgc2lnbmFsIGluc3RlYWQg
b2Ygb3BzCj4gPj4+Cj4gPj4+IMKgIGRyaXZlcnMvYnVzL0tjb25maWfCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgMTEgKwo+ID4+PiDCoCBkcml2ZXJzL2J1cy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKg
wqAgfMKgwqDCoCAxICsKPiA+Pj4gwqAgZHJpdmVycy9idXMvc3RtMzItZm1jMi1lYmkuYyB8IDEw
OTEKPiA+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrICAKPiA+
Pgo+ID4+IEhtLCBJIHNlZSB0aGF0IG90aGVyIG1lbW9yeSBidXMgY29udHJvbGxlciBkcml2ZXJz
IGFyZSBwbGFjZWQgdW5kZXIKPiA+PiBkcml2ZXJzL21lbW9yeS8sIGFueSByZWFzb24gZm9yIGNo
b29zaW5nIGRyaXZlcnMvYnVzLz8gSWYgdGhhdCdzIHdoZXJlCj4gPj4gd2Ugd2FudCB0byBoYXZl
IGFsbCBnZW5lcmljIG1lbW9yeSBidXMgY29udHJvbGxlcnMgdG8gbGl2ZSBpdCBtaWdodCBiZQo+
ID4+IHdvcnRoIG1vdmluZyBleGlzdGluZyBkcml2ZXJzIHRvIHRoZSBkcml2ZXJzL2J1cy8gZGly
ZWN0b3J5IGF0IHNvbWUKPiA+PiBwb2ludC4KPiA+PiAgCj4gPiAKPiA+IEhpIEJvcmlzLAo+ID4g
Cj4gPiBJIHNlZSB0aGlzIGNvbnRyb2xsZXIgYXMgYW4gZXh0ZXJuYWwgYnVzIGludGVyZmFjZSBh
cyB3ZSBhcmUgYWJsZSB0bwo+ID4gYXR0YWNoIGRpZmZlcmVudCBkZXZpY2VzIG9uIGl0LCBsaWtl
IGEgUFNSQU0sIGFuIGV0aGVybmV0IGNvbnRyb2xsZXIsIGEKPiA+IEZQR0EsIGEgTENEIGRpc3Bs
YXksIC4uLgo+ID4gCj4gPiBXaGVuIEkgaGFkIGEgbG9vayBhdCBidXMvS2NvbmZpZyBmaWxlLCBJ
IGhhdmUgZm91bmQgc2ltaWxhciBkcml2ZXJzCj4gPiAobGlrZSBJTVhfV0VJTSBvciBRQ09NX0VC
STIgZHJpdmVycykuIFRoZXNlIGRyaXZlcnMgYXJlIGFibGUgdG8gY29ubmVjdAo+ID4gZGV2aWNl
cyBsaWtlIE5BTkQgRmxhc2gsIFNSQU0sIGV0aGVybmV0IGFkYXB0ZXJzLCBGUEdBcyBhbmQgTENE
IGRpc3BsYXlzCj4gPiBhcyBpdCBpcyB3cml0dGVuIGluIHRoZSBLY29uZmlnIGZpbGUuCj4gPiAK
PiA+IEJ1dCwgYWZ0ZXIgY2hlY2tpbmcgbWVtb3J5L0tjb25maWcgZmlsZSwgaXQgaXMgYWxzbyBw
b3NzaWJsZSB0byBmaW5kCj4gPiBzaW1pbGFyIGRyaXZlcnMgKGxpa2UgQVRNRUxfRUJJIGRyaXZl
ciB0aGF0IGlzIGluc3BpcmVkIGJ5IHRoZSBXRUlNIGJ1cwo+ID4gZHJpdmVyKS4KPiA+IAo+ID4g
U28sIEkgd2lsbCBmb2xsb3cgdGhlIHJlY29tbWVuZGF0aW9uIGFuZCBJIHdpbGwgbW92ZSBpdCB0
bwo+ID4gZHJpdmVycy9tZW1vcnkgZm9sZGVyIGlmIGl0IGlzIHRoZSBwbGFjZSB3aGVyZSB0aGlz
IGRyaXZlciBzaG91bGQgYmUuICAKPiAKPiBUaGUgRUJJIGlzbid0IGEgbWVtb3J5IGJ1cywgeW91
IGNhbiB2ZXJ5IHdlbGwgaGF2ZSBhIG5vbi1tZW1vcnkgZGV2aWNlLAo+IGxpa2UgYW4gZXh0ZXJu
YWwgcGFyYWxsZWwgYnVzIG1lbW9yeSBjb250cm9sbGVyIG9uIGl0LiBTbyB3aHkgc2hvdWxkIGl0
Cj4gYmUgaW4gZHJpdmVycy9tZW1vcnkgPwoKSnVzdCBsaWtlIG1vc3Qgb2YgdGhvc2Ugc28tY2Fs
bGVkIG1lbW9yeSBidXMgY29udHJvbGxlcnMgd2UgaGF2ZSB1bmRlcgpkcml2ZXJzL21lbW9yeS8g
PT4gdGhleSBhcmUgbW9zdCBvZiB0aGUgdGltZSB1c2VkIHRvIGludGVyYWN0IHdpdGgKbWVtb3Jp
ZXMgYnV0IGNhbiBhbHNvIGJlIHVzZWQgZm9yIG90aGVyIHRoaW5ncyAoQ2hyaXN0b3BoZSBsaXN0
ZWQgYSBmZXcKdXNlcyBjYXNlcykuIEFuZCBJJ20gbm90IHB1c2hpbmcgb25lIHdheSBvciB0aGUg
b3RoZXIsIGFsbCBJIHNhaWQgd2FzCnRoYXQgd2Ugc2hvdWxkIG1ha2VzIHRoaW5ncyBjb25zaXN0
ZW50IGluc3RlYWQgb2YgaGF2aW5nIGhhbGYgb2YKdGhvc2UgY29udHJvbGxlciBkcml2ZXJzIGlu
IGRyaXZlcnMvbWVtb3J5LyBhbmQgdGhlIG90aGVyIGhhbGYgaW4KZHJpdmVycy9idXMvLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
