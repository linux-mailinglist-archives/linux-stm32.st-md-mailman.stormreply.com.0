Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBBA63D4F7
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 12:51:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDFF3C65073;
	Wed, 30 Nov 2022 11:51:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13964C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SeprZaUCrg6YMDUQVxQrpsNw17qVCxSs694K/ikvslE=; b=DnY+sP3ETdi6+M6MeNzJpuGBM6
 3Q6mYmwux7sT7CkxU9xl+BfJZD/l/CWSP7TJ89V45p9uBVpPkx93KWoG0cc3IYXfqmRGy6/3sjbb2
 78COo1ggeQOWJ9vPx3R3AMbUuwvnNPNDg8DA8Wn0cCOnN3ofoQnrNeLi2AjJnyFeBHVx8YX2IsuR+
 3P1WvrTUBxgG1MZWTnEC21nXmOBjnawcYVt7AfFcfeJ1MJ242SqdZYl8tm1PRWZQbayVKpSx/BaSs
 y2BgKvCaFE3O/hRa66dxpbjWwiBKoPLlN/07nYrBtiDMqM2mwRX64X7uXf/sM9qJS6/C7lpYN12V0
 t/t3DfAA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35498)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1p0Lc5-0001fp-7X; Wed, 30 Nov 2022 11:50:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1p0Lc2-0002TM-C2; Wed, 30 Nov 2022 11:50:50 +0000
Date: Wed, 30 Nov 2022 11:50:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <Y4dDmvOQwuIYxgro@shell.armlinux.org.uk>
References: <20221130111148.1064475-1-xiaoning.wang@nxp.com>
 <20221130111148.1064475-2-xiaoning.wang@nxp.com>
 <Y4c9PlfEC17pVE08@shell.armlinux.org.uk>
 <HE1PR0402MB2939242DB6E909B4A62109E5F3159@HE1PR0402MB2939.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <HE1PR0402MB2939242DB6E909B4A62109E5F3159@HE1PR0402MB2939.eurprd04.prod.outlook.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] net: phylink: add sync flag mac_ready
 to fix resume issue with WoL enabled
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

