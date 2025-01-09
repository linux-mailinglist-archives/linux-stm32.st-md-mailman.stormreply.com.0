Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F180A07D8D
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 17:31:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EC02C78011;
	Thu,  9 Jan 2025 16:31:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44D0BC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 16:31:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509ERp9A001039;
 Thu, 9 Jan 2025 17:31:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tOCIMbi4zzKnCjTJpT+vOfF34I4MpmzXJcdcVQ+i7co=; b=G1UBMas6V61HEaGk
 JVOy7evlrOf6GWE5Dq8Ui6lMA+VTOcngVpsNPFctJQbfbfqINfr4tQwd3/ahfIOL
 hL+7NxMoYH9JjknuGvVka8hjb1StFrGf5f5THQ9pIBMteUMk8q1KvWIljYQmdPu9
 Z6a9ng+3yX3DDW3AbM0J3J+lZfrWYVjkVhidHkdfHNJrB8Sqqpl0UNcBkUPKy8qG
 2EUYq1KR0/kJxT8WqWs2EjSicv1+ZeyU355xsNP2hevm4Bwbca4Y+UKnVlA8Fgko
 CMrsiRumyHCGUpuQTUmGmVlKlfX2+9g7qB7jq0SwI/8xH2bafTM1bH6MnfpkKtZ5
 9MUN5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4424hpbusr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 17:31:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5FFC340047;
 Thu,  9 Jan 2025 17:30:12 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55061248764;
 Thu,  9 Jan 2025 17:29:10 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 9 Jan
 2025 17:29:10 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 9 Jan
 2025 17:29:09 +0100
Message-ID: <47dd8588-5c51-44f4-8f9f-e984ae24d57b@foss.st.com>
Date: Thu, 9 Jan 2025 17:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lee Jones <lee@kernel.org>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
 <20241218090153.742869-3-fabrice.gasnier@foss.st.com>
 <20250109104956.GD6763@google.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250109104956.GD6763@google.com>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/9] mfd: stm32-timers: add support for
	stm32mp25
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

