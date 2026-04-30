Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7WFnDF7n82lk8gEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 01 May 2026 01:35:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41E4A8E03
	for <lists+linux-stm32@lfdr.de>; Fri, 01 May 2026 01:35:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7F0BC87ED3;
	Thu, 30 Apr 2026 23:35:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2DEEC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 23:35:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C51942B72;
 Thu, 30 Apr 2026 23:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA394C2BCB3;
 Thu, 30 Apr 2026 23:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777592154;
 bh=UOaPDNLQb+DWXRX86NYkdWJLMQr/Dt6uSVxCr2qRPOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZaefObiUhiS06GyO2ZPam7v+xKSz/xj6dDyzgiFyYF5vwMapPmxw1tjLpeku4NLqC
 MNemy1d3JrJcOG0Jk6NNf+6YhMUlpqGil4LcSSlKqyMAfYs1D2uso3FiUdlp+smO/v
 XDZtnFLVXIgjhIMQGDxFxXhJa93t5Z12b7KOm5uOpZaFN/3PlwFZQty9JQr//W2vqL
 Vq054sIidcx3nsS2/NxotU3HYGyHQmcfz2fSk/UXIx19WufrApEtG037RRolFUxlTG
 mayqczXLjYDszlo6fCq5NDr1S/jjjhfzeFH0Q2VuF9eMDultmmSXbQg3mPEEmemBHz
 lDzLMIcnrmfEg==
Date: Thu, 30 Apr 2026 16:35:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Message-ID: <20260430163551.7491407a@kernel.org>
In-Reply-To: <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
 <20260427072508.1151-1-lizhi2@eswincomputing.com>
 <20260428180625.738223cf@kernel.org>
 <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, maxime.chevallier@bootlin.com, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 horms@kernel.org, rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/4] net: stmmac: eic7700:
 enable clocks before syscon access and correct RX sampling timing
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
X-Rspamd-Queue-Id: AF41E4A8E03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:horms@kernel.org,m:rmk+kernel@armlinux.org.uk,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,ghiti.fr,bootlin.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]

T24gVGh1LCAzMCBBcHIgMjAyNiAxNDo0Mzo1MCArMDgwMCAoR01UKzA4OjAwKSDmnY7lv5cgd3Jv
dGU6Cj4gPiBXaHkgRml4ZXM/IElmIGV0aDEgbmV2ZXIgd29ya2VkIHRoaXMgaXMgbm90IGEgZml4
IGJ1dCBuZXcgZnVuY3Rpb25hbGl0eQo+ID4gSWYgeW91IHdhbnQgdG8gbWFrZSB0aGlzIGEgZml4
IHRvIHByZXZlbnQgaW5jb21wYXRpYmlsaXR5IC0gY3V0IGl0IGRvd24KPiA+IGp1c3QgdG8gdGhl
IGV0aDAgY2hhbmdlcy4KPiA+ICAgCj4gVGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4KPiAK
PiBZb3UncmUgcmlnaHQgdGhhdCBldGgxIG5ldmVyIHdvcmtlZCBhdCBHaWdhYml0IHNwZWVkLCBz
byB0aGlzIHNob3VsZAo+IG5vdCBiZSB0cmVhdGVkIGFzIGEgZml4Lgo+IAo+IEluIHY4LCBJIHdp
bGwgc3BsaXQgdGhlIGNoYW5nZXMgaW50byB0d28gcGF0Y2hlcyB3aXRoaW4gdGhlIHNhbWUgc2Vy
aWVzOgo+IC0gUGF0Y2ggMSB3aWxsIGNvbnRhaW4gb25seSB0aGUgZml4ZXMgYWZmZWN0aW5nIHRo
ZSBleGlzdGluZyBldGgwCj4gZnVuY3Rpb25hbGl0eSwgYW5kIHdpbGwga2VlcCB0aGUgRml4ZXMg
dGFnLgo+IC0gUGF0Y2ggMiB3aWxsIGFkZCB0aGUgZXRoMSBzdXBwb3J0IChSWCBjbG9jayBpbnZl
cnNpb24gd29ya2Fyb3VuZCkKPiBhcyBuZXcgZnVuY3Rpb25hbGl0eSwgd2l0aG91dCBhIEZpeGVz
IHRhZy4KPiAKPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdvdWxkIHByZWZlciBhIGRpZmZl
cmVudCBzcGxpdCBvciBvcmRlcmluZy4KCklmIHlvdSB3YW50IHRvIGNvbnNpZGVyIHNvbWUgcGFy
dCBvZiB0aGlzIGNvbW1pdCBhIGZpeCBpdCBoYXMgdG8gYmUKcG9zdGVkIHNlcGFyYXRlbHkgdG8g
dGhlIG5ldCB0cmVlIChyYXRoZXIgdGhhbiBuZXQtbmV4dCkuCk9uY2UgaXQncyBtZXJnZWQgYW5k
IG1ha2VzIGl0IHdheSBvdmVyIHRvIHRoZSBuZXQtbmV4dCB0cmVlIChlYWNoClRodXJzZGF5KSB5
b3UgY2FuIHBvc3QgdGhlIG5ldC1uZXh0IGNobmFnZXMgZm9yIGV0aDEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
