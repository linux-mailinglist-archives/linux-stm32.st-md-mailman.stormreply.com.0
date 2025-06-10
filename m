Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A582FAD35AD
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 14:12:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 701DCC3F93F;
	Tue, 10 Jun 2025 12:12:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82FCDC3F93D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 12:12:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC90Ov024216;
 Tue, 10 Jun 2025 14:12:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MXR00VLxmhsH+jMRE5s/YJIThaFKie022RUlAGpjRqQ=; b=t6dw14ZVsezx0sZs
 dftYh8TOHkwZtHKigra6IELajwcohq2X2U/EEzOrgg0UgqcCvyxyY95HhWWoKgi2
 l4ZJJjbTa8HLWqKfQm2wmIhV23PM+pZlQmpP8ZqXmB7w5Uf/sVmqzPJA0LWQ3kzx
 ZGDc3AczGGayRcDDLvlGgg5SfZ13prHfUyt+Ywh3/Jr8eSaFyEFcCezGJD7sBfT4
 yo67Out2oEAp5y//3gcZ3GC3tcrKPk8c+QbnrmIiPOzCjQ5TIcxZ2wQ28JCT4cF6
 dPSGGljjkPcfzRdCSTvtcIyJm+uXEV+vGImsJ/DQAgwWFd7J3L8SD+EZ/j+BJKwG
 ZYYf5g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumd4ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 14:12:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F28EA40054;
 Tue, 10 Jun 2025 14:10:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42B8AB3A752;
 Tue, 10 Jun 2025 14:10:07 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:10:06 +0200
Message-ID: <60423d3e-20b2-47c7-a889-f5cbffb83734@foss.st.com>
Date: Tue, 10 Jun 2025 14:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
 <57667ad9-d98f-4f8b-9b70-428960765ddb@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <57667ad9-d98f-4f8b-9b70-428960765ddb@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/9] dt-bindings: pinctrl: stm32:
	Introduce HDP
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

T24gNS8yOS8yNSAxMToxNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyOC8wNS8y
MDI1IDE1OjMwLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+ICdIRFAnIHN0YW5kcyBmb3Ig
SGFyZHdhcmUgRGVidWcgUG9ydCwgaXQgaXMgYW4gaGFyZHdhcmUgYmxvY2sgaW4KPj4gU1RNaWNy
b2xlY3Ryb25pY3MnIE1QVXMgdGhhdCBsZXQgdGhlIHVzZXIgZGVjaWRlIHdoaWNoIGludGVybmFs
IFNvQydzCj4+IHNpZ25hbCB0byBvYnNlcnZlLgo+PiBJdCBwcm92aWRlcyA4IHBvcnRzIGFuZCBm
b3IgZWFjaCBwb3J0IHRoZXJlIGlzIHVwIHRvIDE2IGRpZmZlcmVudAo+PiBzaWduYWxzIHRoYXQg
Y2FuIGJlIG91dHB1dC4KPj4gU2lnbmFscyBhcmUgZGlmZmVyZW50IGZvciBlYWNoIE1QVS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZv
c3Muc3QuY29tPgo+PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IAo+IERyb3AgcmV2aWV3ZWQgdGFnLiBJdCB3YXMgZ2l2
ZW4gdW5kZXIgYXNzdW1wdGlvbiB0aGF0IHlvdSB3aWxsIHRlc3QgeW91cgo+IGNvZGUgYmVmb3Jl
IHNlbmRpbmcuCgpIaSwgeWVzIHN1cmUsIHNvcnJ5IGZvciB0aGF0Li4KCj4gCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEtyenlzenRvZgoKQ2zDqW1lbnQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
