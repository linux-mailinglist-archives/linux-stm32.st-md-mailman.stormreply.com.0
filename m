Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C33F2BF6A0C
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 15:02:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7007AC57B6C;
	Tue, 21 Oct 2025 13:02:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7072BC3F95B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qGFQDK06oh6OLUShVkpRbJc+sQgtZHJKwB3osXf18fU=; b=hdMqbjlVBeNERiKKRmc4fxopEf
 7ijQKQJ25i4cUunwHzEDydRxnusbakgP7Nn4u6JcLFAAj4oZSOsqrGyLgKkPXpRu1jPHtbxUPiibN
 0zZYOSoq26JmtAlLEJdHkC62UwIB7hXtwDw2K4/dRZ7uLTb64PGB5VU/T+pWr344eiQJKaXF2eKdW
 44YDhyLkEPjdGPZLAh7w3SS0GIB+ZaRoN2FYmeQ/DLWniUE4U1Pfj24mHFtB/I7KVphFTTS6TahZP
 JMNlJXuue0hvv5+LfafQshiMC3ZaxV+M07HUVMJJesJ6DkC0TK7bAYWSd50O6iNTa0C4W65FfEuYC
 fhzXwVhQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56540)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBC0F-000000003iO-4C50;
 Tue, 21 Oct 2025 14:02:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBC0A-000000008Cd-1Yri; Tue, 21 Oct 2025 14:02:10 +0100
Date: Tue, 21 Oct 2025 14:02:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <aPeEUmHeQWh7ZuIU@shell.armlinux.org.uk>
References: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
 <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: replace
	has_xxxx with core_type
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMDI6NDI6MDlQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBUaHUsIE9jdCAxNiwgMjAyNSBhdCA5OjQx4oCvUE0gUnVzc2VsbCBL
aW5nIChPcmFjbGUpCj4gPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4g
PiBSZXBsYWNlIHRoZSBoYXNfZ21hYywgaGFzX2dtYWM0IGFuZCBoYXNfeGdtYWMgaW50cywgb2Yg
d2hpY2ggb25seSBvbmUKPiA+IGNhbiBiZSBzZXQgd2hlbiBtYXRjaGluZyBhIGNvcmUgdG8gaXRz
IGRyaXZlciBiYWNrZW5kLCB3aXRoIGFuCj4gPiBlbnVtZXJhdGVkIHR5cGUgY2FycnlpbmcgdGhl
IERXTUFDIGNvcmUgdHlwZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9y
YWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+ID4gLS0tCj4gPiBBZnRlciB0aGUg
Zml2ZSBwYXRjaCBjbGVhbnVwIGhhcyBiZWVuIG1lcmdlZCwgSSB3aWxsIHdhbnQgdG8gc3VibWl0
Cj4gPiB0aGlzIGZvciBtZXJnaW5nLgo+ID4KPiA+IFRoZSBwcm9ibGVtOgo+ID4gLSBBbnkgbmV3
IHN0bW1hYyBnbHVlIGNvZGUgaXMgbGlrZWx5IHRvIGNvbmZsaWN0IHdpdGggdGhpcy4KPiA+IC0g
QmFydG9zeiBHb2xhc3pld3NraSdzIHFjb20tZXRocW9zIHBhdGNoZXMgcG9zdGVkIG9uIDh0aCBP
Y3RvYmVyCj4gPiAgIHdpbGwgY29uZmxpY3Qgd2l0aCB0aGlzIGlmIHJlc3VibWl0dGVkICh3ZSdy
ZSBjaGFuZ2luZyBsaW5lcyB0aGF0Cj4gPiAgIG92ZXJsYXAgaW4gZGlmZiBjb250ZXh0LikKPiA+
IC0gTWF4aW1lIENoZXZhbGxpZXIncyB0aWVtc3RhbXBpbmcgY2hhbmdlcyB3aWxsIGNvbmZsaWN0
IHdpdGggdGhpcy4KPiA+Cj4gCj4gUmV2aWV3ZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KClBsZWFzZSBjYW4geW91IHJlcGx5IHdpdGgg
eW91ciByZXZpZXdlZC1ieSB0byB0aGUgbGF0ZXN0IHBhdGNoIHN1Ym1pdHRlZAp0b2RheSwgc28g
eW91ciByLWIgZ2V0cyBwaWNrZWQgdXAgaWYgbmV0ZGV2IGFwcGxpZXMgaXQ/IFRoYW5rcy4KCi0t
IApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9w
ZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBj
b25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
