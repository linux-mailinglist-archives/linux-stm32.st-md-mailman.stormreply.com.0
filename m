Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JiHNCtGQPGqupQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 04:22:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D77E6C25C5
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 04:22:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=HiOavYNd;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47616C58D77;
	Thu, 25 Jun 2026 02:22:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93861C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 02:22:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F72A418E7;
 Thu, 25 Jun 2026 02:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE40A1F000E9;
 Thu, 25 Jun 2026 02:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782354126;
 bh=UlrC4XUDtorWQW364JN0VeT9+sVnJidBJZvQBFd/jWU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HiOavYNdbdkx11uI3Z7iAu3Qr+Vw+lNFKBH5kxQwAHLtGi8sTYQFSblscjPerahV8
 3SXc/H+XSsYx1QjjkBQHPtR0TOS/H7pdRKXl9va4pzL60yYe9X6oDu8VIpy5VzmIhl
 oeG8ZSGjblxHCO6ixyCLeGbenNyIKRcA4sFj04cqHth2B6vUcuW5ozkPtax89wo0W9
 J69L2VeRA5/9TcOwUMS+Qbff5CiZKPWH6Ip8JydeUXavGLwDx7Bqf5f3FUWJzIafrG
 vpA6AE+Zz65Bj+JmhZWhZHRRlOAfN1JbjPPcsI8uUs74hlPbVJCJF0l1qTQ70hwkRc
 2sx0qwAn3VAfg==
Date: Wed, 24 Jun 2026 19:22:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20260624192205.4485cd61@kernel.org>
In-Reply-To: <b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
References: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
 <b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix missed le32_to_cpu()
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:ben.dooks@codethink.co.uk,m:mcoquelin.stm32@gmail.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,codethink.co.uk,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codethink.co.uk:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D77E6C25C5

T24gTW9uLCAyMiBKdW4gMjAyNiAxOTo1MTozOSArMDIwMCBNYXhpbWUgQ2hldmFsbGllciB3cm90
ZToKPiBIaSBCZW4sCj4gCj4gT24gNi8yMi8yNiAxNjozNywgQmVuIERvb2tzIHdyb3RlOgo+ID4g
VGhlIHByaW50IGluIG5kZXNjX2Rpc3BsYXlfcmluZygpIHNlbmRzIHRoZSBkZXMyIGFuZCBkZXMz
Cj4gPiB0byB0aGUgcHJfaW5mbygpIHdpdGhvdXQgcGFzc2luZyB0aGVtIHRocm91Z2ggdGhlIHJl
bGV2YW50Cj4gPiBjb252ZXJzaW9uIHRvIGNwdSBvcmRlci4KPiA+IAo+ID4gRml4IHRoZSAocHJv
dG90eXBlKSBzcGFyc2Ugd2FybmluZ3MgYnkgdXNpbmcgbGUzMl90b19jcHUoKToKPiA+IGRyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL25vcm1fZGVzYy5jOjI1ODoxNzogd2Fybmlu
ZzogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgNiAoZGlmZmVyZW50IGJhc2UgdHlwZXMpCj4g
PiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9ub3JtX2Rlc2MuYzoyNTg6MTc6
ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGludAo+ID4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvbm9ybV9kZXNjLmM6MjU4OjE3OiAgICBnb3QgcmVzdHJpY3RlZCBfX2xlMzIgW3Vz
ZXJ0eXBlXSBkZXMyCj4gPiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9ub3Jt
X2Rlc2MuYzoyNTg6MTc6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFyZ3VtZW50IDcgKGRp
ZmZlcmVudCBiYXNlIHR5cGVzKQo+ID4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvbm9ybV9kZXNjLmM6MjU4OjE3OiAgICBleHBlY3RlZCB1bnNpZ25lZCBpbnQKPiA+IGRyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL25vcm1fZGVzYy5jOjI1ODoxNzogICAgZ290
IHJlc3RyaWN0ZWQgX19sZTMyIFt1c2VydHlwZV0gZGVzMwo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+ICAKPiAKPiBJIGFncmVlIG9u
IHRoZSBwcmluY2lwbGUsIGJ1dCB0aGlzIGlzbid0IGEgZml4IHNvIHRoaXMnbGwgaGF2ZSB0byB3
YWl0Cj4gdW50aWwgbmV0LW5leHQgcmUtb3BlbnMgOikKCkh1bXBmLCB3aHkgYXJlIHdlIG5vdCBz
ZWVpbmcgdGhpcyBvbiB4ODYgYWxsbW9kY29uZmlnID8g8J+klO+4jwoKJCBtYWtlIEM9MSBXPTEg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvbm9ybV9kZXNjLm8gCiAgREVTQ0VO
RCBvYmp0b29sCiAgQ0MgW01dICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9u
b3JtX2Rlc2MubwogIENIRUNLICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
bm9ybV9kZXNjLmMKJApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
