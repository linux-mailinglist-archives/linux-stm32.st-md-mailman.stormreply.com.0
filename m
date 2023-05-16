Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B43770525B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 17:38:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB1C2C6A615;
	Tue, 16 May 2023 15:38:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BABF0C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 15:38:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GD50rY032459; Tue, 16 May 2023 17:37:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=yaiXGJIEjJ0GT5upQDWDY3dTnGhq9SL8ZecEEkPwAWw=;
 b=Qz6YrZHmAHrMLNKIB8RLTUdRTZtja2RPXr2UO5KBSFgP3f0jXfqfklBLoXdqHSnWo8Im
 7UyajHkn1ibeGJa8lQzc+KaSineJiC0jn6McZVqquknCA2FoNBzGt8Ou82HmKHguIxK0
 AxyxOIra8lnbIPO5+jppENRRjRfRk7Vs6U6HeAlZV0j1di46YXtbXQ2TfrDwbwSYCT8w
 pE7MxAk2k7rJHbwJ/Cyo8BpG8urKnr/1I3QiO/T7J+HYS0f8ep6ZnqC3GSsoVtc7YBPb
 kOxN5jZ5eEt0BGIM4+5m0nreDfQmiHOK2aiJA2Z/T8SUHPppqjryb/jEqHUvgz1qD0kY zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qhyyhav80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 17:37:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 953A010002A;
 Tue, 16 May 2023 17:37:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85E80233017;
 Tue, 16 May 2023 17:37:38 +0200 (CEST)
Received: from [192.168.8.15] (10.48.0.39) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 17:37:37 +0200
Message-ID: <919aaa61015366e82b5a9ec918189c01031d3399.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 16 May 2023 17:37:36 +0200
In-Reply-To: <20230511001949.179521-1-marex@denx.de>
References: <20230511001949.179521-1-marex@denx.de>
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Originating-IP: [10.48.0.39]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_08,2023-05-16_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Richard
 Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/3] irqchip/stm32-exti: Add STM32MP15xx
 IWDG2 EXTI to GIC map
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

T24gVGh1LCAyMDIzLTA1LTExIGF0IDAyOjE5ICswMjAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBU
aGUgRVhUSSBpbnRlcnJ1cHQgNDYgaXMgbWFwcGVkIHRvIEdJQyBpbnRlcnJ1cHQgMTUxLiBBZGQg
dGhlCj4gbWlzc2luZyBtYXBwaW5nLCB3aGljaCBpcyB1c2VkIGZvciBJV0RHMiBwcmV0aW1lb3V0
IGludGVycnVwdAo+IGFuZCB3YWtlIHVwIHNvdXJjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJl
ayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPiAtLS0KPiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxl
eGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogR3VlbnRlciBSb2VjayA8bGludXhAcm9l
Y2stdXMubmV0Pgo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
K2R0QGxpbmFyby5vcmc+Cj4gQ2M6IE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+Cj4gQ2M6
IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPiBDYzogUmljaGFy
ZCBDb2NocmFuIDxyaWNoYXJkY29jaHJhbkBnbWFpbC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxy
b2JoK2R0QGtlcm5lbC5vcmc+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4
LmRlPgo+IENjOiBXaW0gVmFuIFNlYnJvZWNrIDx3aW1AbGludXgtd2F0Y2hkb2cub3JnPgo+IENj
OiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBs
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gQ2M6IGxpbnV4LXdhdGNo
ZG9nQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+IMKgZHJpdmVycy9pcnFjaGlwL2lycS1zdG0zMi1l
eHRpLmMgfCAxICsKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYyBiL2RyaXZlcnMvaXJxY2hp
cC9pcnEtc3RtMzItZXh0aS5jCj4gaW5kZXggNmEzZjc0OThlYThlYS4uZjY4NGJlNzdiYTM3OCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYwo+ICsrKyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtc3RtMzItZXh0aS5jCj4gQEAgLTIwOCw2ICsyMDgsNyBAQCBzdGF0
aWMgY29uc3QgdTggc3RtMzJtcDFfZGVzY19pcnFbXSA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgWzMx
XSA9IDUzLAo+IMKgwqDCoMKgwqDCoMKgwqBbMzJdID0gODIsCj4gwqDCoMKgwqDCoMKgwqDCoFsz
M10gPSA4MywKPiArwqDCoMKgwqDCoMKgwqBbNDZdID0gMTUxLAo+IMKgwqDCoMKgwqDCoMKgwqBb
NDddID0gOTMsCj4gwqDCoMKgwqDCoMKgwqDCoFs0OF0gPSAxMzgsCj4gwqDCoMKgwqDCoMKgwqDC
oFs1MF0gPSAxMzksCgpIaSBNYXJlaywKCnRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKUmV2aWV3ZWQt
Ynk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
