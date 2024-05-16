Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626108C7A69
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 18:33:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1423BC6C83A;
	Thu, 16 May 2024 16:33:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE420C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 16:33:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GDhYe5005402;
 Thu, 16 May 2024 18:33:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=2pRzvEKsr2u9WywjaryEnBZCx349KN6Wpc4RHZd+rck=; b=dM
 2SFDJzSYm9AtY55y2HwV2Jyh8tSKydE5jusko5MbfwttReZjEn3YHFd0zMgY6lso
 aEk774snO5txwIxya4PGQGt+fuci8ATwfzLqhyI/SE0iwLLTI3QEP0x686iIuE0p
 yls1WTxNB6EaUDH6CvG0Wst0kOvj55xLoR4yZZemdhAXyIPoCS0SCbzP2Sa6NzEO
 DEQi6AKSAP83EEPGS+sUrFGdfDqdRrfk5JCl/EoXB1PhBEyoHlBjJoYuFSgu+iLN
 q27l4PC/TM7XcBuykhDDbui/wxORAI6++7wO21esoE1U5MHvwxW3Ezrkq3EXJMHz
 eJ0ta5KxTtYs+IhVaoDg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4syme8rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2024 18:33:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E36A340045;
 Thu, 16 May 2024 18:33:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8359226FC6;
 Thu, 16 May 2024 18:32:17 +0200 (CEST)
Received: from [10.48.87.205] (10.48.87.205) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 18:32:17 +0200
Message-ID: <2e5ad8c3-4889-4062-964b-acf4ec75986c@foss.st.com>
Date: Thu, 16 May 2024 18:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>, Marek Vasut <marex@denx.de>
References: <20240513095605.218042-1-patrick.delaunay@foss.st.com>
 <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
 <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
 <20240513-stabilize-proofread-81f0f9ee38b9@spud>
 <d73d4435-75d6-4cea-b38e-07c7ceae3980@foss.st.com>
 <20240514-entryway-idealize-fcd5ed0e1de7@spud>
 <0c97408c-422d-46b3-8017-da9ebb0767e1@foss.st.com>
 <20240515-monsoon-starfish-0dc59707e843@spud>
 <9de93cbb-5868-473e-8b32-a6b6f50e128e@denx.de>
 <20240515-edginess-evacuee-356bd6dd1dfa@spud>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240515-edginess-evacuee-356bd6dd1dfa@spud>
X-Originating-IP: [10.48.87.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Pascal Paillet <p.paillet@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add compatible for STM32MP13
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

SGksCgpPbiA1LzE1LzI0IDE4OjE1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gV2VkLCBNYXkg
MTUsIDIwMjQgYXQgMDU6Mzc6NDlQTSArMDIwMCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDUv
MTUvMjQgNTozNSBQTSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4gT24gV2VkLCBNYXkgMTUsIDIw
MjQgYXQgMDQ6MzM6MjJQTSArMDIwMCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4+PiB3aXRo
Cj4+Pj4KPj4+PiAgIMKgIGNvbXBhdGlibGU6Cj4+Pj4gICDCoMKgwqAgb25lT2Y6Cj4+Pj4gICDC
oMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25z
dDogc3Qsc3RtMzJtcDEscHdyLXJlZwo+Pj4+ICAgwqDCoMKgwqDCoMKgwqAgLSBpdGVtczoKPj4+
PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHN0LHN0bTMybXAxMy1wd3ItcmVnCj4+
Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzdCxzdG0zMm1wMSxwd3ItcmVnCj4+
PiBPdGhlciB0aGFuIHRoZSBleHRyYSAscyB0aGlzIGxvb2tzIG9rYXksIHRoYW5rcy4KPj4gSSB0
aGluayB0aGUgZXh0cmEgLHMgYXJlIGFjdHVhbGx5IGNvcnJlY3QsIHRob3NlIGFyZSB0aGUgb25l
cyBmcm9tIHRoZQo+PiBvcmlnaW5hbCBjb21wYXRpYmxlIHdoaWNoIGhhZCBUV08gLHMgKGl0IGRv
ZXMgbG9vayBhIGJpdCB1bnVzdWFsKS4KPiBPaCBteSBiYWQgdGhlbi4KCgpPaywgSSBwcmVwYXJl
IGEgVjQgd2l0aCBmYWxsYmFjawoKCmFuZCBjb21tYSBpbiBjb21wYXRpYmxlICJzdCxzdG0zMm1w
MSxwd3ItcmVnIiB3YXMgY2xlYXJseSBhbiBlcnJvcgoKYnV0IGl0IGlzIHRvbyBsYXRlIHRvIGNo
YW5nZSBpdCwgc2VlIFsxXQoKWzFdIEFSTTogc3Q6IHVzZSBhIGNvcnJlY3QgcHdyIGNvbXBhdGli
bGUgZm9yIHN0bTMybXAxNQoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LWFybS1rZXJuZWwvbGlzdC8/c2VyaWVzPTg0NzczMyZzdGF0ZT0qIAoKCnJlZ2FyZHMKClBh
dHJpY2sKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
