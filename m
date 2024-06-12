Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D11AC904B5C
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2024 08:09:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88BE4C712A3;
	Wed, 12 Jun 2024 06:09:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68EA1C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2024 06:08:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C66ALM015571;
 Wed, 12 Jun 2024 08:08:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4BuUrXtJ8nfNNbqSYjYdRBD5SKv01tJO1QN5QZpZwhI=; b=4YEtz0TZAySLCvkt
 xsYGrK2KlgXBA3ZTzl8DpJTicjrfPqgOYmBaMOUedIFtNJf3CAacwbg32SjpFPj5
 FjFU2V6dc5LjbUibIwq2t7clfaqY19tzoAPYAbN2+coabAB2BslmoUzPJ7ZOUKlf
 E8XUu1aUAOl6fCU1PnSs6BWA/VigR0sHEUybaUD5GmcK0lFFafQwPHYIXutQr+hh
 93VQ4jZxw9uC0LV+7orKpX1I99B8vNmYaBO3+DRsGCs7iJxo1Mt0K+iFn1+ycRfM
 G7Z9HeUp0dZHOFLInm8yH6MvG3mF5keqLLi1QpdCjTR3v9d3lriOJS9FK8o18gwr
 aoD9CA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypub39r2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 08:08:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B2BCA40044;
 Wed, 12 Jun 2024 08:08:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90E0420D41D;
 Wed, 12 Jun 2024 08:07:10 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 12 Jun
 2024 08:07:09 +0200
Message-ID: <1f5000c4-30cd-40fd-b610-24366a15fd6c@foss.st.com>
Date: Wed, 12 Jun 2024 08:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240611083606.733453-1-christophe.roullier@foss.st.com>
 <20240611083606.733453-8-christophe.roullier@foss.st.com>
 <ee101ca5-4444-4610-9473-1a725a542c91@denx.de>
 <7999f3df-da1e-4902-b58a-6bb58546a634@foss.st.com>
 <e0b9b074-3aad-4b2d-9f4e-99ad2eebbb6b@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <e0b9b074-3aad-4b2d-9f4e-99ad2eebbb6b@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
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

SGkgTWFyZWssCgpPbiA2LzExLzI0IDE4OjE2LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzEx
LzI0IDM6MzIgUE0sIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+Cj4+IE9uIDYvMTEvMjQg
MTU6MDcsIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gT24gNi8xMS8yNCAxMDozNiBBTSwgQ2hyaXN0
b3BoZSBSb3VsbGllciB3cm90ZToKPj4+Cj4+PiBbLi4uXQo+Pj4KPj4+PiDCoCBzdGF0aWMgdm9p
ZCBzdG0zMl9kd21hY19jbGtfZGlzYWJsZShzdHJ1Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjLCAKPj4+
PiBib29sIHN1c3BlbmQpCj4+Pj4gQEAgLTM0OCw4ICszNTIsMTUgQEAgc3RhdGljIGludCBzdG0z
Ml9kd21hY19wYXJzZV9kYXRhKHN0cnVjdCAKPj4+PiBzdG0zMl9kd21hYyAqZHdtYWMsCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGR3bWFjLT5yZWdtYXApOwo+Pj4+IMKg
IMKgwqDCoMKgwqAgZXJyID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJzdCxzeXNj
b24iLCAxLCAKPj4+PiAmZHdtYWMtPm1vZGVfcmVnKTsKPj4+PiAtwqDCoMKgIGlmIChlcnIpCj4+
Pj4gK8KgwqDCoCBpZiAoZXJyKSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2
LCAiQ2FuJ3QgZ2V0IHN5c2NvbmZpZyBtb2RlIG9mZnNldCAoJWQpXG4iLCBlcnIpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDC
oMKgIGR3bWFjLT5tb2RlX21hc2sgPSBTWVNDRkdfTVAxX0VUSF9NQVNLOwo+Pj4+ICvCoMKgwqAg
ZXJyID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJzdCxzeXNjb24iLCAyLCAKPj4+
PiAmZHdtYWMtPm1vZGVfbWFzayk7Cj4+Pj4gK8KgwqDCoCBpZiAoZXJyKQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBkZXZfZGJnKGRldiwgIldhcm5pbmcgc3lzY29uZmlnIHJlZ2lzdGVyIG1hc2sgbm90
IHNldFxuIik7Cj4+Pgo+Pj4gTXkgY29tbWVudCBvbiBWNiB3YXMgbm90IGFkZHJlc3NlZCBJIHRo
aW5rID8KPj4KPj4gSGkgTWFyZWssCj4+Cj4+IEkgcHV0IHRoZSBtb2RpZmljYXRpb24gaW4gcGF0
Y2ggd2hpY2ggaW50cm9kdWNlIE1QMTMgKFY3IDgvOCkgOy0pCj4+Cj4+IMKgwqDCoMKgwqAgZXJy
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJzdCxzeXNjb24iLCAyLCAKPj4gJmR3
bWFjLT5tb2RlX21hc2spOwo+PiAtwqDCoMKgIGlmIChlcnIpCj4+IC3CoMKgwqDCoMKgwqDCoCBk
ZXZfZGJnKGRldiwgIldhcm5pbmcgc3lzY29uZmlnIHJlZ2lzdGVyIG1hc2sgbm90IHNldFxuIik7
Cj4+ICvCoMKgwqAgaWYgKGVycikgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGR3bWFjLT5vcHMt
PmlzX21wMTMpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiU3lzY29u
ZmlnIHJlZ2lzdGVyIG1hc2sgbXVzdCBiZSBzZXQgCj4+ICglZClcbiIsIGVycik7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBlbHNlCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9kYmcoZGV2LCAi
V2FybmluZyBzeXNjb25maWcgcmVnaXN0ZXIgbWFzayBub3Qgc2V0XG4iKTsKPj4gK8KgwqDCoCB9
Cj4KPiBUaGF0IGlzbid0IHJpZ2h0LCBpcyBpdCA/Cj4KPiBGb3IgTVAyICwgdGhpcyBzdGlsbCBj
aGVja3MgdGhlIHByZXNlbmNlIG9mIHN5c2NvbiAsIHdoaWNoIHNob3VsZG4ndCAKPiBiZSBjaGVj
a2VkIGF0IGFsbCBmb3IgTVAyIGFzIGZhciBhcyBJIHVuZGVyc3RhbmQgaXQgPwoKV2hlbiBJIHdp
bGwgcHVzaCBNUDIgc2VyaWUsIEkgd2lsbCBieXBhc3MgdGhlIGNoZWNrIG9mIG1hc2sgc3lzY2Zn
LiBJIAp3aWxsIHB1c2ggTVAyIGFmdGVyIE1QMTMgYWNrLgoKVGhhbmtzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
