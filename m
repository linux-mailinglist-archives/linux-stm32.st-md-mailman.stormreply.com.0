Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE6AE7BB8
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 11:12:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2A34C3087B;
	Wed, 25 Jun 2025 09:12:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13A16C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 09:12:22 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P510l9032381;
 Wed, 25 Jun 2025 11:12:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7ONVBi6t27yoHOLom4q+9fNttcSqpjkl1fBEaeAnNkw=; b=Vwf8UUn5XqH75K2i
 fscZ6KsiCvCjx7WJPqQv23IzCGzpmhbdb1xkGE7uHQA9PyER1EFSCXUkQPBiHlW+
 4uwmJYQWpOhdd6Xqb43cGBt89mdGyI4ppGLqD0yH1sy3yZx/kSdVbeJbpm7/B+03
 Z9f1dnJinZdTX1NVip71mTOSvnuabKIaG0/CX1WLLaIsmVKwNQzNqUc9OI0pJPJR
 +iV48oYu9RNwLmIxPb3rBTaniPK+oj3phiUfDazp0779JUqdQ6+GrWs/PsBHyMyh
 9Jjsu1AigmntTDkS0pGejX+t7nZFk2GI47Nkl0M9/6Pv5QZ3GQ6LWYth0Mh1SWTm
 kubHIA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e6a6pxh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jun 2025 11:12:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B9BB140045;
 Wed, 25 Jun 2025 11:10:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4176DB29C43;
 Wed, 25 Jun 2025 11:09:07 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 11:09:06 +0200
Message-ID: <dabecbc6-967e-4912-8297-4d53fd2d9cc1@foss.st.com>
Date: Wed, 25 Jun 2025 11:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
 <9cb1575e-ae27-4a78-adb7-8a9e7072375e@kernel.org>
 <5044c733-8836-43bd-85d7-0f552b000fb1@foss.st.com>
 <49483568-b287-45ca-a66c-1e0ad0490225@kernel.org>
 <e2400615-f21e-40bf-84f8-384242632193@foss.st.com>
 <a6440cbf-f7b5-4bce-8e2b-8aa3ec4d2342@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <a6440cbf-f7b5-4bce-8e2b-8aa3ec4d2342@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/13] perf: stm32: introduce DDRPERFM
	driver
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

