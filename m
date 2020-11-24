Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5D2C3040
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 19:56:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81208C56630;
	Tue, 24 Nov 2020 18:56:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2C40C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 18:56:56 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 585E2208B8;
 Tue, 24 Nov 2020 18:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606244215;
 bh=9EeXvYxhc+xygm951jAEsP8Q6mZuaqaa24L32cHPcPc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VJZaXlBJHkMCoewgWb8aXdZ1RrA1dJX7Zg1ZTsrOfUsQXQhXL/f+tq6i/n3Xv+sDy
 yhlkpL7F/7iM2hyfE1vn+ugehJ4gaLx95i8+BaYcWglq9PM9Pno+w8Z6pmM87NokLY
 hXLVqiFYs6LQnVhEyu8qqbSkssb9l82omiO/pxwk=
Date: Tue, 24 Nov 2020 10:56:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20201124105653.40426fe7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <4a53794f1a0cea5eb009fce0b4b4c4846771f8be.camel@st.com>
References: <20191007154306.95827-1-antonio.borneo@st.com>
 <20191007154306.95827-5-antonio.borneo@st.com>
 <20191009152618.33b45c2d@cakuba.netronome.com>
 <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
 <e2b2b623700401538fe91e70495c348c08b5d2e3.camel@st.com>
 <20201124102022.1a6e6085@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <4a53794f1a0cea5eb009fce0b4b4c4846771f8be.camel@st.com>
MIME-Version: 1.0
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, has <has@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add flexible PPS to dwmac
	4.10a
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

