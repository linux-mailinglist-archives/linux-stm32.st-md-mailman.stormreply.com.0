Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF20A5FD0D
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 18:07:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF8A9C78F86;
	Thu, 13 Mar 2025 17:07:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D923DC78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 17:07:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DGD84J004017;
 Thu, 13 Mar 2025 18:07:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 m/R+k38EavnnLqI4ME3aQthwcfO1+fuRzyD+GV3fSk4=; b=2+g7dDtPyxMq1Shu
 QHC7J6eyC/YvBdFdAZwurWUHHOA6LbrJL32RrgKtq6u5ob9qxTvRk5bJnUVgh8Bh
 fuL7OIC6gBf4neJDK0XG6x0vLfIzJOPucsEIuA+AefRNN1/Tuc5P5s+cnZ1BhBtI
 q5WeCk4l+oVW8Gj7CMC2somyp35Ih/UhvZkznVvVOmoxkw/vAKm4LW+OWDwHN8pC
 WLkSntmDkbrr9nk82zbtKDLviuYVMp2hghusryDe1xQFlabxomansar33G0yJIzX
 HwdVxqOZpfB1NNjLgHBkwR/1Z3jQkjXWn0WqW4/vjeQYpH+q7pcfT+BUaXVFZ9sD
 5eitpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45c2pf07ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 18:07:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9EAC94002D;
 Thu, 13 Mar 2025 18:05:58 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1DE757D4E3;
 Thu, 13 Mar 2025 18:04:27 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 18:04:27 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 18:04:26 +0100
Message-ID: <c0aec002-7889-4ec5-a438-e7e90d8da13f@foss.st.com>
Date: Thu, 13 Mar 2025 18:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lezcano <daniel.lezcano@linaro.org>, <lee@kernel.org>,
 <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <jic23@kernel.org>, <tglx@linutronix.de>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-5-fabrice.gasnier@foss.st.com>
 <83283a94-6833-4d7d-8d89-6ba42b43b96c@linaro.org>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <83283a94-6833-4d7d-8d89-6ba42b43b96c@linaro.org>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-11_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/8] clocksource: stm32-lptimer: add
 support for stm32mp25
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

