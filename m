Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC243CBC13F
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Dec 2025 23:33:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 735A8C58D77;
	Sun, 14 Dec 2025 22:33:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE4BAC57B68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Dec 2025 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=/xB0oJAXp3qEO4ENcSX3Z1/nEQf1M14DCflSGjej4+8=; b=lF
 E+vr2NgmGXKsHZWD2ULhRLIMai7tY+0nGBkao0Z9cHgY5nS8J3NI2buROpSRKb+3xT02Fpv/wcPR/
 0+0SD1OVNmyD9rdt7OUGL5xOyVrp2XfdvTeb249r/jXD6++7KS4A34cB19BWvkHX0B3CX9hxvEIcq
 GPS97jZR+UJsMp4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vUuef-00GwbG-M1; Sun, 14 Dec 2025 23:33:29 +0100
Date: Sun, 14 Dec 2025 23:33:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Message-ID: <39430c2b-9430-46c3-8087-5381782a5b01@lunn.ch>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC 0/4] Support multi-channel IRQs in
 stmmac platform drivers
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

T24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTE6MTU6MzZQTSArMDEwMCwgSmFuIFBldHJvdXMgdmlh
IEI0IFJlbGF5IHdyb3RlOgo+IFRoZSBzdG1tYWMgY29yZSBzdXBwb3J0cyB0d28gaW50ZXJydXB0
IG1vZGVzLCBjb250cm9sbGVkIGJ5IHRoZQo+IGZsYWcgU1RNTUFDX0ZMQUdfTVVMVElfTVNJX0VO
Lgo+IC0gV2hlbiB0aGUgZmxhZyBpcyBzZXQsIHRoZSBkcml2ZXIgdXNlcyBtdWx0aS1jaGFubmVs
IElSUSBtb2RlIChtdWx0aS1JUlEpLgo+IC0gT3RoZXJ3aXNlLCBhIHNpbmdsZSBJUlEgbGluZSBp
cyByZXF1ZXN0ZWQ6Cj4gCj4gc3RhdGljIGludCBzdG1tYWNfcmVxdWVzdF9pcnEoc3RydWN0IG5l
dF9kZXZpY2UgKmRldikKPiB7Cj4gICAgICAgICAvKiBSZXF1ZXN0IHRoZSBJUlEgbGluZXMgKi8K
PiAgICAgICAgIGlmIChwcml2LT5wbGF0LT5mbGFncyAmIFNUTU1BQ19GTEFHX01VTFRJX01TSV9F
TikKPiAgICAgICAgICAgICAgICAgcmV0ID0gc3RtbWFjX3JlcXVlc3RfaXJxX211bHRpX21zaShk
ZXYpOwo+ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICByZXQgPSBzdG1tYWNfcmVxdWVz
dF9pcnFfc2luZ2xlKGRldik7Cj4gfQo+IAo+IEF0IHByZXNlbnQsIG9ubHkgUENJIGRyaXZlcnMg
KEludGVsIGFuZCBMb29uZ3NvbikgbWFrZSB1c2Ugb2YgdGhlIG11bHRpLUlSUQo+IG1vZGUuIFRo
aXMgY29uY2VwdCBjYW4gYmUgZXh0ZW5kZWQgdG8gRFQtYmFzZWQgZW1iZWRkZWQgZ2x1ZSBkcml2
ZXJzCj4gKGR3bWFjLXh4eC5jKS4KPiAKPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHJl
YWRpbmcgcGVyLWNoYW5uZWwgSVJRcyBmcm9tIHRoZSBEVCBub2RlIGFuZAo+IHJldXNlcyB0aGUg
ZXhpc3RpbmcgU1RNTUFDX0ZMQUdfTVVMVElfTVNJX0VOIGZsYWcgdG8gZW5hYmxlIG11bHRpLUlS
UQo+IG9wZXJhdGlvbiBpbiBwbGF0Zm9ybSBkcml2ZXJzLgo+IAo+IE5YUCBTMzJHMi9TMzJHMy9T
MzJSIFNvQ3MgaW50ZWdyYXRlIHRoZSBEV01BQyBJUCB3aXRoIG11bHRpLWNoYW5uZWwKPiBpbnRl
cnJ1cHQgc3VwcG9ydC4gVGhlIGR3bWFjLXMzMi5jIGRyaXZlciBjaGFuZ2UgaXMgcHJvdmlkZWQg
YXMgYW4gZXhhbXBsZSBvZgo+IGVuYWJsaW5nIG11bHRpLUlSUSBtb2RlIGZvciBub24tUENJIGRy
aXZlcnMuCj4gCj4gQW4gb3BlbiBxdWVzdGlvbiByZW1haW5zOiBzaG91bGQgcGxhdGZvcm0gZHJp
dmVycyBzdXBwb3J0IGJvdGggc2luZ2xlLUlSUQo+IGFuZCBtdWx0aS1JUlEgbW9kZXMsIG9yIHNo
b3VsZCBtdWx0aS1JUlEgYmUgcmVxdWlyZWQgd2l0aCB0aGUgRFQgbm9kZQo+IHNwZWNpZnlpbmcg
YWxsIGNoYW5uZWwgaW50ZXJydXB0cz8gVGhlIGN1cnJlbnQgUkZDIGltcGxlbWVudGF0aW9uIGZv
bGxvd3MKPiB0aGUgbGF0dGVyIGFwcHJvYWNoIOKAlCBkd21hYy1zMzIgcmVxdWlyZXMgSVJRcyB0
byBiZSBkZWZpbmVkIGZvciBhbGwKPiBjaGFubmVscy4KCllvdSBuZWVkIHRvIGNvbnNpZGVyIGJh
Y2t3YXJkcyBjb21wYXRpYmlsaXR5LiBXaWxsIGFuIG9sZCBEVCBibG9iCmNvbnRpbnVlIHRvIHdv
cmsgYWZ0ZXIgdGhpcyBjaGFuZ2U/CgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
