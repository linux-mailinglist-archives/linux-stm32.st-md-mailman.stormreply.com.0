Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B528C43BC
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 17:06:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3A0EC6DD66;
	Mon, 13 May 2024 15:06:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EBA2C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 15:06:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 42D9A882D8;
 Mon, 13 May 2024 17:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715612808;
 bh=dFRl+UyXsb6ZN6/Bsy1gYor7t7lvZznQLrqAhOOp/wg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kUpaXSXm2V5tAqWUzWOnUcr30a32u+LYIZ6BxWf97mYO/7FVS+xv7W5J0mELzqbg4
 v9aD/SOgXFxAb+RcLQxhgY3RzO8SA+TsV9IGSMWS3+HHKDNibtO0/nTCTxIY3/pDtb
 XYdMzRV2J96o6C2jwFSEoZgPdsdRhkHf3MNi06StgLhEL54ZUk7in+6CcnyngPGZTV
 tLbb+VdnVXOOSOWF2ffkr1LSL1pe0XQ5n6uf5D1qiKWTo+eoyYMGgzcuSAMl7bMAb3
 TL66NN8EzfcplXm6VcYiCgwoll9/7q0KYdFGD4vM13tEHN8kc5dcAix3Ch2WYxqaqN
 9DbYTedQtlvOg==
Message-ID: <601550a5-da3b-4311-965d-ce65f6fdd337@denx.de>
Date: Mon, 13 May 2024 16:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>,
 Rob Herring <robh@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-3-christophe.roullier@foss.st.com>
 <20240426153010.GA1910161-robh@kernel.org>
 <a2a631a0-9a16-4068-aed2-6bdaa71e3953@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a2a631a0-9a16-4068-aed2-6bdaa71e3953@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/11] dt-bindings: net: add phy-supply
 property for stm32
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

T24gNS8xMy8yNCA0OjA2IFBNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+IEhpCj4gCj4g
T24gNC8yNi8yNCAxNzozMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+IE9uIEZyaSwgQXByIDI2LCAy
MDI0IGF0IDAyOjU2OjU4UE0gKzAyMDAsIENocmlzdG9waGUgUm91bGxpZXIgd3JvdGU6Cj4+PiBQ
aGFuZGxlIHRvIGEgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcG93ZXIgdG8gdGhlIFBIWS4gVGhp
cwo+Pj4gcmVndWxhdG9yIHdpbGwgYmUgbWFuYWdlZCBkdXJpbmcgdGhlIFBIWSBwb3dlciBvbi9v
ZmYgc2VxdWVuY2UuCj4+Pgo+Pj4gQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUg
Um91bGxpZXIgPGNocmlzdG9waGUucm91bGxpZXJAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+IMKg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RtMzItZHdtYWMueWFtbCB8
IDMgKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RtMzItZHdt
YWMueWFtbCAKPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdG0z
Mi1kd21hYy55YW1sCj4+PiBpbmRleCBiOTAxYTQzMmRmYTkuLjdjM2FhMTgxYWJjYiAxMDA2NDQK
Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RtMzItZHdt
YWMueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9z
dG0zMi1kd21hYy55YW1sCj4+PiBAQCAtODQsNiArODQsOSBAQCBwcm9wZXJ0aWVzOgo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBvZmZzZXQgb2YgdGhlIGNvbnRyb2wg
cmVnaXN0ZXIKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogZmllbGQg
dG8gc2V0IG1hc2sgaW4gcmVnaXN0ZXIKPj4+ICvCoCBwaHktc3VwcGx5Ogo+Pj4gK8KgwqDCoCBk
ZXNjcmlwdGlvbjogUEhZIHJlZ3VsYXRvcgo+PiBUaGlzIGlzIGZvciB3aGljaCBQSFk/IFRoZSBz
ZXJkZXMgcGh5IG9yIGV0aGVybmV0IHBoeT8gVGhpcyBvbmx5IG1ha2VzCj4+IHNlbnNlIGhlcmUg
aWYgdGhlIHBoeSBpcyBwYXJ0IG9mIHRoZSBNQUMuIE90aGVyd2lzZSwgaXQgYmVsb25ncyBpbiB0
aGUKPj4gcGh5IG5vZGUuCj4+Cj4+IFJvYgo+IAo+IFlvdSBhcmUgcmlnaHQsIG5vcm1hbGx5IGl0
IHNob3VsZCBiZSBtYW5hZ2VkIGluIEV0aGVybmV0IFBIWSAoUmVhbHRlaywgCj4gTWljcm9jaGlw
IGV0Yy4uLikKPiAKPiBMb3RzIG9mIGdsdWUgbWFuYWdlIHRoaXMgbGlrZSB0aGlzLiBEb2VzIGl0
IGZvcmJpZGRlbiBub3cgPyBpZiB5ZXMgbmVlZCAKPiB0byB1cGRhdGUgUEhZIGRyaXZlciB0byBt
YW5hZ2UgdGhpcyBwcm9wZXJ0eS4KCklmIHRoZSByZWd1bGF0b3IgaXMgY29ubmVjdGVkIHRvIHRo
ZSBQSFksIHRoZW4gdGhlIHN1cHBseSBzaG91bGQgYmUgCmRlc2NyaWJlZCBpbiB0aGUgUEhZIG5v
ZGUgYW5kIHlvdSB3b3VsZG4ndCBldmVuIG5lZWQgdGhlc2UgUEhZIHBhdGNoZXMgCihhbHNvIHNl
ZSBteSBjb21tZW50IHRoYXQgeW91IHNob3VsZCBzcGxpdCB0aGUgUEhZIHJlZ3VsYXRvciBwYXJ0
IG9mIAp0aGlzIHBhdGNoc2V0IGludG8gc2VwYXJhdGUgc2VyaWVzKS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
