Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0924BAC6909
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 14:18:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3186C36B35;
	Wed, 28 May 2025 12:18:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5D31C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 12:18:09 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8ewG3017013;
 Wed, 28 May 2025 14:17:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qfmkwNJuQPgRSv5nRvippWgZ2ln8+OwhTXxV/tbD23s=; b=390QO/o2W/+aXv2v
 rSzQAJskUa0wTrEFkuE2s6XzLs2G6pTQ6qpfRW6NOe1nKuhJjYIrSB2VlsQUNiCZ
 r5TwU5UlnQAVk+c2cqucPwSw+TUaBJvim16OoKktuZVA0qdAI5Z+wKVWuATxw9iK
 a4jy3ZchWVpFupWMeBrVBN/gRKYRNHdOid9Q3f7XGJOwmGugCCcT081pEAkf1QYv
 KcOdXSHx+LG584DetTSm9RGsTuKNDz6N1xI0+9d3ru1L8bF4GwsA5OmDNIjSrcel
 RzidRptdgNA2lFeXQ0dffhx2LEjxTby6EqEBBdxZGFd2ytx4VK+7ErSMXlmXhjck
 RgypBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4q18h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 14:17:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C0EEB4004A;
 Wed, 28 May 2025 14:16:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68E786D6652;
 Wed, 28 May 2025 14:16:00 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 14:15:59 +0200
Message-ID: <ef481451-b7d2-4f9a-a3d0-c67e8f5061dd@foss.st.com>
Date: Wed, 28 May 2025 14:15:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-6-bd6ca199466a@foss.st.com>
 <1c21f915-e067-4801-925a-3d4882f358f2@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <1c21f915-e067-4801-925a-3d4882f358f2@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 6/9] ARM: dts: stm32: add Hardware
 debug port (HDP) on stm32mp15
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

T24gNS8yOC8yNSAxMTowMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyMy8wNS8y
MDI1IDE0OjM4LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+IEFkZCB0aGUgaGRwIGRldmlj
ZXRyZWUgbm9kZSBmb3Igc3RtMzJtcDE1IFNvQyBmYW1pbHkKPj4KPj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+PiAtLS0K
Pj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kgfCA3ICsrKysrKysKPj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTUxLmR0c2kKPj4gaW5kZXggMGRhYThmZmUyZmY1Li5iMWI1NjhkZmQxMjYgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEuZHRzaQo+PiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kKPj4gQEAgLTI3MCw2ICsyNzAsMTMg
QEAgZHRzOiB0aGVybWFsQDUwMDI4MDAwIHsKPj4gICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
PiAgIAkJfTsKPj4gICAKPj4gKwkJaGRwOiBwaW5jdHJsQDUwMDJhMDAwIHsKPj4gKwkJCWNvbXBh
dGlibGUgPSAic3Qsc3RtMzJtcDE1MS1oZHAiOwo+PiArCQkJcmVnID0gPDB4NTAwMmEwMDAgMHg0
MDA+Owo+PiArCQkJY2xvY2tzID0gPCZyY2MgSERQPjsKPj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7Cj4gCj4gU2FtZSBxdWVzdGlvbnMgaGVyZSBhbmQgaW4gZnVydGhlciBwYXRjaGVzLgoKU2Ft
ZSwgZGlzYWJsZWQgYnkgZGVmYXVsdCBhbmQgZW5hYmxlIGluIGJvYXJkJ3MgZHRzIGZpbGUKCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
