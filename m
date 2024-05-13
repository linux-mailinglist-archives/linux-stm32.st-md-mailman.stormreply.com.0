Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF798C47E0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 21:52:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 807EFC6A61D;
	Mon, 13 May 2024 19:52:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 298D0C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=413blUidoZWelONSsN0SMSimPfYxVtpWsVLy1UsodyE=; b=Hj
 kpJ9i7j63HHIGE8iWKQpPmGWAhk2KaaRQMv3bM76nCk15Un+1uyE/2KAqkk5dMahEAZRQfEe6XLFV
 hFaRpBlCIS2/lQ1+cJB+BpSwhrdN+TMBq6BjjMbepbomlwauFsj1XB9k5qZOqQPr5M6oP8nQjWu33
 TvR6/xe16rM1Coo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1s6biq-00FKdS-HE; Mon, 13 May 2024 21:52:32 +0200
Date: Mon, 13 May 2024 21:52:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <ea0485f6-fc7d-4e02-884c-05d77420d6ea@lunn.ch>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <Zj/IPpub11OL3jBo@shell.armlinux.org.uk>
 <CAMdnO-KCC0qXEsE1iDGNZwdd0PAcsRinmxe8_-5Anp=e1c5WFA@mail.gmail.com>
 <ZkJQz9u8pQ9YmM5n@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZkJQz9u8pQ9YmM5n@shell.armlinux.org.uk>
Cc: Herve Codina <herve.codina@bootlin.com>, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

T24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgMDY6NDE6MzVQTSArMDEwMCwgUnVzc2VsbCBLaW5nIChP
cmFjbGUpIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDEzLCAyMDI0IGF0IDEwOjM4OjQ2QU0gLTA3MDAs
IEppdGVuZHJhIFZlZ2lyYWp1IHdyb3RlOgo+ID4gVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBh
dGNoLgo+ID4gT24gU2F0LCBNYXkgMTEsIDIwMjQgYXQgMTI6MzTigK9QTSBSdXNzZWxsIEtpbmcg
KE9yYWNsZSkKPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gPiBBcyBwb2lu
dGVkIG91dCBpbiB0aGUgb3RoZXIgc3ViLXRocmVhZCwgeW91IGRvbid0IG5lZWQgdGhpcy4gSWYg
eW91IG5lZWQKPiA+ID4gYSBmaXhlZC1saW5rIGFuZCB5b3UgZG9uJ3QgaGF2ZSBhIGZpcm13YXJl
IGRlc2NyaXB0aW9uIG9mIGl0LCB5b3UgY2FuCj4gPiA+IHByb3ZpZGUgYSBzd25vZGUgYmFzZWQg
ZGVzY3JpcHRpb24gdGhyb3VnaCBwbGF0LT5wb3J0X25vZGUgdGhhdCB3aWxsIGJlCj4gPiA+IHBh
c3NlZCB0byBwaHlsaW5rLiBUaHJvdWdoIHRoYXQsIHlvdSBjYW4gdGVsbCBwaHlsaW5rIHRvIGNy
ZWF0ZSBhCj4gPiA+IGZpeGVkIGxpbmsuCj4gPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHRoZSBwb2lu
dGVycyBvciBzb2Z0d2FyZSBub2RlIHN1cHBvcnQuCj4gPiBTaW5jZSB0aGUgZHJpdmVyIGlzIGlu
aXRpYWxseSB0YXJnZXR0ZWQgZm9yIFg4Ni9fNjQsIHdlIHdlcmUgbm90IHN1cmUKPiA+IGhvdyB0
byBkZWFsIHdpdGggbGFjayBvZiBPRiBzdXBwb3J0Lgo+ID4gV2Ugd2lsbCB0cnkgb3V0IHRoZSBz
b2Z0d2FyZSBub2RlIGZhY2lsaXR5Lgo+IAo+IFlvdSBtYXkgd2lzaCB0byBoYXZlIGEgbG9vayBh
dCBkcml2ZXJzL25ldC9ldGhlcm5ldC93YW5neHVuLyB3aGljaAo+IGFsc28gY3JlYXRlcyBzb2Z0
d2FyZSBub2RlcyBmb3IgcGh5bGluay4KCkhvdyBjb21wbGV4IGlzIHRoZSBzd2l0Y2ggY29uZmln
dXJhdGlvbj8gU28gZmFyLCB5b3UgaGF2ZSBub3Qgc2FpZAphbnl0aGluZyBhYm91dCBpdC4gSXMg
aXQgZGVyaXZlZCBmcm9tIGI1My9TRjI/CgpUaGVyZSBpcyBhbiBhbHRlcm5hdGl2ZSByb3V0ZSB5
b3UgY2FuIHRha2UuIFdvcmsgd2l0aCBib290bGluIGFuZCB1c2UKRFQgb3ZlcmxheXMuCgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyNDA0MzAwODM3MzAuMTM0OTE4LTEtaGVy
dmUuY29kaW5hQGJvb3RsaW4uY29tLwoKTG9va2luZyBhdCB0aGUgcHJvZHVjdCBicmllZiwgdGhl
IEJDTTg5NTg2TSBoYXMgTURJTyBidXNzZXMsIFNQSQpidXNzZXMsIEdQSU8sIGV0Yy4gSXQgaXMg
dW5jbGVhciBpZiB0aGVzZSBhcmUgYXZhaWxhYmxlIG9uIHRoZSBQQ0llCmludGVyZmFjZSwgb3Ig
YXJlIG9ubHkgY29ubmVjdGVkIHRvIHRoZSBDb3J0ZXgtTTc/IEkgd291bGQgZ3Vlc3MgdGhlClFT
UEksIERFQlVHL0pUQUcgYW5kIHRoZSBVQVJUIGdvIHRvIHRoZSBNNywgZm9yIGl0cyBib290IG1l
ZGlhIGFuZApjb25zb2xlLiBCdXQgdGhlIG90aGVyIGludGVyZmFjZXMgY291bGQgYmUgZm9yIExp
bnV4IHRvIGNvbnRyb2wgb3Zlcgp0aGUgUENJZS4gQWRkaXRpb25hbGx5LCB0aGUgUEhZLWxlc3Mg
cG9ydHMgZG9pbmcgWEZJLCA1RywgMi41RyBTR01JSQpldGMsIHdvdWxkIGhhdmUgZWl0aGVyIGFu
IFNGUCBvciBtdWx0aS1naWdpIFBIWSBjb25uZWN0ZWQsIGhhbmdpbmcgb2YKb25lIG9mIHRoZSBN
RElPIGJ1c3NlcywgR1BJT3MgdXNlZCBmb3IgU0ZQIExPUywgVFgtZW5hYmxlIGV0Yy4gT2RkbHkK
dGhlcmUgaXMgbm8gSTJDIGZvciB0aGUgU1BGLCBidXQgaSBzdXBwb3NlIHlvdSBjb3VsZCBkbyBT
UEktPkkyQy4KQW55d2F5LCBhbGwgdGhhdCBpcyBnb2luZyB0byBuZWVkIGEgY29tcGxleCBjb25m
aWd1cmF0aW9uLCBzbyBtYXliZSBEVApvdmVybGF5cyBtYWtlIHNlbnNlLCBiZWNhdXNlIG9uY2Ug
dGhlIGluaXRpYWwgd29yayBnZXR0aW5nIEJvb3RsaW5zCnBhdGNoZXMgbWVyZ2VkIGlzIGNvbXBs
ZXRlLCB5b3UgZ2V0IHRoZSByZXN0IHByZXR0eSBtdWNoIGZvciBmcmVlLgoKCUFuZHJldwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
