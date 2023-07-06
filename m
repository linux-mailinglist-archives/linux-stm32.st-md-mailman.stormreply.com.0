Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E2749882
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 11:31:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE6C2C6B45C;
	Thu,  6 Jul 2023 09:31:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39DB8C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 09:31:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3667J8tL028476; Thu, 6 Jul 2023 11:30:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QjdN1V/hI6Mx6jHfQb/2NbbcyfO5P8v8g9k00xWpqD4=;
 b=DYCthB7alQTQ3lrROhg7wOy4r1QjzIouOx6L/IhrmzziUxxOXE/SAY/s3xl5nbC6MKjP
 yKTOupwej1UZTT1NzllCw19pAI/ozfW4DzFp93ABJK04vmnrhUVTRSeHfQBMiFRmMCS6
 RE6I1Z7cJ131NjJJcG1uMwLxnvvWKLJSrY1Ldr2zQqHHRB5gF6YmNXEW5uDS8b7ASW9K
 9NavX8kCT/YO35Q8WUwtoqHl0/n1GZUt3sDcUAgcu4R4+QK48NXobdWd0egzTTMZmYXB
 Fcl1NvDUv2WloUvJGVEtMGRv5s06I3e2+JLxzO7J8eoNhgBH/rQgPUF5qHlO3YrPxajT yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rns47s4ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 11:30:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3A43100052;
 Thu,  6 Jul 2023 11:30:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E997C216ED4;
 Thu,  6 Jul 2023 11:30:47 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 6 Jul
 2023 11:30:46 +0200
Message-ID: <997780a9-1cbc-46a2-2743-7fd493682278@foss.st.com>
Date: Thu, 6 Jul 2023 11:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <vkoul@kernel.org>, <jic23@kernel.org>,
 <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
 <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
 <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
 <catalin.marinas@arm.com>, <arnd@kernel.org>, <richardcochran@gmail.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-8-gatien.chevallier@foss.st.com>
 <61d93738-4ffd-411d-d32c-912c14eea56d@foss.st.com>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <61d93738-4ffd-411d-d32c-912c14eea56d@foss.st.com>
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_06,2023-07-06_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 07/10] arm64: dts: st: add RIFSC as a
 domain controller for STM32MP25x boards
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

SGkgQWxleCwKCk9uIDcvNi8yMyAxMToyNSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBH
YXRpZW4KPiAKPiBPbiA3LzUvMjMgMTk6MjcsIEdhdGllbiBDaGV2YWxsaWVyIHdyb3RlOgo+PiBS
SUZTQyBpcyBhIGZpcmV3YWxsIGNvbnRyb2xsZXIuIENoYW5nZSBpdHMgY29tcGF0aWJsZSBzbyB0
aGF0IGlzIG1hdGNoZXMKPj4gdGhlIGRvY3VtZW50YXRpb24gYW5kIHJlZmVyZW5jZSBSSUZTQyBh
cyBhIGZlYXR1cmUtZG9tYWluLWNvbnRyb2xsZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdhdGll
biBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKg
IGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIHwgNSArKysrLQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAKPj4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaQo+PiBpbmRleCA1MjY4YTQzMjE4NDEu
LjYyMTAxMDg0Y2FiOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0z
Mm1wMjUxLmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0
c2kKPj4gQEAgLTEwNiwxNyArMTA2LDIwIEBAIHNvY0AwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJhbmdlcyA9IDwweDAgMHgwIDB4MCAweDgwMDAwMDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJpZnNjOiByaWZzYy1idXNANDIwODAwMDAgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21w
YXRpYmxlID0gInN0LHN0bTMybXAyNS1yaWZzYyI7Cj4gCj4gWW91IGNvdWxkIGtlZXAgInNpbXBs
ZS1idXMiIGNvbXBhdGlibGUgKGluIHNlY29uZCBwb3NpdGlvbikuIEluIGNhc2Ugb2YgCj4gdGhl
IFJJRlNDIGlzIG5vdCBwcm9iZWQsIHRoZSBwbGF0Zm9ybSB3aWxsIGJlIGFibGUgdG8gYm9vdC4g
SWYgeW91IGFncmVlIAo+IHlvdSBjYW4gdXNlIHRoZSBzYW1lIGZvciBFVFpQQy4KPiAKPiBDaGVl
cnMKPiBBbGV4CgpTdXJlLCBnb29kIHBvaW50LgoKSSdsbCBjaGFuZ2UgdGhhdCBpbiBWMgoKQmVz
dCByZWdhcmRzLApHYXRpZW4KPiAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0g
PDB4NDIwODAwMDAgMHgxMDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2FkZHJl
c3MtY2VsbHMgPSA8MT47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxz
ID0gPDE+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYW5nZXM7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZlYXR1cmUtZG9tYWluLWNvbnRyb2xsZXI7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICNmZWF0dXJlLWRvbWFpbi1jZWxscyA9IDwxPjsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdXNhcnQyOiBzZXJpYWxANDAwZTAwMDAgewo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJoNy11YXJ0IjsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHg0MDBlMDAwMCAweDQw
MD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDExNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JmNrX2ZsZXhnZW5fMDg+Owo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZlYXR1cmUtZG9tYWlucyA9IDwmcmlmc2MgMzI+Owo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
