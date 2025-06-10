Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D77AD35B1
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 14:12:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 848CBC3F93F;
	Tue, 10 Jun 2025 12:12:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2B1BC3F93D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 12:12:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC97NU007654;
 Tue, 10 Jun 2025 14:12:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3JoIjs0rN0Mef0RCPvvnCGsgeRN+4kOPLLI4ZD9o2Mw=; b=IBiW8Pd2ALdNOtHN
 XRPdHmX5cTFMzfSFGNahSDjWx6E60NVZHz7RlKXUmNwfGV20G7xd9V9G3HiR6ujB
 s+AZQL0BORu4XoQQw2qgCAB1ogBecjXstW5BDDTJ1IdEXR5HIP5dzWhaDQwR2xTr
 DN++VSdsEGrCF7mKiFWci9lVp2CO6zMKD0zCB5hhG1erz3Wu/jwuqg/GKdjloTbj
 tBUQ6/vo43atWvHUG7qXWWX2LRMnpUjlBn8AmANT14iUFewIlwezop9IJIL2CRl5
 Q6Pbbq/R0mNtnUVfPtNb2+Az+ReLy0hp7cE7LzTFCBZ5rEOk5XssMErKjm6G6nvk
 K0WZLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2mt3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 14:12:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C66614006E;
 Tue, 10 Jun 2025 14:11:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB802B39A25;
 Tue, 10 Jun 2025 14:11:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:11:26 +0200
Message-ID: <e4a1bbd0-3886-4a88-bfaf-1e5ce5b27625@foss.st.com>
Date: Tue, 10 Jun 2025 14:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-5-7e9b3ad2036d@foss.st.com>
 <c0336f46-1fbc-4766-9e0a-a3812d48083e@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <c0336f46-1fbc-4766-9e0a-a3812d48083e@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 5/9] ARM: dts: stm32: add Hardware
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

T24gNS8yOS8yNSAxMToxMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyOC8wNS8y
MDI1IDE1OjMwLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+IEFkZCB0aGUgaGRwIGRldmlj
ZXRyZWUgbm9kZSBmb3Igc3RtMzJtcDEzIFNvQyBmYW1pbHkKPj4KPj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+PiAtLS0K
Pj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgfCA3ICsrKysrKysKPj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTMxLmR0c2kKPj4gaW5kZXggODUxMmE2ZTQ2YjMzLi45ZTM3OTdlZTFmN2IgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEuZHRzaQo+PiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kKPj4gQEAgLTk1NCw2ICs5NTQsMTMg
QEAgZHRzOiB0aGVybWFsQDUwMDI4MDAwIHsKPj4gICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
PiAgIAkJfTsKPj4gICAKPj4gKwkJaGRwOiBwaW5jdHJsQDUwMDJhMDAwIHsKPj4gKwkJCWNvbXBh
dGlibGUgPSAic3Qsc3RtMzJtcDEzMS1oZHAiOwo+PiArCQkJcmVnID0gPDB4NTAwMmEwMDAgMHg0
MDA+Owo+PiArCQkJY2xvY2tzID0gPCZyY2MgSERQPjsKPj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7Cj4gRG9uJ3Qgc2VuZCBuZXcgdmVyc2lvbnMgd2hpbGUgZGlzY3Vzc2lvbiBpcyBnb2luZy4K
PiAKPiBNeSBjb21tZW50cyBhcmUgc3RpbGwgdmFsaWQgaGVyZS4KPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gS3J6eXN6dG9mCgpPayBrZWVwIGRpc2N1c3NpbmcgaW4gdGhlIFYzIHNvLgoKQ2zDqW1lbnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
