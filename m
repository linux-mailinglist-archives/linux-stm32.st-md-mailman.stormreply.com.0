Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7A6FDFF5
	for <lists+linux-stm32@lfdr.de>; Wed, 10 May 2023 16:22:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58D7EC69053;
	Wed, 10 May 2023 14:22:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 799EEC6904E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 May 2023 14:22:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AARLSF003420; Wed, 10 May 2023 16:22:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KPcKF2alaU6EYzoeowQfXYviPM8+Cm+PPF8ke7qvULk=;
 b=SyfyPZu99HLkHkofrMkgRvJ8/xYUS88mq/rUbBsDn9xQVfl+UjqGWjCyF92jdeQlS38N
 ILOeBc7PqajfXASKmM2YgidBKbfwFMtbw/YuEws/PneqKGDGMDLTo6H+INjnwx1h6GYX
 YOmsa486K+C8rzuctkiLcxq/II0Fw0UL72S7Z1W9yPk61z/agGsG72XHhjl4MIXbWeee
 f/IA2Xq2iP3Q5otupIk1PA9opC6Q6+ADRM+ZoXgPL1/4/bFO96k5cp7OSR+R4cE7a2Oj
 aiojbOM3QqBM05qaJPWxjbLkEsfd/zsp9ksix5lIxmqhOqT+MuA9Jj++ktizTV6LSRpq HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qg9hf9bkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 16:22:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3937100038;
 Wed, 10 May 2023 16:22:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 919192248CE;
 Wed, 10 May 2023 16:22:12 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 10 May
 2023 16:22:12 +0200
Message-ID: <7884b0d8-199c-4415-4113-ddce4b640508@foss.st.com>
Date: Wed, 10 May 2023 16:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Rob Herring <robh@kernel.org>, <gabriel.fernandez@foss.st.com>
References: <20230407201526.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
 <20230412151404.GA2372294-robh@kernel.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230412151404.GA2372294-robh@kernel.org>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rcc: stm32: Fix STM32MP13
	include file
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

