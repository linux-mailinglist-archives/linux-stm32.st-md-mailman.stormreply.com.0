Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E95AD71F8
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 15:31:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB04AC32E8E;
	Thu, 12 Jun 2025 13:31:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 880A6C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 13:31:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCgPWj025965;
 Thu, 12 Jun 2025 15:30:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ERviKJzJWlZq/zWcOwo++EjzTpgeVRiokZ0eXobkweM=; b=CEkICjMoTQD0BpEW
 suZqI97L6bGTXYEmI0lLhmS2Ix8pEnmIJHj/w4j00yCvyX9kVbX2PNQv2Lmi3QFv
 HDEskOLiZ8Py1q+A4WKKv9CMH7uTzGKdJIeu80R6cRHVMtTnVQIxzwgDPB7xnuRR
 ijfoEtAvYSluQMpp1+1c2fnyWw3yTPp3qkti4j/vZQcMOvp7y0BN0ay9XHXS8ARo
 q9LRzEgc8F3S2ZV+80Xd2hmJ7VEtFHixDtvZUlg8aguRUhAMuUQeLCASt6l3l7lK
 Mf7xPzOdZCA+HPxzb4mh8aoz4cZGpEf67SDE5YKcLNl2vlNA0BeXuZPgTh9HddHa
 7vdsrQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aums1xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 15:30:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 53BB940046;
 Thu, 12 Jun 2025 15:29:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8557AB9C2B7;
 Thu, 12 Jun 2025 15:28:53 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 15:28:52 +0200
Message-ID: <341950d6-1a2c-4191-948a-6e572fa74cc0@foss.st.com>
Date: Thu, 12 Jun 2025 15:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
 <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
 <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
 <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
 <f1a63830-0533-4f1c-9116-32e8c1e61a8b@kernel.org>
 <26a4f12a-2295-402e-8e31-45733aa6582d@foss.st.com>
 <4f31f016-d250-41ea-b613-b074b8ea00d1@kernel.org>
 <782763e2-99d6-4533-b0db-79b618577586@foss.st.com>
 <30f8e319-4103-44ba-8f98-c01e7b0ba76c@kernel.org>
 <49e5b9ca-6860-4ebe-9856-ae550e1aff42@foss.st.com>
Content-Language: en-US
In-Reply-To: <49e5b9ca-6860-4ebe-9856-ae550e1aff42@foss.st.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-12_02,2025-03-28_01
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 5/9] ARM: dts: stm32: add Hardware
 debug port (HDP) on stm32mp13
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

