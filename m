Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 324D83A6D47
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jun 2021 19:37:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB458C597B0;
	Mon, 14 Jun 2021 17:37:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99C81C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jun 2021 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=cONCX2OHCfk2/XaURxX1uWtX4MnH7IVZGQBhzW25uws=; b=us
 ds8I821Kurup69t/J7weKC3U5A9SmnaIbvOtCBMJGXNfzOUN+10F/6v3RpJF6wrX9WQbziMcY5MRA
 5H8fM8q+pLY/lB/yoNI6e3KdCmPf/Q1DsiCQ/LdeGsJ7+pNwtRKaBPYhvpBpxZpQHwo0L2lbSz91D
 PTsmCsxHTxTsQHM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lsqW7-009Mmp-M8; Mon, 14 Jun 2021 19:36:55 +0200
Date: Mon, 14 Jun 2021 19:36:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Message-ID: <YMeTt35Q6gTG8UL/@lunn.ch>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
Cc: joabreu@synopsys.com, alexandre.torgue@st.com, jun.jiang@ingenic.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com, netdev@vger.kernel.org,
 sihui.liu@ingenic.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 sernia.zhou@foxmail.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, matthias.bgg@gmail.com, kuba@kernel.org,
 dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: dwmac: Add bindings
 for new Ingenic SoCs.
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

T24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgMDE6MTU6MzZBTSArMDgwMCwg5ZGo55Cw5p2wIChaaG91
IFlhbmppZSkgd3JvdGU6Cj4gQWRkIHRoZSBkd21hYyBiaW5kaW5ncyBmb3IgdGhlIEpaNDc3NSBT
b0MsIHRoZSBYMTAwMCBTb0MsCj4gdGhlIFgxNjAwIFNvQywgdGhlIFgxODMwIFNvQyBhbmQgdGhl
IFgyMDAwIFNvQyBmcm9tIEluZ2VuaWMuCj4gCj4gU2lnbmVkLW9mZi1ieTog5ZGo55Cw5p2wICha
aG91IFlhbmppZSkgPHpob3V5YW5qaWVAd2FueWVldGVjaC5jb20+CgpSZXZpZXdlZC1ieTogQW5k
cmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgoKICAgIEFuZHJldwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
