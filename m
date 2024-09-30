Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9449A98ACAA
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2024 21:18:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43082C78002;
	Mon, 30 Sep 2024 19:18:05 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37786C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=qWKbZygsjr2RtwDX9i0gKQDPrH5sR1FZSuwO6Sb/yHg=; b=nN
 Pgnn0T2J6vaMpt3LVADX2ibEAgbSWUP92VRtTwiNb88MiU/nH3G/GW1wKD1Ff3MGcwu1El2EOjc40
 3O9c3kwVDGDkhWy8IVAnartJoavH1AwXBTtTqkT3DunEMyVjZ/EombOb+NiXY03KmrZcYdpxBu0L3
 SoYbrAseQGz1Si0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1svLtx-008ekj-TD; Mon, 30 Sep 2024 21:17:45 +0200
Date: Mon, 30 Sep 2024 21:17:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vitalii Mordan <mordan@ispras.ru>
Message-ID: <ea008e5e-be22-4a59-9243-682be313fea2@lunn.ch>
References: <20240930183926.2112546-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930183926.2112546-1-mordan@ispras.ru>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Vadim Mutilin <mutilin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] stmmac: dwmac-intel-plat: remove
 redundant check dwmac->data in probe
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

T24gTW9uLCBTZXAgMzAsIDIwMjQgYXQgMDk6Mzk6MjZQTSArMDMwMCwgVml0YWxpaSBNb3JkYW4g
d3JvdGU6Cj4gVGhlIGRyaXZlcuKAmXMgY29tcGF0aWJpbGl0eSB3aXRoIGRldmljZXMgaXMgY29u
ZmlybWVkIGVhcmxpZXIgaW4KPiBwbGF0Zm9ybV9tYXRjaCgpLiBTaW5jZSByZWFjaGluZyBwcm9i
ZSBtZWFucyB0aGUgZGV2aWNlIGlzIHZhbGlkLAo+IHRoZSBleHRyYSBjaGVjayBjYW4gYmUgcmVt
b3ZlZCB0byBzaW1wbGlmeSB0aGUgY29kZS4KPiAgCj4gIAlkd21hYy0+ZGF0YSA9IGRldmljZV9n
ZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPiAtCWlmIChkd21hYy0+ZGF0YSkgewoKWW91IHNh
eSB0aGlzIGNhbm5vdCBmYWlsLCBidXQgbXkgZ3Vlc3MgaXMsIHRoZXJlIGFyZSBzdGF0aWMgY29k
ZQphbmFseXNlcnMgd2hpY2ggY2Fubm90IGRldGVybWluZSBpdCBjYW5ub3QgZmFpbC4gQXMgYSBy
ZXN1bHQsIHRob3NlCmRldmVsb3BlcnMgYmxpbmRseSBmb2xsb3dpbmcgYm90cyBhcmUgZ29pbmcg
dG8gd2FudCB0byB0ZXN0IHRoZSByZXR1cm4KdmFsdWUgZnJvbSBkZXZpY2VfZ2V0X21hdGNoX2Rh
dGEoKS4KCllvdSBtaWdodCB3YW50IHRvIHByZXZlbnQgc3VjaCBwYXRjaGVzIGJ5IGFkZGluZyBh
IGNvbW1lbnQ6CgovKiBUaGlzIGNhbm5vdCBmYWlsIGJlY2F1c2UuLi4uCgogICBBbmRyZXcKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
