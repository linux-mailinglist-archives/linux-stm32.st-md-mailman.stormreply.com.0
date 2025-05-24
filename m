Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA28AC312A
	for <lists+linux-stm32@lfdr.de>; Sat, 24 May 2025 21:34:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5BE2C7801E;
	Sat, 24 May 2025 19:34:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FD93C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 May 2025 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FDzdnEi5TtcfKfjBkwBIU4/mQNamhC7e6P0CVNdVIJw=; b=HAt5yaoD8r1RszUzBbuF8pC43r
 6oAm8q6za/9fBu8kLaJV/wfUo1mDL9YbJN24T8ehAhOcgv1KvAaRQq9qcls3V1pNhtZ72ypqO4huO
 T+JQFwB3s23BdF/KqtFLnIcdJhDEQaW72xPKwVhW9bzjbdBXXhj6+O9gLx3mhZhQssUdBJlPvvZS/
 xK+2bfiQ7CXjruJHi0FeyQqKd9ki4wveUOyeKQxlMug29Mdri9yyYxhwAgn+ri1g5FNf9H9oZeSt4
 2awXIc4zwtCH2Mt8RLAF6Sd+a134GkvAA/diZAqtSuBDgq65VDnu1BgJ3SjjO/IWyg3/LWvWJgIgE
 QekY3i3g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59090)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uIudU-0005Al-17;
 Sat, 24 May 2025 20:34:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uIudJ-00075J-2Z;
 Sat, 24 May 2025 20:34:13 +0100
Date: Sat, 24 May 2025 20:34:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aDIfNZtSwZ1HwW2l@shell.armlinux.org.uk>
References: <20250523151521.3503-1-sensor1010@163.com>
 <d5325aba-507e-47b6-83fb-b9156c1f351e@lunn.ch>
 <2525c791.3415.197029d3705.Coremail.sensor1010@163.com>
 <112fa3c4-908d-4e31-9288-b3a2949555b0@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <112fa3c4-908d-4e31-9288-b3a2949555b0@lunn.ch>
Cc: linux-kernel@vger.kernel.org, jonas@kwiboo.se, lizhe <sensor1010@163.com>,
 linux-stm32@st-md-mailman.stormreply.com, wens@csie.org, andrew+netdev@lunn.ch,
 edumazet@google.com, an.petrous@oss.nxp.com, u.kleine-koenig@baylibre.com,
 mcoquelin.stm32@gmail.com, david.wu@rock-chips.com, kuba@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
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

T24gU2F0LCBNYXkgMjQsIDIwMjUgYXQgMDQ6NDg6MTVQTSArMDIwMCwgQW5kcmV3IEx1bm4gd3Jv
dGU6Cj4gT24gU2F0LCBNYXkgMjQsIDIwMjUgYXQgMTA6MDU6NDdQTSArMDgwMCwgbGl6aGUgd3Jv
dGU6Cj4gPiBIae+8jCBBbmVyZHcKPiA+IFRoZSBmb2xsb3dpbmcgaXMgdGhlIGxvZ2ljIGZvciBj
YWxsaW5nIHRoaXMgZnVuY3Rpb27vvJogCj4gPiAKPiA+IAo+ID4gcmtfZ21hY19wb3dlcnVwKCkg
ewo+ID4gCj4gPiByZXQgPSBwaHlfcG93ZXJfb24oYnNwX3ByaXYsIHRydWUpOyAgICAgIC8vIGhl
cmUuCj4gPiAKPiA+IGlmIChyZXQpIHsKPiA+IAo+ID4gZ21hY19jbGtfZW5hYmxlKGJzcF9wcml2
LCBmYWxzZSk7Cj4gPiAKPiA+IHJldHVybiByZXQ7Cj4gPiAKPiA+IH0KPiA+IAo+ID4gfQo+IAo+
IEFoLCB0aGVyZSBpcyBzb21ldGhpbmcgZnVubnkgd2l0aCB5b3VyIHBhdGNoLiBMb29rIGF0IHRo
ZSBkaWZmOgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1yay5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtcmsuYwo+IGluZGV4IDcwMDg1OGZmNmY3Yy4uMDM2ZTQ1YmU1ODI4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4gQEAgLTE2NDgs
NyArMTY0OCw3IEBAICBzdGF0aWMgaW50IGdtYWNfY2xrX2VuYWJsZShzdHJ1Y3QgcmtfcHJpdl9k
YXRhICpic3BfcHJpdiwgYm9vbCBlbmFibGUpCj4gCj4gVGhpcyBsaW5lIHRlbGxzIHlvdSB3aGVy
ZSBpbiB0aGUgZmlsZSB5b3UgYXJlIHBhdGNoaW5nLCBhbmQgdGhlCj4gZnVuY3Rpb24gdG8gYmUg
cGF0Y2hlZC4gVGhpcyBpcyB3aGF0IGkgbG9va2VkIGF0LAo+IGdtYWNfY2xrX2VuYWJsZSgpLiBB
bmQgZ21hY19jbGtfZW5hYmxlKCkgaGFzIGEgc2ltaWxhciBzdHJ1Y3R1cmUsIHJldAo+IGRlY2xh
cmVkIGF0IHRoZSBiZWdpbm5pbmcsIHJldHVybiAwIGF0IHRoZSBlbmQuIEJ1dCB0aGUgb25seSB3
YXkgdG8KPiB0aGF0IHJldHVybiAwIGlzIHdpdGhvdXQgZXJyb3IuCj4gCj4gQnV0IHBhdGNoIGlz
IGFjdHVhbGx5IGZvcjoKPiAKPiAgc3RhdGljIGludCBwaHlfcG93ZXJfb24oc3RydWN0IHJrX3By
aXZfZGF0YSAqYnNwX3ByaXYsIGJvb2wgZW5hYmxlKQoKQW5kcmV3LCB0aGlzIGlzIG5vdCBhIHBy
b2JsZW0uIFRoaXMgaXMgaG93IGRpZmZzIHdvcmsuIElmIHRoZSBmdW5jdGlvbgpoYXNuJ3QgYWN0
dWFsbHkgc3RhcnRlZCBhdCB0aGUgcG9pbnQgdGhlIGNvbnRleHQgc3RhcnRzLCB0aGVuIHRoZQpw
cmV2aW91cyBmdW5jdGlvbiB3aWxsIGFwcGVhciBpbiB0aGUgY29tbWVudCBhZnRlciB0aGUgbGlu
ZSBudW1iZXJzLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgu
b3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJw
cyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
