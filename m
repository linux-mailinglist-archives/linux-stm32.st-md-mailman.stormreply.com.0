Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C091121D
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 21:31:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2E8EC7128D;
	Thu, 20 Jun 2024 19:31:00 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF697C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 19:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=Xp5DdyyOVSdJC4Y+QKf7CMgqOpurY27ZBMpNeiF2Pto=; b=GG
 XQ8UicF96zmhbcHGoTPgJoHkHmIKsRWvUZL6rRR1A72fnCH0t+10Oe25CCIUeJQpveAK5sgkOKwMr
 Vi0vhjT16ZEzeJOQcyQG/u/z/3bIbR5gGM6r05SNYLSXtbHy3KBGEwfnI5S6asVVtUHXfA1dOX9K4
 srruDiqvTmdOt0M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sKNUW-000bO0-RG; Thu, 20 Jun 2024 21:30:40 +0200
Date: Thu, 20 Jun 2024 21:30:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <b747f841-7520-4fee-9a1f-f3215203e138@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-9-brgl@bgdev.pl>
 <f4af7cb3-d139-4820-8923-c90f28cca998@lunn.ch>
 <CAMRc=MeP9o2n8AqHYNZMno5gFA94DnQCoHupYiofQLLw03bL6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MeP9o2n8AqHYNZMno5gFA94DnQCoHupYiofQLLw03bL6A@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 8/8] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride-r3
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMTA6MjA6MDhBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCA5OjMz4oCvUE0gQW5kcmV3IEx1
bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBh
dCAwODo0NTo0OVBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiBGcm9t
OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4g
PiA+Cj4gPiA+IE9uIHNhODc3NXAtcmlkZSB0aGUgUlggY2xvY2tzIGZyb20gdGhlIEFRUjExNUMg
UEhZIGFyZSBub3QgYXZhaWxhYmxlIGF0Cj4gPiA+IHRoZSB0aW1lIG9mIHRoZSBETUEgcmVzZXQg
c28gd2UgbmVlZCB0byBsb29wIFRYIGNsb2NrcyB0byBSWCBhbmQgdGhlbgo+ID4gPiBkaXNhYmxl
IGxvb3BiYWNrIGFmdGVyIGxpbmstdXAuIFVzZSB0aGUgcHJvdmlkZWQgY2FsbGJhY2tzIHRvIGRv
IGl0IGZvcgo+ID4gPiB0aGlzIGJvYXJkLgo+ID4KPiA+IEhvdyBkb2VzIHRoaXMgZGlmZmVyIHRv
IGV0aHFvc19jbGtzX2NvbmZpZygpPwo+ID4KPiAKPiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5k
IHRoZSBxdWVzdGlvbi4gVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgYXQKPiBwcm9iZS9yZW1vdmUg
YW5kIHN1c3BlbmQvcmVzdW1lLiBJdCdzIG5vdCBsaW5rZWQgdG8gdGhlIGlzc3VlIHNvbHZlZAo+
IGhlcmUuCgoJCS8qIEVuYWJsZSBmdW5jdGlvbmFsIGNsb2NrIHRvIHByZXZlbnQgRE1BIHJlc2V0
IHRvIHRpbWVvdXQgZHVlCgkJICogdG8gbGFja2luZyBQSFkgY2xvY2sgYWZ0ZXIgdGhlIGhhcmR3
YXJlIGJsb2NrIGhhcyBiZWVuIHBvd2VyCgkJICogY3ljbGVkLiBUaGUgYWN0dWFsIGNvbmZpZ3Vy
YXRpb24gd2lsbCBiZSBhZGp1c3RlZCBvbmNlCgkJICogZXRocW9zX2ZpeF9tYWNfc3BlZWQoKSBp
cyBpbnZva2VkLgoKSXQgc291bmRzIHNpbWlsYXIsICJETUEgcmVzZXQiLCAibGFja2luZyBQSFkg
Y2xvY2siLgoKVGhlcmUgaXMgYWxzbwoKY29tbWl0IDU4MzI5YjAzYTU5NTc5MDRmYTJiMzNiMzgy
NGVkMTllN2I0MmM5ZTkKQXV0aG9yOiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9v
dGxpbi5jb20+CkRhdGU6ICAgVHVlIE1hciAyNiAxNDozMjoxMSAyMDI0ICswMTAwCgogICAgbmV0
OiBzdG1tYWM6IFNpZ25hbCB0byBQSFkvUENTIGRyaXZlcnMgdG8ga2VlcCBSWCBjbG9jayBvbgog
ICAgCiAgICBUaGVyZSBpcyBhIHJlb2N1cnJpbmcgaXNzdWUgd2l0aCBzdG1tYWMgY29udHJvbGxl
cnMgd2hlcmUgdGhlIE1BQyBmYWlscyB0bwogICAgaW5pdGlhbGl6ZSBpdHMgaGFyZHdhcmUgaWYg
YW4gUlggY2xvY2sgc2lnbmFsIGlzbid0IHByb3ZpZGVkIG9uIHRoZSBNQUMvUEhZCiAgICBsaW5r
LgogICAgCiAgICBUaGlzIGNhdXNlcyBpc3N1ZXMgd2hlbiBQSFkgb3IgUENTIGRldmljZXMgZWl0
aGVyIGdvIGludG8gc3VzcGVuZCB3aGlsZQogICAgY3V0dGluZyB0aGUgUlggY2xvY2sgb3IgZG8g
bm90IGJyaW5nIHRoZSBjbG9jayBzaWduYWwgdXAgZWFybHkgZW5vdWdoIGZvcgogICAgdGhlIE1B
QyB0byBpbml0aWFsaXplIHN1Y2Nlc3NmdWxseS4KICAgIAogICAgU2V0IHRoZSBtYWNfcmVxdWly
ZXNfcnhjIGZsYWcgaW4gdGhlIHN0bW1hYyBwaHlsaW5rIGNvbmZpZyBzbyB0aGF0IFBIWS9QQ1MK
ICAgIGRyaXZlcnMga25vdyB0byBrZWVwIHRoZSBSWCBjbG9jayB1cCBhdCBhbGwgdGltZXMuCgpJ
dCB3b3VsZCBiZSBnb29kIHRvIGV4cGxhaW4gdGhlIGJpZyBwaWN0dXJlcywgd2h5IHRoZXNlIHR3
byBjaGFuZ2VzCmFyZSBub3Qgc3VmZmljaWVudC4KCiAgICBBbmRyZXcKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
