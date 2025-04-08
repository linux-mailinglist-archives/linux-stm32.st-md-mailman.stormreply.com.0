Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FE0A813A0
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 19:28:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 092F3C78F75;
	Tue,  8 Apr 2025 17:28:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD819C7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y8RWM2V6ZnehV9xCG2Wi7D3YFpwSdHlPKuNFJkQ/bqQ=; b=Gug+5dJkFQ2rbCZ5IXZX4osrkc
 z4jCLXuY8M+Deo7TGvO4X3azXzNOY81Pym6BE1wRVtlX0j1A55PWe5bI2sC3crPMPxHw1CeStLy2o
 /V0QKXahJUMiiC0QA75pZ0B71CSfo3v561yu0Dz00hSkJbrLJPo2YlqRoNq7PJUrXxcRgH84YKKRU
 OmVjnaBReXWpYspNTe4XnqnxjIhTFm+dq6EUTbPorz00lCBHEMhGAjD6JCR7I3D0tHI4klOBUjGmX
 WZfuxE+cKAVpE7S62ePuI4c2mcHsgReKBCz99EZlrG7OMoPEVQAv2csuoYJ61Ua+C90ZhC8XailZA
 nZx7znGQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51470)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u2Cjb-0007pu-0I;
 Tue, 08 Apr 2025 18:27:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u2CjV-0001bg-19;
 Tue, 08 Apr 2025 18:27:33 +0100
Date: Tue, 8 Apr 2025 18:27:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Message-ID: <Z_VchfzoKOTvy5TQ@shell.armlinux.org.uk>
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
 <20250408075047.69d031a9@kernel.org>
 <08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, UNGLinuxDriver@microchip.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>,
 linux-doc@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Robert Hancock <robert.hancock@calian.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, upstream@airoha.com,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v2 00/14] Add PCS core support
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

T24gVHVlLCBBcHIgMDgsIDIwMjUgYXQgMTE6MzA6NDNBTSAtMDQwMCwgU2VhbiBBbmRlcnNvbiB3
cm90ZToKPiBPbiA0LzgvMjUgMTA6NTAsIEpha3ViIEtpY2luc2tpIHdyb3RlOgo+ID4gT24gTW9u
LCAgNyBBcHIgMjAyNSAxOToxNzozMSAtMDQwMCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+ID4+IFRo
aXMgc2VyaWVzIGRlcGVuZHMgb24gWzEsMl0sIGFuZCB0aGV5IGhhdmUgYmVlbiBpbmNsdWRlZCBh
dCB0aGUKPiA+PiBiZWdpbm5pbmcgc28gQ0kgd2lsbCBydW4uIEhvd2V2ZXIsIEkgZXhwZWN0IHRo
ZW0gdG8gYmUgcmV2aWV3ZWQvYXBwbGllZAo+ID4+IG91dHNpZGUgdGhlIG5ldC1uZXh0IHRyZWUu
Cj4gPiAKPiA+IFRoZXNlIGFwcGVhciB0byBicmVhayB0aGUgYnVpbGQ6Cj4gPiAKPiA+IGRyaXZl
cnMvYWNwaS9wcm9wZXJ0eS5jOjE2Njk6Mzk6IGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiDigJhp
bnQgKCopKGNvbnN0IHN0cnVjdCBmd25vZGVfaGFuZGxlICosIGNvbnN0IGNoYXIgKiwgY29uc3Qg
Y2hhciAqLCBpbnQsICB1bnNpZ25lZCBpbnQsICBzdHJ1Y3QgZndub2RlX3JlZmVyZW5jZV9hcmdz
ICop4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSDigJhpbnQgKCopKGNvbnN0IHN0
cnVjdCBmd25vZGVfaGFuZGxlICosIGNvbnN0IGNoYXIgKiwgY29uc3QgY2hhciAqLCB1bnNpZ25l
ZCBpbnQsICB1bnNpZ25lZCBpbnQsICBzdHJ1Y3QgZndub2RlX3JlZmVyZW5jZV9hcmdzICop4oCZ
IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+ID4gIDE2NjkgfCAgICAgICAgICAgICAg
ICAgLmdldF9yZWZlcmVuY2VfYXJncyA9IGFjcGlfZndub2RlX2dldF9yZWZlcmVuY2VfYXJncywg
ICBcCj4gPiAKPiA+IENvdWxkIHlvdSBwb3N0IGFzIFJGQyB1bnRpbCB3ZSBjYW4gYWN0dWFsbHkg
bWVyZ2UgdGhpcz8gSSdtIHdvcnJpZWQgCj4gPiBzb21lIHNsZWVwIGRlcHJpdmVkIG1haW50YWlu
ZXIgbWF5IG1pc3MgdGhlIG5vdGUgaW4gdGhlIGNvdmVyIGxldHRlcgo+ID4gYW5kIGp1c3QgYXBw
bHkgaXQgYWxsIHRvIG5ldC1uZXh0Li4KPiAKPiBJIHdvdWxkIHJlYWxseSBsaWtlIHRvIGtlZXAg
UkZDIG9mZiB0aGUgdGl0bGVzIHNpbmNlIHNvbWUgcmV2aWV3ZXJzIGRvbid0Cj4gcGF5IGF0dGVu
dGlvbiB0byBSRkMgc2VyaWVzLgo+IAo+IFdvdWxkIFtETyBOT1QgTUVSR0VdIGluIHRoZSBzdWJq
ZWN0IGJlIE9LPwoKSSdkIGJldCB0aGF0IHRob3NlIHdobyBoYXZlIGRlY2lkZWQgIlJGQyBtZWFu
cyB0aGUgcGF0Y2ggc2VyaWVzIGlzIG5vdApyZWFkeSIgd2lsbCB0YWtlIHN1Y2ggYSBub3RpY2Ug
dG8gYWxzbyBtZWFuIHRoZSBzYW1lLCBhbmQgaWdub3JlIGl0LgoKSSB0aGluayB0aGVyZSBuZWVk
cyB0byBiZSBzb21lIGtpbmQgb2YgcHVzaC1iYWNrIGFnYWluc3QgdGhlc2UKbWFpbnRhaW5lcnMg
d2hvIGV4cGxpY2l0bHkgc3RhdGUgdGhhdCB0aGV5IGlnbm9yZSBSRkMgc2VyaWVzIC0gbWFraW5n
Cml0IGJhc2ljYWxseSBhbnRpLXNvY2lhbCBiZWhhdmlvdXIgaW4gdGhlIGtlcm5lbCBjb21tdW5p
dHkuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsv
ZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBE
ZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
