Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B59AC93B7
	for <lists+linux-stm32@lfdr.de>; Fri, 30 May 2025 18:38:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B5D6C35E3F;
	Fri, 30 May 2025 16:38:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DD46C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TFob6bHbt9evz3lA1lPRqmDyommaykyRcKttnYjRsmk=; b=uHJFaY3ojfDQ39JRVwhAlbj8t8
 1Y5rFZax7qQUv5Cij4StrfieciR/Co5CJwpK5qF7VQia1udFwAObBb4qN3q7xzZrUMhYZKK97F+JZ
 xjy8OW2hrcSbn/lwTqXuqrjDYtD7Qvp8DGUssryzW86/rd7piheZNH9yUJ7jlZ4jRyGfi1ReXW6+F
 t4Z2rO9xKJvT+KUrMh8aVEecqXkGTx4Bha4rvpaiIkf05EZQviIhjAfB05PimgT93oP8nju4ugggV
 8EDDqj05B1X/blg87CNyQ0wwusKrU6SDEvUe4DBaWgx8vE6gcqFMD2DwsfwLZ158BF/lxdGqRGGAI
 cwgA5dgw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50618)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uL2js-0002Yx-2v;
 Fri, 30 May 2025 17:37:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uL2jl-0004kI-2u;
 Fri, 30 May 2025 17:37:41 +0100
Date: Fri, 30 May 2025 17:37:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?5p2O5ZOy?= <sensor1010@163.com>
Message-ID: <aDne1Ybuvbk0AwG0@shell.armlinux.org.uk>
References: <20250530162017.3661-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530162017.3661-1-sensor1010@163.com>
Cc: detlev.casanova@collabora.com, linux-kernel@vger.kernel.org,
 jonas@kwiboo.se, netdev@vger.kernel.org, jan.petrous@oss.nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, david.wu@rock-chips.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: dwmac-rk: No need to check the
 return value of the phy_power_on()
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

T24gRnJpLCBNYXkgMzAsIDIwMjUgYXQgMDk6MjA6MTdBTSAtMDcwMCwg5p2O5ZOyIHdyb3RlOgo+
IHBoeV9wb3dlcl9vbigpIGlzIGEgbG9jYWwgc2NvcGUgb25lIHdpdGhpbiB0aGUgZHJpdmVyLCBz
aW5jZSB0aGUgcmV0dXJuCj4gdmFsdWUgb2YgdGhlIHBoeV9wb3dlcl9vbigpIGZ1bmN0aW9uIGlz
IGFsd2F5cyAwLCBjaGVja2luZyBpdHMgcmV0dXJuCj4gdmFsdWUgaXMgcmVkdW5kYW50Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IOadjuWTsiA8c2Vuc29yMTAxMEAxNjMuY29tPgoKUGF0Y2ggbG9va3Mg
Z2VuZXJhbGx5IGdvb2QsIG5pY2UgdG8gc2VlIHRoZSByZXZlcnNlIGNocmlzdG1hcyB0cmVlCm9y
ZGVyaW5nIG9mIGxvY2FsIHZhcmlhYmxlcyByZXN1bHRpbmcgZnJvbSB0aGlzIHBhdGNoLiBIb3dl
dmVyLCB0aGUKc3ViamVjdCBsaW5lIG5lZWRzIHRvIGJlIGFkanVzdGVkIHRvIG1lZXQgbmV0ZGV2
IHJlcXVpcmVtZW50cy4gUGxlYXNlCnNlZQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1s
L3Y1LjEvbmV0d29ya2luZy9uZXRkZXYtRkFRLmh0bWwjcS1ob3ctZG8taS1pbmRpY2F0ZS13aGlj
aC10cmVlLW5ldC12cy1uZXQtbmV4dC1teS1wYXRjaC1zaG91bGQtYmUtaW4KUGxlYXNlIHdhaXQg
YSBtaW5pbXVtIG9mIG9uZSBkYXkgYmVmb3JlIHNlbmRpbmcgYW4gdXBkYXRlZCB2ZXJzaW9uLgoK
UmV2aWV3ZWQtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1saW51eC5v
cmcudWs+CgpQbGVhc2UgY2FuIHlvdSBhbHNvIGZvbGxvdyB1cCB3aXRoIGEgcGF0Y2ggdG8gY2hh
bmdlIHRoZSBmdW5jdGlvbiBuYW1lCmZyb20gInBoeV9wb3dlcl9vbigpIiBhcyB0aGlzIG1heSBj
b25mbGljdCB3aXRoIHRoZSBQSFkgc3Vic3lzdGVtcwoiaW50IHBoeV9wb3dlcl9vbihzdHJ1Y3Qg
cGh5ICpwaHkpOyIKCiJya19waHlfcG93ZXJfc2V0KCkiIHdvdWxkIHByb2JhYmx5IGJlIGEgZ29v
ZCBhbHRlcm5hdGl2ZSBuYW1lLAplc3BlY2lhbGx5IGFzIHdoZW4gdGhlIDJuZCBhcmd1bWVudCBp
cyBmYWxzZSwgdGhlIGZ1bmN0aW9uIHR1cm5zIHRoZQpQSFkgb2ZmLgoKVGhhbmtzIQoKLS0gClJN
SydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9w
YXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5l
Y3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
