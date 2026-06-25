Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 15gQIMHTPGrkswgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 09:07:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 098106C341B
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 09:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=njkmDsA5;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A64B7C5A4C0;
	Thu, 25 Jun 2026 07:07:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 587D7C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 07:07:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A15014E408CB;
 Thu, 25 Jun 2026 07:07:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73EA05FF03;
 Thu, 25 Jun 2026 07:07:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 82406106C84DD; 
 Thu, 25 Jun 2026 09:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1782371261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HKhlYO1rWwC1+kuhbZdMLAovIe+I8+auK56i6UqdxkU=;
 b=njkmDsA57+ghNCGe6eKbMng2cExlwQSFlMa2v9ma8N9ihXXLAquwJMSQW1SeP2sWl3dijT
 9penFFUrSGsFD+fdJMrDAQAr7oxudkV38rDxir3nKfhqI9chafzMDZq2d0XMA8MEr2K3OR
 ePw7YOSo/d5AqTz6rkcqcb8j54f/pm+Vv36B24KppvdfKyaR5ePLF3xLgGvMq3ZDG48brq
 YqV6EmqQUCSDa1QJf4MUAHOWyGk4Uou3HOi2qTGGO2U4bTSwJUEQ2+LEFUCqA2FjUeLQLy
 DaMXHvArxM0vlYr/QyB8PjiYwXipakxHWoZZl8iZa3JeOQQu3+PCBdP5wKPKLQ==
Message-ID: <2a92fd9d-42b3-4564-b784-ec504d4d82b8@bootlin.com>
Date: Thu, 25 Jun 2026 09:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
 <b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
 <20260624192205.4485cd61@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260624192205.4485cd61@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:ben.dooks@codethink.co.uk,m:mcoquelin.stm32@gmail.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,codethink.co.uk,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 098106C341B

CgpPbiA2LzI1LzI2IDA0OjIyLCBKYWt1YiBLaWNpbnNraSB3cm90ZToKPiBPbiBNb24sIDIyIEp1
biAyMDI2IDE5OjUxOjM5ICswMjAwIE1heGltZSBDaGV2YWxsaWVyIHdyb3RlOgo+PiBIaSBCZW4s
Cj4+Cj4+IE9uIDYvMjIvMjYgMTY6MzcsIEJlbiBEb29rcyB3cm90ZToKPj4+IFRoZSBwcmludCBp
biBuZGVzY19kaXNwbGF5X3JpbmcoKSBzZW5kcyB0aGUgZGVzMiBhbmQgZGVzMwo+Pj4gdG8gdGhl
IHByX2luZm8oKSB3aXRob3V0IHBhc3NpbmcgdGhlbSB0aHJvdWdoIHRoZSByZWxldmFudAo+Pj4g
Y29udmVyc2lvbiB0byBjcHUgb3JkZXIuCj4+Pgo+Pj4gRml4IHRoZSAocHJvdG90eXBlKSBzcGFy
c2Ugd2FybmluZ3MgYnkgdXNpbmcgbGUzMl90b19jcHUoKToKPj4+IGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL25vcm1fZGVzYy5jOjI1ODoxNzogd2FybmluZzogaW5jb3JyZWN0
IHR5cGUgaW4gYXJndW1lbnQgNiAoZGlmZmVyZW50IGJhc2UgdHlwZXMpCj4+PiBkcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9ub3JtX2Rlc2MuYzoyNTg6MTc6ICAgIGV4cGVjdGVk
IHVuc2lnbmVkIGludAo+Pj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvbm9y
bV9kZXNjLmM6MjU4OjE3OiAgICBnb3QgcmVzdHJpY3RlZCBfX2xlMzIgW3VzZXJ0eXBlXSBkZXMy
Cj4+PiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9ub3JtX2Rlc2MuYzoyNTg6
MTc6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFyZ3VtZW50IDcgKGRpZmZlcmVudCBiYXNl
IHR5cGVzKQo+Pj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvbm9ybV9kZXNj
LmM6MjU4OjE3OiAgICBleHBlY3RlZCB1bnNpZ25lZCBpbnQKPj4+IGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL25vcm1fZGVzYy5jOjI1ODoxNzogICAgZ290IHJlc3RyaWN0ZWQg
X19sZTMyIFt1c2VydHlwZV0gZGVzMwo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8
YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4gIAo+Pgo+PiBJIGFncmVlIG9uIHRoZSBwcmluY2lw
bGUsIGJ1dCB0aGlzIGlzbid0IGEgZml4IHNvIHRoaXMnbGwgaGF2ZSB0byB3YWl0Cj4+IHVudGls
IG5ldC1uZXh0IHJlLW9wZW5zIDopCj4gCj4gSHVtcGYsIHdoeSBhcmUgd2Ugbm90IHNlZWluZyB0
aGlzIG9uIHg4NiBhbGxtb2Rjb25maWcgPyDwn6SU77iPCj4gCj4gJCBtYWtlIEM9MSBXPTEgZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvbm9ybV9kZXNjLm8gCj4gICBERVNDRU5E
IG9ianRvb2wKPiAgIENDIFtNXSAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
bm9ybV9kZXNjLm8KPiAgIENIRUNLICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvbm9ybV9kZXNjLmMKPiAkCgpIZWggZ29vZCBwb2ludCBpbmRlZWQgIQogIAo+Pj4gRml4IHRo
ZSAocHJvdG90eXBlKSBzcGFyc2Ugd2FybmluZ3MgYnkgdXNpbmcgbGUzMl90b19jcHUoKToKCkJl
biwgd2hhdCdzIHRoaXMgInByb3RvdHlwZSIgc3BhcnNlID8gYSBjdXN0b20gdG9vbCBvZiB5b3Vy
cyB0aGF0CnlvdSB1c2VkIHRvIGZpbmQgdGhhdCA/CgpNYXhpbWUKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
