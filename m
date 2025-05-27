Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8692AC5C6A
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 23:48:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4071FC36B19;
	Tue, 27 May 2025 21:48:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AD85C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 21:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=Yo5i6Cfp507HWKu8x8QsupHsb5V8DAsofc1dKd1g6JU=; b=G8
 8J1JyNZI1h77yRUT+EqGtVaguMkpS9J7EEusMtT2VRNZY8u+RhYP/vtnUNsA1CKnMk7ooz/nriaji
 nCera2wrUOrrpjnS0rXf8vk8P3KxQ0XblNMMvzlOIpwyB9Qm3Nwc8h4FL7a8FUCPS889BGfiVlKJu
 bgfVxfJiLPHa2gU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uK29V-00E70R-Kg; Tue, 27 May 2025 23:48:05 +0200
Date: Tue, 27 May 2025 23:48:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <93bfec74-c679-400f-8ce4-3bc84d6d803f@lunn.ch>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMDI6Mzc6MDNQTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQg
d3JvdGU6Cj4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMjozMOKAr1BNIEFuZHJldyBMdW5uIDxh
bmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPgo+ID4gPiBTdXJlLCB0aGF0IG1heSBtYWtlIHNlbnNl
IHRvIGRvIGFzIHdlbGwsIGJ1dCBJIHN0aWxsIGRvbid0IHNlZQo+ID4gPiBob3cgdGhhdCBpbXBh
Y3RzIHRoZSBuZWVkIHRvIHJ1bnRpbWUgc2VsZWN0IHRoZSBQSFkgd2hpY2gKPiA+ID4gaXMgY29u
ZmlndXJlZCBmb3IgdGhlIGNvcnJlY3QgTUZELgo+ID4KPiA+IElmIHlvdSBrbm93IHdoYXQgdmFy
aWFudCB5b3UgaGF2ZSwgeW91IG9ubHkgaW5jbHVkZSB0aGUgb25lIFBIWSB5b3UKPiA+IGFjdHVh
bGx5IGhhdmUsIGFuZCBwaHktaGFuZGxlIHBvaW50cyB0byBpdCwganVzdCBhcyBub3JtYWwuIE5v
IHJ1bnRpbWUKPiA+IHNlbGVjdGlvbi4KPiAKPiBPaCwgc28gaGVyZSdzIHRoZSBpc3N1ZSwgd2Ug
aGF2ZSBib3RoIFBIWSB2YXJpYW50cywgb2xkZXIgaGFyZHdhcmUKPiBnZW5lcmFsbHkgaGFzIEFD
MjAwIFBIWSdzIHdoaWxlIG5ld2VyIHNoaXBzIEFDMzAwIFBIWSdzLCBidXQKPiB3aGVuIEkgc3Vy
dmV5ZWQgb3VyIGRlcGxveWVkIGhhcmR3YXJlIHVzaW5nIHRoZXNlIGJvYXJkcyBtYW55Cj4gc3lz
dGVtcyBvZiBzaW1pbGFyIGFnZSB3b3VsZCByYW5kb21seSBtaXggQUMyMDAgYW5kIEFDMzAwIFBI
WSdzLgoKQXJlIHRoZXkgcGluIGNvbXBhdGlibGU/CgpCdXQgaSBhc3N1bWUgbm9uZSBvZiB0aGVz
ZSBib2FyZHMgLmR0cyBmaWxlcyBhcmUgYWN0dWFsbHkgaW4gbWFpbmxpbmU/ClNvIHRoZXkgbmVl
ZCB0byBnbyB0aHJvdWdoIHJldmlldywgYW5kIGFyZSBsaWtlbHkgdG8gYmUgaG9ycmlibHkKYnJv
a2VuIGFuZCBuZWVkIGZpeGluZz8gU28geW91IGNhbiBmaXggdXAgdGhlIFBIWSBub2RlIGFzIHBh
cnQgb2YgdGhlCmNsZWFudXAuCgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