T24gNi8yNS8yNSAxMDo0OCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyNS8wNi8y
MDI1IDEwOjMzLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPj4gT24gNi8yNS8yNSAwODozNSwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDI0LzA2LzIwMjUgMTI6NDMsIENsZW1l
bnQgTEUgR09GRklDIHdyb3RlOgo+Pj4+IE9uIDYvMjMvMjUgMTE6NDUsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+IEhpIEtyenlzenRvZiwKPj4+Pgo+Pj4+
IFNvcnJ5IEkgZm9yZ290IHRvIGFkZHJlc3MgY29tbWVudHMgYmVsb3cuCj4+Pj4KPj4+Pj4+ICsK
Pj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHN0bTMyX2Rkcl9wbXVfY2ZnIHN0bTMyX2Rkcl9w
bXVfY2ZnX21wMSA9IHsKPj4+Pj4+ICsJLnJlZ3MgPSAmc3RtMzJfZGRyX3BtdV9yZWdzcGVjX21w
MSwKPj4+Pj4+ICsJLmF0dHJpYnV0ZSA9IHN0bTMyX2Rkcl9wbXVfYXR0cl9ncm91cHNfbXAxLAo+
Pj4+Pj4gKwkuY291bnRlcnNfbmIgPSBNUDFfQ05UX05CLAo+Pj4+Pj4gKwkuZXZ0X2NvdW50ZXJz
X25iID0gTVAxX0NOVF9OQiAtIDEsIC8qIFRpbWUgY291bnRlciBpcyBub3QgYW4gZXZlbnQgY291
bnRlciAqLwo+Pj4+Pj4gKwkudGltZV9jbnRfaWR4ID0gTVAxX1RJTUVfQ05UX0lEWCwKPj4+Pj4+
ICsJLmdldF9jb3VudGVyID0gc3RtMzJfZGRyX3BtdV9nZXRfZXZlbnRfY291bnRlcl9tcDEsCj4+
Pj4+PiArfTsKPj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHN0bTMyX2Rkcl9w
bXVfY2ZnIHN0bTMyX2Rkcl9wbXVfY2ZnX21wMiA9IHsKPj4+Pj4+ICsJLnJlZ3MgPSAmc3RtMzJf
ZGRyX3BtdV9yZWdzcGVjX21wMiwKPj4+Pj4+ICsJLmF0dHJpYnV0ZSA9IHN0bTMyX2Rkcl9wbXVf
YXR0cl9ncm91cHNfbXAyLAo+Pj4+Pj4gKwkuY291bnRlcnNfbmIgPSBNUDJfQ05UX05CLAo+Pj4+
Pj4gKwkuZXZ0X2NvdW50ZXJzX25iID0gTVAyX0NOVF9OQiAtIDEsIC8qIFRpbWUgY291bnRlciBp
cyBhbiBldmVudCBjb3VudGVyICovCj4+Pj4+PiArCS50aW1lX2NudF9pZHggPSBNUDJfVElNRV9D
TlRfSURYLAo+Pj4+Pj4gKwkuZ2V0X2NvdW50ZXIgPSBzdG0zMl9kZHJfcG11X2dldF9ldmVudF9j
b3VudGVyX21wMiwKPj4+Pj4+ICt9Owo+Pj4+Pj4gKwo+Pj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZGV2X3BtX29wcyBzdG0zMl9kZHJfcG11X3BtX29wcyA9IHsKPj4+Pj4+ICsJU0VUX1NZU1RF
TV9TTEVFUF9QTV9PUFMoTlVMTCwgc3RtMzJfZGRyX3BtdV9kZXZpY2VfcmVzdW1lKQo+Pj4+Pj4g
K307Cj4+Pj4+PiArCj4+Pj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3Rt
MzJfZGRyX3BtdV9vZl9tYXRjaFtdID0gewo+Pj4+Pj4gKwl7Cj4+Pj4+PiArCQkuY29tcGF0aWJs
ZSA9ICJzdCxzdG0zMm1wMTMxLWRkci1wbXUiLAo+Pj4+Pj4gKwkJLmRhdGEgPSAmc3RtMzJfZGRy
X3BtdV9jZmdfbXAxCj4+Pj4+PiArCX0sCj4+Pj4+PiArCXsKPj4+Pj4+ICsJCS5jb21wYXRpYmxl
ID0gInN0LHN0bTMybXAxNTEtZGRyLXBtdSIsCj4+Pj4+PiArCQkuZGF0YSA9ICZzdG0zMl9kZHJf
cG11X2NmZ19tcDEKPj4+Pj4KPj4+Pj4gU28gZGV2aWNlcyBhcmUgY29tcGF0aWJsZSwgdGh1cyBl
eHByZXNzIGl0IGNvcnJlY3RseSBhbmQgZHJvcCB0aGlzLgo+Pj4+Cj4+Pj4gT2sgc28gSSBhc3N1
bWUgdGhpcyBjb21lcyB3aXRoIHlvdXIgY29tbWVudCBpbiB0aGUgYmluZGluZ3MgYW5kCj4+Pj4g
YmFzaWNhbGx5IGRvbid0IGdldCB5b3UgcG9pbnQgaGVyZS4KPj4+PiBDYW4geW91IHBsZWFzZSBi
ZSBtb3JlIHByZWNpc2UgPwo+Pj4KPj4+IEV4cHJlc3MgY29tcGF0aWJpbGl0eSBpbiB0aGUgYmlu
ZGluZ3MsIGxpa2UgOTAlIG9mIFNvQ3MgYXJlIGRvaW5nLCBzbwo+Pj4gd2l0aCBwcm9wZXIgZmFs
bGJhY2sgYW5kIGRyb3AgdGhpcyBlbnRyeSBpbiB0aGUgdGFibGUuIE15IGNvbW1lbnQgd2FzCj4+
PiBwcmV0dHkgcHJlY2lzZSwgYmVjYXVzZSB0aGlzIGlzIGNvbXBsZXRlbHkgc3RhbmRhcmQgcGF0
dGVybiwgYWxzbyB1c2VkCj4+PiBhbHJlYWR5IGluIHN0bTMyLgo+Pj4KPj4KPj4gT2sgSSByZW1l
bWJlciB5b3VyIGRpc2N1c3Npb24gd2l0aCBBbGV4IGluIG15IFYxIG9mIHBpbmN0cmwtaGRwIDoK
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzFkZTU4NjcyLTUzNTUtNGI3NS05OWY0LWM0
ODY4NzAxN2QyZkBrZXJuZWwub3JnLwo+Pgo+PiBEb2VzIGl0IHN1aXRzIHlvdSA6Cj4+IEluIHRo
ZSBTb0MgRFQ6Cj4+IE1QMTM6IGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEzMS1kZHItcG11Iiwg
InN0LHN0bTMybXAxLWRkci1wbXUiOwo+PiBNUDE1OiBjb21wYXRpYmxlID0gInN0LHN0bTMybXAx
NTEtZGRyLXBtdSIsICJzdCxzdG0zMm1wMS1kZHItcG11IjsKPiAKPiBObywgYmVjYXVzZSBJIGRp
ZCBub3Qgc2F5IHRvIGNoYW5nZSBvdGhlciBlbnRyeSBpbiB0aGUgdGFibGUuIFBsZWFzZQo+IHJl
YWQgYWdhaW4gd2hhdCBJIGFza2VkOiBkcm9wIHRoaXMuICJUaGlzIiBtZWFucyBPTkxZIHRoaXMg
ZW50cnkuICJEcm9wCj4gdGhpcyIgZG9lcyBub3QgbWVhbiAiY2hhbmdlIHNvbWV0aGluZyBlbHNl
Ii4gRG8gbm90IGNoYW5nZSBvdGhlciBlbnRyaWVzCj4gYnkgaW50cm9kdWNpbmcgc29tZSBnZW5l
cmljIGNvbXBhdGlibGUuIFRoYXQncyBub3QgdGhlIHBhdHRlcm4gZXZlcgo+IGVuZG9yc2VkIGJ5
IERUIG1haW50YWluZXJzLiBBZGQgZnJvbnQgY29tcGF0aWJsZSBhbmQgeW91IGFyZSBkb25lLAo+
IHNtYWxsZXN0IGFtb3VudCBvZiBjaGFuZ2VzLCBtb3N0IG9idmlvdXMgY29kZS4KPgoKT2sgc28g
aW4gdGhlIFNvQyBEVCBJJ2xsIGtlZXA6Ck1QMTM6IGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEz
MS1kZHItcG11IjsKTVAxNTogY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTUxLWRkci1wbXUiLCAi
c3Qsc3RtMzJtcDEzMS1kZHItcG11IjsKClRoYW5rcyBmb3IgY2xhcmlmeWluZy4KCkJlc3QgcmVn
YXJkcywKQ2zDqW1lbnQKCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
