Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D767A255FC
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 10:35:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 520FAC78F7C;
	Mon,  3 Feb 2025 09:35:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF0FACFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 09:35:31 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5139V16j030463;
 Mon, 3 Feb 2025 10:35:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 EASdrYtM22Mujm5iYROTbz08JxL+HLrTGBslvwiDY9U=; b=6AXqoIfFv/24c5zN
 4Ef8qn8F0r7e/ShwEAW0O95YdxRm2TO9hVJrLw2F/EndBtKNav63AAKoJ17bYo2r
 nY3+IPcCjzNBQ+SXQHG9Sk4awCkZM7xLBYNlRudGQFJTIM2dLr4qP6eDPt56YEAQ
 xVXdGNfLiePxTmAs7zY/vNlWZd/nbyWKGUkrGJWHbG1XTMi13jEacJu5DHuetRm/
 OOwdKjV04GdN8mh2d7asRNg1HV4ddeWOsi+zQfx2CRcTsRY98XxKoH9HxA3+vqsy
 OelrKP+kFlgGo67kzR2GiPmqIdjk638Negi0v/uLMQEThURY5UABmNdCrqtnp2sb
 hmO4cg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44hx23kp85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2025 10:35:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C3CD54002D;
 Mon,  3 Feb 2025 10:34:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 541842A419B;
 Mon,  3 Feb 2025 10:33:33 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:33:32 +0100
Message-ID: <152005c9-577e-4853-b85b-8cac3feee793@foss.st.com>
Date: Mon, 3 Feb 2025 10:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Parant <C.Parant@phytec.fr>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20250110150216.309760-1-c.parant@phytec.fr>
 <4325bcfd010ee1dc64a261438c9d14e2ce121037.camel@phytec.fr>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <4325bcfd010ee1dc64a261438c9d14e2ce121037.camel@phytec.fr>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
Cc: "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [Upstream] [PATCH 00/11] Rework and fix
	STM32MP15x PHYTEC dts
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