T24gNi8xMi8yNSAxNToyMSwgQ2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6Cj4gT24gNi8xMi8yNSAx
NTowOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMTIvMDYvMjAyNSAxNTowMiwg
Q2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6Cj4+PiBPbiA2LzEyLzI1IDEzOjA1LCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOgo+Pj4+IE9uIDEyLzA2LzIwMjUgMTE6MzEsIENsZW1lbnQgTEUgR09G
RklDIHdyb3RlOgo+Pj4+PiBPbiA2LzExLzI1IDE3OjQ4LCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+Pj4+Pj4gT24gMTEvMDYvMjAyNSAxNjowOCwgQ2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6
Cj4+Pj4+Pj4gT24gNi8xMS8yNSAwODozNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+
Pj4+Pj4gT24gMTAvMDYvMjAyNSAxNTozMywgQ2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6Cj4+Pj4+
Pj4+PiBPbiA2LzEwLzI1IDE0OjM4LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+Pj4+
Pj4+IE9uIDEwLzA2LzIwMjUgMTQ6MDIsIENsZW1lbnQgTEUgR09GRklDIHdyb3RlOgo+Pj4+Pj4+
Pj4+PiBPbiA1LzI5LzI1IDExOjAxLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+Pj4+
Pj4+Pj4gT24gMjgvMDUvMjAyNSAxNDoxNCwgQ2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6Cj4+Pj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4+Pj4+Pj4+Pj4+
Pj4+ICsKPj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBoZHA6IHBpbmN0cmxANTAwMmEw
MDAgewo+Pj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJzdCxzdG0zMm1wMTMxLWhkcCI7Cj4+Pj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSA8MHg1MDAyYTAwMCAweDQwMD47Cj4+Pj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JnJjYyBIRFA+Owo+Pj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4+
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gV2h5IGFyZSB5b3UgZGlzYWJsaW5nIGl0PyBXaGF0
IGlzIG1pc3Npbmc/Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBOb3RoaW5nIGlzIG1pc3Np
bmcganVzdCBkaXNhYmxlZCBieSBkZWZhdWx0Lgo+Pj4+Pj4+Pj4+Pj4+IFRoZSBub2RlIGlzIHRo
ZW4gZW5hYmxlZCB3aGVuIG5lZWRlZCBpbiBib2FyZCdzIGR0cyBmaWxlLgo+Pj4+Pj4+Pj4+Pj4g
Tm9kZXMgc2hvdWxkIG5vdCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0IGlmIHRoZXkgYXJlIAo+Pj4+
Pj4+Pj4+Pj4gY29tcGxldGUuIFRoYXQncyB3aHkKPj4+Pj4+Pj4+Pj4+IEkgYXNrZWQgd2hhdCBp
cyBtaXNzaW5nLiBEcm9wLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBIaSBLcnp5c3p0b2YsIE9L
IEkgYmV0dGVyIHVuZGVyc3RhbmQgbm93Lgo+Pj4+Pj4+Pj4+PiBTbyB5ZXMgdGhlICdwaW5jdHJs
LSonIHByb3BlcnRpZXMgd2hpY2ggYXJlIGJvYXJkIGRlcGVuZGVudCAKPj4+Pj4+Pj4+Pj4gYXJl
IGxhY2tpbmcuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBUaGVzZSBhcmUgbm90IHByb3BlcnRpZXMg
b2YgdGhpcyBub2RlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IERvZXMgdGhpcyBtZWFuIEkgc2hvdWxk
IGFkZCAncGluY3RybC0qJyBwcm9wZXJ0aWVzIGluIGJpbmRpbmdzIAo+Pj4+Pj4+Pj4geWFtbCBm
aWxlID8KPj4+Pj4+Pj4+IEkgZG9uJ3QgZ2V0IGl0Li4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhlc2Ug
cHJvcGVydGllcyBoYXZlIG5vIG1lYW5pbmcgaGVyZSwgc28gdGhlIGhhcmR3YXJlIAo+Pj4+Pj4+
PiBkZXNjcmlwdGlvbiBpcwo+Pj4+Pj4+PiBjb21wbGV0ZS4gWW91IGNsYWltIHRoYXQgeW91IG1p
c3MgdGhlbSB0aHVzIGRldmljZSBpcyBpbmNvbXBsZXRlIAo+Pj4+Pj4+PiBpcyBqdXN0Cj4+Pj4+
Pj4+IG5vdCBjb3JyZWN0OiB0aGVzZSBwcm9wZXJ0aWVzIGRvIG5vdCBiZWxvbmcgaGVyZSEgVGhl
eSBiZWxvbmcgdG8gCj4+Pj4+Pj4+IHRoZQo+Pj4+Pj4+PiBib2FyZCBidXQgZXZlbiB0aGVyZSB0
aGV5IGFyZSB0b3RhbGx5IG9wdGlvbmFsLiBXaHkgd291bGQgdGhleSBiZSBhCj4+Pj4+Pj4+IHJl
cXVpcmVkIHJlc291cmNlPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUbyByZW1pbmQ6IHdlIHRhbGsgaGVy
ZSBPTkxZIGFib3V0IHJlcXVpcmVkIHJlc291cmNlcy4KPj4+Pj4+Pgo+Pj4+Pj4+IFllcywgJ3Bp
bmN0cmwtKicgcHJvcGVydGllcyBiZWxvbmdzIHRvIHRoZSBib2FyZCBhbmQgYXJlIG5vdCAKPj4+
Pj4+PiByZXF1aXJlZC4KPj4+Pj4+PiBTbyBub3RoaW5nIGlzIG1pc3NpbmcuCj4+Pj4+Pj4KPj4+
Pj4+PiBUaGlzIGhkcCBub2RlIGluIHRoZSBTb0MgZHRzaSBmaWxlIGNhbiBiZSBlbmFibGVkIGJ5
IGRlZmF1bHQuCj4+Pj4+Pj4gQnV0IHRoZSBoZHAgZHJpdmVyIHdpbGwgcHJvYmUgYW5kIGRvIG5v
dGhpbmcgYmVjYXVzZSB3aXRob3V0IHRoZQo+Pj4+Pj4+ICdwaW5jdHJsLSonIHByb3BlcnRpZXMg
ZnJvbSB0aGUgYm9hcmQgZmlsZXMgaXQgd291bGQgbm90IGJlIGFibGUgdG8KPj4+Pj4+PiBhY2Nl
c3MgdG8gYW55IHBpbi4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gUGluY3RybCBoYXMgb3RoZXIgZmVh
dHVyZXMgaW4gZ2VuZXJhbCwgaW5jbHVkaW5nIGludGVyZmFjZXMgdG8gCj4+Pj4+PiB1c2Vyc3Bh
Y2UKPj4+Pj4+IChhcyBwcmV0dHkgb2Z0ZW4gY29tYmluZWQgd2l0aCBncGlvLCBhbHRob3VnaCBu
b3Qgc3VyZSBpZiByZWxldmFudCAKPj4+Pj4+IGhlcmUpLgo+Pj4+Pgo+Pj4+PiBZb3UncmUgcmln
aHQuIEFsc28gSERQIHBpbmN0cmwgaGFzIGEgR1BPIGZlYXR1cmUgYWNjZXNzaWJsZSBmcm9tIAo+
Pj4+PiB1c2Vyc3BhY2UuCj4+Pj4+IEJ1dCBieSBkZWZhdWx0IHRoZSBIRFAgaXMgbm90IGNvbm5l
Y3RlZCB0byBhbnkgcGFkOyBpdCBuZWVkcyB0aGUgYm9hcmQKPj4+Pgo+Pj4+IE9LLCB0aGVuIHRo
YXQgd2FzIHRoZSBhbnN3ZXIgdG8gbXkgZmlyc3QgcXVlc3Rpb24gLSB3aGF0IGlzIG1pc3Npbmcu
Cj4+Pj4gSG93ZXZlciBhcmVuJ3QgdGhlc2UgcGFkcyBjb25uZWN0ZWQgaW50ZXJuYWxseSBhbHNv
IHRvIG90aGVyIHBhcnRzIG9mCj4+Pj4gdGhlIFNvQyAobGlrZSBpbiBtb3N0IG90aGVyIHZlbmRv
cnMpPwo+Pj4KPj4+IE5vLCBIRFAgIm91dHB1dCBwYWRzIiBhcmUgb25seSBjb25uZWN0ZWQgdG8g
U29DIHBpbmN0cmwgdG8gcm91dGUgb3V0c2lkZQo+Pj4gdGhlIGludGVybmFsIFNvQyBzaWduYWxz
IGZvciBkZWJ1ZyBwdXJwb3NlLgo+Pj4KPj4+Pj4gJ3BpbmN0cmwtKicgcHJvcGVydGllcyB0byBj
b25maWd1cmUgdGhlIFNvQyBwaW5jdHJsIGFuZCBleHBvc2UgSERQIG9uCj4+Pj4+IHRoZSBTb0Mg
cGFkcy4KPj4+Pj4KPj4+Pj4gVGhhdCdzIHdoeSBmb3IgbWUgdGhlIGVuYWJsaW5nIG9mIHRoZSBk
cml2ZXIgc2hvdWxkIGJlIGluIHRoZSBib2FyZCAKPj4+Pj4gZmlsZQo+Pj4+PiB0b2dldGhlciB3
aXRoIHRoZSBTb0MgcGluY3RybCBjb25maWd1cmF0aW9uLgo+Pj4+Cj4+Pj4gQW5kIHdoYXQgYXJl
IHRoZSBkZWZhdWx0IHBhZCBzZXR0aW5ncyBjb25maWd1cmVkIGJ5IEhQRCBkcml2ZXIgaW4KPj4+
PiBib290bG9hZGVyIChhbmQgYnkgYm9vdGxvYWRlciBJIG1lYW4gb25lIG9mIGZldyBib290bG9h
ZGVycyB0aGlzIGlzCj4+Pj4gZ29pbmcgdG8gYmUgdXNlZCBvbiBsaWtlIFUtQm9vdCkKPj4+Cj4+
PiBUaGUgZGVmYXVsdCBpcyB0byB1c2UgdGhlIEdQSU8gb2YgdGhlIFNvQyBwaW5jdHJsLiBUaGUg
SERQIGlzIG5vdCByb3V0ZWQKPj4+IG91dHNpZGUuCj4+PiDCoMKgID4+Cj4+Pj4+IFRoZSB1c2Vy
bGFuZCBjYW5ub3QgY2hhbmdlIHRoZSBwaW5jdHJsIGFsdGVybmF0ZSBmdW5jdGlvbiBtdXgsIHRo
aXMgaXMKPj4+Pj4gc3RhdGljYWxseSBkZWZpbmVkIGJ5IHRoZSBkZXZpY2V0cmVlLgo+Pj4+Cj4+
Pj4gSWYgeW91IGV4cG9zZSBHUElPIHRoZW4gdXNlcmxhbmQgbmVlZHMgdGhpcyByZWdhcmRsZXNz
IG9mIGFsdGVybmF0ZSAKPj4+PiBtdXguCj4+Pj4gSU9XLCBib2FyZCBsZXZlbCBjb3VsZCBub3Qg
Y29uZmlndXJlIG11eCBiZWNhdXNlIGl0IHNob3VsZCBiZSBhbHdheXMKPj4+PiBjb25maWd1cmVk
IHRvIHNhZmUgR1BJTyBpbnB1dC4KPj4+Cj4+PiBGb3IgdXNlcmxhbmQgc2lnaHQgdmlldywgU29D
IEdQSU8gYXJlIHByZWZlcnJlZCBpbnN0ZWFkIG9mIEhEUC4KPj4+IEhEUCBpcyBvbmx5IEdQTyBu
b3QgR1BJTy4gJ3BpbmN0cmwtKicgcHJvcGVydGllcyBjb25maWd1cmUgYXQgdGhlIHNhbWUKPj4+
IHRpbWUgdGhlIFNvQyBwaW5jdHJsIG11eCB0byBIRFAgYW5kIHRoZSBIRFAgcGluY3RybCBtdXgg
dG8gb25lIG9mIHRoZQo+Pj4gSERQIGZ1bmN0aW9ucyAoZS5nLiBHUE8pLgo+PiBUaGFua3MsIHRo
YXQncyBleHBsYWlucywgZmluZSB0byBrZWVwIGl0IGRpc2FibGVkLiBVbmxlc3MgaXQgaXMgb2J2
aW91cwo+PiBmb3IgZXZlcnlvbmUsIGl0IHdvdWxkIGJlIG5pY2UgdG8gcHV0IGl0IGluIGNvbW1p
dCBtc2cuCj4gCj4gWW91J3JlIHdlbGNvbWUsIHNvIEknbGwgcHJvdmlkZSB0aGUgVjYgd2l0aCBt
b3JlIGluZm9ybWF0aW9uIGluIHRoZQo+IGNvbW1pdCBtZXNzYWdlIG9mIHBhdGNoIFs1LTddIGFt
b25nIG90aGVyIG5lZWRlZCBmaXhlcy4KClY1KgoKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBLcnp5
c3p0b2YKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LXN0bTMyIG1haWxpbmcgbGlzdAo+IExpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KPiBodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
