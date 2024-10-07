Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586B993045
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 17:00:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E21C6DD94;
	Mon,  7 Oct 2024 15:00:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46B9CC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 15:00:17 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497BL5xg003601;
 Mon, 7 Oct 2024 16:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BJ8Knk1OilaXvESuSFI3aU6RMgbAH9yejobycbQkYhg=; b=faxNql5faKfAou6p
 EZ+UECY5U+KLZiBJtDX1R4fkCO+eRfv/PxOodhiM2F9+CfvRiHFNJltQrMyARQu+
 GqXh/y0uf2LAAm0DYLsOOHKKH0nQE4/utct4UE5ErMfuEm5EO7A7DY1Sa2G7Wszh
 nsB72b33nxoXkKlgni+In0vQrPpTTIE98wO9PN392ts5YhC/FwIKtthF62DuNtjb
 RygPljlMDnOfnAsN7ncI/MNIhP2Woteuac0GIijAn1siZe8KcoTEnowX+yOOpbQ3
 E5lVd8jG7FevDcGGtKMe6T4syzrH8i8QGIozLNvOsRQnQMJ5WeKBTnSdawgjdVqh
 8Pl7bw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f10pt0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 16:59:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A773E40048;
 Mon,  7 Oct 2024 16:58:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 379592216F8;
 Mon,  7 Oct 2024 16:57:27 +0200 (CEST)
Received: from [10.48.86.225] (10.48.86.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 16:57:26 +0200
Message-ID: <2e1ee778-06b1-4cb3-b10a-6f5a97338d82@foss.st.com>
Date: Mon, 7 Oct 2024 16:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Olivia Mackall <olivia@selenic.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-2-gatien.chevallier@foss.st.com>
 <a7b2d849-ce6c-46b3-bf4f-c619106e2edd@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <a7b2d849-ce6c-46b3-bf4f-c619106e2edd@denx.de>
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: rng: add st,
	stm32mp25-rng support
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

CgpPbiAxMC83LzI0IDE1OjUzLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxMC83LzI0IDM6Mjcg
UE0sIEdhdGllbiBDaGV2YWxsaWVyIHdyb3RlOgo+PiBBZGQgUk5HIFNUTTMyTVAyNXggcGxhdGZv
cm1zIGNvbXBhdGlibGUuIFVwZGF0ZSB0aGUgY2xvY2sKPj4gcHJvcGVydGllcyBtYW5hZ2VtZW50
IHRvIHN1cHBvcnQgYWxsIHZlcnNpb25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hl
dmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiDCoCAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ybmcvc3Qsc3RtMzItcm5nLnlhbWwgfCA0MSArKysrKysrKysr
KysrKysrKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3JuZy9zdCxzdG0zMi1ybmcueWFtbCAKPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvcm5nL3N0LHN0bTMyLXJuZy55YW1sCj4+IGluZGV4IDM0MGQwMWQ0ODFkMS4uYzky
Y2U5MmI2YWM5IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvcm5nL3N0LHN0bTMyLXJuZy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ybmcvc3Qsc3RtMzItcm5nLnlhbWwKPj4gQEAgLTE4LDEyICsxOCwxOSBAQCBw
cm9wZXJ0aWVzOgo+PiDCoMKgwqDCoMKgIGVudW06Cj4+IMKgwqDCoMKgwqDCoMKgIC0gc3Qsc3Rt
MzItcm5nCj4+IMKgwqDCoMKgwqDCoMKgIC0gc3Qsc3RtMzJtcDEzLXJuZwo+PiArwqDCoMKgwqDC
oCAtIHN0LHN0bTMybXAyNS1ybmcKPj4gwqDCoMKgIHJlZzoKPj4gwqDCoMKgwqDCoCBtYXhJdGVt
czogMQo+PiDCoMKgwqAgY2xvY2tzOgo+PiAtwqDCoMKgIG1heEl0ZW1zOiAxCj4+ICvCoMKgwqAg
bWluSXRlbXM6IDEKPj4gK8KgwqDCoCBtYXhJdGVtczogMgo+PiArCj4+ICvCoCBjbG9jay1uYW1l
czoKPj4gK8KgwqDCoCBpdGVtczoKPj4gK8KgwqDCoMKgwqAgLSBjb25zdDogcm5nX2Nsawo+PiAr
wqDCoMKgwqDCoCAtIGNvbnN0OiBybmdfaGNsawo+PiDCoMKgwqAgcmVzZXRzOgo+PiDCoMKgwqDC
oMKgIG1heEl0ZW1zOiAxCj4+IEBAIC01NywxNSArNjQsNDMgQEAgYWxsT2Y6Cj4+IMKgwqDCoMKg
wqDCoMKgIHByb3BlcnRpZXM6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdCxybmctbG9jay1jb25m
OiBmYWxzZQo+PiArwqAgLSBpZjoKPj4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoKPj4gK8KgwqDC
oMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW06Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIHN0LHN0bTMybXAyNS1ybmcKPiBNYXliZSB0aGlzIG1hdGNoIHNob3VsZCBiZSBpbnZl
cnRlZCwgaXQgaXMgbGlrZWx5IHRoZSBuZXh0IGdlbmVyYXRpb24gb2YgCj4gc3RtMzIgd2lsbCBh
bHNvIHVzZSAyIGlucHV0IGNsb2NrIGludG8gdGhlIFJORyBibG9jayBhbmQgaXQgd2lsbCBiZSBv
bmx5IAo+IHRoZSBsZWdhY3kgTVAxIHRoYXQgdXNlcyBvbmUgY2xvY2suCgpIaSwgc3VyZSwgbWFr
ZXMgbW9yZSBzZW5zZSwgSSdsbCBjaGFuZ2UgaXQgZm9yIFYyLgoKR2F0aWVuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
