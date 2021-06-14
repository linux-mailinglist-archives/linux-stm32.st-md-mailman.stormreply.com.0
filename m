Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C03F3A6D49
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jun 2021 19:37:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6AB4C597B3;
	Mon, 14 Jun 2021 17:37:10 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62CA9C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jun 2021 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=yNJZdu5e9R9IKJLMXzwlJdT1h35Mb6+Vu9cSblpMexw=; b=ZS
 KVZMYvVbzNUjqEwyxpEivD5BHmDXQdFmXDlwsUAfxEy07XyluMcabpUle5H5ZNTlSvWB4khgr7WwR
 SHWWk/hNzMPcEPeXbB3a2+T5/ZVepAo7dFI1ZQsFWtOdM76xQYQ0j9sV2dFWQdkvxLW/kGtDsIIws
 pA0kkT9QLeZtg8s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lsqVy-009MmX-Ti; Mon, 14 Jun 2021 19:36:46 +0200
Date: Mon, 14 Jun 2021 19:36:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Message-ID: <YMeTrq/j7728lCN0@lunn.ch>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623690937-52389-3-git-send-email-zhouyanjie@wanyeetech.com>
Cc: joabreu@synopsys.com, alexandre.torgue@st.com, jun.jiang@ingenic.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com, netdev@vger.kernel.org,
 sihui.liu@ingenic.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 sernia.zhou@foxmail.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, matthias.bgg@gmail.com, kuba@kernel.org,
 dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v3 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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

T24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgMDE6MTU6MzdBTSArMDgwMCwg5ZGo55Cw5p2wIChaaG91
IFlhbmppZSkgd3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9yIEluZ2VuaWMgU29DIE1BQyBnbHVlIGxh
eWVyIHN1cHBvcnQgZm9yIHRoZSBzdG1tYWMKPiBkZXZpY2UgZHJpdmVyLiBUaGlzIGRyaXZlciBp
cyB1c2VkIG9uIGZvciB0aGUgTUFDIGV0aGVybmV0IGNvbnRyb2xsZXIKPiBmb3VuZCBpbiB0aGUg
Slo0Nzc1IFNvQywgdGhlIFgxMDAwIFNvQywgdGhlIFgxNjAwIFNvQywgdGhlIFgxODMwIFNvQywK
PiBhbmQgdGhlIFgyMDAwIFNvQy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiDlkajnkLDmnbAgKFpob3Ug
WWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcg
THVubiA8YW5kcmV3QGx1bm4uY2g+CgogICAgQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