SGksCgpPbiA0LzEyLzIzIDE3OjE0LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBGcmksIEFwciAw
NywgMjAyMyBhdCAwODoxNTozM1BNICswMjAwLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBN
aW5vciBjb3NtZXRpYyBjaGFuZ2UsIGFsaWduZWQgd2l0aCBmaWxlcyBpbiBVLUJvb3Q6Cj4+IC0g
Y2hhbmdlIG9ic29sZXRlIFNQRFggaWQgOiBHUEwtMi4wKwo+PiAtIHVzZSBjb3JyZWN0IGFkZHJl
c3MgZ2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20KPj4gLSByZW1vdmUgZXh0cmEgc3BhY2UK
PiBNYWtlIHRoZSBzdWJqZWN0IHJlZmxlY3QgdGhlIHB1cnBvc2U6ICdTeW5jIHdpdGggdS1ib290
IGNvcHknCgoKT2sKCgo+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJp
Y2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiAgIGluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svc3RtMzJtcDEzLWNsa3MuaCAgIHwgNiArKystLS0KPj4gICBpbmNsdWRlL2R0LWJp
bmRpbmdzL3Jlc2V0L3N0bTMybXAxMy1yZXNldHMuaCB8IDQgKystLQo+PiAgIDIgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdG0zMm1wMTMtY2xrcy5oIGIvaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9zdG0zMm1wMTMtY2xrcy5oCj4+IGluZGV4IDAyYmVmZDI1ZWRjZS4uZGE0
Y2I3NTY3NDMwIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N0bTMy
bXAxMy1jbGtzLmgKPj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdG0zMm1wMTMt
Y2xrcy5oCj4+IEBAIC0xLDcgKzEsNyBAQAo+PiAtLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjArIG9yIEJTRC0zLUNsYXVzZSAqLwo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb3ItbGF0ZXIgb3IgQlNELTMtQ2xhdXNlICovCj4+ICAgLyoKPj4gICAgKiBD
b3B5cmlnaHQgKEMpIFNUTWljcm9lbGVjdHJvbmljcyAyMDIwIC0gQWxsIFJpZ2h0cyBSZXNlcnZl
ZAo+PiAtICogQXV0aG9yOiBHYWJyaWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpAc3Qu
Y29tPiBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzLgo+PiArICogQXV0aG9yOiBHYWJyaWVsIEZlcm5h
bmRleiA8Z2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20+IGZvciBTVE1pY3JvZWxlY3Ryb25p
Y3MuCj4+ICAgICovCj4+ICAgCj4+ICAgI2lmbmRlZiBfRFRfQklORElOR1NfU1RNMzJNUDEzX0NM
S1NfSF8KPj4gQEAgLTY0LDcgKzY0LDcgQEAKPj4gICAjZGVmaW5lIENLX01DTzEJCTM4Cj4+ICAg
I2RlZmluZSBDS19NQ08yCQkzOQo+PiAgIAo+PiAtLyogIElQIGNsb2NrcyAqLwo+PiArLyogSVAg
Y2xvY2tzICovCj4+ICAgI2RlZmluZSBTWVNDRkcJCTQwCj4+ICAgI2RlZmluZSBWUkVGCQk0MQo+
PiAgICNkZWZpbmUgRFRTCQk0Mgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9zdG0zMm1wMTMtcmVzZXRzLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3N0bTMy
bXAxMy1yZXNldHMuaAo+PiBpbmRleCA5MzQ4NjRlOTBkYTYuLjFiODNhMDFkZThmMCAxMDA2NDQK
Pj4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zdG0zMm1wMTMtcmVzZXRzLmgKPj4g
KysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zdG0zMm1wMTMtcmVzZXRzLmgKPj4gQEAg
LTEsNyArMSw3IEBACj4+IC0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBvciBC
U0QtMy1DbGF1c2UgKi8KPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9y
LWxhdGVyIG9yIEJTRC0zLUNsYXVzZSAqLwo+IFJlYWxseSwgdGhlIExpbnV4IGNvcHkgY2FtZSBm
aXJzdCwgc28geW91IHNob3VsZCB1c2UgaXRzIGxpY2Vuc2UuIFlvdXIKPiBjb21wYW55J3MgbGF3
eWVycyBhcmUgZ29vZCB3aXRoIEdQTHYzIGFuZCB0aGVuIHY0PwoKCldlIGhhdmUgYSBsb25nIGRl
YmF0ZSBvbiB0aGUgbGljZW5zZXMsIGFuZCBwYXJ0aWN1bGFyIGZvciBkZXZpY2UgdHJlZSwKCmFu
ZCBhcyBjb25jbHVzaW9uIHdlIGFyZSB1c2luZyBmb3IgU1RNMzJNUCBTb0NzOgoKLSBGb3IgY29k
ZSAoaW4gTGludXgga2VybmVsIGRyaXZlcikgPT4gR1BMLTIuMC1vbmx5CgotIEZvciBkZXZpY2Ug
dHJlZSBhbmQgYmluZGluZyAuaCBmaWxlczsgdGhlIGR1YWwgbGljZW5zZXMgPT4gCkdQTC0yLjAt
b3ItbGF0ZXIgT1IgQlNELTMtQ2xhdXNlCgoKSXQgaXMgYmVjYXVzZSB0aGUgbW9kaWZpY2F0aW9u
cyBpbiBkZXZpY2UgdHJlZSBmaWxlcyBhbmQgYmluZGluZyBmaWxlIHMgCmNhbiBiZSBhcHBsaWVk
IG9uCgpvdGhlciBTVyB3aXRoIHVzaW5nIGFueSBsaWNlbnNlczoKCiDCoMKgIC0gR1BMMiAoTGlu
dXggL3UtQm9vdCkKCiDCoMKgIC0gQlNEIChURi1BL09QLVRFRSkKCiDCoMKgIC0gR1BMMy9HUEw0
IGxpY2Vuc2UgKGFueSBvdGhlciBTVyBjb21wb25lbnQpCgoKSnVzdCBpbmRpY2F0ZSBHUEwtMi4w
LW9yLWxhdGVyIGluIHRoZSBkZXZpY2UgdHJlZSBvciBiaW5kaW5nIGZpbGVzIHdvbid0IApjb250
YW1pbmF0ZQoKYWxsIHRoZSBwcm9qZWN0cyB3aXRoIEdQTDMvR1BMNCBsaWNlbnNlIGlmIGl0IG9u
bHkgdXNlIHRoaXMgRFQsIG9yIApiaW5kaW5nIGZpbGVzLgoKCk5COiBpdCBpcyBhbHJlYWR5IHRo
ZSBjYXNlIGZvciBvdGhlciBmaWxlcyB1c2VkIGJ5IFNUTTMyTVAgU29DLCBmb3IgCmV4YW1wbGUg
OgoKLi9pbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzItcGluZnVuYy5oOgogwqDCoMKg
IC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgQlNELTMtQ2xhdXNlKSAq
LwoKCmFuZCB3ZSBoYXZlIG5vIHJlYXNvbiB0byB1c2UgYSBkaWZmZXJlbnQgbGljZW5zZSBmb3Ig
dGhlIDIgZmlsZXMgZm9yIApTVE0zMk1QMTMgUkNDIGJpbmRpbmc6CgogwqAgaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC9zdG0zMm1wMTMtcmVzZXRzLmgKIMKgIGluY2x1ZGUvZHQtYmluZGluZ3Mv
Y2xvY2svc3RtMzJtcDEzLWNsa3MuaAoKVGhpcyBwYXRjaCBjb3JyZWN0cyBhIG1pc3Rha2UgaW4g
dGhlIGluaXRpYWwgY29tbWl0IGZvciBSQ0MgYmluZGluZyAKdXAtc3RyZWFtZWQKCmJ5IEdhYnJp
ZWwgaW4gcGFyYWxsZWwgaW4gVS1Cb290IGFuZCBMaW51eCByZXBvc2l0b3JpZXM7IHRoaXMgCmlu
Y29uc2lzdGVuY3kgaW4gdGhlIGxpY2Vuc2UKCndhcyBjb3JyZWN0ZWQgb25seSB3aGVuIHRoZSBz
YW1lIHBhdGNoIHdhcyBwdXNoZWQgaW4gVS1Cb290LgoKClBTOiB1c2luZyB0aGUgR1BMMi1vbmx5
IGlzIG5vdCBhIGlzc3VlIGZvciBVLUJvb3QgYnV0IHBlcmhhcHMgZm9yIG90aGVyIAp1c2VyIG9m
IGRldmljZSB0cmVlIGluIG90aGVyIGNvbXBvbmVudHMsCiDCoMKgwqDCoMKgIFNvIGlmIGl0IGlz
IGEgYmxvY2tpbmcgaXNzdWUgZm9yIExpbnV4IEkgY2FuIGNoYW5nZSBpdCB0byAKIkdQTC0yLjAt
b25seSIgaW4gTGludXggYW5kIFUtQm9vdAoKClBhdHJpY2sKCj4KPj4gICAvKgo+PiAgICAqIENv
cHlyaWdodCAoQykgU1RNaWNyb2VsZWN0cm9uaWNzIDIwMTggLSBBbGwgUmlnaHRzIFJlc2VydmVk
Cj4+IC0gKiBBdXRob3I6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBzdC5j
b20+IGZvciBTVE1pY3JvZWxlY3Ryb25pY3MuCj4+ICsgKiBBdXRob3I6IEdhYnJpZWwgRmVybmFu
ZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNvbT4gZm9yIFNUTWljcm9lbGVjdHJvbmlj
cy4KPj4gICAgKi8KPj4gICAKPj4gICAjaWZuZGVmIF9EVF9CSU5ESU5HU19TVE0zMk1QMTNfUkVT
RVRfSF8KPj4gLS0gCj4+IDIuMjUuMQo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
