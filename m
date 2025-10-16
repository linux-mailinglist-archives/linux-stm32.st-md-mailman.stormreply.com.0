Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B60DBE2130
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 10:02:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 426A7C5719E;
	Thu, 16 Oct 2025 08:02:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 367E3C5719D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 08:02:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 75C80C03B71;
 Thu, 16 Oct 2025 08:01:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 94D946062C;
 Thu, 16 Oct 2025 08:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ADF8C102F22F8; 
 Thu, 16 Oct 2025 10:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760601724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=epg/CJTop2yMwEwTNQzhdUDQRTPIOstndBbKQiZycUs=;
 b=R86uQbSwPtfWBGs3P9qIkZwbYZIxEbHPKPfBOUcKnU4E91PDHpMmVcCdfUM39MUUox04kQ
 G1R/ikQ+nU9LU6nWtmUTpv4+0kCjgzQSITC3ZJteHpc3136OMXJz8TxYWYczhU5h3UoXzW
 BJEud93vn7k6MKpWQYYfI+XBV9MNEioT9ansLB4lAk8o/g8NOBN5JMBmK1eoSfBQJDtfFE
 FMqRKBsa/avl4sAJxydw/fS9LGMQUqKMHF/RHU52F2e7G6wcOmVUfpvFOigddgk3DCjz+A
 HZVtwoZl1uyNj06dWK+wvEu1SCwYeGfgKYXxzcjzxABs+bbtI8WcH7GuXguVvA==
Message-ID: <731e8fa7-465b-4470-9036-c59fea602c07@bootlin.com>
Date: Thu, 16 Oct 2025 10:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-4-maxime.chevallier@bootlin.com>
 <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: ethtool: tsconfig:
 Re-configure hwtstamp upon provider change
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

SGkgS8O2cnksCgpPbiAxNS8xMC8yMDI1IDE0OjQ1LCBLb3J5IE1haW5jZW50IHdyb3RlOgo+IE9u
IFdlZCwgMTUgT2N0IDIwMjUgMTI6Mjc6MjMgKzAyMDAKPiBNYXhpbWUgQ2hldmFsbGllciA8bWF4
aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+IHdyb3RlOgo+IAo+PiBXaGVuIGEgaHdwcm92IHRp
bWVzdGFtcGluZyBzb3VyY2UgaXMgY2hhbmdlZCwgYnV0IHdpdGhvdXQgdXBkYXRpbmcgdGhlCj4+
IHRpbWVzdGFtcGluZyBwYXJhbWV0ZXJzLCB3ZSBtYXkgd2FudCB0byByZWNvbmZpZ3VyZSB0aGUg
dGltZXN0YW1waW5nCj4+IHNvdXJjZSB0byBlbmFibGUgdGhlIG5ldyBwcm92aWRlci4KPj4KPj4g
VGhpcyBpcyBlc3BlY2lhbGx5IGltcG9ydGFudCBpZiB0aGUgc2FtZSBIVyB1bml0IGltcGxlbWVu
dHMgMiBwcm92aWRlcnMsCj4+IGEgcHJlY2lzZSBhbmQgYW4gYXBwcm94IG9uZS4gSW4gdGhpcyBj
YXNlLCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB3ZSBjYWxsCj4+IHRoZSBod3RzdGFtcF9zZXQgb3Bl
cmF0aW9uIGZvciB0aGUgbmV3bHkgc2VsZWN0ZWQgcHJvdmlkZXIuCj4gCj4gVGhpcyBpcyBhIGRl
c2lnbiBjaG9pY2UuCj4gRG8gd2Ugd2FudCB0byBwcmVzZXJ2ZSB0aGUgaHd0c3RhbXAgY29uZmln
IGlmIG9ubHkgdGhlIGh3dHN0YW1wIHNvdXJjZSBpcwo+IGNoYW5nZWQgZnJvbSBldGh0b29sPwo+
IElmIHdlIHdhbnQgdG8gY29uZmlndXJlIHRoZSBuZXcgc291cmNlIHRvIHRoZSBvbGQgc291cmNl
IGNvbmZpZyB3ZSB3aWxsIGFsc28KPiBuZWVkIHRvIHJlbW92ZSB0aGlzIGNvbmRpdGlvbjoKPiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNy4xL3NvdXJjZS9uZXQvZXRodG9v
bC90c2NvbmZpZy5jI0wzMzkKCldoYXQgSSBnZXQgZnJvbSB0aGUgZXRodG9vbCBvdXRwdXQgaXMg
dGhhdCB0aGUgdHMgY29uZmlnIGlzIHBlci1zb3VyY2UuClJlLWFwcGx5aW5nIHRoZSBvbGQgY29u
ZmlnIHRvIHRoZSBuZXcgc291cmNlIG1heSBub3Qgd29yayBpZiB0aGUgbmV3IG9uZQpkb2Vzbid0
IGhhdmUgdGhlIHNhbWUgY2FwYWJpbGl0aWVzLgoKPiAKPiBJIGRvIG5vdCByZWFsbHkgaGF2ZSBh
IHN0cm9uZyBvcGluaW9uIG9uIHRoaXMsIGxldCdzIGRpc2N1c3Mgd2hpY2ggYmVoYXZpb3Igd2UK
PiBwcmVmZXIuCgpXZWxsIGlmIHdlIHdhbnQgdG8gc3VwcG9ydCBkaWZmZXJlbnQgdGltZXN0YW1w
IHByb3ZpZGVycyBwcm92aWRlZCBieSB0aGUgc2FtZQpIVyBibG9jayAoc2FtZSBNQUMgb3IgZXZl
biBzYW1lIFBIWSksIHRoZW4gd2UgbmVlZCBhIHdheSB0byBub3RpZnkgdGhlIHByb3ZpZGVyCndo
ZW4gdGhlIHRpbWVzdGFtcCBwcm92aWRlciBnZXRzIHNlbGVjdGVkIGFuZCB1bnNlbGVjdGVkLgoK
T3RoZXJ3aXNlIHRoZXJlJ3Mgbm8gd2F5IGZvciB0aGUgcHJvdmlkZXIgdG8ga25vdyBpdCBoYXMg
YmVlbiByZS1lbmFibGVkLCB1bmxlc3MKd2UgcGVyZm9ybSBhIGNvbmZpZyBjaGFuZ2UgYXQgdGhl
IHNhbWUgdGltZS4KCk1heGltZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
