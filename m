Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iN1jGOVSQmo24wkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 13:11:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EBE6D93B5
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 13:11:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=codethink.co.uk header.s=imap5-20230908 header.b="5jj+/jM8";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=codethink.co.uk (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 564E8C0693D;
	Mon, 29 Jun 2026 11:11:32 +0000 (UTC)
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D904C424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Reply-To; bh=jPAvt4qaBDMoIurCHx70ouodE4Ai1NaWhHP67n45SmU=; b=5jj+/jM8kzonl4B7
 XJdz4oWYE8E8yYUtrOmNyccKZxdT86dDo5mmb/lELsNfM2q4/9lPJrbgSPCbq0l9hhS/Ic4FNhWRm
 CQ6tIi760AvxADxXVzgVttzly7dQbzSaSYCD7FRCXlXSxXSHpT4dNMMDMaSLeJa/acNYBioYmMAlt
 9tnhVQdD6TMQPgAj/PWazeEsVbgwCjdVNB2VcaOFtnRASUZCr9YwJ1Hicjf0p13qPTK3q65+dZ1to
 cACsKcRR+VVeoNZpIZhKOtE4YIlvukMcAo9NQQzktprBzN+uVg9Y918AEDVoFXuIAXEE4t3paW22/
 +fbV6rq/AHfYOFXDyw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1we9tN-000PL2-9D; Mon, 29 Jun 2026 12:11:09 +0100
Message-ID: <74e05f3d-39a6-4a4c-8bc3-d4f23a54ef69@codethink.co.uk>
Date: Mon, 29 Jun 2026 12:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
 <b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
 <20260624192205.4485cd61@kernel.org>
 <2a92fd9d-42b3-4564-b784-ec504d4d82b8@bootlin.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <2a92fd9d-42b3-4564-b784-ec504d4d82b8@bootlin.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[codethink.co.uk : SPF not aligned (relaxed),reject,sampled_out];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[codethink.co.uk:s=imap5-20230908];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[ben.dooks@codethink.co.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[codethink.co.uk:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codethink.co.uk:mid,codethink.co.uk:email,codethink.co.uk:url,codethink.co.uk:from_mime,stormreply.com:url,stormreply.com:email,marc.info:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7EBE6D93B5

T24gMjUvMDYvMjAyNiAwODowNywgTWF4aW1lIENoZXZhbGxpZXIgd3JvdGU6Cj4gCj4gCj4gT24g
Ni8yNS8yNiAwNDoyMiwgSmFrdWIgS2ljaW5za2kgd3JvdGU6Cj4+IE9uIE1vbiwgMjIgSnVuIDIw
MjYgMTk6NTE6MzkgKzAyMDAgTWF4aW1lIENoZXZhbGxpZXIgd3JvdGU6Cj4+PiBIaSBCZW4sCj4+
Pgo+Pj4gT24gNi8yMi8yNiAxNjozNywgQmVuIERvb2tzIHdyb3RlOgo+Pj4+IFRoZSBwcmludCBp
biBuZGVzY19kaXNwbGF5X3JpbmcoKSBzZW5kcyB0aGUgZGVzMiBhbmQgZGVzMwo+Pj4+IHRvIHRo
ZSBwcl9pbmZvKCkgd2l0aG91dCBwYXNzaW5nIHRoZW0gdGhyb3VnaCB0aGUgcmVsZXZhbnQKPj4+
PiBjb252ZXJzaW9uIHRvIGNwdSBvcmRlci4KPj4+Pgo+Pj4+IEZpeCB0aGUgKHByb3RvdHlwZSkg
c3BhcnNlIHdhcm5pbmdzIGJ5IHVzaW5nIGxlMzJfdG9fY3B1KCk6Cj4+Pj4gZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvbm9ybV9kZXNjLmM6MjU4OjE3OiB3YXJuaW5nOiBpbmNv
cnJlY3QgdHlwZSBpbiBhcmd1bWVudCA2IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPj4+PiBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9ub3JtX2Rlc2MuYzoyNTg6MTc6ICAgIGV4
cGVjdGVkIHVuc2lnbmVkIGludAo+Pj4+IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL25vcm1fZGVzYy5jOjI1ODoxNzogICAgZ290IHJlc3RyaWN0ZWQgX19sZTMyIFt1c2VydHlw
ZV0gZGVzMgo+Pj4+IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL25vcm1fZGVz
Yy5jOjI1ODoxNzogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgNyAoZGlmZmVy
ZW50IGJhc2UgdHlwZXMpCj4+Pj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
bm9ybV9kZXNjLmM6MjU4OjE3OiAgICBleHBlY3RlZCB1bnNpZ25lZCBpbnQKPj4+PiBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9ub3JtX2Rlc2MuYzoyNTg6MTc6ICAgIGdvdCBy
ZXN0cmljdGVkIF9fbGUzMiBbdXNlcnR5cGVdIGRlczMKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPj4+Cj4+PiBJIGFncmVlIG9u
IHRoZSBwcmluY2lwbGUsIGJ1dCB0aGlzIGlzbid0IGEgZml4IHNvIHRoaXMnbGwgaGF2ZSB0byB3
YWl0Cj4+PiB1bnRpbCBuZXQtbmV4dCByZS1vcGVucyA6KQo+Pgo+PiBIdW1wZiwgd2h5IGFyZSB3
ZSBub3Qgc2VlaW5nIHRoaXMgb24geDg2IGFsbG1vZGNvbmZpZyA/IPCfpJTvuI8KPj4KPj4gJCBt
YWtlIEM9MSBXPTEgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvbm9ybV9kZXNj
Lm8KPj4gICAgREVTQ0VORCBvYmp0b29sCj4+ICAgIENDIFtNXSAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvbm9ybV9kZXNjLm8KPj4gICAgQ0hFQ0sgICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9ub3JtX2Rlc2MuYwo+PiAkCj4gCj4gSGVoIGdvb2QgcG9p
bnQgaW5kZWVkICEKPiAgICAKPj4+PiBGaXggdGhlIChwcm90b3R5cGUpIHNwYXJzZSB3YXJuaW5n
cyBieSB1c2luZyBsZTMyX3RvX2NwdSgpOgo+IAo+IEJlbiwgd2hhdCdzIHRoaXMgInByb3RvdHlw
ZSIgc3BhcnNlID8gYSBjdXN0b20gdG9vbCBvZiB5b3VycyB0aGF0Cj4geW91IHVzZWQgdG8gZmlu
ZCB0aGF0ID8KCkkgaGF2ZSBhbiBSRkMgdG8gYWRkIHZhcmlhZGljIGFuZCB0aHVzIGFsc28gcHJp
bnRmL3NjYW5mIGZvcm1hdHRpbmcKdG8gc3BhcnNlLiBUaGlzIGlzIHdhaXRpbmcgb24gcmV2aWV3
IGFmdGVyIHRoZSBvcmlnaW5hbCBnb3QgcmUtd29ya2VkCnRvIGFkZCBzY2FuZiBhbmQgYSBmZXcg
b3RoZXIgYnVnLWZpeGVkIGFuZCBzaHVmZmxlcy4KClJlZjogaHR0cHM6Ly9tYXJjLmluZm8vP2w9
bGludXgtc3BhcnNlJm09MTc4MTg1Mjc0NjAwNjc5Jnc9MgoKCi0tIApCZW4gRG9va3MJCQkJaHR0
cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQ
cm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1s
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
