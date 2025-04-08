Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A28A81002
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 17:30:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA287C78F75;
	Tue,  8 Apr 2025 15:30:54 +0000 (UTC)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B58D4C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 15:30:53 +0000 (UTC)
Message-ID: <08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1744126252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8BoOWeNe+pe93MVOTNw72S8eDhTJzWNGVCLyplYdrjU=;
 b=xHjiYEdgV7tMnhbjUS9rxzHVYtisqRgofwAbFgKBjHeCW/w+sALVnUMiySoFUarrOrSbJp
 Ecqv/CNdAQM8aUz/+aPqTRou80iDO+z9ZzmUuIVt85PyF9sLMmnGUY26Em+RgqaMhsISwv
 mClV4f4j7VSPhAIpytBuD78aAgb4MhI=
Date: Tue, 8 Apr 2025 11:30:43 -0400
MIME-Version: 1.0
To: Jakub Kicinski <kuba@kernel.org>
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
 <20250408075047.69d031a9@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250408075047.69d031a9@kernel.org>
X-Migadu-Flow: FLOW_OUT
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
 linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Clark Wang <xiaoning.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
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

T24gNC84LzI1IDEwOjUwLCBKYWt1YiBLaWNpbnNraSB3cm90ZToKPiBPbiBNb24sICA3IEFwciAy
MDI1IDE5OjE3OjMxIC0wNDAwIFNlYW4gQW5kZXJzb24gd3JvdGU6Cj4+IFRoaXMgc2VyaWVzIGRl
cGVuZHMgb24gWzEsMl0sIGFuZCB0aGV5IGhhdmUgYmVlbiBpbmNsdWRlZCBhdCB0aGUKPj4gYmVn
aW5uaW5nIHNvIENJIHdpbGwgcnVuLiBIb3dldmVyLCBJIGV4cGVjdCB0aGVtIHRvIGJlIHJldmll
d2VkL2FwcGxpZWQKPj4gb3V0c2lkZSB0aGUgbmV0LW5leHQgdHJlZS4KPiAKPiBUaGVzZSBhcHBl
YXIgdG8gYnJlYWsgdGhlIGJ1aWxkOgo+IAo+IGRyaXZlcnMvYWNwaS9wcm9wZXJ0eS5jOjE2Njk6
Mzk6IGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiDigJhpbnQgKCopKGNvbnN0IHN0cnVjdCBmd25v
ZGVfaGFuZGxlICosIGNvbnN0IGNoYXIgKiwgY29uc3QgY2hhciAqLCBpbnQsICB1bnNpZ25lZCBp
bnQsICBzdHJ1Y3QgZndub2RlX3JlZmVyZW5jZV9hcmdzICop4oCZIGZyb20gaW5jb21wYXRpYmxl
IHBvaW50ZXIgdHlwZSDigJhpbnQgKCopKGNvbnN0IHN0cnVjdCBmd25vZGVfaGFuZGxlICosIGNv
bnN0IGNoYXIgKiwgY29uc3QgY2hhciAqLCB1bnNpZ25lZCBpbnQsICB1bnNpZ25lZCBpbnQsICBz
dHJ1Y3QgZndub2RlX3JlZmVyZW5jZV9hcmdzICop4oCZIFstV2luY29tcGF0aWJsZS1wb2ludGVy
LXR5cGVzXQo+ICAxNjY5IHwgICAgICAgICAgICAgICAgIC5nZXRfcmVmZXJlbmNlX2FyZ3MgPSBh
Y3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MsICAgXAo+IAo+IENvdWxkIHlvdSBwb3N0IGFz
IFJGQyB1bnRpbCB3ZSBjYW4gYWN0dWFsbHkgbWVyZ2UgdGhpcz8gSSdtIHdvcnJpZWQgCj4gc29t
ZSBzbGVlcCBkZXByaXZlZCBtYWludGFpbmVyIG1heSBtaXNzIHRoZSBub3RlIGluIHRoZSBjb3Zl
ciBsZXR0ZXIKPiBhbmQganVzdCBhcHBseSBpdCBhbGwgdG8gbmV0LW5leHQuLgoKSSB3b3VsZCBy
ZWFsbHkgbGlrZSB0byBrZWVwIFJGQyBvZmYgdGhlIHRpdGxlcyBzaW5jZSBzb21lIHJldmlld2Vy
cyBkb24ndApwYXkgYXR0ZW50aW9uIHRvIFJGQyBzZXJpZXMuCgpXb3VsZCBbRE8gTk9UIE1FUkdF
XSBpbiB0aGUgc3ViamVjdCBiZSBPSz8KCi0tU2VhbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
