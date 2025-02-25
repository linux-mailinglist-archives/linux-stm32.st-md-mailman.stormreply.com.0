Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4DDA4480D
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 18:30:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E188C78F9F;
	Tue, 25 Feb 2025 17:30:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FCF3C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 17:30:12 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PF2BBx000811;
 Tue, 25 Feb 2025 18:29:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zboDa3cKQkLjfjJd+7M0V2NhLphn96I5A2P8IRJH05M=; b=wgvvxZWW/CqAHK3j
 H8sgxDoRLndjNM9Sd34CXs4PXk5zv6HAYe1E3VwWDrRK8sHF482eocl9THKJ9N27
 yUIfiqlKj2VdC+Ir8+dPwx5EA4NCnMKxl1X74e4c8S/swBVfsjJ5v5afQa3fhJwA
 +wVJ268wjp6nEHEytQg/Qn8skofLorecSxqwEzRIZSUNK5tkojzeyZEkWpK/srzJ
 aeOeQuvy7TX65vAKcnizUIptGUgD3I37OoEY1gX1imisG+4JVwTQoQmwekuHf55P
 SdTs5UrdwLlMDkQhIEF1hSH752cpuFUHY6BKJf01wEcWhzjbcne0+Dwif5rwpHDr
 RsHO+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4xep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 18:29:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 877F4400E2;
 Tue, 25 Feb 2025 18:28:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6783C4C5307;
 Tue, 25 Feb 2025 17:09:41 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 17:09:40 +0100
Message-ID: <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
Date: Tue, 25 Feb 2025 17:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 7/9] ARM: dts: stm32: add Hardware debug
 port (HDP) on stm32mp25
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

T24gMi8yNS8yNSAxNDowNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyNS8wMi8y
MDI1IDA5OjQ4LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+IEFkZCB0aGUgaGRwIGRldmlj
ZXRyZWUgbm9kZSBmb3Igc3RtMzJtcDI1IFNvQyBmYW1pbHkKPj4KPj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+PiAtLS0K
Pj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSB8IDcgKysrKysrKwo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4gaW5kZXggZjNjNmNkZmQ3MDA4Li40M2FhZWQ0ZmNmMTAg
MTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4+IEBAIC05MTgs
NiArOTE4LDEzIEBAIHBhY2thZ2Vfb3RwQDFlOCB7Cj4+ICAgCQkJfTsKPj4gICAJCX07Cj4+ICAg
Cj4+ICsJCWhkcDogcGluY3RybEA0NDA5MDAwMCB7Cj4+ICsJCQljb21wYXRpYmxlID0gInN0LHN0
bTMybXAtaGRwIjsKPiAKPiBTbyBoZXJlIGFnYWluIC0geW91IGhhdmUgc3RtMzJtcDI1MSBTb0Ms
IGJ1dCB1c2UgZW50aXJlbHkgZGlmZmVyZW50Cj4gY29tcGF0aWJsZS4KCk9rIHNvIEkgd2lsbCB1
c2UgInN0LHN0bTMybXAxNS1oZHAiCgo+IFNhbWUgZmVlZGJhY2sgYXMgd2l0aCBwcmV2aW91cyBw
YXRjaHNldHMgZnJvbSBTVC4gUGxlYXNlIHRha2UgaXQgaW5zaWRlLAo+IGRpZ2VzdCBpbnRlcm5h
bGx5IGFuZCBkbyBub3QgcmVwZWF0IHNhbWUgaXNzdWVzLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBL
cnp5c3p0b2YKCkJlc3QgcmVnYXJkcywKCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
