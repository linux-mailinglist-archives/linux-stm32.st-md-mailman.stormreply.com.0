Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 539FF8FF12C
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2024 17:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00445C6DD67;
	Thu,  6 Jun 2024 15:49:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6D77C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jun 2024 15:49:44 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7DB4187F5C;
 Thu,  6 Jun 2024 17:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717688984;
 bh=oZ6AjegqpphtNzQqTVjigVkYVuIdij5lsm+LsTd1UtQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OJWfsYXrkT/xrqKKC8f0G7vpTqRVoG/3UxJo5NH1cdn0JC9Yt9dabTFrY4oPXk+W9
 9WAFIGbDvbHPI6Ox8lgHVYwEnf1xv3jwzZYpXtslutOdUt7HNrKlXZWsCVuETRBJ/8
 OjZ7JHCqWqSLXK3cXJaUkg/H9I7ECaLbr0y8usap/gU2Yk8HWgCel7gD5UPQhy5Jq+
 aSRxUxkQgw4vP49wQ/ikXJJyrFeieaVg/yZ1NqhJwtcJ5e9PoHbXCtee6PPFiXhfr9
 DTLsqYlSqWXaCBYawwS7t8z7izIKQTHpyWvaN8lNmjzd67mWPu3r/69eUI65g1/OQP
 lvkC69ao7ueuQ==
Message-ID: <ee9a4da7-8b7a-4bd5-8a34-19e0e7cb49ff@denx.de>
Date: Thu, 6 Jun 2024 17:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240604143502.154463-1-christophe.roullier@foss.st.com>
 <20240604143502.154463-8-christophe.roullier@foss.st.com>
 <3c40352b-ad69-4847-b665-e7b2df86a684@denx.de>
 <73f7b4a4-31d1-4907-b83b-2ac7758edf0d@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <73f7b4a4-31d1-4907-b83b-2ac7758edf0d@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 07/11] net: ethernet: stmmac: add
 management of stm32mp13 for stm32
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

T24gNi82LzI0IDQ6MTkgUE0sIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6CgpIaSwKCj4+PiBA
QCAtMzQ4LDggKzM2MCwxNSBAQCBzdGF0aWMgaW50IHN0bTMyX2R3bWFjX3BhcnNlX2RhdGEoc3Ry
dWN0IAo+Pj4gc3RtMzJfZHdtYWMgKmR3bWFjLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBQVFJfRVJSKGR3bWFjLT5yZWdtYXApOwo+Pj4gwqAgwqDCoMKgwqDCoCBlcnIgPSBvZl9wcm9w
ZXJ0eV9yZWFkX3UzMl9pbmRleChucCwgInN0LHN5c2NvbiIsIDEsIAo+Pj4gJmR3bWFjLT5tb2Rl
X3JlZyk7Cj4+PiAtwqDCoMKgIGlmIChlcnIpCj4+PiArwqDCoMKgIGlmIChlcnIpIHsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkNhbid0IGdldCBzeXNjb25maWcgbW9kZSBv
ZmZzZXQgKCVkKVxuIiwgZXJyKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4g
K8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIGR3bWFjLT5tb2RlX21hc2sgPSBTWVNDRkdfTVAx
X0VUSF9NQVNLOwo+Pj4gK8KgwqDCoCBlcnIgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChu
cCwgInN0LHN5c2NvbiIsIDIsIAo+Pj4gJmR3bWFjLT5tb2RlX21hc2spOwo+Pj4gK8KgwqDCoCBp
ZiAoZXJyKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHByX2RlYnVnKCJXYXJuaW5nIHN5c2NvbmZpZyBy
ZWdpc3RlciBtYXNrIG5vdCBzZXRcbiIpOwo+Pgo+PiBJIF90aGlua18geW91IG5lZWQgdG8gbGVm
dC1zaGlmdCB0aGUgbW9kZSBtYXNrIGJ5IDggZm9yIFNUTTMyTVAxM3h4IAo+PiBzZWNvbmQgR01B
QyBzb21ld2hlcmUgaW4gaGVyZSwgcmlnaHQgPwo+Pgo+IFRoZSBzaGlmdCBpcyBwZXJmb3JtZWQg
aW4gZnVuY3Rpb24gc3RtMzJtcDFfY29uZmlndXJlX3BtY3I6Cj4gCj4gIMKgwqDCoCAvKiBTaGlm
dCB2YWx1ZSBhdCBjb3JyZWN0IGV0aGVybmV0IE1BQyBvZmZzZXQgaW4gU1lTQ0ZHX1BNQ1NFVFIg
Ki8KPiAgwqDCoCDCoHZhbCA8PD0gZmZzKGR3bWFjLT5tb2RlX21hc2spIC0gZmZzKFNZU0NGR19N
UDFfRVRIX01BU0spOwo+IAo+IEluIGNhc2Ugb2YgTVAxMyBFdGhlcm5ldDEgb3IgTVAxNSwgc2hp
ZnQgZXF1YWwgMAo+IAo+IEluIGNhc2Ugb2YgTVAxMyBFdGhlcm5ldDIgLCBzaGlmdCBlcXVhbCA4
wqAgOy0pCgpPaCwgZ29vZCwgdGhhbmtzICEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
