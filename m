Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC4AC7283
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 23:05:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62F99C36B3E;
	Wed, 28 May 2025 21:05:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00D16C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=b95mbv58GC1sLRpCdVviPp1TGSLCgwADdPiOEMX8kAs=; b=4L
 8mlfeRvliv9ijr/wpaHqc6/m0DT95i0TweNRw89IsfTxUOZnG0O1o0KeOLB19ufZ+HsFnaxD3i5Ts
 XssIZNhQxsjOi4mcw1okG4dYNjkby2gZWp5YFVilP1G+kR0xz7chzpgpvJNNB0vrjgUZNLTaWFF4m
 A2gneThrUTubonA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uKNxl-00ED1x-It; Wed, 28 May 2025 23:05:25 +0200
Date: Wed, 28 May 2025 23:05:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
References: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
 <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
 <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
 <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
 <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, wens@csie.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMDE6NDU6NDBQTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQg
d3JvdGU6Cj4gT24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMToyN+KAr1BNIEFuZHJldyBMdW5uIDxh
bmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPgo+ID4gPiBJIHRoaW5rIGEgbG90IG9mIGV0aGVybmV0
IGRyaXZlcnMgdXNlIHBoeV9maW5kX2ZpcnN0KCkgZm9yIHBoeSBzY2FubmluZwo+ID4gPiBhcyB3
ZWxsIHNvIGl0J3Mgbm90IGxpbWl0ZWQgdG8ganVzdCBzdG1tYWMgQUZBSVUuCj4gPgo+ID4gWW91
IG5lZWQgdG8gZGlmZmVyZW50aWF0ZSBieSB0aW1lLiBJdCBoYXMgYmVjb21lIGEgbG90IGxlc3Mg
dXNlZCBpbgo+ID4gdGhlIGxhc3QgZGVjYWRlLiBEVCBkZXNjcmliZXMgdGhlIFBIWSwgc28gdGhl
cmUgaXMgbm8gbmVlZCB0byBodW50Cj4gPiBhcm91bmQgZm9yIGl0LiBUaGUgb25seSByZWFsIHVz
ZSBjYXNlIG5vdyBhIGRheXMgaXMgVVNCIGRvbmdsZXMsIHdoaWNoCj4gPiBkb24ndCBoYXZlIERU
LCBhbmQgbWF5YmUgUENJZSBkZXZpY2VzIHdpdGhvdXQgQUNQSSBzdXBwb3J0Lgo+IAo+IEkgbWVh
biwgaGFyZHdhcmUgcHJvYmluZyBmZWF0dXJlcyBmb3IgdGhpcyBzb3J0IG9mIHVzZSBjYXNlIGhh
dmUgYmVlbgo+IGdldHRpbmcgYWRkZWQgb3V0c2lkZSB0aGUgbmV0d29yayBzdWJzeXN0ZW0gc28g
SSdtIG5vdCBzdXJlIHdoYXQgdGhlCj4gaXNzdWUgd2l0aCB0aGlzIGlzIGFzIHRob3NlIHVzZSBj
YXNlcyBkb24ndCBhcHBlYXIgdG8gYmUgbWVhbmluZ2Z1bGx5Cj4gZGlmZmVyZW50Lgo+IAo+ID4g
SSBzdWdnZXN0IHlvdSBnaXZlIHVwIHB1c2hpbmcgdGhpcy4gWW91IGhhdmUgdHdvIE1haW50YWlu
ZXJzIHNheWluZyBubwo+ID4gdG8gdGhpcywgc28gaXQgaXMgdmVyeSB1bmxpa2VseSB5b3UgYXJl
IGdvaW5nIHRvIHN1Y2NlZWQuCj4gCj4gU28gd2hhdCBzaG91bGQgSSBiZSBkb2luZyBpbnN0ZWFk
PwoKRGVzY3JpYmUgdGhlIG9uZSBQSFkgd2hpY2ggYWN0dWFsbHkgZXhpc3RzIGluIGRldmljZSB0
cmVlIGZvciB0aGUKYm9hcmQsIGFuZCBwb2ludCB0byBpdCB1c2luZyBwaHktaGFuZGxlLiBObyBy
dW50aW1lIGRldGVjdGlvbiwganVzdApjb3JyZWN0bHkgZGVzY3JpYmUgdGhlIGhhcmR3YXJlLgoK
RG8geW91IGhhdmUgZXhhbXBsZXMgb2YgYm9hcmRzIHdoZXJlIHRoZSBTb0MgdmFyaWFudCBjaGFu
Z2VkIGR1cmluZwp0aGUgYm9hcmRzIHByb2R1Y3Rpb24gbGlmZT8KCglBbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
