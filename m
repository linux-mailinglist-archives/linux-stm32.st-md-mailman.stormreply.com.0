Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8978B44884
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 23:31:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59147C36B2A;
	Thu,  4 Sep 2025 21:31:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 176B7C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 21:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6H1pSOS0tE8x4+w4j5sSTNSvLpOtXpis8kCsGfo1lcM=; b=KkMgZWe+XVf2JxNzPK4es8X5Pk
 08NY++duiwnRg15poUU2Xa53D+o5nE3vzxllBZdeJDRLTejJKchTMJIf3qjK5EyxV6ZpE1AZMFQR2
 UE2uvX8UmgWim2jW90temcr6HpOXtagXU9OIu3+sHOzxalUz5zBukXlR6r6H1zvPR+qfS4/waOn65
 Cm44rA5rJDq3iWf2cA6Fyv3Pz861y67zugaUaa6T+ZysZGg7YzULl5Mh4WcqmC0xWj3dR/fT0uffh
 tDEbUQc+fjqUV060l0CY6vBVs0P1i08ZCg04FpwjwQqJ13b8upZlbpdrUlgvX102c42IFL33cBIRk
 twajxq3A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35846)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uuHY7-000000002ZH-0ZPb;
 Thu, 04 Sep 2025 22:31:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uuHY2-000000001sE-2wEY; Thu, 04 Sep 2025 22:31:14 +0100
Date: Thu, 4 Sep 2025 22:31:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Message-ID: <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
 <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac:
 dwmac-renesas-gbeth: Use OF data for configuration
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

T24gVGh1LCBTZXAgMDQsIDIwMjUgYXQgMTA6MTA6MzJQTSArMDEwMCwgTGFkLCBQcmFiaGFrYXIg
d3JvdGU6Cj4gSGkgUnVzc2VsbCwKPiAKPiBPbiBUaHUsIFNlcCA0LCAyMDI1IGF0IDk6NDnigK9Q
TSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkKPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToK
PiA+Cj4gPiBPbiBUaHUsIFNlcCAwNCwgMjAyNSBhdCAwOTozOTo0OFBNICswMTAwLCBQcmFiaGFr
YXIgd3JvdGU6Cj4gPiA+ICAgICAgIHBsYXRfZGF0LT5pbml0ID0gcmVuZXNhc19nYmV0aF9pbml0
Owo+ID4gPiAgICAgICBwbGF0X2RhdC0+ZXhpdCA9IHJlbmVzYXNfZ2JldGhfZXhpdDsKPiA+ID4g
LSAgICAgcGxhdF9kYXQtPmZsYWdzIHw9IFNUTU1BQ19GTEFHX0hXVFNUQU1QX0NPUlJFQ1RfTEFU
RU5DWSB8Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBTVE1NQUNfRkxBR19FTl9UWF9M
UElfQ0xLX1BIWV9DQVAgfAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgU1RNTUFDX0ZM
QUdfU1BIX0RJU0FCTEU7Cj4gPiA+ICsgICAgIHBsYXRfZGF0LT5mbGFncyB8PSBnYmV0aC0+b2Zf
ZGF0YS0+c3RtbWFjX2ZsYWdzOwo+ID4KPiA+IFlvdSBpbmNsdWRlIHRoZSBmaXJzdCB0d28gZmxh
Z3MgaW4geW91ciBuZXcgZGV2aWNlLiBJIHdvdWxkIGxpa2UgdG8gc2VlCj4gPiBhdCBsZWFzdCBT
VE1NQUNfRkxBR19FTl9UWF9MUElfQ0xLX1BIWV9DQVAgYWx3YXlzIGJlaW5nIHNldC4gVGhlIG9u
bHkKPiA+IHJlYXNvbiB3ZSBoYXZlIHRoZSBTVE1NQUNfRkxBR19FTl9UWF9MUElfQ0xLX1BIWV9D
QVAgZmxhZyBpcyB0byBhdm9pZAo+ID4gY2hhbmdpbmcgZXhpc3RpbmcgYmVoYXZpb3VyIGFuZCBj
YXVzaW5nIHJlZ3Jlc3Npb25zLiBOZXcgc3R1ZmYgc2hvdWxkCj4gPiBhbHdheXMgc2V0IHRoaXMu
Cj4gPgo+IE1lIGNvbmZ1c2VkLCBTVE1NQUNfRkxBR19FTl9UWF9MUElfQ0xLX1BIWV9DQVAgZmxh
ZyBpcyBzZXQgaW4gdGhlIG5ldwo+IGRldmljZSBbMF0uIFRoZSByZWFzb24gU1RNTUFDX0ZMQUdf
U1BIX0RJU0FCTEUgZmxhZyBiZWluZyBkcm9wcGVkIGluCj4gdGhlIG5ldyBkZXZpY2UgaXMgU1BI
RU49MSBpbiBNQUMgSFcgZmVhdHVyZSByZWcgZm9yIHRoZSBuZXcgZGV2aWNlLgoKV2hhdCBJJ20g
c2F5aW5nIGlzIEknZCBsaWtlIHRvIHNlZToKCglwbGF0X2RhdC0+ZmxhZ3MgfD0gU1RNTUFDX0ZM
QUdfRU5fVFhfTFBJX0NMS19QSFlfQ0FQIHwKCQkJICAgZ2JldGgtPm9mX2RhdGEtPnN0bW1hY19m
bGFnczsKCmlvdywgaXQgaXMgc2V0IHVuY29uZGl0aW9uYWxseSwgZXZlbiBpZiBmb3Jnb3R0ZW4g
aW4gYSBmdXR1cmUgcGF0Y2guCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5h
cm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRv
d24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
