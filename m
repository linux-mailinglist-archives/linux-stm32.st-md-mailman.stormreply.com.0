Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D255CC1E10A
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 02:57:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFC4AC62D79;
	Thu, 30 Oct 2025 01:56:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97E76C62D6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 01:56:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A625D4446F;
 Thu, 30 Oct 2025 01:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF82EC4CEFD;
 Thu, 30 Oct 2025 01:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761789415;
 bh=HRpBacWvcERcW6Qv0x09GJHb3Ah9hMytMcYGZZIFbVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gh4ILMBqEHUxbzVxPNqMOyFKoBk1D/2dQepMJwwn7MC+LxPe8bWzlFc0eOlE3GmMs
 GjyszMZWKU+BKnqE3gljkkBM8c2E3CgG2lA3V8BGoiqAsrCoiDbdpA4LmayHj9+2ct
 btpzGcp+9t29UohHNXRtpOZ22usFiprhf4Q0VHOdumxE8QVL/n8lNGeWrnDzN98pwL
 o96amkoTXFSNP+m+eKA5tRAB0mUJXoaZMs/1ZkRbVT+miZRfxHASMkTAxQ6wyGwkfx
 bw9x/TVL5KywwZOQnv89h5iDMO1jIqg+5uAiBwFh8onEhOd2lCVQWvC35MEHJiKewk
 AdpETnV8lF1Xw==
Date: Wed, 29 Oct 2025 18:56:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>
Message-ID: <20251029185652.14483c58@kernel.org>
In-Reply-To: <20251027120559.GA365372@ragnatech.se>
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
 <20251027120559.GA365372@ragnatech.se>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Michael Nemanov <michael.nemanov@ti.com>,
 Roopni Devanathan <quic_rdevanat@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, linux-arm-msm@vger.kernel.org,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Paolo Abeni <pabeni@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stephan Gerhold <stephan@gerhold.net>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>,
 Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>,
 Paul Barker <paul@pbarker.dev>, Roger Quadros <rogerq@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Alex Elder <elder@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, "David S.
 Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RESEND 1/4] net: ethernet: Remove
 redundant pm_runtime_mark_last_busy() calls
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

T24gTW9uLCAyNyBPY3QgMjAyNSAxMzowNTo1OSArMDEwMCBOaWtsYXMgU8O2ZGVybHVuZCB3cm90
ZToKPiA+ICBvdXRfcnBtX3B1dDoKPiA+ICAJaWYgKCFwcml2LT53b2xfZW5hYmxlZCkgewo+ID4g
LQkJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShkZXYpOwo+ID4gIAkJcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoZGV2KTsKPiA+ICAJfSAgCj4gCj4gWW91IGNvdWxkIGRyb3AgdGhlIHsgfSBo
ZXJlLiBXaXRoIHRoaXMgZml4ZWQgZm9yIFJBVkIsCgpmaXhlZCB3aGVuIGFwcGx5aW5nLCB0aGUg
d2lyZWxlc3MgcGF0Y2ggbmVlZHMgdG8gZ28gdG8gbGludXgtd2lyZWxlc3MuCllvdSBtYXkgd2Fu
dCB0byByZXBvc3QgdGhhdCBvbmNlIGFnYWluIGlmIGl0J3Mgbm90IGluIGxpbnV4LW5leHQgYnkK
bmV4dCB3ZWVrLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