T24gV2VkLCBOb3YgMzAsIDIwMjIgYXQgMTE6MzI6MDlBTSArMDAwMCwgQ2xhcmsgV2FuZyB3cm90
ZToKPiBIaSBSdXNzZWxsLAo+IAo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZy
b206IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgo+ID4gU2VudDogMjAyMuW5
tDEx5pyIMzDml6UgMTk6MjQKPiA+IFRvOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5j
b20+Cj4gPiBDYzogcGVwcGUuY2F2YWxsYXJvQHN0LmNvbTsgYWxleGFuZHJlLnRvcmd1ZUBmb3Nz
LnN0LmNvbTsKPiA+IGpvYWJyZXVAc3lub3BzeXMuY29tOyBkYXZlbUBkYXZlbWxvZnQubmV0OyBl
ZHVtYXpldEBnb29nbGUuY29tOwo+ID4ga3ViYUBrZXJuZWwub3JnOyBwYWJlbmlAcmVkaGF0LmNv
bTsgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbTsKPiA+IGFuZHJld0BsdW5uLmNoOyBoa2FsbHdl
aXQxQGdtYWlsLmNvbTsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsKPiA+IGxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb207Cj4gPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMS8yXSBuZXQ6IHBoeWxpbms6IGFkZCBzeW5jIGZsYWcgbWFjX3JlYWR5IHRvIGZp
eCByZXN1bWUKPiA+IGlzc3VlIHdpdGggV29MIGVuYWJsZWQKPiA+IAo+ID4gT24gV2VkLCBOb3Yg
MzAsIDIwMjIgYXQgMDc6MTE6NDdQTSArMDgwMCwgQ2xhcmsgV2FuZyB3cm90ZToKPiA+ID4gSXNz
dWUgd2UgbWV0Ogo+ID4gPiBPbiBzb21lIHBsYXRmb3JtcywgbWFjIGNhbm5vdCB3b3JrIGFmdGVy
IHJlc3VtZWQgZnJvbSB0aGUgc3VzcGVuZCB3aXRoCj4gPiA+IFdvTCBlbmFibGVkLgo+ID4gPgo+
ID4gPiBUaGUgY2F1c2Ugb2YgdGhlIGlzc3VlOgo+ID4gPiAxLiBwaHlsaW5rX3Jlc29sdmUoKSBp
cyBpbiBhIHdvcmtxdWV1ZSB3aGljaCB3aWxsIG5vdCBiZSBleGVjdXRlZCBpbW1lZGlhdGVseS4K
PiA+ID4gICAgVGhpcyBpcyB0aGUgY2FsbCBzZXF1ZW5jZToKPiA+ID4gICAgICAgIHBoeWxpbmtf
cmVzb2x2ZSgpLT5waHlsaW5rX2xpbmtfdXAoKS0+cGwtPm1hY19vcHMtPm1hY19saW5rX3VwKCkK
PiA+ID4gICAgRm9yIHN0bW1hYyBkcml2ZXIsIG1hY19saW5rX3VwKCkgd2lsbCBzZXQgdGhlIGNv
cnJlY3Qgc3BlZWQvZHVwbGV4Li4uCj4gPiA+ICAgIHZhbHVlcyB3aGljaCBhcmUgZnJvbSBsaW5r
X3N0YXRlLgo+ID4gPiAyLiBJbiBzdG1tYWNfcmVzdW1lKCksIGl0IHdpbGwgY2FsbCBzdG1tYWNf
aHdfc2V0dXAoKSBhZnRlciBjYWxsZWQgdGhlCj4gPiA+ICAgIHBoeWxpbmtfcmVzdW1lKCkuIHN0
bW1hY19jb3JlX2luaXQoKSBpcyBjYWxsZWQgaW4gZnVuY3Rpb24KPiA+ID4gc3RtbWFjX2h3X3Nl
dHVwKCksCj4gPiAKPiA+IC4uLiBhbmQgdGhhdCBpcyB3aGVyZSB0aGUgcHJvYmxlbSBpcy4gRG9u
J3QgY2FsbCBwaHlsaW5rX3Jlc3VtZSgpIGJlZm9yZSB5b3VyCj4gPiBoYXJkd2FyZSBpcyByZWFk
eSB0byBzZWUgYSBsaW5rLXVwIGV2ZW50Lgo+IAo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlv
dXIgcmVwbHkhCj4gCj4gWW91IGFyZSByaWdodC4KPiAKPiBIb3dldmVyLCBzdG1tYWMgcmVxdWly
ZXMgUlhDIHRvIGhhdmUgYSBjbG9jayBpbnB1dCB3aGVuIHBlcmZvcm1pbmcgYSByZXNldChpbiBz
dG1tYWNfaHdfc2V0dXAoKSkuIE9uIG91ciBib2FyZCwgUlhDIGlzIHByb3ZpZGVkIGJ5IHRoZSBw
aHkuCj4gCj4gSW4gV29MIG1vZGUsIHRoaXMgaXMgbm90IGEgcHJvYmxlbSwgYmVjYXVzZSB0aGUg
cGh5IHdpbGwgbm90IGJlIGRvd24gd2hlbiBzdXNwZW5kLiBSWEMgd2lsbCBrZWVwIG91dHB1dC4g
QnV0IGluIG5vcm1hbCBzdXNwZW5kKHdpdGhvdXQgV29MKSwgdGhlIHBoeSB3aWxsIGJlIGRvd24s
IHdoaWNoIGRvZXMgbm90IGd1YXJhbnRlZSB0aGUgb3V0cHV0IG9mIHRoZSBSWEMgb2YgdGhlIHBo
eS4gVGhlcmVmb3JlLCB0aGUgcHJldmlvdXMgY29kZSB3aWxsIGNhbGwgcGh5bGlua19yZXN1bWUo
KSBiZWZvcmUgc3RtbWFjX2h3X3NldHVwKCkuCgpJIHRoaW5rIHdlIG5lZWQgcGh5bGlua19waHlf
cmVzdW1lKCkgd2hpY2ggc3RtbWFjIGNhbiB1c2UgdG8gcmVzdW1lIHRoZQpQSFkgd2l0aG91dCBy
ZXN1bWluZyBwaHlsaW5rLCBhc3N1bWluZyB0aGF0IHdpbGwgb3V0cHV0IHRoZSBSWEMuIFdoaWNo
ClBIWSBkcml2ZXIocykgYXJlIHVzZWQgd2l0aCBzdG1tYWM/CgotLSAKUk1LJ3MgUGF0Y2ggc3lz
dGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAg
aXMgaGVyZSEgNDBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxh
c3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
