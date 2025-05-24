Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C8AC3008
	for <lists+linux-stm32@lfdr.de>; Sat, 24 May 2025 16:48:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36CBAC78F7B;
	Sat, 24 May 2025 14:48:49 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D178C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 May 2025 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=6j+A/wcAjjzOXucCcPrPqRyyoTRY9hnx7kS73VHwOW0=; b=Xm
 +Fntir9xBjM2MNWbSndaFmwEXhYF9USaPzzlIBnIdtYCNjV4ZIq9s5XoD2o1OaBJXNVmTu9z5TRMd
 DNKc6sxBSylhkLtYUeHzjykapObNfBt7gPISSXSgjjNCK2lIOsy/V1psSSVvUhRSOwIEWMD8OVuTi
 VWCCVcoaxKAAdTY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uIqAZ-00DglV-8h; Sat, 24 May 2025 16:48:15 +0200
Date: Sat, 24 May 2025 16:48:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhe <sensor1010@163.com>
Message-ID: <112fa3c4-908d-4e31-9288-b3a2949555b0@lunn.ch>
References: <20250523151521.3503-1-sensor1010@163.com>
 <d5325aba-507e-47b6-83fb-b9156c1f351e@lunn.ch>
 <2525c791.3415.197029d3705.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2525c791.3415.197029d3705.Coremail.sensor1010@163.com>
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

T24gU2F0LCBNYXkgMjQsIDIwMjUgYXQgMTA6MDU6NDdQTSArMDgwMCwgbGl6aGUgd3JvdGU6Cj4g
SGnvvIwgQW5lcmR3Cj4gVGhlIGZvbGxvd2luZyBpcyB0aGUgbG9naWMgZm9yIGNhbGxpbmcgdGhp
cyBmdW5jdGlvbu+8miAKPiAKPiAKPiBya19nbWFjX3Bvd2VydXAoKSB7Cj4gCj4gcmV0ID0gcGh5
X3Bvd2VyX29uKGJzcF9wcml2LCB0cnVlKTsgICAgICAvLyBoZXJlLgo+IAo+IGlmIChyZXQpIHsK
PiAKPiBnbWFjX2Nsa19lbmFibGUoYnNwX3ByaXYsIGZhbHNlKTsKPiAKPiByZXR1cm4gcmV0Owo+
IAo+IH0KPiAKPiB9CgpBaCwgdGhlcmUgaXMgc29tZXRoaW5nIGZ1bm55IHdpdGggeW91ciBwYXRj
aC4gTG9vayBhdCB0aGUgZGlmZjoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtcmsuYwppbmRleCA3MDA4NThmZjZmN2MuLjAzNmU0NWJlNTgyOCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYworKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCkBAIC0xNjQ4
LDcgKzE2NDgsNyBAQCAgc3RhdGljIGludCBnbWFjX2Nsa19lbmFibGUoc3RydWN0IHJrX3ByaXZf
ZGF0YSAqYnNwX3ByaXYsIGJvb2wgZW5hYmxlKQoKVGhpcyBsaW5lIHRlbGxzIHlvdSB3aGVyZSBp
biB0aGUgZmlsZSB5b3UgYXJlIHBhdGNoaW5nLCBhbmQgdGhlCmZ1bmN0aW9uIHRvIGJlIHBhdGNo
ZWQuIFRoaXMgaXMgd2hhdCBpIGxvb2tlZCBhdCwKZ21hY19jbGtfZW5hYmxlKCkuIEFuZCBnbWFj
X2Nsa19lbmFibGUoKSBoYXMgYSBzaW1pbGFyIHN0cnVjdHVyZSwgcmV0CmRlY2xhcmVkIGF0IHRo
ZSBiZWdpbm5pbmcsIHJldHVybiAwIGF0IHRoZSBlbmQuIEJ1dCB0aGUgb25seSB3YXkgdG8KdGhh
dCByZXR1cm4gMCBpcyB3aXRob3V0IGVycm9yLgoKQnV0IHBhdGNoIGlzIGFjdHVhbGx5IGZvcjoK
CiBzdGF0aWMgaW50IHBoeV9wb3dlcl9vbihzdHJ1Y3QgcmtfcHJpdl9kYXRhICpic3BfcHJpdiwg
Ym9vbCBlbmFibGUpCiB7CiAJc3RydWN0IHJlZ3VsYXRvciAqbGRvID0gYnNwX3ByaXYtPnJlZ3Vs
YXRvcjsKLQlpbnQgcmV0OworCWludCByZXQgPSAwOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZi
c3BfcHJpdi0+cGRldi0+ZGV2OwogCiAJaWYgKGVuYWJsZSkgewpAQCAtMTY2MSw3ICsxNjYxLDcg
QEAgIHN0YXRpYyBpbnQgcGh5X3Bvd2VyX29uKHN0cnVjdCBya19wcml2X2RhdGEgKmJzcF9wcml2
LCBib29sIGVuYWJsZSkKIAkJCWRldl9lcnIoZGV2LCAiZmFpbCB0byBkaXNhYmxlIHBoeS1zdXBw
bHlcbiIpOwogCX0KIAotCXJldHVybiAwOworCXJldHVybiByZXQ7CiB9CgpBbmQgYWdyZWUsIHRo
ZSBlcnJvciBjb2RlcyBhcmUgaWdub3JlZCBpbiBwaHlfcG93ZXJfb24oKS4KCkJ1dCBpIGhhdmUg
YSBmZXcgcXVlc3Rpb25zOgoKSG93IGRpZCB5b3UgZ2VuZXJhdGUgdGhpcyBkaWZmPyBUaGlzIGlz
IHRoZSBmaXJzdCB0aW1lIGkndmUgbWFkZSB0aGlzCm1pc3Rha2UsIGFzIGZhciBhcyBpIGtub3cu
IEkgdHJ1c3QgdGhlIGNvbnRleHQgaW5mb3JtYXRpb24gd2hlbgpyZXZpZXdpbmcgcGF0Y2hlcy4g
WWV0IGhlcmUgaXQgaXMgd3JvbmcuIFdoeT8gSXMgdGhpcyBhY3R1YWxseSBub3JtYWw/Ckkga25v
dyBkaWZmIGdldHMgaXQgd3JvbmcgZm9yIHB5dGhvbiwgaSBkb24ndCB0cnVzdCBpdCBhdCBhbGwg
d2l0aAp0aGF0IGxhbmd1YWdlLCBidXQgaSd2ZSBub3Qgbm90aWNlZCBzdWNoIHByb2JsZW1zIHdp
dGggQy4KCkRpZCB5b3UgbG9vayBhdCB0aGUgaGlzdG9yeSBvZiBwaHlfcG93ZXJfb24oKT8gSXQg
bG9va3MgcHJldHR5CmRlbGliZXJhdGUgaWdub3JpbmcgZXJyb3JzLiBNYXliZSB0aGVyZSBpcyBh
IHJlYXNvbiB3aHkgdGhpcyBoYXBwZW5zPwpnaXQgYmxhbWUgYW5kIGdpdCBsb2cgbWlnaHQgZXhw
bGFpbiB3aHkgaXQgaXMgbGlrZSB0aGlzLgoKCUFuZHJldwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
