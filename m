Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A5AC2773
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 18:20:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F06B6C7A82E;
	Fri, 23 May 2025 16:20:37 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAF39CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=FKSYcBDrAVeosFiXivZE6eLg3M7cJpM8m8qO+mm0CJw=; b=rR
 twtHAXcENvE9yW6v25dXUilX104IemQqVM7uHNhpLnfEdMBnz+GV0+AaooNJhCNj9WkBK/30N89v/
 zfdNuPB+qxeGf9ymvJWF5UGU9erpoRCQB+bxaE7CHJCeRq/EyzIArpOxfR7bdcI9JJtbTCTyQiqeW
 ekCkuM3pfbt1Liw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uIV81-00Dd47-36; Fri, 23 May 2025 18:20:13 +0200
Date: Fri, 23 May 2025 18:20:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5ZOy?= <sensor1010@163.com>
Message-ID: <d5325aba-507e-47b6-83fb-b9156c1f351e@lunn.ch>
References: <20250523151521.3503-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523151521.3503-1-sensor1010@163.com>
Cc: linux-kernel@vger.kernel.org, jonas@kwiboo.se, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, wens@csie.org, andrew+netdev@lunn.ch,
 edumazet@google.com, an.petrous@oss.nxp.com, u.kleine-koenig@baylibre.com,
 mcoquelin.stm32@gmail.com, david.wu@rock-chips.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: dwmac-rk: MAC clock should be truned
	off
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMDg6MTU6MjFBTSAtMDcwMCwg5p2O5ZOyIHdyb3RlOgo+
IGlmIFBIWSBwb3dlci1vbiBmYWlscywgY2xvY2thc3NvY2lhdGVkIHRoZSBNQUMgc2hvdWxkCj4g
YmUgZGlzYWJsZWQgZHVyaW5nIHRoZSBNQUMgaW5pdGlhbGl6YXRpb24gcHJvY2VzcwoKVGhlIFN1
YmplY3Q6IGxpbmUgaGFzIGEgdHlwby4KCj4gU2lnbmVkLW9mZi1ieTog5p2O5ZOyIDxzZW5zb3Ix
MDEwQDE2My5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLXJrLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtcmsuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLXJrLmMKPiBpbmRleCA3MDA4NThmZjZmN2MuLjAzNmU0NWJlNTgyOCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4g
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+IEBA
IC0xNjQ4LDcgKzE2NDgsNyBAQCBzdGF0aWMgaW50IGdtYWNfY2xrX2VuYWJsZShzdHJ1Y3Qgcmtf
cHJpdl9kYXRhICpic3BfcHJpdiwgYm9vbCBlbmFibGUpCj4gIHN0YXRpYyBpbnQgcGh5X3Bvd2Vy
X29uKHN0cnVjdCBya19wcml2X2RhdGEgKmJzcF9wcml2LCBib29sIGVuYWJsZSkKPiAgewo+ICAJ
c3RydWN0IHJlZ3VsYXRvciAqbGRvID0gYnNwX3ByaXYtPnJlZ3VsYXRvcjsKPiAtCWludCByZXQ7
Cj4gKwlpbnQgcmV0ID0gMDsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZic3BfcHJpdi0+cGRl
di0+ZGV2Owo+ICAKPiAgCWlmIChlbmFibGUpIHsKPiBAQCAtMTY2MSw3ICsxNjYxLDcgQEAgc3Rh
dGljIGludCBwaHlfcG93ZXJfb24oc3RydWN0IHJrX3ByaXZfZGF0YSAqYnNwX3ByaXYsIGJvb2wg
ZW5hYmxlKQo+ICAJCQlkZXZfZXJyKGRldiwgImZhaWwgdG8gZGlzYWJsZSBwaHktc3VwcGx5XG4i
KTsKPiAgCX0KPiAgCj4gLQlyZXR1cm4gMDsKPiArCXJldHVybiByZXQ7CgpUaGlzIGRvZXMgbm90
IG1ha2UgbXVjaCBzZW5zZSB0byBtZS4gSG93IGRvIHlvdSBnZXQgaGVyZSB3aXRoIHJldCBub3QK
YmVpbmcgMD8KCiAgICBBbmRyZXcKCi0tLQpwdy1ib3Q6IGNyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
