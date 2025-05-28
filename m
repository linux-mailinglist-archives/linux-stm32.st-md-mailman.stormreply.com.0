Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E81BBAC6900
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 14:17:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A78D0C36B35;
	Wed, 28 May 2025 12:17:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EA61C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 12:17:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SB7A5E007927;
 Wed, 28 May 2025 14:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 gsxchGz+NPMbQD+2/mdAAZvARKNk9ZKprAWBWXssYfg=; b=P8uR/8ZYHA6PyU+p
 1yQYTn8+drhMGTmu/DwUOUFEmJY6sFik+XP7pbPz0hRRgOgJdATJhYeD+ClTZxvW
 OfwmpHZkxYvD83+alQD1NSA43S/Ma1WerAhlvHAHY3sKa4nva2yaT7tvmQESC8Xy
 MNtWCjm8Evwhv9FJG61K3A7gKhoP2rkAFns0EQRDXcncu5yIYuQAvrycmWQBj6AJ
 /+QwsZJ43IrNZdjnZR9bWlQkQskQ/Yyy7Xk/r48zr/K2Y/d30WGeyQ7CQPMiQQv6
 sO7e7tkct39wYJYdYW119O178HKQVb5ndHre0L6ztrjwyE8tacZF58sBBnYeal+x
 mcS98Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u5f2951g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 14:16:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF12C40049;
 Wed, 28 May 2025 14:15:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EC216D63CF;
 Wed, 28 May 2025 14:14:49 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 14:14:48 +0200
Message-ID: <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
Date: Wed, 28 May 2025 14:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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

T24gNS8yOC8yNSAxMDo1NSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyMy8wNS8y
MDI1IDE0OjM4LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+IEFkZCB0aGUgaGRwIGRldmlj
ZXRyZWUgbm9kZSBmb3Igc3RtMzJtcDEzIFNvQyBmYW1pbHkKPj4KPj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+PiAtLS0K
Pj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgfCA2ICsrKysrKwo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxMzEuZHRzaQo+PiBpbmRleCA4NTEyYTZlNDZiMzMuLmIwNTM3YmNkYjlkNSAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzMS5kdHNpCj4+ICsrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEuZHRzaQo+PiBAQCAtOTUxLDYgKzk1MSwxMiBA
QCBkdHM6IHRoZXJtYWxANTAwMjgwMDAgewo+PiAgIAkJCWNsb2NrcyA9IDwmcmNjIERUUz47Cj4+
ICAgCQkJY2xvY2stbmFtZXMgPSAicGNsayI7Cj4+ICAgCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxz
ID0gPDA+Owo+IAo+IFdoeSBhcmUgeW91IGVuYWJsaW5nIGl0PyBDb21taXQgbXNnIHNob3VsZCBl
eHBsYWluIHRoaXMgYW5kIHRoaXMgc2hvdWxkCj4gYmUgc3BhcmF0ZSBwYXRjaC4KCk9vcHMgZ29v
ZCBjYXRjaCBJJ2xsIGZpeCB0aGlzLgoKPiAKPj4gKwkJfTsKPj4gKwo+PiArCQloZHA6IHBpbmN0
cmxANTAwMmEwMDAgewo+PiArCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTMxLWhkcCI7Cj4+
ICsJCQlyZWcgPSA8MHg1MDAyYTAwMCAweDQwMD47Cj4+ICsJCQljbG9ja3MgPSA8JnJjYyBIRFA+
Owo+PiAgIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gCj4gV2h5IGFyZSB5b3UgZGlzYWJsaW5n
IGl0PyBXaGF0IGlzIG1pc3Npbmc/CgpOb3RoaW5nIGlzIG1pc3NpbmcganVzdCBkaXNhYmxlZCBi
eSBkZWZhdWx0LgpUaGUgbm9kZSBpcyB0aGVuIGVuYWJsZWQgd2hlbiBuZWVkZWQgaW4gYm9hcmQn
cyBkdHMgZmlsZS4KCj4gCj4+ICAgCQl9Owo+PiAgIAo+Pgo+IAo+IAo+IEJlc3QgcmVnYXJkcywK
PiBLcnp5c3p0b2YKCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