T24gMy83LzI1IDE2OjEyLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiAwNS8wMy8yMDI1IDEw
OjQ5LCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4+IE9uIHN0bTMybXAyNSwgRElFUiAoZm9ybWVy
IElFUikgbXVzdCBvbmx5IGJlIG1vZGlmaWVkIHdoZW4gdGhlIGxwdGltZXIKPj4gaXMgZW5hYmxl
ZC4gT24gZWFybGllciBTb0NzLCBpdCBtdXN0IGJlIG9ubHkgYmUgbW9kaWZpZWQgd2hlbiBpdCBp
cwo+PiBkaXNhYmxlZC4gUmVhZCB0aGUgTFBUSU1fVkVSUiByZWdpc3RlciB0byBwcm9wZXJseSBt
YW5hZ2UgdGhlIGVuYWJsZQo+PiBzdGF0ZSwgYmVmb3JlIGFjY2Vzc2luZyBJRVIuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZv
c3Muc3QuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiBWMjoKPj4gLSByZWx5IG9uIGZhbGxiYWNr
IGNvbXBhdGlibGUgYXMgbm8gc3BlY2lmaWMgLmRhdGEgaXMgYXNzb2NpYXRlZCB0byB0aGUKPj4g
wqDCoCBkcml2ZXIuIFVzZSB2ZXJzaW9uIGRhdGEgZnJvbSBNRkQgY29yZS4KPj4gLSBBZGRlZCBp
bnRlcnJ1cHQgZW5hYmxlIHJlZ2lzdGVyIGFjY2VzcyB1cGRhdGUgaW4gKG1pc3NlZCBpbiBWMSkK
Pj4gLS0tCj4+IMKgIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYyB8IDI2ICsr
KysrKysrKysrKysrKysrKysrKystLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3Nv
dXJjZS90aW1lci1zdG0zMi1scC5jCj4+IGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdG0z
Mi1scC5jCj4+IGluZGV4IGE0Yzk1MTYxY2IyMi4uOTZkOTc1YWRmN2E0IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMKPj4gKysrIGIvZHJpdmVycy9j
bG9ja3NvdXJjZS90aW1lci1zdG0zMi1scC5jCj4+IEBAIC0yNSw2ICsyNSw3IEBAIHN0cnVjdCBz
dG0zMl9scF9wcml2YXRlIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgY2xvY2tfZXZlbnRfZGV2aWNl
IGNsa2V2dDsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBlcmlvZDsKPj4gwqDCoMKgwqDC
oCBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4+ICvCoMKgwqAgYm9vbCBpZXJfd3JfZW5hYmxlZDvCoMKg
wqAgLyogRW5hYmxlcyBMUFRJTUVSIGJlZm9yZSB3cml0aW5nIGludG8KPj4gSUVSIHJlZ2lzdGVy
ICovCj4+IMKgIH07Cj4+IMKgIMKgIHN0YXRpYyBzdHJ1Y3Qgc3RtMzJfbHBfcHJpdmF0ZSoKPj4g
QEAgLTM3LDggKzM4LDE1IEBAIHN0YXRpYyBpbnQgc3RtMzJfY2xrZXZlbnRfbHBfc2h1dGRvd24o
c3RydWN0Cj4+IGNsb2NrX2V2ZW50X2RldmljZSAqY2xrZXZ0KQo+PiDCoCB7Cj4+IMKgwqDCoMKg
wqAgc3RydWN0IHN0bTMyX2xwX3ByaXZhdGUgKnByaXYgPSB0b19wcml2KGNsa2V2dCk7Cj4+IMKg
IC3CoMKgwqAgcmVnbWFwX3dyaXRlKHByaXYtPnJlZywgU1RNMzJfTFBUSU1fQ1IsIDApOwo+PiAr
wqDCoMKgIC8qIERpc2FibGUgTFBUSU1FUiBlaXRoZXIgYmVmb3JlIG9yIGFmdGVyIHdyaXRpbmcg
SUVSIHJlZ2lzdGVyCj4+IChlbHNlLCBrZWVwIGl0IGVuYWJsZWQpICovCj4+ICvCoMKgwqAgaWYg
KCFwcml2LT5pZXJfd3JfZW5hYmxlZCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ21hcF93cml0ZShw
cml2LT5yZWcsIFNUTTMyX0xQVElNX0NSLCAwKTsKPj4gKwo+PiDCoMKgwqDCoMKgIHJlZ21hcF93
cml0ZShwcml2LT5yZWcsIFNUTTMyX0xQVElNX0lFUiwgMCk7Cj4+ICsKPiAKPiBXaHkgbm90IGVu
Y2Fwc3VsYXRlIHRoZSBmdW5jdGlvbiA/Cj4gCj4gwqDCoMKgwqByZWdtYXBfd3JpdGVfaWVyKHN0
cnVjdCBzdG0zMl9scF9wcml2YXRlICpwcml2LCBpbnQgdmFsdWUpCj4gwqDCoMKgwqB7Cj4gCj4g
wqDCoMKgwqDCoMKgwqAgLyogQSBjb21tZW50IC4uLiAqLwo+IMKgwqDCoMKgwqDCoMKgIGlmICgh
cHJpdi0+aWVyX3dyX2VuYWJsZWQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWdtYXBfd3Jp
dGUocHJpdi0+cmVnLCBTVE0zMl9MUFRJTV9DUiwgMCk7Cj4gCj4gwqDCoMKgwqDCoMKgwqAgcmVn
bWFwX3dyaXRlKHByaXYtPnJlZywgU1RNMzJfTFBUSU1fSUVSLCB2YWx1ZSk7Cj4gCj4gwqDCoMKg
wqDCoMKgwqAgaWYgKCFwcml2LT5pZXJfd3JfZW5hYmxlZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJlZ21hcF93cml0ZShwcml2LT5yZWcsIFNUTTMyX0xQVElNX0NSLCBTVE0zMl9MUFRJTV9F
TkFCTEUpOwo+IMKgwqDCoMKgfQoKSGkgRGFuaWVsLAoKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rp
b24uCgpJJ3ZlIHRyaWVkIHZhcmlvdXMgZmFjdG9yaXphdGlvbiBidXQgY2FuJ3QgcmVhbGx5IGZp
bmQgc29tZXRoaW5nIHByZXR0eQphbmQgZWFzeSB0byByZWFkLgoKSSB0aGluayBJJ2xsIHJhdGhl
ciBpbXBsZW1lbnQgc29tZSBkZWRpY2F0ZWQgb3BzIGluIFY0LCBmb3Igc3RtMzJtcDI1LApiYXNl
ZCBvbiBjb21wYXRpYmxlIGRhdGEuClRoaXMgd291bGQgYWxsb3cgc3RyYWlnaHQgZm9yd2FyZCBz
ZXF1ZW5jZSwgd2l0aG91dCBkYW5nbGluZyB3aXRoIGVuYWJsZQpiaXQgLyBmbGFncy4gSSBhbHNv
IG5lZWQgdG8gYWRkIHNvbWUgY2hlY2tzIG9uIG5ldyBzdGF0dXMgZmxhZ3MuIFNvIHRoaXMKd2ls
bCBhdm9pZCB0byBhZGQgY29tcGxleGl0eSBvbiBleGlzdGluZyByb3V0aW5lcy4KCkJlc3QgUmVn
YXJkcywKRmFicmljZQoKPiAKPiAKPj4gK8KgwqDCoCBpZiAocHJpdi0+aWVyX3dyX2VuYWJsZWQp
Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWdtYXBfd3JpdGUocHJpdi0+cmVnLCBTVE0zMl9MUFRJTV9D
UiwgMCk7Cj4+ICsKPiAKPj4gwqDCoMKgwqDCoCAvKiBjbGVhciBwZW5kaW5nIGZsYWdzICovCj4+
IMKgwqDCoMKgwqAgcmVnbWFwX3dyaXRlKHByaXYtPnJlZywgU1RNMzJfTFBUSU1fSUNSLCBTVE0z
Ml9MUFRJTV9BUlJNQ0YpOwo+PiDCoCBAQCAtNTEsMTIgKzU5LDIxIEBAIHN0YXRpYyBpbnQgc3Rt
MzJfY2xrZXZlbnRfbHBfc2V0X3RpbWVyKHVuc2lnbmVkCj4+IGxvbmcgZXZ0LAo+PiDCoCB7Cj4+
IMKgwqDCoMKgwqAgc3RydWN0IHN0bTMyX2xwX3ByaXZhdGUgKnByaXYgPSB0b19wcml2KGNsa2V2
dCk7Cj4+IMKgIC3CoMKgwqAgLyogZGlzYWJsZSBMUFRJTUVSIHRvIGJlIGFibGUgdG8gd3JpdGUg
aW50byBJRVIgcmVnaXN0ZXIqLwo+PiAtwqDCoMKgIHJlZ21hcF93cml0ZShwcml2LT5yZWcsIFNU
TTMyX0xQVElNX0NSLCAwKTsKPj4gK8KgwqDCoCBpZiAoIXByaXYtPmllcl93cl9lbmFibGVkKSB7
Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBEaXNhYmxlIExQVElNRVIgdG8gYmUgYWJsZSB0byB3cml0
ZSBpbnRvIElFUiByZWdpc3RlciAqLwo+PiArwqDCoMKgwqDCoMKgwqAgcmVnbWFwX3dyaXRlKHBy
aXYtPnJlZywgU1RNMzJfTFBUSU1fQ1IsIDApOwo+PiArwqDCoMKgIH0gZWxzZSB7Cj4+ICvCoMKg
wqDCoMKgwqDCoCAvKiBFbmFibGUgTFBUSU1FUiB0byBiZSBhYmxlIHRvIHdyaXRlIGludG8gSUVS
IHJlZ2lzdGVyICovCj4+ICvCoMKgwqDCoMKgwqDCoCByZWdtYXBfd3JpdGUocHJpdi0+cmVnLCBT
VE0zMl9MUFRJTV9DUiwgU1RNMzJfTFBUSU1fRU5BQkxFKTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4g
wqDCoMKgwqDCoCAvKiBlbmFibGUgQVJSIGludGVycnVwdCAqLwo+PiDCoMKgwqDCoMKgIHJlZ21h
cF93cml0ZShwcml2LT5yZWcsIFNUTTMyX0xQVElNX0lFUiwgU1RNMzJfTFBUSU1fQVJSTUlFKTsK
Pj4gKwo+PiDCoMKgwqDCoMKgIC8qIGVuYWJsZSBMUFRJTUVSIHRvIGJlIGFibGUgdG8gd3JpdGUg
aW50byBBUlIgcmVnaXN0ZXIgKi8KPj4gLcKgwqDCoCByZWdtYXBfd3JpdGUocHJpdi0+cmVnLCBT
VE0zMl9MUFRJTV9DUiwgU1RNMzJfTFBUSU1fRU5BQkxFKTsKPj4gK8KgwqDCoCBpZiAoIXByaXYt
Pmllcl93cl9lbmFibGVkKQo+PiArwqDCoMKgwqDCoMKgwqAgcmVnbWFwX3dyaXRlKHByaXYtPnJl
ZywgU1RNMzJfTFBUSU1fQ1IsIFNUTTMyX0xQVElNX0VOQUJMRSk7Cj4+ICsKPj4gwqDCoMKgwqDC
oCAvKiBzZXQgbmV4dCBldmVudCBjb3VudGVyICovCj4+IMKgwqDCoMKgwqAgcmVnbWFwX3dyaXRl
KHByaXYtPnJlZywgU1RNMzJfTFBUSU1fQVJSLCBldnQpOwo+PiDCoCBAQCAtMTUxLDYgKzE2OCw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfY2xrZXZlbnRfbHBfcHJvYmUoc3RydWN0Cj4+IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+PiDC
oCDCoMKgwqDCoMKgIHByaXYtPnJlZyA9IGRkYXRhLT5yZWdtYXA7Cj4+ICvCoMKgwqAgcHJpdi0+
aWVyX3dyX2VuYWJsZWQgPSBkZGF0YS0+dmVyc2lvbiA9PSBTVE0zMl9MUFRJTV9WRVJSXzIzOwo+
PiDCoMKgwqDCoMKgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShkZGF0YS0+Y2xrKTsKPj4gwqDC
oMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4g
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
