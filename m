Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDB4901C23
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 09:56:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CE15C6C858;
	Mon, 10 Jun 2024 07:56:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6F17C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 07:56:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459KxQcm013767;
 Mon, 10 Jun 2024 09:56:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yUKOFPOQwgaRW01h/tUPDgk5dTLq6HjrNeJuxMsBV3w=; b=4b+FObhIu7awR+Oj
 axyQMwNtyspUjkysg4sAb4ZMzRR9eaHY+fccYwXqQQNk83L5UA7vGr12lHrxqjxY
 Kxnelk55DtgzfmIt5fD0Cu/S/nFt+dmOsNcCndDwN20CvzgGHOLmKEoYqJ+X2+RN
 Rcne6hOqisd/rwg/0bfweDNrhpYi/YpflY6mUTni5FYSOnyC5w6QdUHd/1hUnDAC
 tstW9dpmalPvNhkgld9C9jHjbL1cD+YKdVGCgLEnuV+yI9empFO8RAUjzPXmppIh
 UiPoo4GE23wFSDePOQCHPwaPj9rJdL5+hpfBG9Y9xztRQGHDX+4kLBe4IaNNOe8C
 MdabPg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ymemxnmtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 09:56:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2D57540044;
 Mon, 10 Jun 2024 09:56:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60AF7211940;
 Mon, 10 Jun 2024 09:55:07 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 09:55:06 +0200
Message-ID: <908c2e86-8255-4e76-8665-0b7d02853681@foss.st.com>
Date: Mon, 10 Jun 2024 09:55:05 +0200
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
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-10-christophe.roullier@foss.st.com>
 <6d60bbc6-5ed3-4bb1-ad72-18a2be140b81@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <6d60bbc6-5ed3-4bb1-ad72-18a2be140b81@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 09/12] ARM: dts: stm32: add ethernet1
 and ethernet2 support on stm32mp13
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

T24gNi83LzI0IDE0OjQ4LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzcvMjQgMTE6NTcgQU0s
IENocmlzdG9waGUgUm91bGxpZXIgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4+IEBAIC0xNTA1LDYgKzE1
MTEsMzggQEAgc2RtbWMyOiBtbWNANTgwMDcwMDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH07Cj4+IMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV0aGVybmV0MTogZXRoZXJu
ZXRANTgwMGEwMDAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGli
bGUgPSAic3Qsc3RtMzJtcDEzLWR3bWFjIiwgInNucHMsZHdtYWMtNC4yMGEiOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDU4MDBhMDAwIDB4MjAwMD47Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnLW5hbWVzID0gInN0bW1hY2V0aCI7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwm
aW50YyBHSUNfU1BJIDYyIAo+PiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZleHRpIDY4
IDE+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdC1uYW1lcyA9
ICJtYWNpcnEiLCAiZXRoX3dha2VfaXJxIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjbG9jay1uYW1lcyA9ICJzdG1tYWNldGgiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIm1hYy1jbGstdHgiLAo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIm1hYy1jbGstcngiLAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImV0
aHN0cCIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAiZXRoLWNrIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3Mg
PSA8JnJjYyBFVEgxTUFDPiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPCZyY2MgRVRIMVRYPiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPCZyY2MgRVRIMVJYPiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgPCZyY2MgRVRIMVNUUD4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDwmcmNjIEVUSDFDS19LPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdCxzeXNjb24gPSA8JnN5c2NmZyAweDQgMHhmZjAwMDA+Owo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNucHMsbWl4ZWQtYnVyc3Q7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc25wcyxwYmwgPSA8Mj47Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc25wcyxheGktY29uZmlnID0gPCZzdG1tYWNfYXhpX2NvbmZpZ18xPjsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLHRzbzsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhY2Nlc3MtY29udHJvbGxlcnMgPSA8JmV0enBjIDQ4PjsK
Pgo+IEtlZXAgdGhlIGxpc3Qgc29ydGVkLgoKSGkgTWFyZWssCgpBcyBhbHJlYWR5IGV4cGxhaW5l
ZCwgYWxsIE1QMTMgSVBzIGhhdmUgdGhpcyBwcm9wZXJ0eSBiZWZvcmUgInN0YXR1cyIuIApJZiB3
ZSBtdXN0IG1vdmUgdGhpcyBwcm9wZXJ0eSwgd2Ugd2lsbCBkbyBpdCBsYXRlciBhbmQgZG8gaXQg
Zm9yIGFsbCBJUHMuCgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
