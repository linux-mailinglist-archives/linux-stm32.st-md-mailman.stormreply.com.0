Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLBfLi9/p2kyiAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 01:39:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 751DF1F8F3F
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 01:39:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FDC5C5A4C5;
	Wed,  4 Mar 2026 00:39:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15E1DC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 00:39:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0171243AA8;
 Wed,  4 Mar 2026 00:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46106C2BC9E;
 Wed,  4 Mar 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772584748;
 bh=XfEFP0ePAMl9RzwdsncvUUKsnGIj/z2blRaooWlL5Bw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eiNKQDh0fZuPPjKMDEPIuS+QqGtWQgilLKQuAg75AM6L5IAQdrKv+e1v5OSDMiS4V
 NjFXdg18P/JfxObT4XLpKOC+eq9uXsLq+X00iASe0P9aXIRKGY5wQ9cHFXAKSyhn9J
 q4LU5cBLdUrCEsfPD7VOUKlVDz7qTX4vpDZuJI0bxvIwc3rJFsN7KgEx1GA8RjNTcU
 MICIu13V5phbG0+fx/tDxJNXIIa1AKchlj8SKp5GZgY07BfNCLA3B7BCtKmpCLSy/p
 Q7sM5stjqY41kVanYgSyZQnNiX6Scq4tGR4NTv+fdcInFHFVvpcgOLlqtpJw9zxzph
 bekkRLrZY7Xgg==
Date: Tue, 3 Mar 2026 16:39:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: lizhi2@eswincomputing.com
Message-ID: <20260303163906.187d57a4@kernel.org>
In-Reply-To: <20260303061711.895-1-lizhi2@eswincomputing.com>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061711.895-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, aou@eecs.berkeley.edu, rmk+kernel@armlinux.org.uk,
 wens@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, pjw@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: eic7700:
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
X-Rspamd-Queue-Id: 751DF1F8F3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.913];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[eswincomputing.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

T24gVHVlLCAgMyBNYXIgMjAyNiAxNDoxNzowOCArMDgwMCBsaXpoaTJAZXN3aW5jb21wdXRpbmcu
Y29tIHdyb3RlOgo+ICAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWljNzcwMC5j
ICAgfCAxODAgKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMzcgaW5zZXJ0
aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCgouLi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1laWM3NzAwLmM6MjkwOjMzOiBlcnJvcjogYXNzaWdubWVudCB0byDigJh2
b2lkICgqKSh2b2lkICosIHBoeV9pbnRlcmZhY2VfdCwgIGludCwgIHVuc2lnbmVkIGludCnigJkg
ZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIOKAmHZvaWQgKCopKHZvaWQgKiwgaW50LCAg
dW5zaWduZWQgaW50KeKAmSBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KICAyOTAgfCAg
ICAgICAgIHBsYXRfZGF0LT5maXhfbWFjX3NwZWVkID0gZWljNzcwMF9kd21hY19maXhfc3BlZWQ7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCi4uL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWVpYzc3MDAuYzoxMjk6MTM6IG5vdGU6IOKA
mGVpYzc3MDBfZHdtYWNfZml4X3NwZWVk4oCZIGRlY2xhcmVkIGhlcmUKICAxMjkgfCBzdGF0aWMg
dm9pZCBlaWM3NzAwX2R3bWFjX2ZpeF9zcGVlZCh2b2lkICpwcml2LCBpbnQgc3BlZWQsIHVuc2ln
bmVkIGludCBtb2RlKQogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Ci0tIApwdy1ib3Q6IGNyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
