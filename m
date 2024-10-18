Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B86079A4556
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 19:57:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60D29C78023;
	Fri, 18 Oct 2024 17:57:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E21C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=1XH3C6puuyO0GVVr6J8qrsqvdtJ7rHyrQHKdm3F9rb4=; b=nL
 TrTOpVyJJvFhO65Oehti5rMuApOhKObSUrasY80TmEwQJofwJOV26EQGFrFOT6NzeYcEeFfeppBkC
 x3MjNgWrJaAel7zx1+1xZaw9XKHaR/GRYu2oFTdDxM3PRP7qamUc6+xk87pl4TUZsDoI0GVuDlzaz
 Ri6BE7b9AuV777Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t1rDx-00AYTW-Py; Fri, 18 Oct 2024 19:57:17 +0200
Date: Fri, 18 Oct 2024 19:57:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Fan =?utf-8?B?SGFpbG9uZy/ojIPmtbfpvpk=?= <hailong.fan@siengine.com>
Message-ID: <9a11c47e-0cd6-4741-a25b-68538763110a@lunn.ch>
References: <tencent_6BF819F333D995B4D3932826194B9B671207@qq.com>
 <20241017101857.GE1697@kernel.org>
 <bd7a1be5cec348dab22f7d0c2552967d@siengine.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd7a1be5cec348dab22f7d0c2552967d@siengine.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "2694439648@qq.com" <2694439648@qq.com>, Simon Horman <horms@kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32]
 =?utf-8?b?5Zue5aSNOiBbUEFUQ0hdIG5ldDogc3RtbWFjOiBl?=
 =?utf-8?q?nable_MAC_after_MTL_configuring?=
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

T24gRnJpLCBPY3QgMTgsIDIwMjQgYXQgMDE6MTU6MzBBTSArMDAwMCwgRmFuIEhhaWxvbmcv6IyD
5rW36b6ZIHdyb3RlOgo+IEhpCj4gCj4gRm9yIGV4YW1wbGUsIEVUSCBpcyBkaXJlY3RseSBjb25u
ZWN0ZWQgdG8gdGhlIHN3aXRjaCwgd2hpY2ggbmV2ZXIgcG93ZXIgZG93biBhbmQgc2VuZHMgYnJv
YWRjYXN0IHBhY2tldHMgYXQgcmVndWxhciBpbnRlcnZhbHMuIAo+IER1cmluZyB0aGUgcHJvY2Vz
cyBvZiBvcGVuaW5nIEVUSCwgZGF0YSBtYXkgZmxvdyBpbnRvIHRoZSBNVEwgRklGTywgb25jZSBN
QUMgUlggaXMgZW5hYmxlZC4KPiBhbmQgdGhlbiwgTVRMIHdpbGwgYmUgc2V0LCBzdWNoIGFzIEZJ
Rk8gc2l6ZS4gCj4gT25jZSBlbmFibGUgRE1BLCBUaGVyZSBpcyBhIGNlcnRhaW4gcHJvYmFiaWxp
dHkgdGhhdCBETUEgd2lsbCByZWFkIGluY29ycmVjdCBkYXRhIGZyb20gTVRMIEZJRk8sIGNhdXNp
bmcgRE1BIHRvIGhhbmcgdXAuIAo+IEJ5IHJlYWQgRE1BX0RlYnVnX1N0YXR1cywgeW91IGNhbiBi
ZSBvYnNlcnZlZCB0aGF0IHRoZSBSUFMgcmVtYWlucyBhdCBhIGNlcnRhaW4gdmFsdWUgZm9yZXZl
ci4gCj4gVGhlIGNvcnJlY3QgcHJvY2VzcyBzaG91bGQgYmUgdG8gY29uZmlndXJlIE1BQy9NVEwv
RE1BIGJlZm9yZSBlbmFibGluZyBETUEvTUFDCgpXaGF0IFNpbW9uIGlzIGFza2luZyBmb3IgaXMg
dGhhdCB0aGlzIGlzIHBhcnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLgoKUGxlYXNlIGFsc28gZG9u
J3QgdG9wIHBvc3QuCgogICAgQW5kcmV3CgotLS0KcHctYm90OiBjcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
