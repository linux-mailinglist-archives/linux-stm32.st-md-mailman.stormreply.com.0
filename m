Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 398AF965B1
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 17:57:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E41E8C35E01;
	Tue, 20 Aug 2019 15:57:57 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C168C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a9C3b3G3nm77mUWP6d7nqP+nWBkTPiCKFDND/m1Vhew=; b=iKGQRF0yz5km72zavzs00QyYnf
 lJsAdyZOq5BJbu5UuS6NhRVnE2fIo9APYpeA7sO+5iEB9+zA0YrPOnMNoMCDc4cD5fFM5BCzDD1YA
 VWOUrz4/RXrtkyTeKqTMKHYX7//kPzVuXjFxB4CWDFGZmJ35INddfeS33W3i5sSyYPK0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1i06W0-0006rc-Py; Tue, 20 Aug 2019 17:57:44 +0200
Date: Tue, 20 Aug 2019 17:57:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <20190820155744.GN29991@lunn.ch>
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-4-megous@megous.com>
 <20190820153939.GL29991@lunn.ch>
 <20190820154714.2rt4ctovil5ol3u2@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820154714.2rt4ctovil5ol3u2@core.my.home>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Linux-stm32] [PATCH 3/6] net: stmmac: sun8i: Use
 devm_regulator_get for PHY regulator
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

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDU6NDc6MTRQTSArMDIwMCwgT25kxZllaiBKaXJtYW4g
d3JvdGU6Cj4gSGkgQW5kcmV3LAo+IAo+IE9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDA1OjM5OjM5
UE0gKzAyMDAsIEFuZHJldyBMdW5uIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQg
MDQ6NTM6NDBQTSArMDIwMCwgbWVnb3VzQG1lZ291cy5jb20gd3JvdGU6Cj4gPiA+IEZyb206IE9u
ZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+ID4gPiAKPiA+ID4gVXNlIGRldm1fcmVn
dWxhdG9yX2dldCBpbnN0ZWFkIG9mIGRldm1fcmVndWxhdG9yX2dldF9vcHRpb25hbCBhbmQgcmVs
eQo+ID4gPiBvbiBkdW1teSBzdXBwbHkuIFRoaXMgYXZvaWRzIE5VTEwgY2hlY2tzIGJlZm9yZSBy
ZWd1bGF0b3JfZW5hYmxlL2Rpc2FibGUKPiA+ID4gY2FsbHMuCj4gPiAKPiA+IEhpIE9uZHJlago+
ID4gCj4gPiBXaGF0IGRvIHlvdSBtZWFuIGJ5IGEgZHVtbXkgc3VwcGx5PyBJJ20ganVzdCB0cnlp
bmcgdG8gbWFrZSBzdXJlIHlvdQo+ID4gYXJlIG5vdCBicmVha2luZyBiYWNrd2FyZHMgY29tcGF0
aWJpbGl0eS4KPiAKPiBTb3JyeSwgSSBtZWFuIGR1bW15IHJlZ3VsYXRvci4gU2VlOgo+IAo+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9yZWd1
bGF0b3IvY29yZS5jI0wxODc0Cj4gCj4gT24gc3lzdGVtcyB0aGF0IHVzZSBEVCAoaS5lLiBoYXZl
X2Z1bGxfY29uc3RyYWludHMoKSA9PSB0cnVlKSwgd2hlbiB0aGUKPiByZWd1bGF0b3IgaXMgbm90
IGZvdW5kIChFTk9ERVYsIG5vdCBzcGVjaWZpZWQgaW4gRFQpLCByZWd1bGF0b3JfZ2V0IHdpbGwg
cmV0dXJuCj4gYSBmYWtlIGR1bW15IHJlZ3VsYXRvciB0aGF0IGNhbiBiZSBlbmFibGVkL2Rpc2Fi
bGVkLCBidXQgZG9lc24ndCBkbyBhbnl0aGluZwo+IHJlYWwuCgpIaSBPbmRyZWoKCkJ1dCB3ZSBh
bHNvIGdhaW4gYSBuZXcgd2FybmluZzoKCglkZXZfd2FybihkZXYsCgkJICIlcyBzdXBwbHkgJXMg
bm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3JcbiIsCgkgICAgICAgICBkZXZuYW1lLCBp
ZCk7CgpUaGlzIHJlZ3VsYXRvciBpcyBjbGVhcmx5IG9wdGlvbmFsLCBzbyB0aGVyZSBzaG91bGQg
bm90IGJlIGEgd2FybmluZy4KCk1heWJlIHlvdSBjYW4gYWRkIGEgbmV3IGdldF90eXBlLCBPUFRJ
T05BTF9HRVQsIHdoaWNoIGRvZXMgbm90IGlzc3VlCnRoZSB3YXJuaW5nLCBidXQgZG9lcyBnaXZl
IGJhY2sgYSBkdW1teSByZWd1bGF0b3IuCgpUaGFua3MKCUFuZHJldwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
