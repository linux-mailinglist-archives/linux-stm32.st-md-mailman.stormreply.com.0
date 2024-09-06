Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F296F46D
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 14:41:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24FBEC7801A;
	Fri,  6 Sep 2024 12:41:23 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 258E4C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 12:41:22 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486CFkcU026449;
 Fri, 6 Sep 2024 14:41:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 9glpbHtTCF0WQ+AaJaOaFsxFPEJjjJaHTg3W5Y5Bp00=; b=omyyWlJPa9o0uo1+
 rGeatWEl+pXoj9ycdqbKTyoJ5oVf3TLtXnOjURW0cMLACakQIjCLgjMxQp4qZn4B
 dx7fnQOEWISQU83czPa171rTK2sJKe+WdAg0AicIX3xYMn9dXJz2n1XUdE7LYmzq
 G2qHETv5uZHny/UtT9bonPS8z91mxZHHKpG+Wm+ml5PxSzs8oO9Qcp+B0pTKd5A3
 wIX2KYjEOxCOI0ydZl62/KogksqzIQ9fmBYhjKwo2LcZDXL7rhaQ6lJ4UohD1joe
 Th+DaDN8iATMIQJNE/6if74J7lQL81w9jVCReburdimKUsprxW7kD/2/64FA2wtR
 lbCU4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41fhwquf07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 14:41:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A01C440044;
 Fri,  6 Sep 2024 14:40:25 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC087267F26;
 Fri,  6 Sep 2024 14:40:02 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 6 Sep
 2024 14:40:02 +0200
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 6 Sep
 2024 14:40:02 +0200
Message-ID: <07ad0918-c1bf-4ae2-8091-33e75aac4778@foss.st.com>
Date: Fri, 6 Sep 2024 14:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-pwm@vger.kernel.org>
References: <20240905090627.197536-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20240905090627.197536-2-u.kleine-koenig@baylibre.com>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_02,2024-09-05_01,2024-09-02_01
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Use the right CCxNP bit in
	stm32_pwm_enable()
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

CgpPbiA5LzUvMjQgMTE6MDYsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFRoZSBwd20gZGV2
aWNlcyBmb3IgYSBwd21fY2hpcCBhcmUgbnVtYmVyZWQgc3RhcnRpbmcgYXQgMCwgdGhlIGZpcnN0
IGh3Cj4gY2hhbm5lbCBob3dldmVyIGhhcyB0aGUgbnVtYmVyIDEuIFdoaWxlIGludHJvZHVjaW5n
IGEgcGFyYW1ldHJpc2VkIG1hY3JvCj4gdG8gc2ltcGxpZnkgcmVnaXN0ZXIgYml0IHVzYWdlIGFu
ZCBtYWtpbmcgdGhhdCBvZmZzZXQgZXhwbGljaXQsIG9uZSBvZgo+IHRoZSB1c2FnZXMgd2FzIGNv
bnZlcnRlZCB3cm9uZ2x5LiBUaGlzIGlzIGZpeGVkIGhlcmUuCj4gCj4gRml4ZXM6IDdjZWEwNWFl
MWQ0ZSAoInB3bS1zdG0zMjogTWFrZSB1c2Ugb2YgcGFyYW1ldHJpc2VkIHJlZ2lzdGVyIGRlZmlu
aXRpb25zIikKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQGJheWxpYnJlLmNvbT4KPiAtLS0KPiBIZWxsbywKPiAKPiBkdXJpbmcgcmV2aWV3IG9mIGEg
cGF0Y2ggdG8gdGhlIHN0bTMyIHB3bSBkcml2ZXIgRmFicmljZSBwb2ludGVkIG91dCBhCj4gd3Jv
bmcgdXNhZ2Ugb2YgVElNX0NDRVJfQ0N4TkUuIFdoaWxlIChJIHRoaW5rKSB3ZSBib3RoIGFzc3Vt
ZWQgdGhpcyB3YXMKPiBhIHByb2JsZW0gaW4gc2FpZCBwYXRjaCwgdGhhdCBwcm9ibGVtIGV4aXN0
ZWQgYWxyZWFkeSBiZWZvcmUgYW5kIHRoZQo+IHByb3Bvc2VkIGNoYW5nZSBqdXN0IG1vdmVkIHRo
ZSBwcm9ibGVtIGFyb3VuZC4gU28gaW5zdGVhZCBvZiAob25seSkKPiB1cGRhdGluZyB0aGUgcGF0
Y2ggbGF0ZXIsIGhlcmUgY29tZXMgYSBzZXBhcmF0ZSBmaXggZm9yIHRoZSBkcml2ZXIuCj4gCj4g
SSBpbnRlbmQgdG8gc2VuZCB0aGlzIHRvIExpbnVzIHRvbW9ycm93IHRvIGdldCBpdCBpbnRvIDYu
MTEtcmM3LgoKSGkgVVdlLAoKR29vZCBjYXRjaCwgSSBoYXZlbid0IG5vdGljZWQgdGhpcyBoYXMg
YmVlbiBpbnRyb2R1Y2VkIGluIGVhcmxpZXIgcGF0Y2guCgpZb3UgY2FuIGFkZCBteToKUmV2aWV3
ZWQtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgoKRG9l
cyBpdCBuZWVkIHRvIGJlIENDJ2VkIHRvIHN0YWJsZSBsaXN0IGFsc28gPwoKVGhhbmtzLApCUiwK
RmFicmljZQoKPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKPiAgZHJpdmVycy9wd20vcHdtLXN0
bTMyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMv
cHdtL3B3bS1zdG0zMi5jCj4gaW5kZXggZmQ3NTRhOTljZjJlLi5mODVlYjQxY2IwODQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL3B3bS9wd20t
c3RtMzIuYwo+IEBAIC00MTIsNyArNDEyLDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fZW5hYmxl
KHN0cnVjdCBzdG0zMl9wd20gKnByaXYsIHVuc2lnbmVkIGludCBjaCkKPiAgCS8qIEVuYWJsZSBj
aGFubmVsICovCj4gIAltYXNrID0gVElNX0NDRVJfQ0N4RShjaCArIDEpOwo+ICAJaWYgKHByaXYt
PmhhdmVfY29tcGxlbWVudGFyeV9vdXRwdXQpCj4gLQkJbWFzayB8PSBUSU1fQ0NFUl9DQ3hORShj
aCk7Cj4gKwkJbWFzayB8PSBUSU1fQ0NFUl9DQ3hORShjaCArIDEpOwo+ICAKPiAgCXJlZ21hcF9z
ZXRfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DQ0VSLCBtYXNrKTsKPiAgCj4gYmFzZS1jb21taXQ6
IDg0MDAyOTFlMjg5ZWU2YjJiZjk3NzlmZjFjODNhMjkxNTAxZjAxN2IKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
