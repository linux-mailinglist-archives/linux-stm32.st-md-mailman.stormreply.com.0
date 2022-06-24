Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B468559586
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jun 2022 10:36:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD311C5E2C6;
	Fri, 24 Jun 2022 08:36:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D4A7C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 08:36:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O6twuq000432;
 Fri, 24 Jun 2022 10:36:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8fQm8E77C1pvJFmaRO2kAvyGJP62SBe0Dvnvyrnj/Ek=;
 b=Veana9ExE1sAq7ntWiP1GkTpgD8EDh8KFLZoirbAIJVT5DEIGAJm/r7LLdvSHP3Ou7rI
 RmOBb2uN5wp83dDtKSjxH3prgommMnoJeKdnqvye5eFrFaYTcM3uyHEtpHYoFN7p9RsG
 uAF7LneqB9a6Iewo51QeBumnKHNfb9Yg83pqY+CdiKmViMoc/4kdPRbpMacSAX2O10PH
 F+4UFbDfKiVeirHyfdpb1PFbOBggrp/vflrHUcHKx61rSaZUK8mtWCG7FMcZCzM6GzFe
 Ke4W6lgdh8schSkQI0rz4JhdwExW3qO1d65E9osbmT0sGXay1XMu/Gos6itNiQ0znfCD 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gu9vd53x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 10:36:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7EB510002A;
 Fri, 24 Jun 2022 10:35:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC2F9212FA3;
 Fri, 24 Jun 2022 10:35:58 +0200 (CEST)
Received: from [10.201.20.168] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 24 Jun
 2022 10:35:58 +0200
Message-ID: <952b1ffb-5589-60ac-6ea9-6076cb13d433@foss.st.com>
Date: Fri, 24 Jun 2022 10:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20220504130233.330983-1-valentin.caron@foss.st.com>
 <20220504130617.331290-1-valentin.caron@foss.st.com>
 <YnLhw+Y7m8G2xJpK@mail.local>
 <ceb2d1a3-dccd-865e-ed74-54444e49f349@foss.st.com>
In-Reply-To: <ceb2d1a3-dccd-865e-ed74-54444e49f349@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_05,2022-06-23_01,2022-06-22_01
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: rtc: stm32: add alarm A
 out property to select output
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

