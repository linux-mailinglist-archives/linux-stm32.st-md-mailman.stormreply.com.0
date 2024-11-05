Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1409BC7F3
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 09:25:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB033C6DD9F;
	Tue,  5 Nov 2024 08:25:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1900BC6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 08:25:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A56uQvx022315;
 Tue, 5 Nov 2024 09:25:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 25JB0joO6/APWdWGU9npMYA29F9CUK1XLBMuinxiP4I=; b=VkTiBz7FYMa5Tv0k
 J+YUoTY39W91PJZv+iyDXEEiisQF037iGaJ30A/fDNHsAdXrRunxyQhic9qSqfGS
 BCUJbeWwFQ+EgdqBIRtlfpGEEgcwRiHdRHWwVuMhvSBoxF/Y8YxzgVLmsXwuPiTO
 GhSo+OuSmVspehP/HsL1gIr080uRnIkrjeJExPWPQIBZ6GJnMf9nRMnogDLLAlwJ
 d0sXxtTiuAhevV7OMmuw03ewYTYlEwQLoAB39fiTLZlDYXp0IejQfysKNCxT6i1w
 K1uje9cgzoM40AkGdWlhnM5KDJD4yownykkP7Sz6O8dexHYomgJIZIZ+O9nkMGWh
 fdx1xw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbu10k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 09:25:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4380240052;
 Tue,  5 Nov 2024 09:24:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 787DF24B194;
 Tue,  5 Nov 2024 09:23:44 +0100 (CET)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 09:23:44 +0100
Message-ID: <008a261f5407ab38bb025768624bdc6bd1869c84.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 5 Nov 2024 09:23:43 +0100
In-Reply-To: <20241104190836.278117-1-robh@kernel.org>
References: <20241104190836.278117-1-robh@kernel.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32mp-exti: Use
 of_property_present() for non-boolean properties
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gTW9uLCAyMDI0LTExLTA0IGF0IDEzOjA4IC0wNjAwLCBSb2IgSGVycmluZyAoQXJtKSB3cm90
ZToKPiBUaGUgdXNlIG9mIG9mX3Byb3BlcnR5X3JlYWRfYm9vbCgpIGZvciBub24tYm9vbGVhbiBw
cm9wZXJ0aWVzIGlzCj4gZGVwcmVjYXRlZCBpbiBmYXZvciBvZiBvZl9wcm9wZXJ0eV9wcmVzZW50
KCkgd2hlbiB0ZXN0aW5nIGZvciBwcm9wZXJ0eQo+IHByZXNlbmNlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gwqBkcml2ZXJz
L2lycWNoaXAvaXJxLXN0bTMybXAtZXh0aS5jIHwgMyArLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
cnFjaGlwL2lycS1zdG0zMm1wLWV4dGkuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzJtcC1l
eHRpLmMKPiBpbmRleCAzM2UwY2ZkZWE2NTQuLmNiODNkNmNjNjExMyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2lycWNoaXAvaXJxLXN0bTMybXAtZXh0aS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1zdG0zMm1wLWV4dGkuYwo+IEBAIC02OTYsOCArNjk2LDcgQEAgc3RhdGljIGludCBzdG0z
Mm1wX2V4dGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKHJldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBy
ZXQ7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAi
aW50ZXJydXB0cy1leHRlbmRlZCIpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBo
b3N0X2RhdGEtPmR0X2hhc19pcnFzX2Rlc2MgPSB0cnVlOwo+ICvCoMKgwqDCoMKgwqDCoGhvc3Rf
ZGF0YS0+ZHRfaGFzX2lycXNfZGVzYyA9IG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJpbnRlcnJ1
cHRzLWV4dGVuZGVkIik7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9CgpS
ZXZpZXdlZC1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgoK
VGhhbmtzLApBbnRvbmlvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
