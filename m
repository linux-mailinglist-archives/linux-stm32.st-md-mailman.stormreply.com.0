Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7873FAC433A
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 19:05:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 255A5C36B0F;
	Mon, 26 May 2025 17:05:35 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A74A5C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=ioFZifM8dRn5AWzFoATN3MruIDugkGoasnnViHSdO4U=; b=Xo
 UVqXbDL5alO3ZRLdDwEsTqGkuUqfngzF3nvIPtjcGk64MlCq1PrAgzorqFFgRmkQiKcYOWOq+F9v+
 ciFpZNU1tQJNrb87mAtHPoAgDUVNViOZiyJsZ1wzXvyKB5jZ9Gn4mOqigWuKnuzzpyxAfQtT7WzQM
 tjqlmt2Gnp+lw+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uJbG8-00E117-QC; Mon, 26 May 2025 19:05:08 +0200
Date: Mon, 26 May 2025 19:05:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5ZOy?= <sensor1010@163.com>
Message-ID: <e178677c-c8aa-462b-8d12-e0b4b8b6c7b7@lunn.ch>
References: <20250526161621.3549-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526161621.3549-1-sensor1010@163.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 jonas@kwiboo.se, netdev@vger.kernel.org, jan.petrous@oss.nxp.com,
 wens@csie.org, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, david.wu@rock-chips.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: dwmac-rk: No need to check the
 return value of the phy_power_on()
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

T24gTW9uLCBNYXkgMjYsIDIwMjUgYXQgMDk6MTY6MjFBTSAtMDcwMCwg5p2O5ZOyIHdyb3RlOgo+
IHNpbmNlIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIHBoeV9wb3dlcl9vbigpIGZ1bmN0aW9uIGlz
IGFsd2F5cyAwLAo+IGNoZWNraW5nIGl0cyByZXR1cm4gdmFsdWUgaXMgcmVkdW5kYW50Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IOadjuWTsiA8c2Vuc29yMTAxMEAxNjMuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIHwgNiArLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+IGluZGV4IDcw
MDg1OGZmNmY3Yy4uNmU4YjEwZmRhMjRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4gQEAgLTE4MzksMTEgKzE4MzksNyBAQCBzdGF0
aWMgaW50IHJrX2dtYWNfcG93ZXJ1cChzdHJ1Y3QgcmtfcHJpdl9kYXRhICpic3BfcHJpdikKPiAg
CQlkZXZfZXJyKGRldiwgIk5PIGludGVyZmFjZSBkZWZpbmVkIVxuIik7Cj4gIAl9Cj4gIAo+IC0J
cmV0ID0gcGh5X3Bvd2VyX29uKGJzcF9wcml2LCB0cnVlKTsKPiAtCWlmIChyZXQpIHsKPiAtCQln
bWFjX2Nsa19lbmFibGUoYnNwX3ByaXYsIGZhbHNlKTsKPiAtCQlyZXR1cm4gcmV0Owo+IC0JfQo+
ICsJcGh5X3Bvd2VyX29uKGJzcF9wcml2LCB0cnVlKTsKCkkgc3VnZ2VzdCB5b3UgZ28gb25lIHN0
ZXAgZnVydGhlciBhbmQgdHVybiBwaHlfcG93ZXJfb24oKSBpbnRvIGEgdm9pZApmdW5jdGlvbi4K
Cm5ldC1uZXh0IGlzIGNsb3NlZCBmb3IgdGhlIG5leHQgdHdvIHdlZWsgZHVlIHRvIHRoZSBtZXJn
ZSB3aW5kb3cuCgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
