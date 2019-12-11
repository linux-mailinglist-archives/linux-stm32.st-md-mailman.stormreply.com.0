Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A511A757
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Dec 2019 10:36:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D3AFC36B0B;
	Wed, 11 Dec 2019 09:36:59 +0000 (UTC)
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A72FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2019 09:36:56 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1ieyQ8-0008Ql-42; Wed, 11 Dec 2019 17:36:36 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1ieyQ3-0003HT-Iz; Wed, 11 Dec 2019 17:36:31 +0800
Date: Wed, 11 Dec 2019 17:36:31 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20191211093631.sf2es6tnao6ypk52@gondor.apana.org.au>
References: <1574306448-31868-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574306448-31868-1-git-send-email-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Atul Gupta <atul.gupta@chelsio.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] crypto: Fix Kconfig indentation
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDQ6MjA6NDhBTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1i
eTogSG9yaWEgR2VhbnTEgyA8aG9yaWEuZ2VhbnRhQG54cC5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hh
bmdlcyBzaW5jZSB2MToKPiAxLiBGaXggYWxzbyA3LXNwYWNlIGFuZCB0YWIrMSBzcGFjZSBpbmRl
bnRhdGlvbiBpc3N1ZXMuCj4gLS0tCj4gIGRyaXZlcnMvY3J5cHRvL0tjb25maWcgICAgICAgICB8
IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9jcnlwdG8vY2FhbS9LY29uZmln
ICAgIHwgMTQgKysrKysrKy0tLS0tLS0KPiAgZHJpdmVycy9jcnlwdG8vY2hlbHNpby9LY29uZmln
IHwgMzAgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvY3J5cHRvL3N0
bTMyL0tjb25maWcgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL2NyeXB0by91eDUwMC9LY29uZmln
ICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9u
cygrKSwgNDQgZGVsZXRpb25zKC0pCgpQYXRjaCBhcHBsaWVkLiAgVGhhbmtzLgotLSAKRW1haWw6
IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KSG9tZSBQYWdlOiBodHRw
Oi8vZ29uZG9yLmFwYW5hLm9yZy5hdS9+aGVyYmVydC8KUEdQIEtleTogaHR0cDovL2dvbmRvci5h
cGFuYS5vcmcuYXUvfmhlcmJlcnQvcHVia2V5LnR4dApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
