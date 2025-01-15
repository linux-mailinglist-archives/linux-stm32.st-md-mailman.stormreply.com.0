Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CFA11F18
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 11:20:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C125C78F7B;
	Wed, 15 Jan 2025 10:20:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 762E3C78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 09:43:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F4KQfu027304;
 Wed, 15 Jan 2025 10:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ROpiUW4nfnLvf/oMZJYn+0lH6XwPLhFaln2Q/2PDHgY=; b=C6gJ6kMX9GRMYrRv
 J+drCTKmogjD+SS+6zgBHoc8JZY8k6MgXz1lUo7GJj+gm1IZlIkKMEMu0FYue3/F
 one8F5Sfvh2rFNhZQrRM8tEB4nDdFU9RbFqXk2GoociJMPQOJPyFPVKU2c5LenO2
 BPSgqEXUd2yERQD34otXyuBXOYxpz24xSj39ByPImUiIDZOGDx3eqxUCkHQTDjqc
 EKkEgwjRpVCKQjGGTPcVebvrMYv7VUcGssIBHT0Y5kMo8o2DTbX466jp2GFRY6ua
 BiVVxkcUxTncCo+ZS+27FdTYZsYGTqydWHXSnO4N4ngiusIqzchMQ5gR5BkBXaIQ
 6l4FUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4465weh74g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 10:43:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 353C040045;
 Wed, 15 Jan 2025 10:41:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0E0C2481B7;
 Wed, 15 Jan 2025 10:39:44 +0100 (CET)
Received: from [192.168.8.15] (10.252.20.5) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 15 Jan
 2025 10:39:41 +0100
Message-ID: <e60d2c600133df2202bf3187eeeb9c31bc6c8f32.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans Ulli Kroll
 <ulli.kroll@googlemail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
 <linux-sound@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Date: Wed, 15 Jan 2025 10:39:33 +0100
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.20.5]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-Mailman-Approved-At: Wed, 15 Jan 2025 10:20:39 +0000
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Use str_enable_disable-like
 helpers
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

T24gVHVlLCAyMDI1LTAxLTE0IGF0IDIxOjM2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IFJlcGxhY2UgdGVybmFyeSAoY29uZGl0aW9uID8gImVuYWJsZSIgOiAiZGlzYWJsZSIp
IHN5bnRheCB3aXRoIGhlbHBlcnMKPiBmcm9tIHN0cmluZ19jaG9pY2VzLmggYmVjYXVzZToKPiAx
LiBTaW1wbGUgZnVuY3Rpb24gY2FsbCB3aXRoIG9uZSBhcmd1bWVudCBpcyBlYXNpZXIgdG8gcmVh
ZC7CoCBUZXJuYXJ5Cj4gwqDCoCBvcGVyYXRvciBoYXMgdGhyZWUgYXJndW1lbnRzIGFuZCB3aXRo
IHdyYXBwaW5nIG1pZ2h0IGxlYWQgdG8gcXVpdGUKPiDCoMKgIGxvbmcgY29kZS4KPiAyLiBJcyBz
bGlnaHRseSBzaG9ydGVyIHRodXMgYWxzbyBlYXNpZXIgdG8gcmVhZC4KPiAzLiBJdCBicmluZ3Mg
dW5pZm9ybWl0eSBpbiB0aGUgdGV4dCAtIHNhbWUgc3RyaW5nLgo+IDQuIEFsbG93cyBkZWR1cGlu
ZyBieSB0aGUgbGlua2VyLCB3aGljaCByZXN1bHRzIGluIGEgc21hbGxlciBiaW5hcnkKPiDCoMKg
IGZpbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IC0tLQo+IMKgZHJpdmVycy9waW5jdHJsL2JjbS9waW5j
dHJsLW5zcC1ncGlvLmPCoMKgwqDCoCB8wqAgMyArKy0KPiDCoGRyaXZlcnMvcGluY3RybC9jaXJy
dXMvcGluY3RybC1sb2NobmFnYXIuYyB8wqAgMyArKy0KPiDCoGRyaXZlcnMvcGluY3RybC9ub21h
ZGlrL3BpbmN0cmwtYWJ4NTAwLmPCoMKgIHzCoCA1ICsrKy0tCj4gwqBkcml2ZXJzL3BpbmN0cmwv
bm9tYWRpay9waW5jdHJsLW5vbWFkaWsuY8KgIHzCoCA3ICsrKystLS0KPiDCoGRyaXZlcnMvcGlu
Y3RybC9waW5jdHJsLWFtZC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKystCj4g
wqBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1nZW1pbmkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MTEgKysrKysrLS0tLS0KPiDCoGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL3BpbmN0cmwvcWNvbS9waW5jdHJs
LW1zbS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKy0KPiDCoGRyaXZlcnMvcGluY3RybC9xY29t
L3BpbmN0cmwtc3BtaS1ncGlvLmPCoMKgIHzCoCAzICsrLQo+IMKgZHJpdmVycy9waW5jdHJsL3Fj
b20vcGluY3RybC1zcG1pLW1wcC5jwqDCoMKgIHzCoCAzICsrLQo+IMKgZHJpdmVycy9waW5jdHJs
L3Fjb20vcGluY3RybC1zc2JpLWdwaW8uY8KgwqAgfMKgIDMgKystCj4gwqBkcml2ZXJzL3BpbmN0
cmwvcWNvbS9waW5jdHJsLXNzYmktbXBwLmPCoMKgwqAgfCAxMCArKysrLS0tLS0tCj4gwqBkcml2
ZXJzL3BpbmN0cmwvc2Ftc3VuZy9waW5jdHJsLWV4eW5vcy5jwqDCoCB8wqAgMyArKy0KPiDCoGRy
aXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLmPCoMKgwqDCoMKgIHzCoCA1ICsrKy0t
CgpGb3IgcGluY3RybC1zdG1meCBhbmQgZm9yIHBpbmN0cmwtc3RtMzI6CgpSZXZpZXdlZC1ieTog
QW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgotLS0KQW50b25pbwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
