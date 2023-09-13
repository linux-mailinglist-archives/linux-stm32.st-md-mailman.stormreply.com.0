Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19379EB7C
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Sep 2023 16:46:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FC1FC6B46F;
	Wed, 13 Sep 2023 14:46:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EBBEC6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Sep 2023 14:46:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F0586197C;
 Wed, 13 Sep 2023 14:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE9FC433C8;
 Wed, 13 Sep 2023 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694616406;
 bh=MEPRVLhq94lkOpBYdxRoPzKxMTXOzT6mLYuQo0C5GYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oGLkwU9FWN+uir2AxMWDTeonZoJko3bsyCrAoEwRogRsrKE3tdrx4B9pi8+bKr/rN
 YNmj1snrt3z/3uMq8t3XLwRcIdtFeEX4usIBazutl44jkrrsnbzmUi+o/KlszxGhTW
 kQ/3EbY9WMqXrWE+yQ0jghLPZaWW+prreEFa455H+PLcHo/nLRU9nYtgaZo3JnKrPj
 vFqlFKnCj6MRw+R8ApLZnFn10v9011Amq+LnEVzCYWDd8jZUbGtwzr5m5NpxvdL84/
 3VKpgZuZL8GyrJ1R2wgmk36jUw1EttiwIhx9Ix80TmVPWYzmiShvDIdhGPcyxDKqwd
 tx3968REAuSrA==
Date: Wed, 13 Sep 2023 22:34:42 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Message-ID: <ZQHIgmcnCNoZwtwu@xhacker>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
 <20230911171102.cwieugrpthm7ywbm@pengutronix.de>
 <ZQAa3277GC4c9W1D@xhacker>
 <99695befef06b025de2c457ea5f861aa81a0883c.camel@pengutronix.de>
 <20230912092411.pprnpvrbxwz77x6a@pengutronix.de>
 <2fcc9fb0e40ceff8ea4ae55cca3ce0aff75a20ca.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2fcc9fb0e40ceff8ea4ae55cca3ce0aff75a20ca.camel@sipsolutions.net>
Cc: Paolo Abeni <pabeni@redhat.com>, kernel@pengutronix.de,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [REGRESSION] [PATCH net-next v5 2/2] net: stmmac:
 use per-queue 64 bit statistics where necessary
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

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMTE6MzA6MTRBTSArMDIwMCwgSm9oYW5uZXMgQmVyZyB3
cm90ZToKPiBPbiBUdWUsIDIwMjMtMDktMTIgYXQgMTE6MjQgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2
bmlnIHdyb3RlOgo+ID4gPiAKPiA+ID4gVGhlIG5ld2x5IGFkZGVkICJzdHJ1Y3QgdTY0X3N0YXRz
X3N5bmMgc3luY3AiIHVzZXMgYSBzZXFsb2NrCj4gPiA+IGludGVybmFsbHksIHdoaWNoIGlzIGJy
b2tlbiBpbnRvIG11bHRpcGxlIHdvcmRzIG9uIDMyYml0IG1hY2hpbmVzLCBhbmQKPiA+ID4gbmVl
ZHMgdG8gYmUgaW5pdGlhbGl6ZWQgcHJvcGVybHkuIFlvdSBuZWVkIHRvIGNhbGwgdTY0X3N0YXRz
X2luaXQgb24KPiA+ID4gc3luY3AgYmVmb3JlIGZpcnN0IHVzYWdlLgo+ID4gCj4gPiBUaGlzIGlz
IGRvbmUuIFRoZSBwcm9ibGVtYXRpYyB0aGluZyBpcyB0aGF0IGluIHN0bW1hY19vcGVuKCkgLT4K
PiA+IF9fc3RtbWFjX29wZW4oKSB0aGUgc3luY3AgaW5pdGlhbGl6ZWQgYmVmb3JlIGlzIG92ZXJ3
cml0dGVuIGJ5Cj4gPiAKPiA+IAltZW1jcHkoJnByaXYtPmRtYV9jb25mLCBkbWFfY29uZiwgc2l6
ZW9mKCpkbWFfY29uZikpOwoKVGhhbmsgSm9oYW5uZXMgYW5kIFV3ZSBmb3IgcG9pbnRpbmcgb3V0
IHRoZSBpc3N1ZS4KCj4gPiAKPiA+IERvIEkgbmVlZCB0byBwb2ludCBvdXQgdGhhdCB0aGlzIGlz
IHVnbHk/Cj4gCj4gSSB0aGluayBpdCBhbHNvIGxlYWtzIHRoZSAobG9ja2RlcCkgc3RhdGUgc2lu
Y2UgaXQgcmVpbml0cyB0aGUgc3luY3AKPiAoYW5kIGEgbG90IG9mIG90aGVyIHN0YXRlKSBkb2lu
ZyB0aGlzLiBUaGlzIGlzIGFsc28gY2FsbGVkIHdoZW4gdGhlIE1UVQo+IGNoYW5nZXMuCj4gCj4g
QWxzbywgSSBjb3VsZG4ndCBjb252aW5jZSBteXNlbGYgdGhhdCBpdCdzIGV2ZW4gcmFjZS1mcmVl
PyBFdmVuIGlmIGl0Cj4gaXMsIGl0J3Mgbm90IHJlYWxseSBvYnZpb3VzLCBJTUhPLgo+IAo+IFNv
IGl0IHNlZW1zIHRvIG1lIHRoYXQgcmVhbGx5IHRoaXMgbmVlZHMgdG8gYmUgc3BsaXQgaW50byBk
YXRhIHRoYXQKPiBhY3R1YWxseSBzaG91bGQgYmUgcmVpbml0aWFsaXplZCwgYW5kIGRhdGEgdGhh
dCBzaG91bGRuJ3QsIG9yIGp1c3Qgbm90Cj4gdXNlIG1lbWNweSgpIGhlcmUgYnV0IGNvcHkgb25s
eSB0aGUgcmVsZXZhbnQgc3RhdGU/CgpTaW5jZSB3ZSBhcmUgaW4gcmMxLCBJIG5lZWQgdG8gZml4
IHRoZSBidWcgd2l0aCBhcyBzbWFsbCBjaGFuZ2VzIGFzCnBvc3NpYmxlLiBzbyBhbm90aGVyIHNv
bHV0aW9uIGNvdWxkIGJlOiByZXBsYWNlIHJ4L3R4IHN0YXRzIHN0cnVjdHVyZQp3aXRoIHBvaW50
ZXJzLCB0aGVuIHNldHVwIHBvaW50ZXJzIGluIHRoZSBuZXcgYWxsb2NhdGVkIGRtYV9jb25mIHdp
dGgKdGhlIG9sZCBvbmUgYXMgY3VycmVudCBjb2RlIGRpZCBmb3IgZG1hX3R4X3NpemUvZG1hX3J4
X3NpemUgaW4Kc3RtbWFjX3NldHVwX2RtYV9kZXNjKCk6CgpkbWFfY29uZi0+ZG1hX3R4X3NpemUg
PSBwcml2LT5kbWFfY29uZi5kbWFfdHhfc2l6ZQoKSXMgaXQgYWNjZXB0YWJsZT8KClRoYW5rcwoK
PiAKPiBCdXQgYW55d2F5LCBJIGhhdmUgbm8gc2tpbiBpbiB0aGlzIGdhbWUgLSBqdXN0IHJldmll
d2luZyB0aGlzIGJlY2F1c2UgSQo+IHdhcyB0cnlpbmcgdG8gaGVscCBvdXQgVXdlLgo+IAo+IGpv
aGFubmVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
