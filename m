Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 880556BEFDF
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 18:39:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ED51C6907C;
	Fri, 17 Mar 2023 17:39:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4233CC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iHnR6VsoXLRrgo7RdT0e2Sj6OaG0kttlCIL24iJ+R/E=; b=f57Rqgoj74FE0JtuFHgjAPzlUC
 YkZquQYr1QP8+06LtLlZgr8Muz+A/OqU0kSmuZAAwyNcbcPFlxP+QJULHWbXjmLWLIV0rT2xExFz3
 1OnuzugNDXfryvu/f+H79S0rVBW6053hsmkGT620nYfTY3Jr/RVIrKICS8Umy0G8biNGvaw8flKT7
 KTupK78KTRZGXMD0eBLhLWDMpE+OEoBnZQAwMlubLi2trR2nWfuwmt2tWD3MMEKFFSHI0TGp6brUl
 eHmvfC/zgCjdespr5BxCPchEp03MrJ8wEv3fcUzOflYSWlXr51TucXysEQRTR25r7uVoKbHmrYULY
 dBwMN6EQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34204)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pdE2i-0003A5-F5; Fri, 17 Mar 2023 17:39:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pdE2d-0003dP-5d; Fri, 17 Mar 2023 17:38:59 +0000
Date: Fri, 17 Mar 2023 17:38:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZBSlsyv+qcd30hBg@shell.armlinux.org.uk>
References: <20230316205449.1659395-1-shenwei.wang@nxp.com>
 <ZBOQecR6q5Xgr75F@shell.armlinux.org.uk>
 <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
X-Topics: 
Cc: Jose Abreu <joabreu@synopsys.com>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: start PHY early in
	__stmmac_open
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

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgMDY6MzQ6MTNQTSArMDEwMCwgQW5kcmV3IEx1bm4gd3Jv
dGU6Cj4gPiBOQUsuIEEgcGF0Y2ggc2ltaWxhciB0byB0aGlzIGhhcyBhbHJlYWR5IGJlZW4gc2Vu
dC4KPiA+IAo+ID4gVGhlIHByb2JsZW0gd2l0aCBqdXN0IG1vdmluZyB0aGlzIGlzIHRoYXQgcGh5
bGluayBjYW4gY2FsbCB0aGUKPiA+IG1hY19saW5rX3VwKCkgbWV0aG9kICpiZWZvcmUqIHBoeWxp
bmtfc3RhcnQoKSBoYXMgcmV0dXJuZWQgLSBhbmQgYXMKPiA+IHRoaXMgZHJpdmVyIGhhcyBub3Qg
Y29tcGxldGVkIHRoZSBzZXR1cCwgaXQgZG9lc24ndCBleHBlY3QgdGhlIGxpbmsKPiA+IHRvIGNv
bWUgdXAgYXQgdGhhdCBwb2ludC4KPiA+IAo+ID4gVGhlcmUgYXJlIHNldmVyYWwgaXNzdWVzIHdp
dGggdGhpcyBkcml2ZXIgd2FudGluZyB0aGUgUEhZIGNsb2NrIGVhcmx5LAo+ID4gYW5kIHRoZXJl
IGhhdmUgYmVlbiB0d28gcGVvcGxlIHdvcmtpbmcgb24gYWRkcmVzc2luZyB0aGlzIHByZXZpb3Vz
bHksCj4gPiBwcm9wb3NpbmcgdHdvIGRpZmZlcmVudCBjaGFuZ2VzIHRvIHBoeWxpbmsuCj4gPiAK
PiA+IEkgc2VudCB0aGVtIGF3YXkgdG8gdGFsayB0byBlYWNoIG90aGVyIGFuZCBjb21lIGJhY2sg
d2l0aCBhIHVuaWZpZWQKPiA+IHNvbHV0aW9uLiBTaG9jayBob3Jyb3IsIHRoZXkgbmV2ZXIgY2Ft
ZSBiYWNrLgo+ID4gCj4gPiBOb3cgd2Ugc2VlbSB0byBiZSBzdGFydGluZyBhZ2FpbiBmcm9tIHRo
ZSBiZWdpbm5pbmcuCj4gPiAKPiA+IHN0bW1hYyBmb2xrIHJlYWxseSBuZWVkIHRvIGdldCBhIGhh
bmRsZSBvbiB0aGlzIHNvIHJldmlld2VycyBhcmUgbm90Cj4gPiBoYXZpbmcgdG8gTkFLIHNpbWls
YXIgcGF0Y2hlcyB0aW1lIGFuZCB0aW1lIGFnYWluLCByZXN1bHRpbmcgaW4gdGhlCj4gPiBwcm9i
bGVtIG5vdCBiZWluZyBzb2x2ZWQuCj4gCj4gQW5kIGp1c3QgYWRkaW5nIHRvIHRoYXQsIERldmVs
b3BlcnMgc2hvdWxkIGFsc28gZ2V0IGludG8gdGhlIGhhYml0IG9mCj4gc2VhcmNoaW5nIHRvIHNl
ZSBpZiBzb21lYm9keSBoYXMgYWxyZWFkeSB0cmllZCBhbmQgZmFpbGVkIHRvIHNvbHZlIHRoZQo+
IHByb2JsZW0uCj4gCj4g4oCcVGhvc2UgV2hvIERvIE5vdCBMZWFybiBIaXN0b3J5IEFyZSBEb29t
ZWQgVG8gUmVwZWF0IEl0LuKAnQo+IAo+IFRyeSBhdm9pZGluZyB3YXN0aW5nIGV2ZXJ5Ym9keSdz
IHRpbWVzIGJ5IGxlYXJuaW5nIGEgYml0IG9mIGhpc3RvcnkuCgorMSwwMDAsMDAwLDAwMCwwMDAs
MDAwLDAwMCwwMDAsMDAwLDAwMCwwMDAsMDAwLDAwMCwwMDAsMDAwLDAwMCEKCihZZXMsIGZhY3Rv
cmlhbCB0b28hIDopICkKCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxp
bnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA0ME1icHMgZG93biAx
ME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
