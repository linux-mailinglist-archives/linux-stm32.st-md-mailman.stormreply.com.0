Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 139E38902A4
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 16:08:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BA93C6DD96;
	Thu, 28 Mar 2024 15:08:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1F97C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 15:08:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42SENT78017636; Thu, 28 Mar 2024 16:08:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=iLOweYbCsmn698CJ46dWyC3tf2LxrlF3WpWQb+3oxRE=; b=zp
 u+15rjkBN0yym8/YKQUXKM7KkDrPXNb9xjRmvtVUWcwUoAA7fwTn2+GqQbrvk1fD
 07bu7tF8IK1QJaSKPiZDfuu6HSMjHkn9NObrsultisKGcOfQHHseo1zme7sMk3BY
 8wiGfR4FwPkyXwXQeSRWiDPDWABG7RXz85nwtKpB4IurCvxQNxyA5dvJIRbxhqWM
 LiMrXzMQAO0SnLYOJwIlt4zg0lvvFdZ8rjPlEQSv6RHauyNw34Uz/jU59xwIN4W9
 vDg32W4tGw5vo06quCrMLd3mr4pOquc8b5ELSfyQmv8EvWnt6FnnPnGXV0tMLuPK
 7cx7o3DgklHKP0reBu0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x1n39tw26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Mar 2024 16:08:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7EC9B40044;
 Thu, 28 Mar 2024 16:08:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFE3F2248BB;
 Thu, 28 Mar 2024 16:07:03 +0100 (CET)
Received: from [10.201.21.128] (10.201.21.128) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Mar
 2024 16:07:02 +0100
Message-ID: <6df41c81-0aa4-48a5-a069-d8a742f412ef@foss.st.com>
Date: Thu, 28 Mar 2024 16:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240328140803.324141-1-christophe.roullier@foss.st.com>
 <20240328140803.324141-2-christophe.roullier@foss.st.com>
 <480d4064-b553-4005-ad98-499a862703ff@denx.de>
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <480d4064-b553-4005-ad98-499a862703ff@denx.de>
X-Originating-IP: [10.201.21.128]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_15,2024-03-27_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 1/1] dt-bindings: net: dwmac: Document
 STM32 property st, ext-phyclk
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

Ck9uIDMvMjgvMjQgMTU6MTksIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDMvMjgvMjQgMzowOCBQ
TSwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToKPgo+IFsuLi5dCj4KPj4gfCBSTUlJwqDCoMKg
IHzCoMKgwqAgLcKgwqAgfMKgwqDCoMKgIGV0aC1ja8KgwqDCoCB8IGV0aC1ja8KgwqDCoMKgwqDC
oMKgIHzCoMKgwqDCoMKgwqAgbi9hwqDCoMKgwqDCoMKgwqAgfAo+PiB8wqDCoMKgwqDCoMKgwqDC
oCB8wqDCoMKgwqDCoMKgwqAgfCBzdCxleHQtcGh5Y2xrIHwgc3QsZXRoLXJlZi1jbGstc2VsIAo+
PiB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+IHzCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IG9yIHN0
LGV4dC1waHljbGsgCj4+IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4K
Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tIAo+Pgo+Pgo+PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVyQGZvc3Muc3QuY29tPgo+
PiAtLS0KPj4gwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdG0zMi1k
d21hYy55YW1sIHwgNyArKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvc3RtMzItZHdtYWMueWFtbCAKPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L3N0bTMyLWR3bWFjLnlhbWwKPj4gaW5kZXggZmM4Yzk2YjA4ZDdkYy4uYjM1ZWFlODBl
ZDZhYyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9zdG0zMi1kd21hYy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvc3RtMzItZHdtYWMueWFtbAo+PiBAQCAtODIsNiArODIsMTMgQEAgcHJvcGVydGll
czoKPj4gwqDCoMKgwqDCoMKgwqAgU2hvdWxkIGJlIHBoYW5kbGUvb2Zmc2V0IHBhaXIuIFRoZSBw
aGFuZGxlIHRvIHRoZSBzeXNjb24gbm9kZSAKPj4gd2hpY2gKPj4gwqDCoMKgwqDCoMKgwqAgZW5j
b21wYXNlcyB0aGUgZ2x1ZSByZWdpc3RlciwgYW5kIHRoZSBvZmZzZXQgb2YgdGhlIGNvbnRyb2wg
Cj4+IHJlZ2lzdGVyCj4+IMKgICtzdCxleHQtcGh5Y2xrOgo+Cj4gRG9uJ3QgeW91IG5lZWQgdHdv
IHNwYWNlcyBpbiBmcm9udCBvZiB0aGUgJ3N0LCcgaGVyZSA/ClNvcnJ5LCB0aGF0J3MgcmlnaHQu
Cj4KPj4gK8KgwqDCoCBkZXNjcmlwdGlvbjoKPj4gK8KgwqDCoMKgwqAgc2V0IHRoaXMgcHJvcGVy
dHkgaW4gUk1JSSBtb2RlIHdoZW4geW91IGhhdmUgUEhZIHdpdGhvdXQgCj4+IGNyeXN0YWwgNTBN
SHogYW5kIHdhbnQgdG8KPj4gK8KgwqDCoMKgwqAgc2VsZWN0IFJDQyBjbG9jayBpbnN0ZWFkIG9m
IEVUSF9SRUZfQ0xLLiBPUiBpbiBSR01JSSBtb2RlIHdoZW4gCj4+IHlvdSB3YW50IHRvIHNlbGVj
dAo+PiArwqDCoMKgwqDCoCBSQ0MgY2xvY2sgaW5zdGVhZCBvZiBFVEhfQ0xLMTI1Lgo+PiArwqDC
oMKgIHR5cGU6IGJvb2xlYW4KPj4gKwo+Cj4gV2l0aCB0aGF0IGZpeGVkOgo+Cj4gUmV2aWV3ZWQt
Ynk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
