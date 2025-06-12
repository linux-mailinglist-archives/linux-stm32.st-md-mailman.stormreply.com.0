Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686EAD7114
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 15:04:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0677CC32E8E;
	Thu, 12 Jun 2025 13:04:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B21BC36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 13:04:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCNNFN024136;
 Thu, 12 Jun 2025 15:04:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 xgUlRHqrOgjoIr0Ken2L714FlmdoDE0xA4Gj6ELLtuY=; b=dAr2YaZ1sX7fLlr4
 qIJtWMwLwt0MLr5MHKrK4dGxNw2ETtYSi2iYYwSjgJZZoe7pu6Z+FpxLYIBC65q3
 L1k3ToqJl2w+O1gIIrkuVi019NXuGoI9O3N4usFcC5H0VJ04v+YKi0Wt+KSLFvcE
 CfY+NKdw6gDnJBQzWSJbgR/k9OXf8x8yDRURcNI3AjzX+IKF8+ckI186VtX0KcMf
 PvdvxvbE3AMPswfPQnoAkr7+IEo2KufhY2qBSXbAcEloo32YVEjy1rkV91/uTPzZ
 E26qrJcRhDoyF2IyPgTlg1+/WiPEo0e5aGdOhElP4bIZyobA+ELz89Y42Fm/Uumd
 c2a2nA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs30j8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 15:04:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 903E240071;
 Thu, 12 Jun 2025 15:03:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80866AFB28F;
 Thu, 12 Jun 2025 15:02:16 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 15:02:15 +0200
Message-ID: <782763e2-99d6-4533-b0db-79b618577586@foss.st.com>
Date: Thu, 12 Jun 2025 15:02:13 +0200
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
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
 <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
 <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
 <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
 <f1a63830-0533-4f1c-9116-32e8c1e61a8b@kernel.org>
 <26a4f12a-2295-402e-8e31-45733aa6582d@foss.st.com>
 <4f31f016-d250-41ea-b613-b074b8ea00d1@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <4f31f016-d250-41ea-b613-b074b8ea00d1@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-10_01,2025-03-28_01
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

