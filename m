Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ED98FDF2E
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2024 08:57:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D9B4C6DD67;
	Thu,  6 Jun 2024 06:57:03 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D7EDC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jun 2024 06:56:56 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45661ISi018429;
 Thu, 6 Jun 2024 08:56:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 q0pHrhrEV2nvppmu5Y5o14Zk3kbzMDqiybbgUNzqXQI=; b=eFS0yGzaw+mUJO06
 Qrc3cVuEAifZjh5JTSKnXkihS6HaP0kZMIRgvcgJLM/WBrayNW/BFTVpc+dVkssD
 j02nIkGfuXSB4yeQHZfMTdiuXbvUZvcwqOjI/lblCIV794azupfJifz0Iqy53CDm
 9h6R0yb2qdlRShE46VCiYAzx/cQwSogw6XuIrhgSWCt0JRw+KkV/xAbTeKAvLRwX
 9pJODzzcFAcLNZe4XR9WkDHd4EeMLC/YNLX3m624txcNssdowGP1i5Pfng+lnkBY
 PjKQVL+H346IlvMZzgIcFIW6qDEDUElIWzUrD361f7gQuaBi3qpt073gT1l13Lp3
 PG+Pfg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ygekj2hmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jun 2024 08:56:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DB8D140049;
 Thu,  6 Jun 2024 08:56:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC7DD20F2D3;
 Thu,  6 Jun 2024 08:54:51 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 08:54:51 +0200
Message-ID: <dce9b2fb-9a63-4e75-aa97-d1c6d2a319bc@foss.st.com>
Date: Thu, 6 Jun 2024 08:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20240605232809.169927-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240605232809.169927-1-marex@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_01,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sean Nyekjaer <sean@geanix.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix STM32MP13xx DHCOR
 DHSBC Makefile entry
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

CgpPbiA2LzYvMjQgMDE6MjcsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IEZpeCBzdG0zMm1wMTM1Zi1k
aGNvci1kaHNiYyBib2FyZCBNYWtlZmlsZSBlbnRyeSwKPiByZXBsYWNlICdkaHNvbScgd2l0aCAn
ZGhjb3InIHR5cG8uCj4gCj4gRml4ZXM6IDEyZmY4ZTE2NzY0MSAoIkFSTTogZHRzOiBzdG0zMjog
QWRkIHN1cHBvcnQgZm9yIFNUTTMyTVAxM3h4IERIQ09SIFNvTSBhbmQgREhTQkMgYm9hcmQiKQo+
IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IC0tLQo+IENjOiAi
TGVvbmFyZCBHw7ZocnMiIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4KPiBDYzogQWhtYWQgRmF0
b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4KPiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxl
eGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGFybS5jb20+Cj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4K
PiBDYzogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pgo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+Cj4gQ2M6IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBDYzogTWF4aW1lIENvcXVl
bGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgo+IENjOiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+Cj4gQ2M6IFN0
ZWZmZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFN0ZXBoZW4g
Um90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25pY3MuY29tCj4gQ2M6IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCj4gLS0tCj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZSB8
IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L01ha2VmaWxlCj4gaW5kZXggZGI5NzE4MDU5YWUyZi4uMDE1OTAzZDA5MzIz
ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZQo+ICsrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlCj4gQEAgLTI5LDcgKzI5LDcgQEAgZHRiLSQoQ09O
RklHX0FSQ0hfU1RNMzIpICs9IFwKPiAgIAlzdG0zMmg3NDNpLWV2YWwuZHRiIFwKPiAgIAlzdG0z
Mmg3NDNpLWRpc2NvLmR0YiBcCj4gICAJc3RtMzJoNzUwaS1hcnQtcGkuZHRiIFwKPiAtCXN0bTMy
bXAxMzVmLWRoc29tLWRoc2JjLmR0YiBcCj4gKwlzdG0zMm1wMTM1Zi1kaGNvci1kaHNiYy5kdGIg
XAo+ICAgCXN0bTMybXAxMzVmLWRrLmR0YiBcCj4gICAJc3RtMzJtcDE1MWEtcHJ0dDFhLmR0YiBc
Cj4gICAJc3RtMzJtcDE1MWEtcHJ0dDFjLmR0YiBcCgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpU
aGFua3MKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
