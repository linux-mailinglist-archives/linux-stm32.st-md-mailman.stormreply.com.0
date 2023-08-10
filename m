Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045278471E
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7551C6C82C;
	Tue, 22 Aug 2023 16:25:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A1ACC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 16:09:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF9FBC0009;
 Thu, 10 Aug 2023 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691683766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4qxw6gwLHzvrbHoxYk1AwkUqX8NF1+OpN2iHArg7CaA=;
 b=h8im4XO4gMECAJCvV5ytTCW+2T3TkjoLfZOcggaEgqfObeXgqEcNJUaC+DzV3o/Cxf6zjT
 qTEWl26zXCXmb+Y+5FYvY8zGP+5FmL82aVhzq734KSmu/qk8MG1ttkQybsagZO7XJTgz4J
 6FgZfjhKoMEHj9uVbe4e5Wiz6mco2uq0BAfN1SzdWIidGo8bMu6ORZyh/GgGpOXAgzgmc4
 B96NMc2vQiEFtrzA1rOoZdNpUZHEK7ElGmxtFlHdrW/bqiLSQP3Mmc864tknRs5ZD2CpDQ
 8f1qSfHPnt5/+vofEGhte/7d2yOx6F96mJqVMAUKkAWt78ORxPLNS7MU7t8ofQ==
Message-ID: <152ee4d9-800e-545a-c2c6-08b03e9d1301@bootlin.com>
Date: Thu, 10 Aug 2023 18:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Clark Wang <xiaoning.wang@nxp.com>
References: <20230202081559.3553637-1-xiaoning.wang@nxp.com>
 <83a8fb89ac7a69d08c9ea1422dade301dcc87297.camel@redhat.com>
 <Y/c+MQtgtKFDjEZF@shell.armlinux.org.uk>
 <HE1PR0402MB2939A09FD54E72C80C19A467F3AB9@HE1PR0402MB2939.eurprd04.prod.outlook.com>
 <Y/dIoAqWfazh9k6F@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <Y/dIoAqWfazh9k6F@shell.armlinux.org.uk>
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH V3 1/2] net: phylink: add a function to
 resume phy alone to fix resume issue with WoL enabled
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

