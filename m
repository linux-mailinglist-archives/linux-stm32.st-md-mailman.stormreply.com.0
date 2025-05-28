Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1EAC70FE
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 20:35:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 781EBC36B3A;
	Wed, 28 May 2025 18:35:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 132E5C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oEfLgoqZZlV3CauhRyPut9aS8+kFBL6RAy2mXOuaG1k=; b=Wosndm3QpTZVvNqtddTO/EUoXb
 G2aSMfofpfTs0Lj9HH36ZoGLLfL29XW2NdZptgFMhsLa4HiLJmIRkdeqv7/651xgC0r0P/ve6nFjK
 QFQxC/4Ql5Bi0PD/gU1UHyqdJMizemvlygAL97MKyKy/l31HXEXeKcuTqXtchmTqSG3u7BbvuNwUl
 wR4TI0dfDpSr3+Keyxz27/QnzYt/qxEsxU02bJbw0JG54MYdZwnf6PKG2ee1/3m98EsDkdlnl5nGy
 wu5BiJNG0PHlg6yVdKWTnIIuO7RJ8l0+gdQCwwtIoYJo7bvIaE1s1Cqc1C9Mg9iX9fpnKBjlFABZS
 jcD17Cog==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50888)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uKLc2-0000ci-1Y;
 Wed, 28 May 2025 19:34:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uKLbx-0002d3-0P;
 Wed, 28 May 2025 19:34:45 +0100
Date: Wed, 28 May 2025 19:34:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
References: <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
 <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
 <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
 wens@csie.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Furong Xu <0x1207@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMTE6MjU6MjBBTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQg
