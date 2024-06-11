Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C05F5903D75
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 15:34:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D5DAC712A3;
	Tue, 11 Jun 2024 13:34:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80D9BC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 13:33:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BCI3c7027544;
 Tue, 11 Jun 2024 15:33:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yc4KsdWifRz6rWcxt8D4eZPRcwDWS3GJ2TG1rWFVqRo=; b=p/Rld3O29KvUSLHb
 0AWiU0UliT8PMxuaA7PA2/iLR8IHkBHkNlHlYjW0rxLicuqwGztFOBW6/MbtznWv
 frCWj/2YKwxc48GTk7YWziKkUzNZIa3J37VIGy/xjS019Vq/ThQ/e3ex1inRWSob
 ur9A7Vn76oAR0Ko6jMcCXJ70ZsI9pbXDAFJlyTzuS8uLHmBq5PdrrN3fXLtAMaUQ
 ZgoAl/f3XszurgUOI3Ko0RjXImVNYxJ/jxAf4RLKUHivcsNc3gglawMJkGc9RU+m
 ZWlY1CeDcTFnOGM4/E8tsQSxumiA6mCVL7g8rEG5vitiJ245RESCn2lfjfSiGJ64
 /dNMiw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp432sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 15:33:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ADC9140044;
 Tue, 11 Jun 2024 15:33:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5298215BEA;
 Tue, 11 Jun 2024 15:32:11 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 15:32:10 +0200
Message-ID: <7999f3df-da1e-4902-b58a-6bb58546a634@foss.st.com>
Date: Tue, 11 Jun 2024 15:32:10 +0200
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
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <ee101ca5-4444-4610-9473-1a725a542c91@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
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

Ck9uIDYvMTEvMjQgMTU6MDcsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDYvMTEvMjQgMTA6MzYg
QU0sIENocmlzdG9waGUgUm91bGxpZXIgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4+IMKgIHN0YXRpYyB2
b2lkIHN0bTMyX2R3bWFjX2Nsa19kaXNhYmxlKHN0cnVjdCBzdG0zMl9kd21hYyAqZHdtYWMsIGJv
b2wgCj4+IHN1c3BlbmQpCj4+IEBAIC0zNDgsOCArMzUyLDE1IEBAIHN0YXRpYyBpbnQgc3RtMzJf
ZHdtYWNfcGFyc2VfZGF0YShzdHJ1Y3QgCj4+IHN0bTMyX2R3bWFjICpkd21hYywKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGR3bWFjLT5yZWdtYXApOwo+PiDCoCDCoMKgwqDC
oMKgIGVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAic3Qsc3lzY29uIiwgMSwg
Cj4+ICZkd21hYy0+bW9kZV9yZWcpOwo+PiAtwqDCoMKgIGlmIChlcnIpCj4+ICvCoMKgwqAgaWYg
KGVycikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJDYW4ndCBnZXQgc3lz
Y29uZmlnIG1vZGUgb2Zmc2V0ICglZClcbiIsIGVycik7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gZXJyOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGR3bWFjLT5tb2RlX21hc2sgPSBT
WVNDRkdfTVAxX0VUSF9NQVNLOwo+PiArwqDCoMKgIGVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
X2luZGV4KG5wLCAic3Qsc3lzY29uIiwgMiwgCj4+ICZkd21hYy0+bW9kZV9tYXNrKTsKPj4gK8Kg
wqDCoCBpZiAoZXJyKQo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2RiZyhkZXYsICJXYXJuaW5nIHN5
c2NvbmZpZyByZWdpc3RlciBtYXNrIG5vdCBzZXRcbiIpOwo+Cj4gTXkgY29tbWVudCBvbiBWNiB3
YXMgbm90IGFkZHJlc3NlZCBJIHRoaW5rID8KCkhpIE1hcmVrLAoKSSBwdXQgdGhlIG1vZGlmaWNh
dGlvbiBpbiBwYXRjaCB3aGljaCBpbnRyb2R1Y2UgTVAxMyAoVjcgOC84KSA7LSkKCiAgCWVyciA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAic3Qsc3lzY29uIiwgMiwgJmR3bWFjLT5t
b2RlX21hc2spOwotCWlmIChlcnIpCi0JCWRldl9kYmcoZGV2LCAiV2FybmluZyBzeXNjb25maWcg
cmVnaXN0ZXIgbWFzayBub3Qgc2V0XG4iKTsKKwlpZiAoZXJyKSB7CisJCWlmIChkd21hYy0+b3Bz
LT5pc19tcDEzKQorCQkJZGV2X2VycihkZXYsICJTeXNjb25maWcgcmVnaXN0ZXIgbWFzayBtdXN0
IGJlIHNldCAoJWQpXG4iLCBlcnIpOworCQllbHNlCisJCQlkZXZfZGJnKGRldiwgIldhcm5pbmcg
c3lzY29uZmlnIHJlZ2lzdGVyIG1hc2sgbm90IHNldFxuIik7CisJfQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
