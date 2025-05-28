Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44982AC6A4E
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 15:25:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE5E8C36B35;
	Wed, 28 May 2025 13:25:10 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3BBFC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=eBLT1coqN7DWf9zqS26cnLXO/a+cQ5A8TJyemfvfOhg=; b=Cv
 NTTWZqEWIqlQKLw1iqZfeKB2gycKP4fQnxaOgVhW9sQoXjUgOMqlAPqOY/cEdYB0XM/boQ+lyJ8s+
 kqj5B6BKu2PlJbvkVkPJ277StCNkbUonv85HBREfXR+xowx5Nj4vC0mlLHpG03b0Wk7ggawLr63qs
 WWFpLv9UJKSTCO4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uKGm5-00EB7S-MN; Wed, 28 May 2025 15:24:53 +0200
Date: Wed, 28 May 2025 15:24:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
 <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMDU6NTc6MzhBTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQg
d3JvdGU6Cj4gT24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMTo1M+KAr0FNIFJ1c3NlbGwgS2luZyAo
T3JhY2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwg
TWF5IDI3LCAyMDI1IGF0IDAyOjM3OjAzUE0gLTA2MDAsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+
ID4gPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAyOjMw4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJl
d0BsdW5uLmNoPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gU3VyZSwgdGhhdCBtYXkgbWFrZSBz
ZW5zZSB0byBkbyBhcyB3ZWxsLCBidXQgSSBzdGlsbCBkb24ndCBzZWUKPiA+ID4gPiA+IGhvdyB0
aGF0IGltcGFjdHMgdGhlIG5lZWQgdG8gcnVudGltZSBzZWxlY3QgdGhlIFBIWSB3aGljaAo+ID4g
PiA+ID4gaXMgY29uZmlndXJlZCBmb3IgdGhlIGNvcnJlY3QgTUZELgo+ID4gPiA+Cj4gPiA+ID4g
SWYgeW91IGtub3cgd2hhdCB2YXJpYW50IHlvdSBoYXZlLCB5b3Ugb25seSBpbmNsdWRlIHRoZSBv
bmUgUEhZIHlvdQo+ID4gPiA+IGFjdHVhbGx5IGhhdmUsIGFuZCBwaHktaGFuZGxlIHBvaW50cyB0
byBpdCwganVzdCBhcyBub3JtYWwuIE5vIHJ1bnRpbWUKPiA+ID4gPiBzZWxlY3Rpb24uCj4gPiA+
Cj4gPiA+IE9oLCBzbyBoZXJlJ3MgdGhlIGlzc3VlLCB3ZSBoYXZlIGJvdGggUEhZIHZhcmlhbnRz
LCBvbGRlciBoYXJkd2FyZQo+ID4gPiBnZW5lcmFsbHkgaGFzIEFDMjAwIFBIWSdzIHdoaWxlIG5l
d2VyIHNoaXBzIEFDMzAwIFBIWSdzLCBidXQKPiA+ID4gd2hlbiBJIHN1cnZleWVkIG91ciBkZXBs
b3llZCBoYXJkd2FyZSB1c2luZyB0aGVzZSBib2FyZHMgbWFueQo+ID4gPiBzeXN0ZW1zIG9mIHNp
bWlsYXIgYWdlIHdvdWxkIHJhbmRvbWx5IG1peCBBQzIwMCBhbmQgQUMzMDAgUEhZJ3MuCj4gPiA+
Cj4gPiA+IEl0IGFwcGVhcnMgdGhlcmUgd2FzIGEgZmFpcmx5IGxvbmcgdHJhbnNpdGlvbiBwZXJp
b2Qgd2hlcmUgYm90aCB2YXJpYW50cwo+ID4gPiB3ZXJlIGJlaW5nIHNoaXBwZWQuCj4gPgo+ID4g
R2l2ZW4gdGhhdCBEVCBpcyBzdXBwb3NlZCB0byBkZXNjcmliZSB0aGUgaGFyZHdhcmUgdGhhdCBp
cyBiZWluZyBydW4gb24sCj4gPiBpdCBzaG91bGQgX2Rlc2NyaWJlXyBfdGhlXyBfaGFyZHdhcmVf
IHRoYXQgdGhlIGtlcm5lbCBpcyBiZWluZyBydW4gb24uCj4gPgo+ID4gVGhhdCBtZWFucyBub3Qg
ZW51bWVyYXRpbmcgYWxsIHBvc3NpYmlsaXRpZXMgaW4gRFQgYW5kIHRoZW4gaGF2aW5nIG1hZ2lj
Cj4gPiBpbiB0aGUga2VybmVsIHRvIHNlbGVjdCB0aGUgcmlnaHQgdmFyaWFudC4gVGhhdCBtZWFu
cyBoYXZpbmcgYSBjb3JyZWN0Cj4gPiBkZXNjcmlwdGlvbiBpbiBEVCBmb3IgdGhlIGtlcm5lbCB0
byB1c2UuCj4gCj4gVGhlIGFwcHJvYWNoIEknbSB1c2luZyBpcyBJTU8gcXVpdGUgc2ltaWxhciB0
byBzYXkgb3RoZXIgaGFyZHdhcmUKPiB2YXJpYW50IHJ1bnRpbWUgZGV0ZWN0aW9uIERUIGZlYXR1
cmVzIGxpa2UgdGhpczoKPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0
LzE1N2NlOGYzODFlZmUyNjQ5MzNlOTM2NmRiODI4ZDg0NWJhZGUzYTEKClRoYXQgaXMgZm9yIHRo
aW5ncyBsaW5rIGEgSEFUIG9uIGEgUlBpLiBJdCBpcyBzb21ldGhpbmcgd2hpY2ggaXMgZWFzeQp0
byByZXBsYWNlLCBhbmQgaXMgZXhwZWN0ZWQgdG8gYmUgcmVwbGFjZWQuCgpZb3UgYXJlIHRhbGtp
bmcgYWJvdXQgc29tZSBmb3JtIG9mIGNoaXBsZXQgbGlrZSBjb21wb25lbnQgd2l0aGluIHRoZQpT
b0MgcGFja2FnZS4gSXQgaXMgbm90IGVhc3kgdG8gcmVwbGFjZSwgYW5kIG5vdCBleHBlY3RlZCB0
byBiZQpyZXBsYWNlZC4KCkRpZmZlcmVudCB1c2VzIGNhc2VzIGFsdG9nZXRoZXIuCgpXaGF0IGkg
dGhpbmsgd2Ugd2lsbCBlbmQgdXAgd2l0aCBpcyB0aGUgYmFzZSBTb0MgLmR0c2kgZmlsZSwgYW5k
IHR3bwphZGRpdGlvbmFsIC5kdHNpIGZpbGVzIGRlc2NyaWJpbmcgdGhlIHR3byBQSFkgdmFyaWFu
dHMuCgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
