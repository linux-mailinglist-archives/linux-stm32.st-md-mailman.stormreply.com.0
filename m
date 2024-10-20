Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 700EF9A5492
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Oct 2024 16:50:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06E99C78018;
	Sun, 20 Oct 2024 14:50:14 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1299C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Oct 2024 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=8zSrv9jMkJqjVhr6qHqhDSITJsgarczXcoOi1N3rASw=; b=0v
 1s0QmUx9NfH7UbqmHsqHUILQYfngh/pdwOJtpC2seEo0UECRM+MMTJKK4uAYWgong3kB/iIr23Vmo
 ZB+geJc8FywMWksxBRHgGO6ZYOq0IleJVmNIBHxQiQqKrAheyOwN0t17Rl30PNpCmEAhnCBjzVCD/
 6T5qdsV5pLThyv8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t2XFU-00AeVi-UT; Sun, 20 Oct 2024 16:49:40 +0200
Date: Sun, 20 Oct 2024 16:49:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Fan =?utf-8?B?SGFpbG9uZy/ojIPmtbfpvpk=?= <hailong.fan@siengine.com>
Message-ID: <ecc1aaf4-8676-453f-93bc-fd93d121b694@lunn.ch>
References: <tencent_6BF819F333D995B4D3932826194B9B671207@qq.com>
 <20241017101857.GE1697@kernel.org>
 <bd7a1be5cec348dab22f7d0c2552967d@siengine.com>
 <9a11c47e-0cd6-4741-a25b-68538763110a@lunn.ch>
 <daf687938ae1413bbc556134b47d0629@siengine.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <daf687938ae1413bbc556134b47d0629@siengine.com>
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
 =?utf-8?b?5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gbmV0OiBz?=
 =?utf-8?q?tmmac=3A_enable_MAC_after_MTL_configuring?=
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

T24gU3VuLCBPY3QgMjAsIDIwMjQgYXQgMDE6NDU6NDFBTSArMDAwMCwgRmFuIEhhaWxvbmcv6IyD
5rW36b6ZIHdyb3RlOgo+IEhpIAo+IAo+IFBsZWFzZSBmaW5kIG5ldyBwYXRjaCBpbiBhdHRhY2ht
ZW50cywgdGhhbmtzLgoKUGxlYXNlIHJlYWQKCmh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nl
c3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwKCmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0
bWwvbGF0ZXN0L3Byb2Nlc3MvbWFpbnRhaW5lci1uZXRkZXYuaHRtbAoKQXR0YWNobWVudHMgYXJl
IG5vdCBhY2NlcHRlZC4KCglBbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