SGkgQ2hyaXN0b3BoZQoKT24gMS8yOC8yNSAxNDo0NCwgQ2hyaXN0b3BoZSBQYXJhbnQgd3JvdGU6
Cj4gSGVsbG8gbWFpbnRhaW5lcnMsCj4gCj4gSnVzdCBjaGVja2luZyB0byBzZWUgaWYgeW91IGhh
dmUgc2VlbiB0aGlzIHBhdGNoIHNlcmllcyBhbmQgaWYgeW91IGdldAo+IGEgY2hhbmNlIHRvIHJl
dmlldyBpdC4KPiBUaGFuayB5b3UgZm9yIHlvdXIgdGltZS4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4g
Q2hyaXN0b3BoZQoKSSBqdXN0IHJlYmFzZWQgc3RtMzItbmV4dCBvbiB2Ni4xNC1yYzEsIHNvIGl0
J2xsIGJlIGRvbmUgKHJldmlldykgaW4gCnRoaXMgY3ljbGUuCgpyZWdhcmRzCkFsZXgKCj4gCj4g
TGUgdmVuZHJlZGkgMTAgamFudmllciAyMDI1IMOgIDE2OjAyICswMTAwLCBDaHJpc3RvcGhlIFBh
cmFudCBhIMOpY3JpdMKgOgo+PiBUaGlzIHBhdGNoIHNlcmllcyByZW5hbWUgYW5kIHJlb3JnYW5p
emUgdGhlIFNUTTMyTVAxNXggUEhZVEVDCj4+IGJhc2Vib2FyZCAocGh5Qk9BUkQtU2FyZ2FzKSBh
bmQgU29NIChwaHlDT1JFLVNUTTMyTVAxNXgpIGRldmljZSB0cmVlCj4+IGZpbGVzLgo+PiBJbmRl
ZWQsIHRoZSBjdXJyZW50IGRldmljZSB0cmVlIG5hbWluZyBhbmQgb3JnYW5pemF0aW9uIGlzIG5v
dCByZWFsbHkKPj4gY29uc2lzdGVudCBhcyBpdCBkb2VzIG5vdCBhbGlnbiB3aXRoIG90aGVycyBT
VE0zMk1QIGJvYXJkcyAodXNlCj4+IGNvbW1vbgo+PiBkdHNpIGZpbGUgYXMgbXVjaCBhcyBwb3Nz
aWJsZSwgdXNlIG9uZSBkdHNpIGZvciBTb00gYW5kIG9uZSBkdHNpIGZvcgo+PiBiYXNlYm9hcmQp
Lgo+Pgo+PiBUaGUgc2VyaWVzIGFsc28gZml4ZXMgc29tZSBpbXBvcnRhbnQgcGluY3RybCBpc3N1
ZXMgYW5kIG1pbm9yIG9uZQo+PiAoY29kaW5nCj4+IHN0eWxlKS4gQWRkaXRpb25hbCBwaW5jdHJs
IGlzIGFsc28gYWRkZWQgZm9yIHRoZSBvcHRpb25uYWwgaW50ZXJmYWNlcwo+PiB0aGF0IGFyZSBu
b3QgZW5hYmxlZCBieSBkZWZhdWx0IChGTUMsIExUREMsIERDTUksIFBXTSkuCj4+Cj4+IENocmlz
dG9waGUgUGFyYW50ICgxMSk6Cj4+ICDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHljb3JlOiBS
ZW5hbWUgZGV2aWNlIHRyZWUgZmlsZXMKPj4gIMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWJv
YXJkLXNhcmdhczogSW50cm9kdWNlIFNvTSBkZXZpY2UgdHJlZQo+PiAgwqAgZHQtYmluZGluZ3M6
IGFybTogc3RtMzI6IFJlbmFtZSBTVE0zMk1QMTV4IFBoeXRlYyBib2FyZCBhbmQgU29NCj4+ICDC
oCBBUk06IGR0czogc3RtMzJtcDE1OiBBZGQgbmV3IHBpbm11eCBncm91cHMgZm9yIHBoeWNvcmUg
YW5kIHBoeWJvYXJkCj4+ICDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHlib2FyZC1zYXJnYXM6
IEZpeCB1YXJ0NCBhbmQgc2FpMiBwaW5jdHJsCj4+ICDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBw
aHljb3JlOiBxc3BpOiBGaXggbWVtb3J5IG1hcCBhbmQgcGluY3RybAo+PiAgwqAgQVJNOiBkdHM6
IHN0bTMybXAxNTogcGh5Y29yZTogQWRkIGR1bW15IG1lbW9yeS1ub2RlCj4+ICDCoCBBUk06IGR0
czogc3RtMzJtcDE1OiBwaHlib2FyZC1zYXJnYXM6IE1vdmUgYWxpYXNlcyBmcm9tIGR0cyB0byBk
dHNpCj4+ICDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHljb3JlOiBEaXNhYmxlIG9wdGlvbmFs
IFNvTSBwZXJpcGhlcmFscwo+PiAgwqAgQVJNOiBkdHM6IHN0bTMybXAxNTogcGh5Y29yZSBhbmQg
cGh5Ym9hcmQ6IEZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzCj4+ICDCoCBBUk06IGR0czogc3RtMzJt
cDE1OiBwaHljb3JlIGFuZCBwaHlib2FyZDogQWRkIG9wdGlvbmFsIGludGVyZmFjZXMKPj4KPj4g
IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWzCoCB8wqDCoCA3
ICstCj4+ICDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+PiAgwqBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTUtcGluY3RybC5kdHNpwqDCoCB8IDE2NCArKysrKysrKysKPj4gIMKgLi4uL3N0L3N0bTMy
bXAxNTdjLXBoeWJvYXJkLXNhcmdhcy1yZGsuZHRzwqDCoMKgIHzCoCA0MiArKysKPj4gIMKgLi4u
L2R0cy9zdC9zdG0zMm1wMTU3Yy1waHljb3JlLXN0bTMybXAxLTMuZHRzIHzCoCA2MCAtLS0KPj4g
IMKgLi4uL2R0cy9zdC9zdG0zMm1wMTV4eC1waHlib2FyZC1zYXJnYXMuZHRzacKgwqAgfCAyODYg
KysrKysrKysrKysrKysrCj4+ICDCoC4uLi1zb20uZHRzaSA9PiBzdG0zMm1wMTV4eC1waHljb3Jl
LXNvbS5kdHNpfSB8IDM0NCArKysrLS0tLS0tLS0tLS0tCj4+IC0tCj4+ICDCoDcgZmlsZXMgY2hh
bmdlZCwgNTY0IGluc2VydGlvbnMoKyksIDM0MSBkZWxldGlvbnMoLSkKPj4gIMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLXBoeWJvYXJkLXNhcmdh
cy0KPj4gcmRrLmR0cwo+PiAgwqBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMv
c3Qvc3RtMzJtcDE1N2MtcGh5Y29yZS0KPj4gc3RtMzJtcDEtMy5kdHMKPj4gIMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LXBoeWJvYXJkLQo+PiBz
YXJnYXMuZHRzaQo+PiAgwqByZW5hbWUgYXJjaC9hcm0vYm9vdC9kdHMvc3Qve3N0bTMybXAxNTdj
LXBoeWNvcmUtc3RtMzJtcDE1LXNvbS5kdHNpCj4+ID0+IHN0bTMybXAxNXh4LXBoeWNvcmUtc29t
LmR0c2l9ICg1MyUpCj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
