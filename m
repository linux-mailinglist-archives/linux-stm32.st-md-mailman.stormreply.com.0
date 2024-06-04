Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D38FAED8
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 11:32:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39402C6DD67;
	Tue,  4 Jun 2024 09:32:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0708C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 09:32:18 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4548spgB031426;
 Tue, 4 Jun 2024 11:31:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FQi2ng79ZmbW4+Hz+M/vUkFGo0dt44niiSmJA3UNOB8=; b=NNFQbzPsDaCwdtSy
 KCUCxh7vVExEbs/WTmc6yBoocLwdNPcmaMvPOrXmvjPyz3nfjvVK8yHVSleKOCYm
 /M1EuRO+4cfQrS3NAk+RhnWopiCC3u+/EJCaKq3ifO1fjPucLkaL5CCsBczqvGUo
 EL7+ulOBJs4NgJ2Vk51Y6DXsu+7lUS/HGnX29LRDtgu+XWj4JtjYjdhe5EPlAVrL
 1TPqEiCUivRfx/hU0ztCgTou81vLETZ3TbOOpLzJUUgtPnv0R1Qy2jz7HvubfqNp
 EM5UUJ0hhbTOKwFSbr+T3OQEzWFCvxAslndZQlZTO0P1jIiATomnYh85TDMQBfVZ
 az5vEg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ygd70sge1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2024 11:31:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0626840045;
 Tue,  4 Jun 2024 11:31:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 46232211F37;
 Tue,  4 Jun 2024 11:30:43 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 11:30:42 +0200
Message-ID: <291953b7-ed37-4b09-9009-588ffdd12fe7@foss.st.com>
Date: Tue, 4 Jun 2024 11:30:41 +0200
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
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-11-christophe.roullier@foss.st.com>
 <29b79c7d-7ff6-40fb-97be-7198a0e9d437@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <29b79c7d-7ff6-40fb-97be-7198a0e9d437@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 10/11] ARM: dts: stm32: add ethernet1
 for STM32MP135F-DK board
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

Ck9uIDYvMy8yNCAxNTowOCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNi8zLzI0IDExOjI3IEFN
LCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+PiBFdGhlcm5ldDE6IFJNSUkgd2l0aCBjcnlz
dGFsCj4+IFBIWSB1c2VkIGlzIFNNU0MgKExBTjg3NDJBKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVyQGZvc3Muc3QuY29tPgo+PiAt
LS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRzIHwgMjQgKysr
KysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1k
ay5kdHMgCj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRzCj4+IGlu
ZGV4IDU2N2U1M2FkMjg1ZmEuLmNlYmU5YjkxZWNlZDkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cwo+PiArKysgYi9hcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMKPj4gQEAgLTE5LDYgKzE5LDcgQEAgLyB7Cj4+IMKgwqDC
oMKgwqAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTM1Zi1kayIsICJzdCxzdG0zMm1wMTM1IjsK
Pj4gwqAgwqDCoMKgwqDCoCBhbGlhc2VzIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGV0aGVybmV0MCA9
ICZldGhlcm5ldDE7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZXJpYWwwID0gJnVhcnQ0Owo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgc2VyaWFsMSA9ICZ1c2FydDE7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBzZXJpYWwyID0gJnVhcnQ4Owo+PiBAQCAtMTQxLDYgKzE0MiwyOSBAQCAmY3J5cCB7Cj4+IMKg
wqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+PiDCoCB9Owo+PiDCoCArJmV0aGVybmV0MSB7Cj4+
ICvCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+PiArwqDCoMKgIHBpbmN0cmwtMCA9IDwmZXRoMV9y
bWlpX3BpbnNfYT47Cj4+ICvCoMKgwqAgcGluY3RybC0xID0gPCZldGgxX3JtaWlfc2xlZXBfcGlu
c19hPjsKPj4gK8KgwqDCoCBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiOwo+PiAr
wqDCoMKgIHBoeS1tb2RlID0gInJtaWkiOwo+PiArwqDCoMKgIG1heC1zcGVlZCA9IDwxMDA+Owo+
Cj4gSXMgdGhpcyBuZWVkZWQgPyBSTUlJIGNhbm5vdCBnbyBmYXN0ZXIgdGhhbiAxMDAgLgo+Cm9r
IChJIHdpbGwgcHV0IGluIHY0KQo+IEFsc28sIGtlZXAgdGhlIGxpc3Qgc29ydGVkIGFscGhhYmV0
aWNhbGx5ICwgUCBnb2VzIGFmdGVyIE0gLgpvayAoSSB3aWxsIHB1dCBpbiB2NCkKPgo+PiArwqDC
oMKgIHBoeS1oYW5kbGUgPSA8JnBoeTBfZXRoMT47Cj4+ICsKPj4gK8KgwqDCoCBtZGlvIHsKPj4g
K8KgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArwqDCoMKgwqDCoMKgwqAg
I3NpemUtY2VsbHMgPSA8MD47Cj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNucHMs
ZHdtYWMtbWRpbyI7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHBoeTBfZXRoMTogZXRoZXJuZXQt
cGh5QDAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImV0aGVybmV0
LXBoeS1pZDAwMDcuYzEzMSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0LWdwaW9z
ID3CoCA8Jm1jcDIzMDE3IDkgR1BJT19BQ1RJVkVfTE9XPjsKPgo+IEV4dHJhIHNwYWNlIGJldHdl
ZW4gPSBhbmQgPCAsIHBsZWFzZSBkcm9wLgpvayAoSSB3aWxsIHB1dCBpbiB2NCkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
