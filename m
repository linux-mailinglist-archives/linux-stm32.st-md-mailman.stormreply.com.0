Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50012904531
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 21:51:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF078C712A3;
	Tue, 11 Jun 2024 19:51:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 723BCC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 19:50:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3A504883CF;
 Tue, 11 Jun 2024 21:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718135452;
 bh=npnYqV9J2WoKJ9LDtrzlpjRBywAdFkb0PaBEMohzQpg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PGt6yIavQt96y3TUxCeFwwWxA9EbReZ4eHCEu4QB66aznmJItlmSV+FKjI9y6rLmr
 qgXJlbHxmbCN/zefXX7dVlBtv4XySbs3gxd52feZikASCbD55TJmg1Oq1SjQjR/DtF
 30arv7jOgCGQooNWJ+Bxezm0f9PyYP0bRJ4UvAKsLCTDT0RGkl1S33QBPB7vuwEvaC
 nmAzH3rLw8Tfnb4d/qyj1BSujK4MyUBkbqjm6lVvQExC9fOPbXFodcy4vOa9DpTjOp
 u+2wfT3EwXfyGytHZ/2TS/79XyrjgVgP+CPyNhMBVaBM5jtRun07nw4gM2qnj0msTd
 wCf73U/Gxq96Q==
Message-ID: <e0b9b074-3aad-4b2d-9f4e-99ad2eebbb6b@denx.de>
Date: Tue, 11 Jun 2024 18:16:14 +0200
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
References: <20240611083606.733453-1-christophe.roullier@foss.st.com>
 <20240611083606.733453-8-christophe.roullier@foss.st.com>
 <ee101ca5-4444-4610-9473-1a725a542c91@denx.de>
 <7999f3df-da1e-4902-b58a-6bb58546a634@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <7999f3df-da1e-4902-b58a-6bb58546a634@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH v7 7/8] net: stmmac: dwmac-stm32: Mask support for PMCR
 configuration
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

T24gNi8xMS8yNCAzOjMyIFBNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+IAo+IE9uIDYv
MTEvMjQgMTU6MDcsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA2LzExLzI0IDEwOjM2IEFNLCBD
aHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+Pgo+PiBbLi4uXQo+Pgo+Pj4gwqAgc3RhdGljIHZv
aWQgc3RtMzJfZHdtYWNfY2xrX2Rpc2FibGUoc3RydWN0IHN0bTMyX2R3bWFjICpkd21hYywgYm9v
bCAKPj4+IHN1c3BlbmQpCj4+PiBAQCAtMzQ4LDggKzM1MiwxNSBAQCBzdGF0aWMgaW50IHN0bTMy
X2R3bWFjX3BhcnNlX2RhdGEoc3RydWN0IAo+Pj4gc3RtMzJfZHdtYWMgKmR3bWFjLAo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGR3bWFjLT5yZWdtYXApOwo+Pj4gwqAgwqDC
oMKgwqDCoCBlcnIgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChucCwgInN0LHN5c2NvbiIs
IDEsIAo+Pj4gJmR3bWFjLT5tb2RlX3JlZyk7Cj4+PiAtwqDCoMKgIGlmIChlcnIpCj4+PiArwqDC
oMKgIGlmIChlcnIpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkNhbid0
IGdldCBzeXNjb25maWcgbW9kZSBvZmZzZXQgKCVkKVxuIiwgZXJyKTsKPj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZXJyOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIGR3bWFjLT5t
b2RlX21hc2sgPSBTWVNDRkdfTVAxX0VUSF9NQVNLOwo+Pj4gK8KgwqDCoCBlcnIgPSBvZl9wcm9w
ZXJ0eV9yZWFkX3UzMl9pbmRleChucCwgInN0LHN5c2NvbiIsIDIsIAo+Pj4gJmR3bWFjLT5tb2Rl
X21hc2spOwo+Pj4gK8KgwqDCoCBpZiAoZXJyKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9kYmco
ZGV2LCAiV2FybmluZyBzeXNjb25maWcgcmVnaXN0ZXIgbWFzayBub3Qgc2V0XG4iKTsKPj4KPj4g
TXkgY29tbWVudCBvbiBWNiB3YXMgbm90IGFkZHJlc3NlZCBJIHRoaW5rID8KPiAKPiBIaSBNYXJl
aywKPiAKPiBJIHB1dCB0aGUgbW9kaWZpY2F0aW9uIGluIHBhdGNoIHdoaWNoIGludHJvZHVjZSBN
UDEzIChWNyA4LzgpIDstKQo+IAo+ICDCoMKgwqDCoCBlcnIgPSBvZl9wcm9wZXJ0eV9yZWFkX3Uz
Ml9pbmRleChucCwgInN0LHN5c2NvbiIsIDIsIAo+ICZkd21hYy0+bW9kZV9tYXNrKTsKPiAtwqDC
oMKgIGlmIChlcnIpCj4gLcKgwqDCoMKgwqDCoMKgIGRldl9kYmcoZGV2LCAiV2FybmluZyBzeXNj
b25maWcgcmVnaXN0ZXIgbWFzayBub3Qgc2V0XG4iKTsKPiArwqDCoMKgIGlmIChlcnIpIHsKPiAr
wqDCoMKgwqDCoMKgwqAgaWYgKGR3bWFjLT5vcHMtPmlzX21wMTMpCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2X2VycihkZXYsICJTeXNjb25maWcgcmVnaXN0ZXIgbWFzayBtdXN0IGJlIHNl
dCAoJWQpXG4iLCAKPiBlcnIpOwo+ICvCoMKgwqDCoMKgwqDCoCBlbHNlCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2X2RiZyhkZXYsICJXYXJuaW5nIHN5c2NvbmZpZyByZWdpc3RlciBtYXNr
IG5vdCBzZXRcbiIpOwo+ICvCoMKgwqAgfQoKVGhhdCBpc24ndCByaWdodCwgaXMgaXQgPwoKRm9y
IE1QMiAsIHRoaXMgc3RpbGwgY2hlY2tzIHRoZSBwcmVzZW5jZSBvZiBzeXNjb24gLCB3aGljaCBz
aG91bGRuJ3QgYmUgCmNoZWNrZWQgYXQgYWxsIGZvciBNUDIgYXMgZmFyIGFzIEkgdW5kZXJzdGFu
ZCBpdCA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
