Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 54rfBobEO2pPcggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 13:50:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7486BDD58
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 13:50:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=sntech.de header.s=gloria202408 header.b=JS+xJ88s;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=sntech.de (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65644C9AE30;
	Wed, 24 Jun 2026 11:50:29 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0947AC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=lO0hgqE9Avytw8qlzJRPWePoOJiVJlIHiSjn9i+FEbY=; b=JS+xJ88sBGk93oWMEscysoluuC
 658s0tG+Eb4BXXO3akz+agVe/Jt+aXOYv2fXFLbrdICbc+MuROfcLS3A/nh3BBKYkgEuDGb/WFDDG
 PATyEu5Fnzn8oWGgZvdczD+JRj5myMae9Mz66E4XTxUE0lXwVL3nqes7544YKUN3wgh/pKysIX99R
 7ev3OruvWpvTIqHLBkN90QmQTLzqyml9JRnFcPZfbWaUew/Y+KcMHuaGTPre8O7357Rj9QJjcsBO/
 3cvZJbi+WdsmL5vQiofJInlGVAc7GDPseiPSKDh2HyhsipnxgugUCx642Gpkk+R/qzRwbV4InFP5M
 5TDFFbvg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Wu <david.wu@rock-chips.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 13:50:18 +0200
Message-ID: <3779785.hdfAi7Kttb@diego>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yanan He <grumpycat921013@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: net: rockchip-dwmac:
	Allow 9 clocks
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[sntech.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sntech.de:s=gloria202408];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:david.wu@rock-chips.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:grumpycat921013@gmail.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,rock-chips.com,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sntech.de:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[diego:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C7486BDD58

QW0gTWl0dHdvY2gsIDI0LiBKdW5pIDIwMjYsIDEwOjQ0OjQwIE1pdHRlbGV1cm9ww6Rpc2NoZSBT
b21tZXJ6ZWl0IHNjaHJpZWIgWWFuYW4gSGU6Cj4gUlYxMTI2IGhhcyBhIHNlcGFyYXRlIEdNQUMg
RXRoZXJuZXQgb3V0cHV0IGNsb2NrIHVzZWQgYXMgdGhlIGV4dGVybmFsCj4gUEhZIHJlZmVyZW5j
ZSBjbG9jay4gVGhpcyBjbG9jayBpcyBkZXNjcmliZWQgaW4gYWRkaXRpb24gdG8gdGhlIGV4aXN0
aW5nCj4gR01BQyBjbG9ja3MuCgpBUyBzdGF0ZWQgaW4gdGhlIGRyaXZlciBwYXRjaCwgdGhpcyBp
cyB0aGUgaW5wdXQgY2xvY2sgZm9yIHRoZSBwaHkKYW5kIGV0aGVybmV0IHBoeXMgYXJlIHBlcmZl
Y3RseSBjYXBhYmxlIG9mIGhhbmRsaW5nIHRoZWlyIGlucHV0CmNsb2Nrcy4gU2VlIHJlZmVyZW5j
ZSBpbiB0aGUgZHJpdmVyIHBhdGNoLgoKCkhlaWtvCgoKPiBTaWduZWQtb2ZmLWJ5OiBZYW5hbiBI
ZSA8Z3J1bXB5Y2F0OTIxMDEzQGdtYWlsLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9yb2NrY2hpcC1kd21hYy55YW1sIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yb2NrY2hpcC1kd21hYy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yb2NrY2hpcC1kd21hYy55
YW1sCj4gaW5kZXggODBjMjUyODQ1MzQ5Li44NmE3ZTgzNjc1YWUgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yb2NrY2hpcC1kd21hYy55YW1sCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yb2NrY2hpcC1kd21h
Yy55YW1sCj4gQEAgLTcxLDcgKzcxLDcgQEAgcHJvcGVydGllczoKPiAgCj4gICAgY2xvY2tzOgo+
ICAgICAgbWluSXRlbXM6IDQKPiAtICAgIG1heEl0ZW1zOiA4Cj4gKyAgICBtYXhJdGVtczogOQo+
ICAKPiAgICBjbG9jay1uYW1lczoKPiAgICAgIGNvbnRhaW5zOgo+IAo+IAoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
