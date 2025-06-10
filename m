Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E670AD35A3
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 14:09:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB4EFC32EA8;
	Tue, 10 Jun 2025 12:09:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0318C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 12:09:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC92oj024409;
 Tue, 10 Jun 2025 14:09:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rbT+/LcXhnguYXXSk/7BxGc8Wpdz3ZyHLa8xXsRBNrQ=; b=fnDqXI6O+WJPistn
 bnZ8DY90tUXzuIBXtkCiwKYbQ0yuNFQecwxgJs/UlcPmsZrU2CYGPmTYSYmeZHOj
 d1cwA+XuSl4xlbDUgNjsNZFueqhF7omyMWhJBDZLcyDmwHJloTFXQcDrWB9t7Zfi
 R8NICF8GKNtMa1wWdwZflkEOHzfYOCCXd9lLfloPdd/+2Xdm3R1pizI6oATBcHGj
 Xv8ZLdGa/f8d3eRrh8J/edSZpBF63QbwVD6xsN1woB5EezODMS1rKZcfP5B/8azg
 ZzYoPNt/P5DXh3c/zWfQUTHVRZI9nR2TCnV2gzZQ3oZvabmZTbNMoqcMlufQNS6e
 RLzqkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahm10e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 14:09:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69F014006E;
 Tue, 10 Jun 2025 14:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3843B394F9;
 Tue, 10 Jun 2025 14:07:48 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:07:48 +0200
Message-ID: <7f7d6fb3-f696-4dd4-ac19-e5d77134a061@foss.st.com>
Date: Tue, 10 Jun 2025 14:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
 <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 8/9] ARM: dts: stm32: add alternate
 pinmux for HDP pin and add HDP pinctrl node
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

T24gNi81LzI1IDE0OjU3LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9uIEZyaSwgTWF5IDIzLCAy
MDI1IGF0IDI6NDDigK9QTSBDbMOpbWVudCBMZSBHb2ZmaWMKPiA8Y2xlbWVudC5sZWdvZmZpY0Bm
b3NzLnN0LmNvbT4gd3JvdGU6Cj4gCj4+IEludHJvZHVjZSBoZHAgbm9kZSB0byBvdXRwdXQgYSB1
c2VyIGRlZmluZWQgdmFsdWUgb24gcG9ydCBoZHAyLgo+PiBBZGQgcGluY3RybCBub2RlcyB0byBi
ZSBhYmxlIHRvIG91dHB1dCB0aGlzIHNpZ25hbCBvbiBvbmUgU29DIHBpbi4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29t
Pgo+IAo+IFRoYXQncyBuaWNlLCB0aGlzIGlzIGV4YWN0bHkgaG93IHBpbiBjb250cm9sIGlzIHN1
cHBvc2VkIHRvIGJlCj4gdXNlZCEKCkhpIExpbnVzLCB0aGFuayB5b3UhCgo+IFJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gCj4gWW91cnMsCj4g
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
