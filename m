Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C227D9C47
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Oct 2023 16:55:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50161C6C841;
	Fri, 27 Oct 2023 14:55:58 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71F1DC6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:55:56 +0000 (UTC)
Received: from [192.168.1.90] (unknown [188.24.143.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DF43660732A;
 Fri, 27 Oct 2023 15:55:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698418555;
 bh=pC/2ckA4eIWbV5Hbrpc+VBynF0iUF/+d8KlgFpe55xM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=WjuUPCwE1Gcpq9PFx2gnR501PN6fY7fzv2/6mj25FJztfY1Z5J7kyJ4e/nNUqjIy1
 uO/ysTkxYiMaLCVl1XL3eK5jy15uni5zBxT3UqwsgPYz2xxLRvJQ5QRScJEPIaA8Ll
 44lkQ5GoWzJEYt6jyickaJfc8VqSgUJOXLGCoKnNy8nlY0V18RATa1ZfQN2ZOjBxdv
 drnGacZUnH3+E+HN9iwkp72SN41/AnYxiNsnFaDFHN2lCA6xKajSDEuVUABwhkNIkl
 jmkbd3StyhrBWPng+/Q0PdUm3rO/WC+PgtgjSrLfgbxeAFhkbLCpg8ybkW2rVd/yUo
 NFU+44OB0VAIg==
Message-ID: <d8ebed94-fd1b-4ee5-ae04-f8b6f66cd5a6@collabora.com>
Date: Fri, 27 Oct 2023 17:55:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
 <Y+e74UIV/Td91lKB@lunn.ch>
 <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
 <Y+zXv90rGfQupjPP@lunn.ch>
 <cfa0f980-4bb6-4419-909c-3fce697cf8f9@collabora.com>
 <Y+5t4Jlb0ytw40pu@lunn.ch>
 <a824a7f6-0a62-7cab-180b-f20297311a2b@collabora.com>
 <Y++BZWhJm1LpdrA9@lunn.ch>
 <350b400f-210a-a2cf-0828-25beb1b93a43@collabora.com>
In-Reply-To: <350b400f-210a-a2cf-0828-25beb1b93a43@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 07/12] dt-bindings: net: Add StarFive
	JH7100 SoC
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

T24gMi8xNy8yMyAxNzoyNSwgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdyb3RlOgo+IE9uIDIvMTcvMjMg
MTU6MzAsIEFuZHJldyBMdW5uIHdyb3RlOgo+Pj4+IEkgd291bGQgYWN0dWFsbHkgc2F5IGl0IHNo
b3dzIHdlIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBpcyBnb2luZyBvbgo+Pj4+IHdpdGggZGVsYXlz
LiAicmdtaWkiIGlzIG5vdCBldmVyeSBvZnRlbiB0aGUgY29ycmVjdCB2YWx1ZS4gVGhlIGZhY3Qg
aXQKPj4+PiB3b3JrcyBzdWdnZXN0cyB0aGUgTUFDIGlzIGFkZGluZyBkZWxheXMuCj4+Pj4KPj4+
PiBXaGF0IHZhbHVlIGFyZSB5b3UgdXNpbmcgZm9yIHN0YXJmaXZlLGd0eGNsay1kbHljaGFpbiA/
Cj4+Pgo+Pj4gVGhpcyBpcyBzZXQgdG8gJzQnIGluIHBhdGNoIDEyLzEyLgo+Pj4KPj4+PiBUcnkg
MCBhbmQgdGhlbiAicmdtaWktaWQiCj4+Pgo+Pj4gSSBtYWRlIHNvbWUgbW9yZSB0ZXN0cyBhbmQg
aXQgc2VlbXMgdGhlIG9ubHkgc3RhYmxlIGNvbmZpZ3VyYXRpb24gaXMKPj4+ICJyZ21paSIKPj4+
IHdpdGggInN0YXJmaXZlLGd0eGNsay1kbHljaGFpbiIgc2V0IHRvIDQ6Cj4+Pgo+Pj4gcGh5LW1v
ZGUgfCBkbHljaGFpbiB8IHN0YXR1cwo+Pj4gLS0tLS0tLS0tKy0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IHJnbWlpwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoCA0IHwgT0sgKG5vIGlzc3VlcyBvYnNlcnZlZCkKPj4+IHJnbWlpLWlkIHzCoMKg
wqDCoMKgwqDCoCA0IHwgQlJPS0VOIChlcnJvcnMgcmVwb3J0ZWQgWzFdKQo+Pj4gcmdtaWnCoMKg
wqAgfMKgwqDCoMKgwqDCoMKgIDAgfCBVTlJFTElBQkxFIChubyBlcnJvcnMsIGJ1dCBmcmVxdWVu
dCBzdGFsbHMpCj4+PiByZ21paS1pZCB8wqDCoMKgwqDCoMKgwqAgMCB8IEJST0tFTiAoZXJyb3Jz
IHJlcG9ydGVkKQo+Pj4KPj4+IFsxXSBSZXBvcnRlZCBlcnJvcnMgaW4gY2FzZSBvZiBCUk9LRU4g
c3RhdHVzOgo+Pj4gJCBncmVwICcnIC9zeXMvY2xhc3MvbmV0L2V0aDAvc3RhdGlzdGljcy8qIHwg
Z3JlcCAtdiAnOjAkJwo+Pgo+PiBUaGFua3MgZm9yIHRoZSB0ZXN0aW5nLgo+Pgo+PiBTbyBpdCBz
ZWVtcyBsaWtlIHNvbWV0aGluZyBpcyBhZGRpbmcgZGVsYXlzIHdoZW4gaXQgcHJvYmFibHkgc2hv
dWxkCj4+IG5vdC4gSWRlYWxseSB3ZSB3YW50IHRvIGtub3cgd2hhdC4KPj4KPj4gVGhlcmUgaXMg
YSBkYW5nZXIgaGVyZSwgc29tZXRoaW5nIHdoaWNoIGhhcyBoYXBwZW5lZCBpbiB0aGUgcGFzdC4g
QQo+PiBQSFkgd2hpY2ggaWdub3JlZCAicmdtaWkiIGFuZCBhY3R1YWxseSBkaWQgcG93ZXIgb24g
ZGVmYXVsdHMgd2hpY2ggd2FzCj4+ICJyZ21paS1pZCIuIEFzIGEgcmVzdWx0LCBsb3RzIG9mIGJv
YXJkcyBwdXQgInJtZ2lpIiBpbiB0aGVyZSBEVCBibG9iLAo+PiB3aGljaCAnd29ya2VkJy4gVW50
aWwgYSBib2FyZCBjYW1lIGFsb25nIHdoaWNoIHJlYWxseSBkaWQgbmVlZAo+PiAicmdtaWkiLiBU
aGUgZGV2ZWxvcGVyIGJyaW5naW5nIHRoYXQgYm9hcmQgdXAgZGVidWdnZWQgdGhlIFBIWSwgZm91
bmQKPj4gdGhlIHByb2JsZW0gYW5kIG1hZGUgaXQgcmVzcGVjdCAicmdtaWkiIHNvIHRoZWlyIGJv
YXJkIHdvcmtlZC4gQW5kIHRoZQo+PiBmaXggYnJva2UgYSBudW1iZXIgb2YgJ3dvcmtpbmcnIGJv
YXJkcyB3aGljaCBoYWQgdGhlIHdyb25nICJyZ21paSIKPj4gaW5zdGVhZCBvZiAicmdtaWktaWQi
Lgo+IAo+IFRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLgo+IAo+PiBTbyB5b3UgaGF2ZSBhIGNob2lj
ZS4gR28gd2l0aCA0IGFuZCAicmdtaWkiLCBidXQgcHV0IGluIGEgYmlnIGZhdAo+PiB3YXJuaW5n
LCAiV29ya3Mgc29tZWhvdyBidXQgaXMgdGVjaG5pY2FsbHkgd3JvbmcgYW5kIHdpbGwgcHJvYmFi
bHkKPj4gYnJlYWsgc29tZXRpbWUgaW4gdGhlIGZ1dHVyZSIuIE9yIHRyeSB0byB1bmRlcnN0YW5k
IHdoYXQgaXMgcmVhbGx5Cj4+IGdvaW5nIG9uIGhlcmUsIHdlcmUgYXJlIHRoZSBkZWxheXMgY29t
aW5nIGZyb20sIGFuZCBmaXggdGhlIGlzc3VlLgo+Pgo+PiDCoMKgwqDCoMKgwqAgQW5kcmV3Cj4g
Cj4gSSB3aWxsIHRyeSB0byBhbmFseXplIHRoaXMgZnVydGhlci4KCkFzIHRoZSBub24tY29oZXJl
bnQgRE1BIHdvcmsgdGhpcyBzZXJpZXMgZGVwZW5kZWQgb24gaGFzIGJlZW4gY29tcGxldGVkLApJ
IHN0YXJ0ZWQgdG8gaW52ZXN0aWdhdGUgZnVydGhlciB0aGUgInJnbWlpLWlkIiBpc3N1ZS4KSSBj
b3VsZG4ndCBzcG90IGFueXRoaW5nIHdyb25nIGluIHRoZSBNb3RvcmNvbW0gUEhZIGRyaXZlciwg
YnV0CmV2ZW50dWFsbHkgZ290IHRoaXMgd29ya2luZyBieSBhZGp1c3RpbmcgcngtaW50ZXJuYWwt
ZGVsYXktcHMuCgpXaWxsIGRvIHNvbWUgbW9yZSB0ZXN0aW5nIGJlZm9yZSBzdWJtaXR0aW5nIHYy
LgoKVGhhbmtzLApDcmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
