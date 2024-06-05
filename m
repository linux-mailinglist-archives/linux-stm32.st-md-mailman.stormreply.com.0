Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E932D8FC738
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 11:05:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B030C6C855;
	Wed,  5 Jun 2024 09:05:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EB70C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 09:05:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4558372O012864;
 Wed, 5 Jun 2024 11:04:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 cW9K5Aa208iQj73NNP37BJq6nJxBU5iesU1QJSwy4yo=; b=GW/9Mw/xfKfxyorz
 vRH99GmrThF9W8w64kj1weF0gDgk4W8Yu2SKrVJIfyPXeq1Dh4Qpwpp3OPWXjj5z
 lOcQIGZco7Qd9M25JEVkZU04QHWtUIdE8qwZuXFEjHZ2ZNsgWIT1ZdJRYukuaIOz
 NKG4q7BuRk2RbswbDGGm+S/tbJxTBtq1IeugFtkHnwQAFAkiB53uT6Yx0ZKjjINn
 OA/ddE+e4gL81QZgeuLZHyVhniNKucZtGfUW4RdVLq/VQNulOYNQxMV3Yj23WJbr
 H6xG3wvkPZ+iNly+qsvIcrYYtqrwyj66se3Zr2Ziwak2qpvvv9eBsBfSXUugby1k
 o2i9uA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw3wqyve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 11:04:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 63DD740045;
 Wed,  5 Jun 2024 11:04:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A12F2138E7;
 Wed,  5 Jun 2024 11:03:30 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 11:03:29 +0200
Message-ID: <92700993-aec6-4880-bbda-8f54debbe765@foss.st.com>
Date: Wed, 5 Jun 2024 11:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>
References: <20240427221048.65392-1-marex@denx.de>
 <171440141047.1676474.1900576669579352447.robh@kernel.org>
 <ec449ed4-53a9-4fb3-b994-d2079402a26d@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <ec449ed4-53a9-4fb3-b994-d2079402a26d@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_02,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: arm: stm32: Add
 compatible string for DH electronics STM32MP13xx DHCOR DHSBC board
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

CgpPbiA0LzI5LzI0IDE3OjEyLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA0LzI5LzI0IDQ6NDEg
UE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IAo+PiBNeSBib3QgZm91bmQgbmV3IERUQiB3YXJuaW5n
cyBvbiB0aGUgLmR0cyBmaWxlcyBhZGRlZCBvciBjaGFuZ2VkIGluIHRoaXMKPj4gc2VyaWVzLgo+
Pgo+PiBTb21lIHdhcm5pbmdzIG1heSBiZSBmcm9tIGFuIGV4aXN0aW5nIFNvQyAuZHRzaS4gT3Ig
cGVyaGFwcyB0aGUgd2FybmluZ3MKPj4gYXJlIGZpeGVkIGJ5IGFub3RoZXIgc2VyaWVzLiBVbHRp
bWF0ZWx5LCBpdCBpcyB1cCB0byB0aGUgcGxhdGZvcm0KPj4gbWFpbnRhaW5lciB3aGV0aGVyIHRo
ZXNlIHdhcm5pbmdzIGFyZSBhY2NlcHRhYmxlIG9yIG5vdC4gTm8gbmVlZCB0byByZXBseQo+PiB1
bmxlc3MgdGhlIHBsYXRmb3JtIG1haW50YWluZXIgaGFzIGNvbW1lbnRzLgo+Pgo+PiBJZiB5b3Ug
YWxyZWFkeSByYW4gRFQgY2hlY2tzIGFuZCBkaWRuJ3Qgc2VlIHRoZXNlIGVycm9yKHMpLCB0aGVu
Cj4+IG1ha2Ugc3VyZSBkdC1zY2hlbWEgaXMgdXAgdG8gZGF0ZToKPj4KPj4gwqDCoCBwaXAzIGlu
c3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCj4+Cj4+Cj4+IE5ldyB3YXJuaW5ncyBydW5uaW5nICdt
YWtlIENIRUNLX0RUQlM9eSAKPj4gc3Qvc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuZHRiJyBmb3Ig
MjAyNDA0MjcyMjEwNDguNjUzOTItMS1tYXJleEBkZW54LmRlOgo+Pgo+PiBhcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTM1Zi1kaGNvci1kaHNiYy5kdGI6IAo+PiAvc29jL3NlcmlhbEA0MDAx
ODAwMC9ibHVldG9vdGg6IGZhaWxlZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggCj4+IGNvbXBh
dGlibGU6IFsnaW5maW5lb24sY3l3NDM0MzktYnQnLCAnYnJjbSxiY200MzI5LWJ0J10KPiAKPiBU
aGlzIHNob3VsZCBiZSBhZGRyZXNzZWQgaW4KPiAKPiBbUEFUQ0ggdjJdIGR0LWJpbmRpbmdzOiBu
ZXQ6IGJyb2FkY29tLWJsdWV0b290aDogQWRkIENZVzQzNDM5IERUIGJpbmRpbmcKPiAKPiBJdCBp
cyBhbHJlYWR5IEFCJ2QgYnkgS3J6eXN6dG9mLCBJIGp1c3QgcGluZ2VkIHRoYXQgcGF0Y2ggdG8g
ZmlndXJlIG91dCAKPiB3aGF0J3MgYmxvY2tpbmcgaXQuCj4gCj4+IGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxMzVmLWRoY29yLWRoc2JjLmR0YjogCj4+IC9zb2Mvc2FpQDQ0MDBhMDAwL2F1
ZGlvLWNvbnRyb2xsZXJANDQwMGEwMDQ6IGZhaWxlZCB0byBtYXRjaCBhbnkgCj4+IHNjaGVtYSB3
aXRoIGNvbXBhdGlibGU6IFsnc3Qsc3RtMzItc2FpLXN1Yi1hJ10KPj4gYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuZHRiOiAKPj4gL3NvYy9zYWlANDQwMGEwMDAv
YXVkaW8tY29udHJvbGxlckA0NDAwYTAyNDogZmFpbGVkIHRvIG1hdGNoIGFueSAKPj4gc2NoZW1h
IHdpdGggY29tcGF0aWJsZTogWydzdCxzdG0zMi1zYWktc3ViLWInXQo+PiBhcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTM1Zi1kaGNvci1kaHNiYy5kdGI6IAo+PiAvc29jL3NhaUA0NDAwYjAw
MC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDA0OiBmYWlsZWQgdG8gbWF0Y2ggYW55IAo+PiBzY2hl
bWEgd2l0aCBjb21wYXRpYmxlOiBbJ3N0LHN0bTMyLXNhaS1zdWItYSddCj4+IGFyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxMzVmLWRoY29yLWRoc2JjLmR0YjogCj4+IC9zb2Mvc2FpQDQ0MDBi
MDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGIwMjQ6IGZhaWxlZCB0byBtYXRjaCBhbnkgCj4+IHNj
aGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnc3Qsc3RtMzItc2FpLXN1Yi1iJ10KPiAKPiBUaGlzIGNv
bWVzIGZyb20gYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzMS5kdHNpICwgaS5lLiB1bnJl
bGF0ZWQgdG8gCj4gdGhpcyBwYXRjaC4gQnV0IHRoZXJlIGlzIGEgc2NoZW1hIGZvciB0aGlzIGlu
IAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1zYWku
eWFtbCBpbiB0b2RheXMnIG5leHQgLgoKSnVzdCB0ZXN0ZWQgb24gc3RtMzItbmV4dCByZWJzZWQg
b24gdjYuMTAtcmMxKSBhbmQgbm8geWFtbCBpc3N1ZSByZXBvcnRlZC4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