SGVsbG8gQ2xhcmssIFJ1c3NlbGwsCgpPbiAyLzIzLzIzIDEyOjA2LCBSdXNzZWxsIEtpbmcgKE9y
YWNsZSkgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjMsIDIwMjMgYXQgMTA6Mjc6MDZBTSArMDAwMCwg
Q2xhcmsgV2FuZyB3cm90ZToKPj4gSGkgUnVzc2VsLAo+Pgo+PiBJIGhhdmUgc2VudCB0aGUgVjQg
cGF0Y2ggc2V0IHllc3RlcmRheS4KPj4gWW91IGNhbiBjaGVjayBpdCBmcm9tOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjMwMjIyMDkyNjM2LjE5ODQ4NDctMi14
aWFvbmluZy53YW5nQG54cC5jb20vVC8KPj4KPiAKPiBBaCB5ZXMsIHNlbnQgd2hpbGUgbmV0LW5l
eHQgaXMgY2xvc2VkLgo+IAo+IEhhdmUgeW91IGhhZCBhbnkgY29udGFjdCB3aXRoIENsw6ltZW50
IEzDqWdlciA/IElmIG5vdCwgcGxlYXNlIGNhbiB5b3UKPiByZWFjaCBvdXQgdG8gQ2zDqW1lbnQs
IGJlY2F1c2UgaGUgaGFzIHZpcnR1YWxseSB0aGUgc2FtZSBwcm9ibGVtLiBJCj4gZG9uJ3Qgd2Fu
dCB0byBlbmQgdXAgd2l0aCBhIGxvYWQgb2YgZGlmZmVyZW50IGZpeGVzIGluIHRoZSBtYWlubGlu
ZQo+IGtlcm5lbCBmb3IgdGhlIHNhbWUgIndlIG5lZWQgdGhlIFBIWSBjbG9jayBlbmFibGVkIG9u
IHN0bW1hYyIgcHJvYmxlbQo+IGZyb20gZGlmZmVyZW50IHBlb3BsZS4KCkkgYW0gcmVzdW1pbmcg
Q2xlbWVudCdzIGluaXRpYWwgZWZmb3J0cyBvbiBSWk4xIEdNQUMgaW50ZXJmYWNlLCB3aGljaCBp
bmRlZWQgaXMKaW4gbmVlZCBvZiBhbiBlYXJseSBQQ1MgaW5pdGlhbGl6YXRpb24gbWVjaGFuaXNt
IHRvbyAoWzFdKS4KCj4gUGxlYXNlIHRyeSB0byBjb21lIHVwIHdpdGggb25lIHBhdGNoIHNldCBi
ZXR3ZWVuIHlvdSBib3RoIHRvIGZpeCB0aGlzLgo+IAo+IChlZmZlY3RpdmVseSwgdGhhdCdzIGEg
dGVtcG9yYXJ5IE5BSyBvbiB5b3VyIHNlcmllcy4pPgoKSSB3b3VsZCBsaWtlIHRvIGtub3cgaWYg
dGhpcyBzZXJpZXMgaXMgc3RpbGwgb25nb2luZy9hbGl2ZSA/IEkgaGF2ZSBjaGVja2VkIGZvcgpm
b2xsb3ctdXBzIGFmdGVyIFY0IHNlbnQgYnkgQ2xhcmsgKFsyXSksIGJ1dCBkaWQgbm90IGZpbmQg
YW55dGhpbmcuIENsZW1lbnQKaGFuZGVkIG1lIG92ZXIgdGhlIHRvcGljIHJpZ2h0IHdoZW4gUnVz
c2VsbCBzdWdnZXN0ZWQgdG8gZGlzY3VzcyB0aGlzIHNoYXJlZApuZWVkLCBzbyBJIGFtIG5vdCBz
dXJlIGlmIGFueSBtdXR1YWxpemF0aW9uIGRpc2N1c3Npb24gaGFzIGhhcHBlbmVkIHlldCA/CgpJ
ZiBub3QsIHdoYXQgd291bGQgYmUgdGhlIG5leHQgc3RlcHMgPyBCYXNlZCBvbiBteSB1bmRlcnN0
YW5kaW5nIGFuZCBjb21tZW50cyBvbgp0aGUgWzJdIHYzLCBJIGZlZWwgdGhhdCBDbGFyaydzIHNl
cmllcyB3b3VsZCBiZSBhIGdvb2Qgc3RhcnRpbmcgcG9pbnQuIEluIG9yZGVyCnRvIGJlIGFibGUg
dG8gdXNlIGl0IGluIGJvdGggc2VyaWVzLCB3ZSBjb3VsZCBwb3NzaWJseSBtYWtlIGl0IGxlc3Mg
c3BlY2lmaWMgdG8KdGhlICJyZXN1bWUiIG1lY2hhbmlzbSAoYmFzaWNhbGx5LCBwaHlsaW5rX3Bo
eV9yZXN1bWUoKSA9PgpwaHlsaW5rX3BoeV9lYXJseV9zdGFydCgpICkgPyBJdCB3b3VsZCB0aGVu
IHByZXZlbnQgWzFdIGZyb20gbW92aW5nIHRoZSB3aG9sZQpwaHlsaW5rX3N0YXJ0KCkgaW4gc3Rt
bWFjX21haW4gdG9vIGVhcmx5IChzZWUgaXNzdWUgcmFpc2VkIGJ5IFJ1c3NlbGwpIGFuZCBhbGxv
dwp0byBqdXN0IGNhbGwgcGh5bGlua19waHlfZWFybHlfc3RhcnQoKSBlYXJseSBlbm91Z2gsIHdo
aWxlIHN0aWxsIGJlaW5nIHVzYWJsZSBpbgp0aGUgcmVzdW1lIHNjZW5hcmlvIHJhaXNlZCBieSBD
bGFyay4gT3IgYW0gSSBtaXNzaW5nIGJpZ2dlciBpc3N1ZXMgd2l0aCBjdXJyZW50CnNlcmllcyA/
CgpSZWdhcmRzLApBbGV4aXMKClsxXQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0t
a2VybmVsLzIwMjMwMTE2MTAzOTI2LjI3Njg2OS0xLWNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20v
ClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzAyMjIwOTI2MzYuMTk4NDg0Ny0x
LXhpYW9uaW5nLndhbmdAbnhwLmNvbS8KLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
