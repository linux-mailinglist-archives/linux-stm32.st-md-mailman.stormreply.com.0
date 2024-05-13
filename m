Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E35338C4658
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 19:42:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A815FC6A61D;
	Mon, 13 May 2024 17:42:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 057B9C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z0WT9I02yh5cFXXMMJOdCfqjrNnWp6CwWdTqqwOw/vY=; b=Pb2uO5DgiupsjtJj1PwMPpOgm5
 WZhPvQiyWo4uSZ7UtYyeh4O1y8ib7T0hXwGVGDlSdGwKWQnpE8JsM1unseo3YMCwKC+VlNyD4t/3N
 4Xht1YsPG2UnomW3i9UpBQL546OD8bsh0Xa6+auznj5rD4R6LZNtxltwo03Ia+OV1LmybTAcMEtgM
 24P/cSLTzADDxs3z8eYLruxYKBy8ZNK0AMS8lUxjdys44+XxBhujsFYIZUJvzqckRagbEjEhmMDDe
 1ffE1atNHrKH91hQxG2hmCIm9/1yihuWWs0ytfMF3KxPYnqRHXNPBVcxi9xdrv81gn4BXha+hfBrJ
 ZlST7+Uw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50092)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s6ZgA-00028n-20;
 Mon, 13 May 2024 18:41:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s6Zg8-0006I4-5m; Mon, 13 May 2024 18:41:36 +0100
Date: Mon, 13 May 2024 18:41:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <ZkJQz9u8pQ9YmM5n@shell.armlinux.org.uk>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <Zj/IPpub11OL3jBo@shell.armlinux.org.uk>
 <CAMdnO-KCC0qXEsE1iDGNZwdd0PAcsRinmxe8_-5Anp=e1c5WFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-KCC0qXEsE1iDGNZwdd0PAcsRinmxe8_-5Anp=e1c5WFA@mail.gmail.com>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
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

T24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgMTA6Mzg6NDZBTSAtMDcwMCwgSml0ZW5kcmEgVmVnaXJh
anUgd3JvdGU6Cj4gVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLgo+IE9uIFNhdCwgTWF5
IDExLCAyMDI0IGF0IDEyOjM04oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCj4gPGxpbnV4QGFy
bWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiBBcyBwb2ludGVkIG91dCBpbiB0aGUgb3RoZXIgc3Vi
LXRocmVhZCwgeW91IGRvbid0IG5lZWQgdGhpcy4gSWYgeW91IG5lZWQKPiA+IGEgZml4ZWQtbGlu
ayBhbmQgeW91IGRvbid0IGhhdmUgYSBmaXJtd2FyZSBkZXNjcmlwdGlvbiBvZiBpdCwgeW91IGNh
bgo+ID4gcHJvdmlkZSBhIHN3bm9kZSBiYXNlZCBkZXNjcmlwdGlvbiB0aHJvdWdoIHBsYXQtPnBv
cnRfbm9kZSB0aGF0IHdpbGwgYmUKPiA+IHBhc3NlZCB0byBwaHlsaW5rLiBUaHJvdWdoIHRoYXQs
IHlvdSBjYW4gdGVsbCBwaHlsaW5rIHRvIGNyZWF0ZSBhCj4gPiBmaXhlZCBsaW5rLgo+ID4KPiBU
aGFuayB5b3UgZm9yIHRoZSBwb2ludGVycyBvciBzb2Z0d2FyZSBub2RlIHN1cHBvcnQuCj4gU2lu
Y2UgdGhlIGRyaXZlciBpcyBpbml0aWFsbHkgdGFyZ2V0dGVkIGZvciBYODYvXzY0LCB3ZSB3ZXJl
IG5vdCBzdXJlCj4gaG93IHRvIGRlYWwgd2l0aCBsYWNrIG9mIE9GIHN1cHBvcnQuCj4gV2Ugd2ls
bCB0cnkgb3V0IHRoZSBzb2Z0d2FyZSBub2RlIGZhY2lsaXR5LgoKWW91IG1heSB3aXNoIHRvIGhh
dmUgYSBsb29rIGF0IGRyaXZlcnMvbmV0L2V0aGVybmV0L3dhbmd4dW4vIHdoaWNoCmFsc28gY3Jl
YXRlcyBzb2Z0d2FyZSBub2RlcyBmb3IgcGh5bGluay4KClRoYW5rcy4KCi0tIApSTUsncyBQYXRj
aCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8K
RlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkg
YXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