T24gVHVlLCAyNCBOb3YgMjAyMCAxOToyNzowMyArMDEwMCBBbnRvbmlvIEJvcm5lbyB3cm90ZToK
PiBPbiBUdWUsIDIwMjAtMTEtMjQgYXQgMTA6MjAgLTA4MDAsIEpha3ViIEtpY2luc2tpIHdyb3Rl
Ogo+ID4gT24gVHVlLCAyNCBOb3YgMjAyMCAxNToyMzoyNyArMDEwMCBBbnRvbmlvIEJvcm5lbyB3
cm90ZTogIAo+ID4gPiBPbiBUdWUsIDIwMjAtMTEtMjQgYXQgMTU6MTUgKzAxMDAsIEFobWFkIEZh
dG91bSB3cm90ZTogIAo+ID4gPiA+IE9uIDEwLjEwLjE5IDAwOjI2LCBKYWt1YiBLaWNpbnNraSB3
cm90ZTogICAgCj4gPiA+ID4gPiBPbiBNb24sIDcgT2N0IDIwMTkgMTc6NDM6MDYgKzAyMDAsIEFu
dG9uaW8gQm9ybmVvIHdyb3RlOiAgICAKPiA+ID4gPiA+ID4gQWxsIHRoZSByZWdpc3RlcnMgYW5k
IHRoZSBmdW5jdGlvbmFsaXRpZXMgdXNlZCBpbiB0aGUgY2FsbGJhY2sKPiA+ID4gPiA+ID4gZHdt
YWM1X2ZsZXhfcHBzX2NvbmZpZygpIGFyZSBjb21tb24gYmV0d2VlbiBkd21hYyA0LjEwYSBbMV0g
YW5kCj4gPiA+ID4gPiA+IDUuMDBhIFsyXS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFJldXNl
IHRoZSBzYW1lIGNhbGxiYWNrIGZvciBkd21hYyA0LjEwYSB0b28uCj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiBUZXN0ZWQgb24gU1RNMzJNUDE1eCwgYmFzZWQgb24gZHdtYWMgNC4xMGEuCj4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiBbMV0gRFdDIEV0aGVybmV0IFFvUyBEYXRhYm9vayA0LjEwYSBP
Y3RvYmVyIDIwMTQKPiA+ID4gPiA+ID4gWzJdIERXQyBFdGhlcm5ldCBRb1MgRGF0YWJvb2sgNS4w
MGEgU2VwdGVtYmVyIDIwMTcKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0BzdC5jb20+ICAgIAo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBBcHBsaWVkIHRvIG5ldC1uZXh0LiAgICAKPiA+ID4gPiAKPiA+ID4gPiBUaGlzIHBh
dGNoIHNlZW1zIHRvIGhhdmUgYmVlbiBmdXp6aWx5IGFwcGxpZWQgYXQgdGhlIHdyb25nIGxvY2F0
aW9uLgo+ID4gPiA+IFRoZSBkaWZmIGRlc2NyaWJlcyBleHRlbnNpb24gb2YgZHdtYWMgNC4xMGEg
YW5kIHNvIGRvZXMgdGhlIEBAIGxpbmU6Cj4gPiA+ID4gCj4gPiA+ID4gwqDCoEBAIC04NjQsNiAr
ODY0LDcgQEAgY29uc3Qgc3RydWN0IHN0bW1hY19vcHMgZHdtYWM0MTBfb3BzID0gewo+ID4gPiA+
IAo+ID4gPiA+IFRoZSBwYXRjaCB3YXMgYXBwbGllZCBtYWlubGluZSBhcyA3NTc5MjYyNDc4MzYg
KCJuZXQ6IHN0bW1hYzogYWRkCj4gPiA+ID4gZmxleGlibGUgUFBTIHRvIGR3bWFjIDQuMTBhIiks
IGJ1dCBpdCBleHRlbmRzIGR3bWFjNF9vcHMgaW5zdGVhZDoKPiA+ID4gPiAKPiA+ID4gPiDCoMKg
QEAgLTkzOCw2ICs5MzgsNyBAQCBjb25zdCBzdHJ1Y3Qgc3RtbWFjX29wcyBkd21hYzRfb3BzID0g
ewo+ID4gPiA+IAo+ID4gPiA+IEkgZG9uJ3Qga25vdyBpZiBkd21hYzQgYWN0dWFsbHkgc3VwcG9y
dHMgRmxleFBQUywgc28gSSB0aGluayBpdCdzCj4gPiA+ID4gYmV0dGVyIHRvIGJlIG9uIHRoZSBz
YWZlIHNpZGUgYW5kIHJldmVydCA3NTc5MjYyNDc4MzYgYW5kIGFkZCB0aGUKPiA+ID4gPiBjaGFu
Z2UgZm9yIHRoZSBjb3JyZWN0IHZhcmlhbnQuICAgIAo+ID4gPiAKPiA+ID4gQWdyZWUsCj4gPiA+
IHRoZSBwYXRjaCBnZXQgYXBwbGllZCB0byB0aGUgd3JvbmcgcGxhY2UhICAKPiA+IAo+ID4gOi1v
Cj4gPiAKPiA+IFRoaXMgaGFwcGVucyBzb21ldGltZXMgd2l0aCBzdGFibGUgYmFja3BvcnRzIGJ1
dCBJJ3ZlIG5ldmVyIHNlZW4gaXQKPiA+IGhhcHBlbiB3b3JraW5nIG9uICJjdXJyZW50IiBicmFu
Y2hlcy4KPiA+IAo+ID4gU29ycnkgYWJvdXQgdGhhdCEKPiA+IAo+ID4gV291bGQgeW91IG1pbmQg
c2VuZGluZyB0aGUgYXBwcm9wcmlhdGUgcGF0Y2hlcz8gSSBjYW4gZG8gdGhlIHJldmVydCBpZgo+
ID4geW91IHByZWZlciwgYnV0IHNpbmNlIHlvdSBuZWVkIHRvIHNlbmQgdGhlIGZpeCBhbnl3YXku
LiAgCj4gCj4gWW91IG1lYW4gc2VuZGluZyB0d28gcGF0Y2hlcyBvbmUgZm9yIHJldmVydCBhbmQg
b25lIHRvIHJlLWFwcGx5IHRoZSBjb2RlPwo+IE9yIGEgc2luZ2xlIHBhdGNoIGZvciB0aGUgZml4
PwoKRWl0aGVyIHdheSBpcyBmaW5lIGJ5IG1lLiBJZiBJIHdhcyBkb2luZyBpdCAtIEknZCBwcm9i
YWJseSBzZW5kIGp1c3Qgb25lCnBhdGNoLCBidXQgaWYgeW91IHByZWZlciB0byByZXZlcnQgZmly
c3QgLSBub3RoaW5nIHdyb25nIHdpdGggdGhhdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
