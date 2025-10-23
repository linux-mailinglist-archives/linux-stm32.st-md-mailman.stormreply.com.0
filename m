Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA65C00990
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 12:59:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACDB2C5EC62;
	Thu, 23 Oct 2025 10:59:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1613C5EC5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 10:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXNqIy91mHPmLyBUYzLy8qeZ7FOKJrKClaIbZivIa/4=; b=ljnUuImE9Pjqxqy0Uz5qYz6n9e
 mGCtjIUZIsd8VeoxBNlc51Frunk5tzXuigWR4oE67G5/H6szRyYTez9MIgvnmQSNh4Mw0eOydkivV
 mD4YugCenid+cFxILBA/x/XzqQa/ZL4mutB4tYA0aeKv9M1Q3dNzphSJD6Sd0Tbl58dUax4bFVDo/
 viI2gysJGHzHvM0rj+FTKe7sYmxNOGmMcpGO0j4gw2+c479jYSr/16oHGCDRG4Cj3fANteVJGbu5z
 RCo/wbUYOg/Lbi7u6XKIkydMPRrDNHOXF9ZuDsZ71qFEW3wnqTcn2u60T8c7lhjC46U1T82xbnjmE
 aJL5ohPw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41112)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBt2S-000000006EA-3ZEb;
 Thu, 23 Oct 2025 11:59:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBt2P-000000001d1-35L8; Thu, 23 Oct 2025 11:59:21 +0100
Date: Thu, 23 Oct 2025 11:59:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <aPoKiREmRurn-Mle@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
 <d7bbb7dd-ddc6-43d6-b234-53213bde71bd@altera.com>
 <83ffc316-6711-4ae4-ad10-917f678de331@linux.dev>
 <0d3a8abe-773c-4859-9d6f-d08c118ce610@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d3a8abe-773c-4859-9d6f-d08c118ce610@altera.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN
 offload tag length for maxSDU
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

T24gU2F0LCBPY3QgMTgsIDIwMjUgYXQgMDc6MjA6MDNBTSArMDUzMCwgRyBUaG9tYXMsIFJvaGFu
IHdyb3RlOgo+IEhpIFZhZGltLAo+IAo+IE9uIDEwLzE3LzIwMjUgNTo1MSBQTSwgVmFkaW0gRmVk
b3JlbmtvIHdyb3RlOgo+ID4gT24gMTcvMTAvMjAyNSAwODozNiwgRyBUaG9tYXMsIFJvaGFuIHdy
b3RlOgo+ID4gPiBIaSBBbGwsCj4gPiA+IAo+ID4gPiBPbiAxMC8xNy8yMDI1IDExOjQxIEFNLCBS
b2hhbiBHIFRob21hcyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gPiA+ID4gK8KgwqDCoCBzZHVfbGVu
ID0gc2tiLT5sZW47Cj4gPiA+ID4gwqDCoMKgwqDCoCAvKiBDaGVjayBpZiBWTEFOIGNhbiBiZSBp
bnNlcnRlZCBieSBIVyAqLwo+ID4gPiA+IMKgwqDCoMKgwqAgaGFzX3ZsYW4gPSBzdG1tYWNfdmxh
bl9pbnNlcnQocHJpdiwgc2tiLCB0eF9xKTsKPiA+ID4gPiArwqDCoMKgIGlmIChoYXNfdmxhbikK
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgc2R1X2xlbiArPSBWTEFOX0hMRU47Cj4gPiA+ID4gKwo+
ID4gPiA+ICvCoMKgwqAgaWYgKHByaXYtPmVzdCAmJiBwcml2LT5lc3QtPmVuYWJsZSAmJgo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoCBwcml2LT5lc3QtPm1heF9zZHVbcXVldWVdICYmCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgIHNrYi0+bGVuID4gcHJpdi0+ZXN0LT5tYXhfc2R1W3F1ZXVlXSl7Cj4g
PiA+IAo+ID4gPiBJIGp1c3Qgbm90aWNlZCBhbiBpc3N1ZSB3aXRoIHRoZSByZXdvcmtlZCBmaXgg
YWZ0ZXIgc2VuZGluZyB0aGUgcGF0Y2guCj4gPiA+IFRoZSBjb25kaXRpb24gc2hvdWxkIGJlOiBz
ZHVfbGVuID4gcHJpdi0+ZXN0LT5tYXhfc2R1W3F1ZXVlXQo+ID4gPiAKPiA+ID4gSeKAmWxsIHNl
bmQgYSBjb3JyZWN0ZWQgdmVyc2lvbiwgYW5kIHdpbGwgd2FpdCBmb3IgYW55IGFkZGl0aW9uYWwg
Y29tbWVudHMKPiA+ID4gaW4gdGhlIG1lYW50aW1lLgo+ID4gCj4gPiBXZWxsLCBldmVuIHRob3Vn
aCBpdCdzIGEgY29weSBvZiBvcmlnaW5hbCBjb2RlLCBpdCB3b3VsZCBiZSBnb29kIHRvCj4gPiBp
bXByb3ZlIHNvbWUgZm9ybWF0dGluZyBhbmQgYWRkIGEgc3BhY2UgYXQgdGhlIGVuZCBvZiBpZiBz
dGF0ZW1lbnQgdG8KPiA+IG1ha2UgaXQgbG9vayBsaWtlICdpZiAoKSB7Jz4KPiAKPiBUaGFua3Mg
Zm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJJ2xsIGZpeCB0aGUgZm9ybWF0dGluZyBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgoKSSBzdWdnZXN0OgoKRmlyc3QgcGF0Y2ggLSBmaXggZm9ybWF0dGluZy4KU2Vj
b25kIHBhdGNoIC0gbW92ZSB0aGUgY29kZS4KCldlIGhhdmUgYSBnZW5lcmFsIHJ1bGUgdGhhdCB3
aGVuIGNvZGUgaXMgbW92ZWQsIGl0IHNob3VsZCBiZSBtb3ZlZCB3aXRoCm5vIGNoYW5nZXMgLSBv
dGhlcndpc2UgaXQgbWFrZXMgcmV2aWV3IG11Y2ggaGFyZGVyLgoKVGhhbmtzLgoKLS0gClJNSydz
IFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRj
aGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rp
dml0eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
