Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F690AC636D
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 09:53:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37381C36B30;
	Wed, 28 May 2025 07:53:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 116E0C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ve9zlEhyAeIJvFh++9HwCNvy/GoFzpwAhVVWMjKo3bE=; b=BxhS0FZ5P9KDXBIuaA2hPCfF72
 kQOc+zam/61pRNAjeSCEDHXcETAjwY5InAkIrntfRtDixw/t8lP0638gmI/JR8kWHFDfLOOXpi/Gm
 pWz4Gkuma2cqnwp+70Osyffe0NV66c2sAGngS1k6cNP/fJDk3xULr+kI8L+74EYw8az0Bd1xmGHcJ
 PbJue0I+lPkoL06qAbKfO8VXR6n21brNYIrFenE9dDocepHHHkGTEddAsFwejmNBBw2AzoHYR7aUr
 P7aPxwZ8ueOHujHeLD6T9b5p78EuLX9EByQMobwH2cn/IhZCPUZtJVG/AD6unO95Fxpjz6edFovbj
 7rgRLdxQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55976)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uKBb9-0008NH-0j;
 Wed, 28 May 2025 08:53:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uKBb4-0002G5-1v;
 Wed, 28 May 2025 08:53:10 +0100
Date: Wed, 28 May 2025 08:53:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
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
WSdzLgo+IAo+IEl0IGFwcGVhcnMgdGhlcmUgd2FzIGEgZmFpcmx5IGxvbmcgdHJhbnNpdGlvbiBw
ZXJpb2Qgd2hlcmUgYm90aCB2YXJpYW50cwo+IHdlcmUgYmVpbmcgc2hpcHBlZC4KCkdpdmVuIHRo
YXQgRFQgaXMgc3VwcG9zZWQgdG8gZGVzY3JpYmUgdGhlIGhhcmR3YXJlIHRoYXQgaXMgYmVpbmcg
cnVuIG9uLAppdCBzaG91bGQgX2Rlc2NyaWJlXyBfdGhlXyBfaGFyZHdhcmVfIHRoYXQgdGhlIGtl
cm5lbCBpcyBiZWluZyBydW4gb24uCgpUaGF0IG1lYW5zIG5vdCBlbnVtZXJhdGluZyBhbGwgcG9z
c2liaWxpdGllcyBpbiBEVCBhbmQgdGhlbiBoYXZpbmcgbWFnaWMKaW4gdGhlIGtlcm5lbCB0byBz
ZWxlY3QgdGhlIHJpZ2h0IHZhcmlhbnQuIFRoYXQgbWVhbnMgaGF2aW5nIGEgY29ycmVjdApkZXNj
cmlwdGlvbiBpbiBEVCBmb3IgdGhlIGtlcm5lbCB0byB1c2UuCgpJIGRvbid0IHRoaW5rIHRoYXQg
YWJ1c2luZyAicGh5cyIgaXMgYSBnb29kIGlkZWEuCgpJdCdzIHF1aXRlIG5vcm1hbCBmb3IgdGhl
IGJvb3QgbG9hZGVyIHRvIGZpeCB1cCB0aGUgZGV2aWNlIHRyZWUKYWNjb3JkaW5nIHRvIHRoZSBo
YXJkd2FyZSAtIGZvciBleGFtcGxlLCBhZGRpbmcgdGhlIGFjdHVhbCBtZW1vcnkKbG9jYXRpb24g
YW5kIHNpemVzIHRoYXQgYXJlIHByZXNlbnQsIGFkZGluZyByZXNlcnZlZCBtZW1vcnkgcmVnaW9u
cywKZXRjLiBJIGRvbid0IHNlZSB3aHkgeW91IGNvdWxkbid0IGRldGVjdCB0aGUgZGlmZmVyZW5j
ZXMgYW5kIGhhdmUKdGhlIGJvb3QgbG9hZGVyIHBhdGNoIHRoZSBkZXZpY2UgdHJlZSBhcHByb3By
aWF0ZWx5LgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3Jn
LnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1
cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
