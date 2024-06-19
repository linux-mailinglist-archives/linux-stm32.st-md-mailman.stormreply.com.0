Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847190F72C
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 21:51:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E76A4C5E2D0;
	Wed, 19 Jun 2024 19:51:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC33AC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=WnQdVdsbldNc+VO+2ej+8Ij/CjLH8t7u+69BlHcBJow=; b=wy
 kRAKO9vKrjnz8H1Qso+72FuS2LpcBjC3qXjri4XnQgfwKy/G8smmugzkf+RXMAcXgQZCrs2u9Mvmk
 GwDQH0IGVU3G0YetnxedN1jDAMkm8bsWJ7k4ycQCar76oRoOPFldxO8oVV1Y9chzE4GkHBELRTBiM
 Xb4aDyh7xSFGETo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sK1Kq-000VKf-O5; Wed, 19 Jun 2024 21:51:12 +0200
Date: Wed, 19 Jun 2024 21:51:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <160b9abd-3972-449d-906d-71d12b2a0aeb@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-2-brgl@bgdev.pl>
 <bedd74cb-ee1e-4f8d-86ee-021e5964f6e5@lunn.ch>
 <CAMRc=MeCcrvid=+KG-6Pe5_-u21PBJDdNCChVrib8zT+FUfPJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MeCcrvid=+KG-6Pe5_-u21PBJDdNCChVrib8zT+FUfPJw@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/8] net: phy: add support for
	overclocked SGMII
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgMDk6Mjk6MDNQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCA5OjA54oCvUE0gQW5kcmV3IEx1
bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBh
dCAwODo0NTo0MlBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiBGcm9t
OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4g
PiA+Cj4gPiA+IFRoZSBBcXVhbnRpYSBBUVIxMTVDIFBIWSBzdXBwb3J0cyB0aGUgT3ZlcmxvY2tl
ZCBTR01JSSBtb2RlLiBJbiBvcmRlciB0bwo+ID4gPiBzdXBwb3J0IGl0IGluIHRoZSBkcml2ZXIs
IGV4dGVuZCB0aGUgUEhZIGNvcmUgd2l0aCB0aGUgbmV3IG1vZGUgYml0cyBhbmQKPiA+ID4gcGll
Y2VzLgo+ID4KPiA+IEhlcmUgd2UgZ28gYWdhaW4uLi4uCj4gPgo+IAo+IEFkbWl0dGVkbHkgSSBk
b24ndCBwb3N0IHRvIG5ldCB2ZXJ5IG9mdGVuIGFuZCBJIGFzc3VtZSB0aGVyZSdzIGEgc3RvcnkK
PiB0byB0aGlzIGNvbW1lbnQ/IENhcmUgdG8gZWxhYm9yYXRlPwoKMi41RyBpcyBhIG1lc3MgYmVj
YXVzZSB2ZW5kb3JzIGltcGxlbWVudGVkIGl0IGJlZm9yZSB0aGUgc3RhbmRhcmQgY2FtZQpvdXQs
IGluIHRoZSBmb3JtIG9mIDI1MDBCYXNlWC4gVGhleSBvZnRlbiBkaWQganVzdCB3aGF0IHRoaXMg
c2VlbXMgdG8Kc3VnZ2VzdCwgdGhleSBvdmVyY2xvY2tlZCBDSVNDTyBTR01JSS4gIEJ1dCB0aGUg
aW4tYmFuZCBzaWduYWxsaW5nClNHTUlJIHVzZXMgY2Fubm90IHdvcmsgYXQgMi41RywgaXQgbWFr
ZXMgbm8gc2Vuc2UuIFNvIHZlbmRvcnMgZGlzYWJsZQp0aGUgaW4tYmFuZCBzaWduYWxsaW5nLgoK
V2hhdCB5b3UgbGlrZWx5IGVuZCB1cCB3aXRoLCBpcyAyNTAwQmFzZVgsIGJ1dCB3aXRob3V0IGlu
LWJhbmQKc2lnbmFsbGluZy4KCk5vdywgc29tZSByZWFsIDI1MDBCYXNlWCBkZXZpY2VzIHJlcXVp
cmUgdGhlIHBlZXIgdG8gcGVyZm9ybSBpbi1iYW5kCnNpZ25hbGxpbmcuIFNvbWUgd2lsbCBsaXN0
ZW4gZm9yIHRoZSBzaWduYWxsaW5nIGEgd2hpbGUsIGFuZCBpZiB0aGV5CmhlYXIgbm90aGluZyB3
aWxsIGdvIGludG8gc29tZSBzb3J0IG9mIGZhbGxiYWNrIG1vZGUuIE90aGVycyBjYW4gYmUKdG9s
ZCB0aGUgcGVlciBkb2VzIG5vdCBzdXBwb3J0IGluYmFuZCBzaWduYWxsaW5nLCBhbmQgc28gZG9u
J3QgZXhwZWN0Cml0LgoKQW5kIHRoZW4gd2UgaGF2ZSB0aG9zZSB3aGljaCBhcmUgb3ZlcmNsb2Nr
ZWQgU0dNSUkgd2hpY2ggZG9uJ3QgZXhwZWN0CmFueSBzaWduYWxsaW5nIGJlY2F1c2UgU0dNSUkg
c2lnbmFsbGluZyBtYWtlcyBubyBzZW5zZSBhdCAyLjVHLgoKcGh5bGliIHN1cHBvcnRzIG91dCBv
ZiBiYW5kIHNpZ25hbGxpbmcsIHdoaWNoIGlzIGVub3VnaCB0byBtYWtlIHRoaXMKd29yaywgc28g
bG9uZyBhcyB0d28gcGVlcnMgd2lsbCBhY3R1YWxseSBlc3RhYmxpc2ggYSBsaW5rIGJlY2F1c2Ug
dGhleQphcmUgc3VmZmljaWVudGx5IHRvbGVyYW50IG9mIHdoYXQgdGhlIG90aGVyIGVuZCBpcyBk
b2luZy4gU29tZXRpbWVzCnRoZXkgbmVlZCBhIGhpbnQuIFJ1c3NlbGwgS2luZyBoYXMgYmVlbiB3
b3JraW5nIG9uIHRoaXMgbWVzcywgYW5kIGknbQpzdXJlIGhlIHdpbGwgYmUgYWxvbmcgc29vbi4K
CldoYXQgaSBleHBlY3Qgd2lsbCBoYXBwZW4gaXMgeW91IGtlZXAgY2FsbGluZyB0aGlzIDI1MDBC
YXNlWCwgd2l0aG91dAppbiBiYW5kIHNpZ25hbGxpbmcuIFlvdSBjYW4gbG9vayBiYWNrIGluIHRo
ZSBuZXRkZXYgbWFpbGxpbmcgbGlzdCBmb3IKbW9yZSBkZXRhaWxzIGFuZCB0aG9zZSB0aGF0IGhh
dmUgYmVlbiBoZXJlIGJlZm9yZSB5b3UuIEl0IGlzIGFsd2F5cwpnb29kIHRvIHNlYXJjaCB0aGUg
aGlzdG9yeSwgb3RoZXJ3aXNlIHlvdSBhcmUganVzdCBnb2luZyB0byByZXBlYXQgaXQuCgogICBB
bmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
