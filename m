Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB7AF67E7
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 04:22:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B085DC3F93F;
	Thu,  3 Jul 2025 02:22:03 +0000 (UTC)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 999E4C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 02:22:02 +0000 (UTC)
Message-ID: <9565e540-3dc5-4831-b9bb-7453e5979a21@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1751509321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=934E9G/VFk13K7ue7jt2ZAeg69cidVPg44xfl0uq5KI=;
 b=gxMjs3vQ3tOa+mTvpJv6AjmHN0EyRg0DcW5fQzAaRbnPbRuI111+pbCJRpbIBCXJmmtwMH
 5Etpal8fel6d5RO2Ft4TpaiVEznDYLn91e58qEhESQ8Z7DOrIljjOprRFMDuG5Hj5WIiHe
 jURBv2u3HB7Zw7nGfB7qGGa/+ABJh3M=
Date: Thu, 3 Jul 2025 10:21:52 +0800
MIME-Version: 1.0
To: EricChan <chenchuangyu@xiaomi.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
X-Migadu-Flow: FLOW_OUT
Cc: xiaojianfeng <xiaojianfeng1@xiaomi.com>, netdev@vger.kernel.org,
 Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, xiongliang <xiongliang@xiaomi.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Fix interrupt handling
 for level-triggered mode in DWC_XGMAC2
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

5ZyoIDcvMy8yNSAxMDowNCBBTSwgRXJpY0NoYW4g5YaZ6YGTOgo+IEFjY29yZGluZyB0byB0aGUg
U3lub3BzeXMgQ29udHJvbGxlciBJUCBYR01BQy0xMEcgRXRoZXJuZXQgTUFDIERhdGFib29rCj4g
djMuMzBhIChzZWN0aW9uIDIuNy4yKSwgd2hlbiB0aGUgSU5UTSBiaXQgaW4gdGhlIERNQV9Nb2Rl
IHJlZ2lzdGVyIGlzIHNldAo+IHRvIDIsIHRoZSBzYmRfcGVyY2hfdHhfaW50cl9vW10gYW5kIHNi
ZF9wZXJjaF9yeF9pbnRyX29bXSBzaWduYWxzIG9wZXJhdGUKPiBpbiBsZXZlbC10cmlnZ2VyZWQg
bW9kZS4gSG93ZXZlciwgaW4gdGhpcyBjb25maWd1cmF0aW9uLCB0aGUgRE1BIGRvZXMgbm90Cj4g
YXNzZXJ0IHRoZSBYR01BQ19OSVMgc3RhdHVzIGJpdCBmb3IgUnggb3IgVHggaW50ZXJydXB0IGV2
ZW50cy4KPiAKPiBUaGlzIGNyZWF0ZXMgYSBmdW5jdGlvbmFsIHJlZ3Jlc3Npb24gd2hlcmUgdGhl
IGNvbmRpdGlvbgo+IGlmIChsaWtlbHkoaW50cl9zdGF0dXMgJiBYR01BQ19OSVMpKSBpbiBkd3hn
bWFjMl9kbWFfaW50ZXJydXB0KCkgd2lsbAo+IG5ldmVyIGV2YWx1YXRlIHRvIHRydWUsIHByZXZl
bnRpbmcgcHJvcGVyIGludGVycnVwdCBoYW5kbGluZyBmb3IKPiBsZXZlbC10cmlnZ2VyZWQgbW9k
ZS4gVGhlIGhhcmR3YXJlIHNwZWNpZmljYXRpb24gZXhwbGljaXRseSBzdGF0ZXMgdGhhdAo+ICJU
aGUgRE1BIGRvZXMgbm90IGFzc2VydCB0aGUgTklTIHN0YXR1cyBiaXQgZm9yIHRoZSBSeCBvciBU
eCBpbnRlcnJ1cHQKPiBldmVudHMiIChTeW5vcHN5cyBEV0NfWEdNQUMyIERhdGFib29rIHYzLjMw
YSwgc2VjLiAyLjcuMikuCj4gCgo+IFRoZSBmaXggZW5zdXJlcyBjb3JyZWN0IGhhbmRsaW5nIG9m
IGJvdGggZWRnZSBhbmQgbGV2ZWwtdHJpZ2dlcmVkCj4gaW50ZXJydXB0cyB3aGlsZSBtYWludGFp
bmluZyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggZXhpc3RpbmcKPiBjb25maWd1cmF0aW9u
cy4gSXQgaGFzIGJlZW4gdGVzdGVkIG9uIHRoZSBoYXJkd2FyZSBkZXZpY2UgKG5vdCBwdWJsaWNs
eQo+IGF2YWlsYWJsZSksIGFuZCBpdCBjYW4gcHJvcGVybHkgdHJpZ2dlciB0aGUgUlggYW5kIFRY
IGludGVycnVwdCBoYW5kbGluZwo+IGluIGJvdGggdGhlIElOVE09MCBhbmQgSU5UTT0yIGNvbmZp
Z3VyYXRpb25zLgpJcyB0aGVyZSBhbnlvbmUgd2lsbGluZyB0byBoZWxwIHRlc3QgdGhpcyBwYXRj
aCBvbiBhIHB1YmxpY2x5CmF2YWlsYWJsZSBEV0NfWEdNQUMyIGhhcmR3YXJlIGRldmljZSAoaWYg
c3VjaCBhIHB1YmxpYyBkZXZpY2UgZXhpc3RzKT8KCgpUaGFua3MsCllhbnRlbmcKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
