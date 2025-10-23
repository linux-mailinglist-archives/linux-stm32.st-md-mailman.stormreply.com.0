Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B8C0095D
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 12:54:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4950FC5EC5F;
	Thu, 23 Oct 2025 10:54:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8959C5A4C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 10:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P5H/X2O6VAth3+1IJiZ1jVADDRZOBh553gExnuinE6g=; b=Pf30+2tgWHWff05MLYY0zw/0+w
 abhcaYZwkQ0qPJr4E85uSPGBRk37p6qmfNoCVIxrBYfZCf8tOmpPEQJbblRJoZOCPOLObmbV/wvPO
 uoVUr+lEphTXs9FQ9lp7Ty3ukn6EbY+cuU9CjUwYcdbXM9lcSfZCHvb7pS1TaajOqUYOdcmb+bYnz
 23KRqaGwo77hReiEZUy5NBKDJvqtwSIfQ1zPJk1uwJSjCpWFbhzIpKvfPO7VnLWUwHPzkGWDIPQmA
 lfcHw/CMNhIUXbIa7hewF4ETVeKLDIjTMnFGgcBAxt0qt06glhbgO9iD1tDuu+Dd8dPEB+vOLzwXm
 PevYaXlA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45430)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBsxV-000000006Cw-1WVS;
 Thu, 23 Oct 2025 11:54:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBsxQ-000000001cU-0p2n; Thu, 23 Oct 2025 11:54:12 +0100
Date: Thu, 23 Oct 2025 11:54:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <aPoJVOUe-ASx1GmV@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
 <aPI5pBXnh5X7OXtG@shell.armlinux.org.uk>
 <e45a8124-ace8-40bf-b55f-56dc8fbe6987@altera.com>
 <1abbcd93-6144-440c-90d9-439d0f18383b@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1abbcd93-6144-440c-90d9-439d0f18383b@altera.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, "Ng,
 Boon Khai" <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v3 1/3] net: stmmac: vlan: Disable
 802.1AD tag insertion offload
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMDk6MDE6MjBBTSArMDUzMCwgRyBUaG9tYXMsIFJvaGFu
IHdyb3RlOgo+IEhpIFJ1c3NlbGwsCj4gCj4gT24gMTAvMTgvMjAyNSA3OjI2IEFNLCBHIFRob21h
cywgUm9oYW4gd3JvdGU6Cj4gPiBIaSBSdXNzZWxsLAo+ID4gCj4gPiBPbiAxMC8xNy8yMDI1IDY6
MTIgUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+ID4gT24gRnJpLCBPY3QgMTcs
IDIwMjUgYXQgMDI6MTE6MTlQTSArMDgwMCwgUm9oYW4gRyBUaG9tYXMgdmlhIEI0IFJlbGF5IHdy
b3RlOgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWNfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX21haW4uYwo+ID4gPiA+IGluZGV4IDY1MGQ3NWI3M2UwYjBlY2QwMmQzNWRkNWQ2YTg3
NDJkNDUxODhjNDcuLmRlZGFhZWYzMjA4YmZhZGMxMDU5NjEwMjlmNzlkMGQyNmMzMjg5ZDggMTAw
NjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX21haW4uYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMKPiA+ID4gPiBAQCAtNDA4OSwxOCArNDA4OSwxMSBAQCBzdGF0aWMg
aW50IHN0bW1hY19yZWxlYXNlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCj4gPiA+ID4gICAgc3Rh
dGljIGJvb2wgc3RtbWFjX3ZsYW5faW5zZXJ0KHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiwgc3Ry
dWN0IHNrX2J1ZmYgKnNrYiwKPiA+ID4gPiAgICAJCQkgICAgICAgc3RydWN0IHN0bW1hY190eF9x
dWV1ZSAqdHhfcSkKPiA+ID4gPiAgICB7Cj4gPiA+ID4gLQl1MTYgdGFnID0gMHgwLCBpbm5lcl90
YWcgPSAweDA7Cj4gPiA+ID4gLQl1MzIgaW5uZXJfdHlwZSA9IDB4MDsKPiA+ID4gPiArCXUxNiB0
YWcgPSAweDA7Cj4gPiA+ID4gICAgCXN0cnVjdCBkbWFfZGVzYyAqcDsKPiA+ID4gCj4gPiA+ICNp
bmNsdWRlIDxzdGRuZXRkZXZjb2RlZm9ybWF0Lmg+IC0gUGxlYXNlIG1haW50YWluIHJldmVyc2Ug
Y2hyaXN0bWFzLQo+ID4gPiB0cmVlIG9yZGVyLgo+ID4gCj4gPiBUaGFua3MgZm9yIHBvaW50aW5n
IHRoaXMgb3V0LiBJJ2xsIGZpeCB0aGUgZGVjbGFyYXRpb24gb3JkZXIgaW4gdGhlIG5leHQKPiA+
IHJldmlzaW9uLgo+ID4gCj4gPiA+IAo+ID4gPiBJIGhhdmVuJ3QgeWV0IHJlZmVycmVkIHRvIHRo
ZSBkYXRhYm9vaywgc28gdGhlcmUgbWF5IGJlIG1vcmUgY29tbWVudHMKPiA+ID4gY29taW5nIG5l
eHQgd2Vlay4KPiA+ID4gCj4gPiAKPiA+IFN1cmUhIFdpbGwgd2FpdCBmb3IgeW91ciBmZWVkYmFj
ayBiZWZvcmUgc2VuZGluZyB0aGUgbmV4dCByZXZpc2lvbi4KPiAKPiBKdXN0IGNoZWNraW5nIGlu
IOKAlCBoYXZlIHlvdSBoYWQgYSBjaGFuY2UgdG8gcmV2aWV3IHRoZSBwYXRjaCBmdXJ0aGVyPyBP
cgo+IHdvdWxkIGl0IGJlIG9rYXkgZm9yIG1lIHRvIGdvIGFoZWFkIGFuZCBzZW5kIHRoZSBuZXh0
IHJldmlzaW9uIGZvcgo+IHJldmlldz8KCkkndmUgY2hlY2tlZCBteSB2ZXJzaW9uIG9mIHRoZSBk
YXRhYm9vaywgYW5kIHRoZSBjb3JlIHZlcnNpb24gdGhhdCBoYXMKVkxJTlMvRFZMQU4gYW5kIG15
IGRhdGFib29rIGRvZXNuJ3QgY292ZXIgdGhpcy4gU28gSSdtIGFmcmFpZCBJIGNhbid0CnJldmll
dyBmdXJ0aGVyLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgu
b3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJw
cyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