d3JvdGU6Cj4gT24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgODoxMuKAr0FNIENoZW4tWXUgVHNhaSA8
d2Vuc0Bjc2llLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgOToy
NeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IFdlZCwgTWF5IDI4LCAyMDI1IGF0IDA1OjU3OjM4QU0gLTA2MDAsIEphbWVzIEhpbGxpYXJkIHdy
b3RlOgo+ID4gPiA+IE9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDE6NTPigK9BTSBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkKPiA+ID4gPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAwMjozNzowM1BNIC0wNjAwLCBK
YW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+ID4gPiA+ID4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQg
MjozMOKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IFN1cmUsIHRoYXQgbWF5IG1ha2Ugc2Vuc2UgdG8gZG8gYXMgd2Vs
bCwgYnV0IEkgc3RpbGwgZG9uJ3Qgc2VlCj4gPiA+ID4gPiA+ID4gPiBob3cgdGhhdCBpbXBhY3Rz
IHRoZSBuZWVkIHRvIHJ1bnRpbWUgc2VsZWN0IHRoZSBQSFkgd2hpY2gKPiA+ID4gPiA+ID4gPiA+
IGlzIGNvbmZpZ3VyZWQgZm9yIHRoZSBjb3JyZWN0IE1GRC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+IElmIHlvdSBrbm93IHdoYXQgdmFyaWFudCB5b3UgaGF2ZSwgeW91IG9ubHkgaW5jbHVk
ZSB0aGUgb25lIFBIWSB5b3UKPiA+ID4gPiA+ID4gPiBhY3R1YWxseSBoYXZlLCBhbmQgcGh5LWhh
bmRsZSBwb2ludHMgdG8gaXQsIGp1c3QgYXMgbm9ybWFsLiBObyBydW50aW1lCj4gPiA+ID4gPiA+
ID4gc2VsZWN0aW9uLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPaCwgc28gaGVyZSdzIHRoZSBp
c3N1ZSwgd2UgaGF2ZSBib3RoIFBIWSB2YXJpYW50cywgb2xkZXIgaGFyZHdhcmUKPiA+ID4gPiA+
ID4gZ2VuZXJhbGx5IGhhcyBBQzIwMCBQSFkncyB3aGlsZSBuZXdlciBzaGlwcyBBQzMwMCBQSFkn
cywgYnV0Cj4gPiA+ID4gPiA+IHdoZW4gSSBzdXJ2ZXllZCBvdXIgZGVwbG95ZWQgaGFyZHdhcmUg
dXNpbmcgdGhlc2UgYm9hcmRzIG1hbnkKPiA+ID4gPiA+ID4gc3lzdGVtcyBvZiBzaW1pbGFyIGFn
ZSB3b3VsZCByYW5kb21seSBtaXggQUMyMDAgYW5kIEFDMzAwIFBIWSdzLgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBJdCBhcHBlYXJzIHRoZXJlIHdhcyBhIGZhaXJseSBsb25nIHRyYW5zaXRpb24g
cGVyaW9kIHdoZXJlIGJvdGggdmFyaWFudHMKPiA+ID4gPiA+ID4gd2VyZSBiZWluZyBzaGlwcGVk
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEdpdmVuIHRoYXQgRFQgaXMgc3VwcG9zZWQgdG8gZGVzY3Jp
YmUgdGhlIGhhcmR3YXJlIHRoYXQgaXMgYmVpbmcgcnVuIG9uLAo+ID4gPiA+ID4gaXQgc2hvdWxk
IF9kZXNjcmliZV8gX3RoZV8gX2hhcmR3YXJlXyB0aGF0IHRoZSBrZXJuZWwgaXMgYmVpbmcgcnVu
IG9uLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYXQgbWVhbnMgbm90IGVudW1lcmF0aW5nIGFsbCBw
b3NzaWJpbGl0aWVzIGluIERUIGFuZCB0aGVuIGhhdmluZyBtYWdpYwo+ID4gPiA+ID4gaW4gdGhl
IGtlcm5lbCB0byBzZWxlY3QgdGhlIHJpZ2h0IHZhcmlhbnQuIFRoYXQgbWVhbnMgaGF2aW5nIGEg
Y29ycmVjdAo+ID4gPiA+ID4gZGVzY3JpcHRpb24gaW4gRFQgZm9yIHRoZSBrZXJuZWwgdG8gdXNl
Lgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGFwcHJvYWNoIEknbSB1c2luZyBpcyBJTU8gcXVpdGUgc2lt
aWxhciB0byBzYXkgb3RoZXIgaGFyZHdhcmUKPiA+ID4gPiB2YXJpYW50IHJ1bnRpbWUgZGV0ZWN0
aW9uIERUIGZlYXR1cmVzIGxpa2UgdGhpczoKPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvY29tbWl0LzE1N2NlOGYzODFlZmUyNjQ5MzNlOTM2NmRiODI4ZDg0NWJhZGUz
YTEKPiA+ID4KPiA+ID4gVGhhdCBpcyBmb3IgdGhpbmdzIGxpbmsgYSBIQVQgb24gYSBSUGkuIEl0
IGlzIHNvbWV0aGluZyB3aGljaCBpcyBlYXN5Cj4gPiA+IHRvIHJlcGxhY2UsIGFuZCBpcyBleHBl
Y3RlZCB0byBiZSByZXBsYWNlZC4KPiA+Cj4gPiBBY3R1YWxseSBpdCdzIGZvciBzZWNvbmQgc291
cmNlZCBjb21wb25lbnRzIHRoYXQgYXJlIG1vZHVsZXMgX3dpdGhpbl8KPiA+IHRoZSBkZXZpY2Ug
KGEgdGFibGV0IG9yIGEgbGFwdG9wKSB0aGF0IGdldCBzd2FwcGVkIGluIGF0IHRoZSBmYWN0b3J5
Lgo+ID4gRGVmaW5pdGVseSBub3Qgc29tZXRoaW5nIGVhc3kgdG8gcmVwbGFjZSBhbmQgbm90IGV4
cGVjdGVkIHRvIGJlIHJlcGxhY2VkCj4gPiBieSB0aGUgZW5kIHVzZXIuCj4gCj4gWWVhaCwgdG8g
bWUgaXQgc2VlbXMgbGlrZSB0aGUgUEhZIHNpdHVhdGlvbiBpcyBzaW1pbGFyLCBpdCdzIG5vdCBy
ZXBsYWNlYWJsZQo+IGR1ZSB0byBiZWluZyBjb3BhY2thZ2VkLCBpdCBzZWVtcyB0aGUgdmVuZG9y
IGp1c3Qgc3dpdGNoZWQgb3ZlciB0byBhCj4gc2Vjb25kIHNvdXJjZSBmb3IgdGhlIFBIWSBwYXJ0
d2F5IHRocm91Z2ggdGhlIHByb2R1Y3Rpb24gcnVuIHdpdGhvdXQKPiBkaXN0aW5ndWlzaGluZyBk
aWZmZXJlbnQgU29DIHZhcmlhbnRzIHdpdGggbmV3IG1vZGVsIG51bWJlcnMuCj4gCj4gS2VlcCBp
biBtaW5kIHN0bW1hYyBpdHNlbGYgaW1wbGVtZW50cyBtZGlvIFBIWSBzY2FubmluZyBhbHJlYWR5
LAo+IHdoaWNoIGlzIGEgZm9ybSBvZiBydW50aW1lIFBIWSBhdXRvZGV0ZWN0aW9uLCBzbyBJIGRv
bid0IHJlYWxseSBzZWUKPiBob3cgZG9pbmcgbnZtZW0vZWZ1c2UgYmFzZWQgUEhZIGF1dG9kZXRl
Y3Rpb24gaXMgYWxsIHRoYXQgZGlmZmVyZW50Cj4gZnJvbSB0aGF0IGFzIGJvdGggYXJlIGZvcm1z
IG9mIFBIWSBydW50aW1lIGF1dG9kZXRlY3Rpb24uCgpXaGF0IGlzIGRpZmZlcmVudCBpcyB1c2lu
ZyAicGh5cyIgYW5kICJwaHktbmFtZXMiIHdoaWNoIGhpc3RvcmljYWxseQpoYXMgbmV2ZXIgYmVl
biB1c2VkIGZvciBldGhlcm5ldCBQSFlzLiBUaGVzZSBoYXZlIGJlZW4gdXNlZCBmb3Igc2VyZGVz
ClBIWXMgKGUuZy4gbXVsdGktcHJvdG9jb2wgUEhZcyB0aGF0IHN1cHBvcnQgUENJZSwgU0FUQSwg
YW5kIGV0aGVybmV0CnByb3RvY29scyBidXQgZG8gbm90IHByb3ZpZGUgZXRoZXJuZXQgUEhZIGNh
cGFiaWxpdHkpLgoKSGlzdG9yaWNhbGx5LCAicGh5cyIgYW5kICJwaHktbmFtZXMiIGhhdmUgYmVl
biB0aGUgZG9tYWluIG9mCmRyaXZlcnMvcGh5IGFuZCBub3QgZHJpdmVycy9uZXQvcGh5LiBkcml2
ZXJzL25ldC9waHkgUEhZcyBoYXZlCmJlZW4gZGVzY3JpYmVkIHVzaW5nICJwaHktaGFuZGxlIi4K
ClNvLCB5b3UncmUgZGV2aWF0aW5nIGZyb20gdGhlIGNvbW1vbiB1c2FnZSBwYXR0ZXJuLCBhbmQg
SSdtIG5vdCBzdXJlCndoZXRoZXIgdGhhdCBoYXMgYmVlbiBtYWRlIGNsZWFyIHRvIHRoZSBEVCBt
YWludGFpbmVycyB0aGF0IHRoYXQgaXMKd2hhdCBpcyBnb2luZyBvbiBpbiB0aGlzIHBhdGNoIHNl
cmllcy4KCkFzIGZvciB0aGUgUEhZIHNjYW5uaW5nIGlzIGEgZHJpdmVyIGltcGxlbWVudGF0aW9u
IGlzc3VlOyBpdCBkb2Vzbid0CmhhdmUgYW55IGVmZmVjdCBvbiBkZXZpY2UgdHJlZSwgaXQgZG9l
c24ndCAiYWJ1c2UiIERUIHByb3BlcnRpZXMgdG8KZG8gc28uIFRoZSBQSFkgc2Nhbm5pbmcgaXMg
bGlrZWx5IGhpc3RvcmljYWwsIHByb2JhYmx5IGZyb20gdGltZXMKd2hlcmUgdGhlIHN0bW1hYyBw
bGF0Zm9ybSBkYXRhIHdhcyBwcm92aWRlZCBieSBib2FyZCBmaWxlcyAodGh1cwpoYXZpbmcgdGhl
IGZpcnN0IGRldGVjdGVkIFBIWSBtYWRlIHRoaW5ncyBzaW1wbGVyLikgVGhlcmVmb3JlLCBJCmRv
bid0IHRoaW5rIHVzaW5nIGl0IGFzIGEganVzdGlmaWNhdGlvbiBmb3IgbW9yZSAiYXV0b2RldGVj
dGlvbiIKc3RhbmRzIHVwLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJt
bGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3du
IDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
