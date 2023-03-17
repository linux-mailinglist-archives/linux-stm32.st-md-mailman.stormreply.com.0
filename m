Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E66BEFBF
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 18:34:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 080CBC6907C;
	Fri, 17 Mar 2023 17:34:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 304DBC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=dcnDEPhnIALH7baeRcHtAIJ4mkDdFCeRzeKfND18+ng=; b=sb
 jo6Js9MMCadEM1hTd96lZaYeoXZ441yzMf1bIctQ90QuLcUlud1xnuT1faDw1XwkuJ0XN/kdc1WuO
 tJymoTVN0l/7ZJblaoY8ttP/50YiokT/3ARuUOEuMqPutrzLWzvyh9N503ZE041a4LaSNnGEXrAan
 9UBzNMtCUmgEOR8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pdDy1-007dXW-BO; Fri, 17 Mar 2023 18:34:13 +0100
Date: Fri, 17 Mar 2023 18:34:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
References: <20230316205449.1659395-1-shenwei.wang@nxp.com>
 <ZBOQecR6q5Xgr75F@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZBOQecR6q5Xgr75F@shell.armlinux.org.uk>
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

PiBOQUsuIEEgcGF0Y2ggc2ltaWxhciB0byB0aGlzIGhhcyBhbHJlYWR5IGJlZW4gc2VudC4KPiAK
PiBUaGUgcHJvYmxlbSB3aXRoIGp1c3QgbW92aW5nIHRoaXMgaXMgdGhhdCBwaHlsaW5rIGNhbiBj
YWxsIHRoZQo+IG1hY19saW5rX3VwKCkgbWV0aG9kICpiZWZvcmUqIHBoeWxpbmtfc3RhcnQoKSBo
YXMgcmV0dXJuZWQgLSBhbmQgYXMKPiB0aGlzIGRyaXZlciBoYXMgbm90IGNvbXBsZXRlZCB0aGUg
c2V0dXAsIGl0IGRvZXNuJ3QgZXhwZWN0IHRoZSBsaW5rCj4gdG8gY29tZSB1cCBhdCB0aGF0IHBv
aW50Lgo+IAo+IFRoZXJlIGFyZSBzZXZlcmFsIGlzc3VlcyB3aXRoIHRoaXMgZHJpdmVyIHdhbnRp
bmcgdGhlIFBIWSBjbG9jayBlYXJseSwKPiBhbmQgdGhlcmUgaGF2ZSBiZWVuIHR3byBwZW9wbGUg
d29ya2luZyBvbiBhZGRyZXNzaW5nIHRoaXMgcHJldmlvdXNseSwKPiBwcm9wb3NpbmcgdHdvIGRp
ZmZlcmVudCBjaGFuZ2VzIHRvIHBoeWxpbmsuCj4gCj4gSSBzZW50IHRoZW0gYXdheSB0byB0YWxr
IHRvIGVhY2ggb3RoZXIgYW5kIGNvbWUgYmFjayB3aXRoIGEgdW5pZmllZAo+IHNvbHV0aW9uLiBT
aG9jayBob3Jyb3IsIHRoZXkgbmV2ZXIgY2FtZSBiYWNrLgo+IAo+IE5vdyB3ZSBzZWVtIHRvIGJl
IHN0YXJ0aW5nIGFnYWluIGZyb20gdGhlIGJlZ2lubmluZy4KPiAKPiBzdG1tYWMgZm9sayByZWFs
bHkgbmVlZCB0byBnZXQgYSBoYW5kbGUgb24gdGhpcyBzbyByZXZpZXdlcnMgYXJlIG5vdAo+IGhh
dmluZyB0byBOQUsgc2ltaWxhciBwYXRjaGVzIHRpbWUgYW5kIHRpbWUgYWdhaW4sIHJlc3VsdGlu
ZyBpbiB0aGUKPiBwcm9ibGVtIG5vdCBiZWluZyBzb2x2ZWQuCgpBbmQganVzdCBhZGRpbmcgdG8g
dGhhdCwgRGV2ZWxvcGVycyBzaG91bGQgYWxzbyBnZXQgaW50byB0aGUgaGFiaXQgb2YKc2VhcmNo
aW5nIHRvIHNlZSBpZiBzb21lYm9keSBoYXMgYWxyZWFkeSB0cmllZCBhbmQgZmFpbGVkIHRvIHNv
bHZlIHRoZQpwcm9ibGVtLgoK4oCcVGhvc2UgV2hvIERvIE5vdCBMZWFybiBIaXN0b3J5IEFyZSBE
b29tZWQgVG8gUmVwZWF0IEl0LuKAnQoKVHJ5IGF2b2lkaW5nIHdhc3RpbmcgZXZlcnlib2R5J3Mg
dGltZXMgYnkgbGVhcm5pbmcgYSBiaXQgb2YgaGlzdG9yeS4KCiAgICBBbmRyZXcKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