SGkgQWxleGFuZHJlLAoKTWF5IEkgaGF2ZSB5b3VyIHZpZXcgcmVnYXJkaW5nIHRoZXNlIG5ldyBl
bGVtZW50cyA/CgpUaGFuayB5b3UsClZhbGVudGluCgpPbiA1LzIzLzIyIDE0OjM0LCBWYWxlbnRp
biBDQVJPTiB3cm90ZToKPiBIaSBBbGV4YW5kcmUsCj4KPiBPbiA1LzQvMjIgMjI6MjcsIEFsZXhh
bmRyZSBCZWxsb25pIHdyb3RlOgo+PiBIZWxsbywKPj4KPj4gT24gMDQvMDUvMjAyMiAxNTowNjox
MyswMjAwLCBWYWxlbnRpbiBDYXJvbiB3cm90ZToKPj4+IFNUTTMyIFJUQyBjYW4gcHVsc2Ugc29t
ZSBTT0MgcGlucyB3aGVuIGFuIGFsYXJtIG9mIFJUQyBleHBpcmVzLgo+Pj4KPj4+IFRoaXMgcGF0
Y2ggYWRkcyBwcm9wZXJ0eSB0byBhY3RpdmF0ZSBhbGFybSBBIG91dHB1dC4gVGhlIHB1bHNlIGNh
bgo+Pj4gb3V0cHV0IG9uIHRocmVlIHBpbnMgUlRDX09VVDEsIFJUQ19PVVQyLCBSVENfT1VUMl9S
TVAKPj4+IChQQzEzLCBQQjIsIFBJOCBvbiBzdG0zMm1wMTUpIChQQzEzLCBQQjIsIFBJMSBvbiBz
dG0zMm1wMTMpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFZhbGVudGluIENhcm9uIDx2YWxlbnRp
bi5jYXJvbkBmb3NzLnN0LmNvbT4KPj4+IC0tLQo+Pj4gwqAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvcnRjL3N0LHN0bTMyLXJ0Yy55YW1sIHwgMTkgCj4+PiArKysrKysrKysrKysrKysrKystCj4+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3N0
LHN0bTMyLXJ0Yy55YW1sIAo+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cnRjL3N0LHN0bTMyLXJ0Yy55YW1sCj4+PiBpbmRleCA1NmQ0NmVhMzVjNWQuLjcxZTAyNjA0ZThk
ZSAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMv
c3Qsc3RtMzItcnRjLnlhbWwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ydGMvc3Qsc3RtMzItcnRjLnlhbWwKPj4+IEBAIC01OSw2ICs1OSwxMyBAQCBwcm9wZXJ0
aWVzOgo+Pj4gwqDCoMKgwqDCoMKgwqAgUmVmZXIgdG8gPGluY2x1ZGUvZHQtYmluZGluZ3MvcnRj
L3J0Yy1zdG0zMi5oPiBmb3IgdGhlIAo+Pj4gc3VwcG9ydGVkIHZhbHVlcy4KPj4+IMKgwqDCoMKg
wqDCoMKgIFBpbmN0cmwgc3RhdGUgbmFtZWQgImRlZmF1bHQiIG1heSBiZSBkZWZpbmVkIHRvIHJl
c2VydmUgcGluIAo+Pj4gZm9yIFJUQyBvdXRwdXQuCj4+PiDCoCArwqAgc3QsYWxhcm06Cj4+PiAr
wqDCoMKgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIiCj4+
PiArwqDCoMKgIGRlc2NyaXB0aW9uOiB8Cj4+PiArwqDCoMKgwqDCoCBUbyBzZWxlY3QgYW5kIGVu
YWJsZSBSVEMgQWxhcm0gQSBvdXRwdXQuCj4+PiArwqDCoMKgwqDCoCBSZWZlciB0byA8aW5jbHVk
ZS9kdC1iaW5kaW5ncy9ydGMvcnRjLXN0bTMyLmg+IGZvciB0aGUgCj4+PiBzdXBwb3J0ZWQgdmFs
dWVzLgo+Pj4gK8KgwqDCoMKgwqAgUGluY3RybCBzdGF0ZSBuYW1lZCAiZGVmYXVsdCIgbWF5IGJl
IGRlZmluZWQgdG8gcmVzZXJ2ZSBwaW4gCj4+PiBmb3IgUlRDIG91dHB1dC4KPj4+ICsKPj4+IMKg
IGFsbE9mOgo+Pj4gwqDCoMKgIC0gaWY6Cj4+PiDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+
Pj4gQEAgLTc1LDYgKzgyLDkgQEAgYWxsT2Y6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3QsbHNj
bzoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWF4SXRlbXM6IDAKPj4+IMKgICvCoMKgwqDC
oMKgwqDCoCBzdCxhbGFybToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgbWF4SXRlbXM6IDAKPj4+
ICsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lczogZmFsc2UKPj4+IMKgIMKgwqDC
oMKgwqDCoMKgIHJlcXVpcmVkOgo+Pj4gQEAgLTk1LDYgKzEwNSw5IEBAIGFsbE9mOgo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHN0LGxzY286Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1heEl0
ZW1zOiAwCj4+PiDCoCArwqDCoMKgwqDCoMKgwqAgc3QsYWxhcm06Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgIG1heEl0ZW1zOiAwCj4+PiArCj4+PiDCoMKgwqDCoMKgwqDCoCByZXF1aXJlZDoKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNsb2NrLW5hbWVzCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBzdCxzeXNjZmcKPj4+IEBAIC0xMTcsNiArMTMwLDkgQEAgYWxsT2Y6Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgc3QsbHNjbzoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWF4SXRlbXM6IDEK
Pj4+IMKgICvCoMKgwqDCoMKgwqDCoCBzdCxhbGFybToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAg
bWF4SXRlbXM6IDEKPj4+ICsKPj4+IMKgwqDCoMKgwqDCoMKgIHJlcXVpcmVkOgo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIC0gY2xvY2stbmFtZXMKPj4+IMKgIEBAIC0xNTMsOCArMTY5LDkgQEAgZXhh
bXBsZXM6Cj4+PiDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JnJjYyBSVENBUEI+LCA8JnJjYyBS
VEM+Owo+Pj4gwqDCoMKgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAicGNsayIsICJydGNfY2siOwo+
Pj4gwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMgSVJRX1RZUEVfTEVWRUxf
SElHSD47Cj4+PiArwqDCoMKgwqDCoCBzdCxhbGFybSA9IDxSVENfT1VUMT47Cj4+PiDCoMKgwqDC
oMKgwqDCoCBzdCxsc2NvID0gPFJUQ19PVVQyX1JNUD47Cj4+IFNob3VsZG4ndCB0aGF0IGJlIGV4
YWN0bHkgdGhlIG9wcG9zaXRlPyBZb3UgaGF2ZSB0d28gcGlucyB0aGF0IGNhbgo+PiBvdXRwdXQg
ZGlmZmVyZW50IGZ1bmN0aW9ucy4gVGhlIHByb3BlcnR5IHNob3VsZCBiZSB0aGUgcGluIGFuZCB0
aGUgdmFsdWUKPj4gdGhlIGZ1bmN0aW9uLiBJJ2QgZ28gZXZlbiBmdXJ0aGVyIGFuZCBJIHdvdWxk
IHNheSB0aGlzIGlzIGFjdHVhbGx5Cj4+IHBpbm11eGluZy4KPj4KPiBZb3UncmUgcmlnaHQsIGlm
IHRoZSBwcm9wZXJ0eSBpcyB0aGUgcGluIGFuZCB0aGUgdmFsdWUgdGhlIGZ1bmN0aW9uLCAKPiB0
aGlzIGxvb2tzIGxpa2UgYSBwaW5jdHJsIG5vZGUuCj4gV2UgY2hvb3NlIHRvIGRldmVsb3AgdGhl
c2VzIGZ1bmN0aW9uYWxpdGllcyBpbiB0aGUgcmV2ZXJzZSBvcmRlciwgdG8gCj4gYXZvaWQgdGhl
IGNvbXBsZXhpdHkgb2YgYWRkaW5nCj4gdGhlIHBpbmN0cmwgZnJhbWV3b3JrIHRvIG91ciBkcml2
ZXIuIE1vcmVvdmVyLCBMU0NPIGFuZCBBbGFybUEgbWF5IAo+IGhhdmVuJ3QgYSBwZXJpcGhlcmFs
IGNsaWVudCBhbmQKPiB0aGlzIHdvdWxkIHByb2JhYmx5IHJlcXVpcmUgdG8gYWxzbyBpbXBsZW1l
bnQgcGluY3RybCBob2dnaW5nLgo+Cj4gSXMgdGhlIGltcGxlbWVudGF0aW9uIHRoYXQgd2UgaGF2
ZSBwcm9wb3NlZCBpcyBhY2NlcHRhYmxlIHJlZ2FyZGluZyAKPiB0aGVzZXMgZWxlbWVudHMgPwo+
Cj4gVGhhbmsgeW91LAo+IFZhbGVudGluCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