T24gNi8xMi8yNSAxMzowNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMi8wNi8y
MDI1IDExOjMxLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPj4gT24gNi8xMS8yNSAxNzo0OCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDExLzA2LzIwMjUgMTY6MDgsIENsZW1l
bnQgTEUgR09GRklDIHdyb3RlOgo+Pj4+IE9uIDYvMTEvMjUgMDg6MzUsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+Pj4+IE9uIDEwLzA2LzIwMjUgMTU6MzMsIENsZW1lbnQgTEUgR09GRklD
IHdyb3RlOgo+Pj4+Pj4gT24gNi8xMC8yNSAxNDozOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPj4+Pj4+PiBPbiAxMC8wNi8yMDI1IDE0OjAyLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToK
Pj4+Pj4+Pj4gT24gNS8yOS8yNSAxMTowMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+
Pj4+Pj4+IE9uIDI4LzA1LzIwMjUgMTQ6MTQsIENsZW1lbnQgTEUgR09GRklDIHdyb3RlOgo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gKwkJfTsKPj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+ICsJ
CWhkcDogcGluY3RybEA1MDAyYTAwMCB7Cj4+Pj4+Pj4+Pj4+PiArCQkJY29tcGF0aWJsZSA9ICJz
dCxzdG0zMm1wMTMxLWhkcCI7Cj4+Pj4+Pj4+Pj4+PiArCQkJcmVnID0gPDB4NTAwMmEwMDAgMHg0
MDA+Owo+Pj4+Pj4+Pj4+Pj4gKwkJCWNsb2NrcyA9IDwmcmNjIEhEUD47Cj4+Pj4+Pj4+Pj4+PiAg
ICAgICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gV2h5
IGFyZSB5b3UgZGlzYWJsaW5nIGl0PyBXaGF0IGlzIG1pc3Npbmc/Cj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+PiBOb3RoaW5nIGlzIG1pc3NpbmcganVzdCBkaXNhYmxlZCBieSBkZWZhdWx0Lgo+Pj4+Pj4+
Pj4+IFRoZSBub2RlIGlzIHRoZW4gZW5hYmxlZCB3aGVuIG5lZWRlZCBpbiBib2FyZCdzIGR0cyBm
aWxlLgo+Pj4+Pj4+Pj4gTm9kZXMgc2hvdWxkIG5vdCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0IGlm
IHRoZXkgYXJlIGNvbXBsZXRlLiBUaGF0J3Mgd2h5Cj4+Pj4+Pj4+PiBJIGFza2VkIHdoYXQgaXMg
bWlzc2luZy4gRHJvcC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSGkgS3J6eXN6dG9mLCBPSyBJIGJldHRl
ciB1bmRlcnN0YW5kIG5vdy4KPj4+Pj4+Pj4gU28geWVzIHRoZSAncGluY3RybC0qJyBwcm9wZXJ0
aWVzIHdoaWNoIGFyZSBib2FyZCBkZXBlbmRlbnQgYXJlIGxhY2tpbmcuCj4+Pj4+Pj4KPj4+Pj4+
PiBUaGVzZSBhcmUgbm90IHByb3BlcnRpZXMgb2YgdGhpcyBub2RlLgo+Pj4+Pj4KPj4+Pj4+IERv
ZXMgdGhpcyBtZWFuIEkgc2hvdWxkIGFkZCAncGluY3RybC0qJyBwcm9wZXJ0aWVzIGluIGJpbmRp
bmdzIHlhbWwgZmlsZSA/Cj4+Pj4+PiBJIGRvbid0IGdldCBpdC4uCj4+Pj4+Cj4+Pj4+IFRoZXNl
IHByb3BlcnRpZXMgaGF2ZSBubyBtZWFuaW5nIGhlcmUsIHNvIHRoZSBoYXJkd2FyZSBkZXNjcmlw
dGlvbiBpcwo+Pj4+PiBjb21wbGV0ZS4gWW91IGNsYWltIHRoYXQgeW91IG1pc3MgdGhlbSB0aHVz
IGRldmljZSBpcyBpbmNvbXBsZXRlIGlzIGp1c3QKPj4+Pj4gbm90IGNvcnJlY3Q6IHRoZXNlIHBy
b3BlcnRpZXMgZG8gbm90IGJlbG9uZyBoZXJlISBUaGV5IGJlbG9uZyB0byB0aGUKPj4+Pj4gYm9h
cmQgYnV0IGV2ZW4gdGhlcmUgdGhleSBhcmUgdG90YWxseSBvcHRpb25hbC4gV2h5IHdvdWxkIHRo
ZXkgYmUgYQo+Pj4+PiByZXF1aXJlZCByZXNvdXJjZT8KPj4+Pj4KPj4+Pj4gVG8gcmVtaW5kOiB3
ZSB0YWxrIGhlcmUgT05MWSBhYm91dCByZXF1aXJlZCByZXNvdXJjZXMuCj4+Pj4KPj4+PiBZZXMs
ICdwaW5jdHJsLSonIHByb3BlcnRpZXMgYmVsb25ncyB0byB0aGUgYm9hcmQgYW5kIGFyZSBub3Qg
cmVxdWlyZWQuCj4+Pj4gU28gbm90aGluZyBpcyBtaXNzaW5nLgo+Pj4+Cj4+Pj4gVGhpcyBoZHAg
bm9kZSBpbiB0aGUgU29DIGR0c2kgZmlsZSBjYW4gYmUgZW5hYmxlZCBieSBkZWZhdWx0Lgo+Pj4+
IEJ1dCB0aGUgaGRwIGRyaXZlciB3aWxsIHByb2JlIGFuZCBkbyBub3RoaW5nIGJlY2F1c2Ugd2l0
aG91dCB0aGUKPj4+PiAncGluY3RybC0qJyBwcm9wZXJ0aWVzIGZyb20gdGhlIGJvYXJkIGZpbGVz
IGl0IHdvdWxkIG5vdCBiZSBhYmxlIHRvCj4+Pj4gYWNjZXNzIHRvIGFueSBwaW4uCj4+Pgo+Pj4K
Pj4+IFBpbmN0cmwgaGFzIG90aGVyIGZlYXR1cmVzIGluIGdlbmVyYWwsIGluY2x1ZGluZyBpbnRl
cmZhY2VzIHRvIHVzZXJzcGFjZQo+Pj4gKGFzIHByZXR0eSBvZnRlbiBjb21iaW5lZCB3aXRoIGdw
aW8sIGFsdGhvdWdoIG5vdCBzdXJlIGlmIHJlbGV2YW50IGhlcmUpLgo+Pgo+PiBZb3UncmUgcmln
aHQuIEFsc28gSERQIHBpbmN0cmwgaGFzIGEgR1BPIGZlYXR1cmUgYWNjZXNzaWJsZSBmcm9tIHVz
ZXJzcGFjZS4KPj4gQnV0IGJ5IGRlZmF1bHQgdGhlIEhEUCBpcyBub3QgY29ubmVjdGVkIHRvIGFu
eSBwYWQ7IGl0IG5lZWRzIHRoZSBib2FyZAo+IAo+IE9LLCB0aGVuIHRoYXQgd2FzIHRoZSBhbnN3
ZXIgdG8gbXkgZmlyc3QgcXVlc3Rpb24gLSB3aGF0IGlzIG1pc3NpbmcuCj4gSG93ZXZlciBhcmVu
J3QgdGhlc2UgcGFkcyBjb25uZWN0ZWQgaW50ZXJuYWxseSBhbHNvIHRvIG90aGVyIHBhcnRzIG9m
Cj4gdGhlIFNvQyAobGlrZSBpbiBtb3N0IG90aGVyIHZlbmRvcnMpPwoKTm8sIEhEUCAib3V0cHV0
IHBhZHMiIGFyZSBvbmx5IGNvbm5lY3RlZCB0byBTb0MgcGluY3RybCB0byByb3V0ZSBvdXRzaWRl
IAp0aGUgaW50ZXJuYWwgU29DIHNpZ25hbHMgZm9yIGRlYnVnIHB1cnBvc2UuCgo+PiAncGluY3Ry
bC0qJyBwcm9wZXJ0aWVzIHRvIGNvbmZpZ3VyZSB0aGUgU29DIHBpbmN0cmwgYW5kIGV4cG9zZSBI
RFAgb24KPj4gdGhlIFNvQyBwYWRzLgo+Pgo+PiBUaGF0J3Mgd2h5IGZvciBtZSB0aGUgZW5hYmxp
bmcgb2YgdGhlIGRyaXZlciBzaG91bGQgYmUgaW4gdGhlIGJvYXJkIGZpbGUKPj4gdG9nZXRoZXIg
d2l0aCB0aGUgU29DIHBpbmN0cmwgY29uZmlndXJhdGlvbi4KPiAKPiBBbmQgd2hhdCBhcmUgdGhl
IGRlZmF1bHQgcGFkIHNldHRpbmdzIGNvbmZpZ3VyZWQgYnkgSFBEIGRyaXZlciBpbgo+IGJvb3Rs
b2FkZXIgKGFuZCBieSBib290bG9hZGVyIEkgbWVhbiBvbmUgb2YgZmV3IGJvb3Rsb2FkZXJzIHRo
aXMgaXMKPiBnb2luZyB0byBiZSB1c2VkIG9uIGxpa2UgVS1Cb290KQoKVGhlIGRlZmF1bHQgaXMg
dG8gdXNlIHRoZSBHUElPIG9mIHRoZSBTb0MgcGluY3RybC4gVGhlIEhEUCBpcyBub3Qgcm91dGVk
IApvdXRzaWRlLgogID4+Cj4+IFRoZSB1c2VybGFuZCBjYW5ub3QgY2hhbmdlIHRoZSBwaW5jdHJs
IGFsdGVybmF0ZSBmdW5jdGlvbiBtdXgsIHRoaXMgaXMKPj4gc3RhdGljYWxseSBkZWZpbmVkIGJ5
IHRoZSBkZXZpY2V0cmVlLgo+IAo+IElmIHlvdSBleHBvc2UgR1BJTyB0aGVuIHVzZXJsYW5kIG5l
ZWRzIHRoaXMgcmVnYXJkbGVzcyBvZiBhbHRlcm5hdGUgbXV4Lgo+IElPVywgYm9hcmQgbGV2ZWwg
Y291bGQgbm90IGNvbmZpZ3VyZSBtdXggYmVjYXVzZSBpdCBzaG91bGQgYmUgYWx3YXlzCj4gY29u
ZmlndXJlZCB0byBzYWZlIEdQSU8gaW5wdXQuCgpGb3IgdXNlcmxhbmQgc2lnaHQgdmlldywgU29D
IEdQSU8gYXJlIHByZWZlcnJlZCBpbnN0ZWFkIG9mIEhEUC4KSERQIGlzIG9ubHkgR1BPIG5vdCBH
UElPLiAncGluY3RybC0qJyBwcm9wZXJ0aWVzIGNvbmZpZ3VyZSBhdCB0aGUgc2FtZSAKdGltZSB0
aGUgU29DIHBpbmN0cmwgbXV4IHRvIEhEUCBhbmQgdGhlIEhEUCBwaW5jdHJsIG11eCB0byBvbmUg
b2YgdGhlIApIRFAgZnVuY3Rpb25zIChlLmcuIEdQTykuCgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