T24gMS85LzI1IDExOjQ5LCBMZWUgSm9uZXMgd3JvdGU6Cj4gT24gV2VkLCAxOCBEZWMgMjAyNCwg
RmFicmljZSBHYXNuaWVyIHdyb3RlOgo+IAo+PiBBZGQgc3VwcG9ydCBmb3IgU1RNMzJNUDI1IFNv
Qy4gVXNlIG5ld2x5IGludHJvZHVjZWQgY29tcGF0aWJsZSwgdG8gaGFuZGxlCj4+IG5ldyBmZWF0
dXJlcy4KPj4gSWRlbnRpZmljYXRpb24gYW5kIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gcmVnaXN0
ZXJzIGFsbG93IHRvIHJlYWQgdGhlCj4+IHRpbWVyIHZlcnNpb24gYW5kIGNhcGFiaWxpdGllcyAo
Y291bnRlciB3aWR0aCwgbnVtYmVyIG9mIGNoYW5uZWxzLi4uKS4KPj4gU28sIHJld29yayB0aGUg
cHJvYmUgdG8gYXZvaWQgdG91Y2hpbmcgQVJSIHJlZ2lzdGVyIGJ5IHNpbXBseSByZWFkIHRoZQo+
PiBjb3VudGVyIHdpZHRoIHdoZW4gYXZhaWxhYmxlLiBUaGlzIG1heSBhdm9pZCBtZXNzaW5nIHdp
dGggYSBwb3NzaWJseQo+PiBydW5uaW5nIHRpbWVyLgo+PiBBbHNvIGFkZCB1c2VmdWwgYml0IGZp
ZWxkcyB0byBzdG0zMi10aW1lcnMgaGVhZGVyIGZpbGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZh
YnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gIGRy
aXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KPj4gIGluY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oIHwgIDkgKysr
KysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jIGIvZHJpdmVy
cy9tZmQvc3RtMzItdGltZXJzLmMKPj4gaW5kZXggNjUwNzI0ZTE5Yjg4Li42ZjIxN2MzMjQ4MmMg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jCj4+ICsrKyBiL2RyaXZl
cnMvbWZkL3N0bTMyLXRpbWVycy5jCj4+IEBAIC05LDYgKzksNyBAQAo+PiAgI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4+ICAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcHJvcGVy
dHkuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgo+PiAgCj4+ICAjZGVmaW5lIFNUTTMy
X1RJTUVSU19NQVhfUkVHSVNURVJTCTB4M2ZjCj4+IEBAIC0xNzMsNiArMTc0LDMyIEBAIHN0YXRp
YyB2b2lkIHN0bTMyX3RpbWVyc19nZXRfYXJyX3NpemUoc3RydWN0IHN0bTMyX3RpbWVycyAqZGRh
dGEpCj4+ICAJcmVnbWFwX3dyaXRlKGRkYXRhLT5yZWdtYXAsIFRJTV9BUlIsIGFycik7Cj4+ICB9
Cj4+ICAKPj4gK3N0YXRpYyBpbnQgc3RtMzJfdGltZXJzX3Byb2JlX2h3Y2ZncihzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBzdG0zMl90aW1lcnMgKmRkYXRhKQo+PiArewo+PiArCXUzMiB2YWw7
Cj4+ICsKPj4gKwlkZGF0YS0+aXBpZHIgPSAodWludHB0cl90KWRldmljZV9nZXRfbWF0Y2hfZGF0
YShkZXYpOwo+IAo+IEFyZSB5b3Ugc3VyZSB0aGlzIGNhc3QgaXMgbmVlZGVkPwoKSGkgTGVlLAoK
WWVzLCBJIGNhbiBzZWUgYSB3YXJuaW5nIHBvcHMtdXAgd2l0aG91dCBpdDoKCmRyaXZlcnMvbWZk
L3N0bTMyLXRpbWVycy5jOjE4MToyMjogd2FybmluZzogYXNzaWdubWVudCB0byDigJh1MzLigJkg
e2FrYQrigJh1bnNpZ25lZCBpbnTigJl9IGZyb20g4oCYY29uc3Qgdm9pZCAq4oCZIG1ha2VzIGlu
dGVnZXIgZnJvbSBwb2ludGVyIHdpdGhvdXQgYQpjYXN0IFstV2ludC1jb252ZXJzaW9uXQogIDE4
MSB8ICAgICAgICAgZGRhdGEtPmlwaWRyID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7CiAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgXgoKCj4gCj4+ICsJaWYgKCFkZGF0YS0+aXBpZHIp
IHsKPj4gKwkJLyogZmFsbGJhY2sgdG8gbGVnYWN5IG1ldGhvZCBmb3IgcHJvYmluZyBjb3VudGVy
IHdpZHRoICovCj4gCj4gU2VudGVuY2VzIHN0YXJ0IHdpdGggdXBwZXJjYXNlIGNoYXJzLgoKQWNr
Cgo+IAo+PiArCQlzdG0zMl90aW1lcnNfZ2V0X2Fycl9zaXplKGRkYXRhKTsKPj4gKwkJcmV0dXJu
IDA7Cj4+ICsJfQo+PiArCj4+ICsJcmVnbWFwX3JlYWQoZGRhdGEtPnJlZ21hcCwgVElNX0lQSURS
LCAmdmFsKTsKPj4gKwkvKiBTYW5pdHkgY2hlY2sgb24gSVAgaWRlbnRpZmljYXRpb24gcmVnaXN0
ZXIgKi8KPiAKPiBUaGlzIHNlZW1zIG9idmlvdXMsIHRodXMgc3VwZXJmbHVvdXMuCgpBY2sKCj4g
Cj4+ICsJaWYgKHZhbCAhPSBkZGF0YS0+aXBpZHIpIHsKPj4gKwkJZGV2X2VycihkZXYsICJVbmV4
cGVjdGVkIGlkZW50aWZpY2F0aW9uOiAldVxuIiwgdmFsKTsKPiAKPiAiVW5leHBlY3RlZCBtb2Rl
bCBudW1iZXIiPwo+ICJVbnN1cHBvcnRlZCBkZXZpY2UgZGV0ZWN0ZWQiPwoKQWNrCgo+IAo+PiAr
CQlyZXR1cm4gLUVJTlZBTDsKPj4gKwl9Cj4+ICsKPj4gKwlyZWdtYXBfcmVhZChkZGF0YS0+cmVn
bWFwLCBUSU1fSFdDRkdSMiwgJnZhbCk7Cj4gCj4gJy9uJyBoZXJlLgoKQWNrCgo+IAo+PiArCS8q
IENvdW50ZXIgd2lkdGggaW4gYml0cywgbWF4IHJlbG9hZCB2YWx1ZSBpcyBCSVQod2lkdGgpIC0g
MSAqLwo+PiArCWRkYXRhLT5tYXhfYXJyID0gQklUKEZJRUxEX0dFVChUSU1fSFdDRkdSMl9DTlRf
V0lEVEgsIHZhbCkpIC0gMTsKPj4gKwlkZXZfZGJnKGRldiwgIlRJTSB3aWR0aDogJWxkXG4iLCBG
SUVMRF9HRVQoVElNX0hXQ0ZHUjJfQ05UX1dJRFRILCB2YWwpKTsKPiAKPiBIb3cgdXNlZnVsIGlz
IHRoaXMgbm93IHRoZSBkcml2ZXIgaGFzIGJlZW4gZGV2ZWxvcGVkPwoKV2VsbC4uLiB0aGF0J3Mg
anVzdCBkZWJ1Zy4gSSdsbCByZW1vdmUgaXQgYW5kIHNlbmQgYSBWMy4KClRoYW5rcyBmb3IgcmV2
aWV3aW5nLApCUiwKRmFicmljZQoKPiAKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiAgc3Rh
dGljIGludCBzdG0zMl90aW1lcnNfZG1hX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gIAkJ
CQkgICBzdHJ1Y3Qgc3RtMzJfdGltZXJzICpkZGF0YSkKPj4gIHsKPj4gQEAgLTI4NSw3ICszMTIs
OSBAQCBzdGF0aWMgaW50IHN0bTMyX3RpbWVyc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+PiAgCWlmIChJU19FUlIoZGRhdGEtPmNsaykpCj4+ICAJCXJldHVybiBQVFJfRVJS
KGRkYXRhLT5jbGspOwo+PiAgCj4+IC0Jc3RtMzJfdGltZXJzX2dldF9hcnJfc2l6ZShkZGF0YSk7
Cj4+ICsJcmV0ID0gc3RtMzJfdGltZXJzX3Byb2JlX2h3Y2ZncihkZXYsIGRkYXRhKTsKPj4gKwlp
ZiAocmV0KQo+PiArCQlyZXR1cm4gcmV0Owo+PiAgCj4+ICAJcmV0ID0gc3RtMzJfdGltZXJzX2ly
cV9wcm9iZShwZGV2LCBkZGF0YSk7Cj4+ICAJaWYgKHJldCkKPj4gQEAgLTMyMCw2ICszNDksNyBA
QCBzdGF0aWMgdm9pZCBzdG0zMl90aW1lcnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4+ICAKPj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bTMyX3Rp
bWVyc19vZl9tYXRjaFtdID0gewo+PiAgCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzItdGltZXJz
IiwgfSwKPj4gKwl7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS10aW1lcnMiLCAuZGF0YSA9
ICh2b2lkICopU1RNMzJNUDI1X1RJTV9JUElEUiB9LAo+PiAgCXsgLyogZW5kIG5vZGUgKi8gfSwK
Pj4gIH07Cj4+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG0zMl90aW1lcnNfb2ZfbWF0Y2gp
Owo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmggYi9pbmNs
dWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaAo+PiBpbmRleCBmMDliYTU5OGM5N2EuLjIzYjBj
YWU0YTlmOCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmgK
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmgKPj4gQEAgLTMzLDYgKzMz
LDkgQEAKPj4gICNkZWZpbmUgVElNX0RDUgkJMHg0OAkJCS8qIERNQSBjb250cm9sIHJlZ2lzdGVy
CQkJKi8KPj4gICNkZWZpbmUgVElNX0RNQVIJMHg0QwkJCS8qIERNQSByZWdpc3RlciBmb3IgdHJh
bnNmZXIJCSovCj4+ICAjZGVmaW5lIFRJTV9USVNFTAkweDY4CQkJLyogSW5wdXQgU2VsZWN0aW9u
CQkJKi8KPj4gKyNkZWZpbmUgVElNX0hXQ0ZHUjIJMHgzRUMJCQkvKiBoYXJkd2FyZSBjb25maWd1
cmF0aW9uIDIgUmVnIChNUDI1KQkqLwo+PiArI2RlZmluZSBUSU1fSFdDRkdSMQkweDNGMAkJCS8q
IGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gMSBSZWcgKE1QMjUpCSovCj4+ICsjZGVmaW5lIFRJTV9J
UElEUgkweDNGOAkJCS8qIElQIGlkZW50aWZpY2F0aW9uIFJlZyAoTVAyNSkJCSovCj4+ICAKPj4g
ICNkZWZpbmUgVElNX0NSMV9DRU4JCUJJVCgwKQkJCQkJLyogQ291bnRlciBFbmFibGUJCQkJKi8K
Pj4gICNkZWZpbmUgVElNX0NSMV9ESVIJCUJJVCg0KQkJCQkJLyogQ291bnRlciBEaXJlY3Rpb24J
CQkJKi8KPj4gQEAgLTEwMCw2ICsxMDMsOSBAQAo+PiAgI2RlZmluZSBUSU1fQkRUUl9CS0YoeCkJ
CSgweGYgPDwgKDE2ICsgKHgpICogNCkpCj4+ICAjZGVmaW5lIFRJTV9EQ1JfREJBCQlHRU5NQVNL
KDQsIDApCQkJCS8qIERNQSBiYXNlIGFkZHIJCQkJKi8KPj4gICNkZWZpbmUgVElNX0RDUl9EQkwJ
CUdFTk1BU0soMTIsIDgpCQkJCS8qIERNQSBidXJzdCBsZW4JCQkJKi8KPj4gKyNkZWZpbmUgVElN
X0hXQ0ZHUjFfTkJfT0ZfQ0MJR0VOTUFTSygzLCAwKQkJCQkvKiBDYXB0dXJlL2NvbXBhcmUgY2hh
bm5lbHMJCQkqLwo+PiArI2RlZmluZSBUSU1fSFdDRkdSMV9OQl9PRl9EVAlHRU5NQVNLKDcsIDQp
CQkJCS8qIENvbXBsZW1lbnRhcnkgb3V0cHV0cyAmIGRlYWQtdGltZSBnZW5lcmF0b3JzICovCj4+
ICsjZGVmaW5lIFRJTV9IV0NGR1IyX0NOVF9XSURUSAlHRU5NQVNLKDE1LCA4KQkJCQkvKiBDb3Vu
dGVyIHdpZHRoCQkJCSovCj4+ICAKPj4gICNkZWZpbmUgTUFYX1RJTV9QU0MJCQkJMHhGRkZGCj4+
ICAjZGVmaW5lIE1BWF9USU1fSUNQU0MJCQkJMHgzCj4+IEBAIC0xMTMsNiArMTE5LDggQEAKPj4g
ICNkZWZpbmUgVElNX0JEVFJfQktGX01BU0sJCQkweEYKPj4gICNkZWZpbmUgVElNX0JEVFJfQktG
X1NISUZUKHgpCQkJKDE2ICsgKHgpICogNCkKPj4gIAo+PiArI2RlZmluZSBTVE0zMk1QMjVfVElN
X0lQSURSCTB4MDAxMjAwMDIKPj4gKwo+PiAgZW51bSBzdG0zMl90aW1lcnNfZG1hcyB7Cj4+ICAJ
U1RNMzJfVElNRVJTX0RNQV9DSDEsCj4+ICAJU1RNMzJfVElNRVJTX0RNQV9DSDIsCj4+IEBAIC0x
NTEsNiArMTU5LDcgQEAgc3RydWN0IHN0bTMyX3RpbWVyc19kbWEgewo+PiAgCj4+ICBzdHJ1Y3Qg
c3RtMzJfdGltZXJzIHsKPj4gIAlzdHJ1Y3QgY2xrICpjbGs7Cj4+ICsJdTMyIGlwaWRyOwo+PiAg
CXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4gIAl1MzIgbWF4X2FycjsKPj4gIAlzdHJ1Y3Qgc3Rt
MzJfdGltZXJzX2RtYSBkbWE7IC8qIE9ubHkgdG8gYmUgdXNlZCBieSB0aGUgcGFyZW50ICovCj4+
IC0tIAo+PiAyLjI1LjEKPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
