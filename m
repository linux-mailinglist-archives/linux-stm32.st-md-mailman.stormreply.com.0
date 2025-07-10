Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16561AFFAD9
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 09:28:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC321C36B3C;
	Thu, 10 Jul 2025 07:28:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C1E5C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 07:28:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A6nMQ4020561;
 Thu, 10 Jul 2025 09:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FteJQilrWBfBvhIiChMigkGkPT4QD1u6xypvpY95TU0=; b=VhSXHgvkoCKjL0PB
 yLPzLljS9EtzmH6qBo4MWrhd/pumsuUD8+ON95lET7nmSmqFrQnoRVupBYdYAlfu
 djGjVlo43TAdWUmsXUZgnroiJwMw47odRN0mNYABKDiOZ51Bt/EJzZNDPzmhBCJ0
 CMbstpvVa2BWVI2D8EppAjFvYXVZ4ZhxSrngbuZELHV/aY6bFeDQ35BAlp1S7N2x
 GeJfMjn0DSAq3a6zy8jnfueD2KysLIEasSHwMmzGQLS15g1t/eLo25EJf82KRv5d
 sp1MjzM+BSKvkf8g6WMx0/jPp6e9fRSs21UvN8PDDjbqKUdd6eMSNQ0AzEYvOb8v
 L38+Tg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ptxjf7w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jul 2025 09:27:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CC7DF40048;
 Thu, 10 Jul 2025 09:26:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81309AE9D80;
 Thu, 10 Jul 2025 09:26:06 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 09:26:05 +0200
Message-ID: <cadb2bcc-9a2a-447a-ac03-459f3e37a173@foss.st.com>
Date: Thu, 10 Jul 2025 09:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
 <20250626-ddr-bindings-v1-1-cae30933c54c@foss.st.com>
 <e016efd6-891b-467e-8a4e-9ea53b7006a9@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <e016efd6-891b-467e-8a4e-9ea53b7006a9@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
Cc: linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH RFC 1/2] dt-bindings: memory: add jedec,
 ddr[3-4]-channel binding
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

SGkgS3J6eXN6dG9mLAoKT24gNy85LzI1IDIwOjI3LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3Rl
Ogo+IE9uIDI2LzA2LzIwMjUgMjE6NDgsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPj4gSW50
cm9kdWNlIGFzIHBlciBqZGVjLGxwZGRyWC1jaGFubmVsIGJpbmRpbmcsIGpkZWMsZGRyWzMtNF0t
Y2hhbm5lbAo+IAo+IHMvamRlYy9qZWRlYy8KClJpZ2h0IHRoYW5rcwoKPiAKPj4gYmluZGluZy4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmlj
QGZvc3Muc3QuY29tPgo+PiAtLS0KPiAKPiAKPj4gKwo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICBkZHJfY2hhbm5lbDog
ZGRyMy1jaGFubmVsQDAgewo+PiArICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLGRkcjMtY2hh
bm5lbCI7Cj4+ICsgICAgICAgIGlvLXdpZHRoID0gPDE2PjsKPiAKPiBNaXNzaW5nIHJlZy4uLiBv
ciBub3Q/IFdoYXQgd2FzIHlvdXIgaW50ZW50aW9uCgpJbmRlZWQgbm8gcmVnLgpJJ2xsIGRyb3Ag
dGhlICJAMCIgZm9yIHRoZSBuZXh0IHZlcnNpb24uCgo+IAo+IAo+PiArICAgIH07Cj4+Cj4gCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
