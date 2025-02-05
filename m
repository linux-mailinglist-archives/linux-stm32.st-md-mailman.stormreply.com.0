Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C57A290B6
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 15:40:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64813C78F88;
	Wed,  5 Feb 2025 14:40:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87838C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0bL3gxLmyKoIOFUQltNWan7x+Q3hxZzBXfuqkmaS2PY=; b=VeLMyF8biNfumqmuZmc/C6wCWs
 cYHL1aCStiFMh3q45g/T0gP/yblv4P2Sr/aG2NKh5HsTcytUdyGSRMXfQHuOl00YgiuU8X10nSp4d
 kknFpGsZJs26ahI6wJZ5Np3T8QPegTgBgvDL/erMWki4TMPAzMFMssXY7J5BWBYT7glwODUwdaCkH
 sVLbHj3pwXrk/oHU+rfSNeXfURFWx/Doph3ecygwITrKTsKOMC40Gb98HftgsxOQguZc+G0grkk46
 E+l2hNjQaqhq46/kyWqSK8dor0UoSKkUpcC2R9AtG2kDqWJrcf1r7XUM9TdmkY+oKoFZni+5d3qWy
 hoQTXHUw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54016)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tfgZ3-0007N2-1Q;
 Wed, 05 Feb 2025 14:39:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tfgYx-0002Uc-2s;
 Wed, 05 Feb 2025 14:39:35 +0000
Date: Wed, 5 Feb 2025 14:39:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yanteng Si <si.yanteng@linux.dev>
Message-ID: <Z6N4J-_C3lq5a_VQ@shell.armlinux.org.uk>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk>
 <20250203142342.145af901@kernel.org>
 <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
Cc: Furong Xu <0x1207@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Petr Tesarik <petr@tesarici.cz>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Steven Price <steven.price@arm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Xi Ruoyao <xry111@xry111.site>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Allow zero for
	[tr]x_fifo_size
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

T24gV2VkLCBGZWIgMDUsIDIwMjUgYXQgMTA6MjI6MDBQTSArMDgwMCwgWWFudGVuZyBTaSB3cm90
ZToKPiAKPiDlnKggMi80LzI1IDA2OjIzLCBKYWt1YiBLaWNpbnNraSDlhpnpgZM6Cj4gPiBPbiBN
b24sIDMgRmViIDIwMjUgMTE6MTY6MzQgKzAwMDAgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3Rl
Ogo+ID4gPiA+IEkndmUgbm8gb3BpbmlvbiB3aGV0aGVyIHRoZSBvcmlnaW5hbCBzZXJpZXMgImhh
ZCB2YWx1ZSIgLSBJJ20ganVzdAo+ID4gPiA+IHRyeWluZyB0byBmaXggdGhlIGJyZWFrYWdlIHRo
YXQgZW50YWlsZWQuIE15IGZpcnN0IGF0dGVtcHQgYXQgYSBwYXRjaAo+ID4gPiA+IHdhcyBpbmRl
ZWQgYSAocGFydGlhbCkgcmV2ZXJ0LCBidXQgQW5kcmV3IHdhcyBrZWVuIHRvIGZpbmQgYSBiZXR0
ZXIKPiA+ID4gPiBzb2x1dGlvblsxXS4KPiA+ID4gVGhlcmUgYXJlIHR3byB3YXlzIHRvIGZpeCB0
aGUgYnJlYWthZ2UgLSBlaXRoZXIgcmV2ZXJ0IHRoZSBvcmlnaW5hbAo+ID4gPiBwYXRjaGVzICh3
aGljaCBpZiB0aGV5IGhhdmUgbGl0dGxlIHZhbHVlIG5vdyB3b3VsZCBiZSB0aGUgc2Vuc2libGUK
PiA+ID4gYXBwcm9hY2ggSU1ITykKPiA+ICsxLCBJIGFsc28gdm90ZSByZXZlcnQgRldJVwo+IAo+
ICsxLCBzYW1lIGhlcmUuCj4gCj4gCj4gRm9yIGEgZHJpdmVyIHRoYXQgcnVucyBvbiBzbyBtdWNo
IGhhcmR3YXJlLCB3ZSBuZWVkIHRvIGFjdAo+IAo+IGNhdXRpb3VzbHkuIEEgY3J1Y2lhbCBwcmVy
ZXF1aXNpdGUgaXMgdGhhdCBjb2RlIGNoYW5nZXMgbXVzdAo+IAo+IG5ldmVyIGNhdXNlIHNvbWUg
aGFyZHdhcmUgdG8gbWFsZnVuY3Rpb24uIEkgd2FzIHRvbyBzaW1wbGlzdGljCj4gCj4gaW4gbXkg
dGhpbmtpbmcgd2hlbiByZXZpZXdpbmcgdGhpcyBiZWZvcmUsIGFuZCBJIHNpbmNlcmVseQo+IAo+
IGFwb2xvZ2l6ZSBmb3IgdGhhdC4KPiAKPiAKPiBTdGV2ZW4sIHRoYW5rIHlvdSBmb3IgeW91ciB0
ZXN0cywgTGV0J3MgcmV2ZXJ0IGl0LgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9FMXRmZXlS
LTAwM1lHSi1HYkBybWstUEMuYXJtbGludXgub3JnLnVrCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVt
OiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMg
aGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3Qh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
