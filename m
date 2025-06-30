Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D7BAEDE57
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 15:09:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54930C32E92;
	Mon, 30 Jun 2025 13:09:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E75EC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 13:09:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UBlus3021366;
 Mon, 30 Jun 2025 15:09:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 s6SnTj7TQmM6IV7OH8vHiU8wCQ741Ir076aqyio17M0=; b=pBg5XVT8Yg+YHR19
 hSMKT4IhjJyppJ/mHjK699QA1oMWSFbCESVoG39WjiLB4ou3GCGBkQ0ICIUT33BH
 BDDNh622ioVsXNwqrH+no+HJDTdyoHoMxVDSQ+PUcyYg66tIkzTLpP4yjoB8kcwX
 MWjj+SATjcY0SCtMAqZAsMHRJG5mSlW5G302JRVljZ5EkPfyEWcSJXlk9XeYYni2
 9U62A0DtoY9YYSKILLetlmYf7g4uD2d2Rad9VzI1FsxmwVb6LTW/dS+eCESicZ+d
 F0xix/SV8A5wQ5+Uu5WHBYhLYRNVJFZW1KljFhcCxVJZXaPUZ/QJcr0kvzqUAx+B
 dYiAhA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r5yt8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 15:09:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DBE5A4004B;
 Mon, 30 Jun 2025 15:08:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48160B4CBCE;
 Mon, 30 Jun 2025 15:07:22 +0200 (CEST)
Received: from [10.252.14.13] (10.252.14.13) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 15:07:21 +0200
Message-ID: <74981e35-1d0f-4649-bb10-2b54e4db5e47@foss.st.com>
Date: Mon, 30 Jun 2025 15:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, "Alain
 Volmat" <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
X-Originating-IP: [10.252.14.13]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] i2c: stm32f7: support
	i2c_*_dma_safe_msg_buf APIs
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

SGkgQ2xlbWVudCwKCk9uIDYvMzAvMjUgMTQ6NTUsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToK
PiBVc2UgdGhlIGkyYy1jb3JlLWJhc2UgQVBJcyB0byBhbGxvY2F0ZSBhIERNQSBzYWZlIGJ1ZmZl
ciB3aGVuIG5lZWRlZC4KPiAKPiBBY2tlZC1ieTogQWxhaW4gVm9sbWF0IDxhbGFpbi52b2xtYXRA
Zm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50
LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0
bTMyZjcuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1zdG0zMmY3LmMKPiBpbmRleCAwNDIzODZiNGNhYmUuLmQwNmYwZWZkZWNlMyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYwo+ICsrKyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCj4gQEAgLTc0Miw5ICs3NDIsMTIgQEAgc3RhdGlj
IHZvaWQgc3RtMzJmN19pMmNfZG1hX2NhbGxiYWNrKHZvaWQgKmFyZykKPiAgCXN0cnVjdCBzdG0z
MmY3X2kyY19kZXYgKmkyY19kZXYgPSAoc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqKWFyZzsKPiAg
CXN0cnVjdCBzdG0zMl9pMmNfZG1hICpkbWEgPSBpMmNfZGV2LT5kbWE7Cj4gIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSBkbWEtPmNoYW5fdXNpbmctPmRldmljZS0+ZGV2Owo+ICsJc3RydWN0IHN0bTMy
ZjdfaTJjX21zZyAqZjdfbXNnID0gJmkyY19kZXYtPmY3X21zZzsKPiAgCj4gIAlzdG0zMmY3X2ky
Y19kaXNhYmxlX2RtYV9yZXEoaTJjX2Rldik7Cj4gIAlkbWFfdW5tYXBfc2luZ2xlKGRldiwgZG1h
LT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sIGRtYS0+ZG1hX2RhdGFfZGlyKTsKPiArCWlmICghZjdf
bXNnLT5zbWJ1cykKPiArCQlpMmNfcHV0X2RtYV9zYWZlX21zZ19idWYoZjdfbXNnLT5idWYsIGky
Y19kZXYtPm1zZywgdHJ1ZSk7Cj4gIAljb21wbGV0ZSgmZG1hLT5kbWFfY29tcGxldGUpOwo+ICB9
Cj4gIAo+IEBAIC04ODAsNiArODgzLDcgQEAgc3RhdGljIHZvaWQgc3RtMzJmN19pMmNfeGZlcl9t
c2coc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldiwKPiAgewo+ICAJc3RydWN0IHN0bTMy
ZjdfaTJjX21zZyAqZjdfbXNnID0gJmkyY19kZXYtPmY3X21zZzsKPiAgCXZvaWQgX19pb21lbSAq
YmFzZSA9IGkyY19kZXYtPmJhc2U7Cj4gKwl1OCAqZG1hX2J1ZjsKPiAgCXUzMiBjcjEsIGNyMjsK
PiAgCWludCByZXQ7Cj4gIAo+IEBAIC05MjksMTcgKzkzMywyMyBAQCBzdGF0aWMgdm9pZCBzdG0z
MmY3X2kyY194ZmVyX21zZyhzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICppMmNfZGV2LAo+ICAKPiAg
CS8qIENvbmZpZ3VyZSBETUEgb3IgZW5hYmxlIFJYL1RYIGludGVycnVwdCAqLwo+ICAJaTJjX2Rl
di0+dXNlX2RtYSA9IGZhbHNlOwo+IC0JaWYgKGkyY19kZXYtPmRtYSAmJiBmN19tc2ctPmNvdW50
ID49IFNUTTMyRjdfSTJDX0RNQV9MRU5fTUlOCj4gLQkgICAgJiYgIWkyY19kZXYtPmF0b21pYykg
ewo+IC0JCXJldCA9IHN0bTMyX2kyY19wcmVwX2RtYV94ZmVyKGkyY19kZXYtPmRldiwgaTJjX2Rl
di0+ZG1hLAo+IC0JCQkJCSAgICAgIG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCwKPiAtCQkJCQkgICAg
ICBmN19tc2ctPmNvdW50LCBmN19tc2ctPmJ1ZiwKPiAtCQkJCQkgICAgICBzdG0zMmY3X2kyY19k
bWFfY2FsbGJhY2ssCj4gLQkJCQkJICAgICAgaTJjX2Rldik7Cj4gLQkJaWYgKCFyZXQpCj4gLQkJ
CWkyY19kZXYtPnVzZV9kbWEgPSB0cnVlOwo+IC0JCWVsc2UKPiAtCQkJZGV2X3dhcm4oaTJjX2Rl
di0+ZGV2LCAiY2FuJ3QgdXNlIERNQVxuIik7Cj4gKwlpZiAoaTJjX2Rldi0+ZG1hICYmICFpMmNf
ZGV2LT5hdG9taWMpIHsKPiArCQlkbWFfYnVmID0gaTJjX2dldF9kbWFfc2FmZV9tc2dfYnVmKG1z
ZywgU1RNMzJGN19JMkNfRE1BX0xFTl9NSU4pOwo+ICsJCWlmIChkbWFfYnVmKSB7Cj4gKwkJCWY3
X21zZy0+YnVmID0gZG1hX2J1ZjsKPiArCQkJcmV0ID0gc3RtMzJfaTJjX3ByZXBfZG1hX3hmZXIo
aTJjX2Rldi0+ZGV2LCBpMmNfZGV2LT5kbWEsCj4gKwkJCQkJCSAgICAgIG1zZy0+ZmxhZ3MgJiBJ
MkNfTV9SRCwKPiArCQkJCQkJICAgICAgZjdfbXNnLT5jb3VudCwgZjdfbXNnLT5idWYsCj4gKwkJ
CQkJCSAgICAgIHN0bTMyZjdfaTJjX2RtYV9jYWxsYmFjaywKPiArCQkJCQkJICAgICAgaTJjX2Rl
dik7Cj4gKwkJCWlmIChyZXQpIHsKPiArCQkJCWRldl93YXJuKGkyY19kZXYtPmRldiwgImNhbid0
IHVzZSBETUFcbiIpOwo+ICsJCQkJaTJjX3B1dF9kbWFfc2FmZV9tc2dfYnVmKGY3X21zZy0+YnVm
LCBtc2csIGZhbHNlKTsKPiArCQkJCWY3X21zZy0+YnVmID0gbXNnLT5idWY7Cj4gKwkJCX0gZWxz
ZSB7Cj4gKwkJCQlpMmNfZGV2LT51c2VfZG1hID0gdHJ1ZTsKPiArCQkJfQo+ICsJCX0KPiAgCX0K
PiAgCj4gIAlpZiAoIWkyY19kZXYtPnVzZV9kbWEpIHsKPiBAQCAtMTYyNiw2ICsxNjM2LDggQEAg
c3RhdGljIGlycXJldHVybl90IHN0bTMyZjdfaTJjX2lzcl9ldmVudF90aHJlYWQoaW50IGlycSwg
dm9pZCAqZGF0YSkKPiAgCQkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYyhkbWEtPmNoYW5fdXNp
bmcpOwo+ICAJCQlkbWFfdW5tYXBfc2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBk
bWEtPmRtYV9sZW4sCj4gIAkJCQkJIGRtYS0+ZG1hX2RhdGFfZGlyKTsKPiArCQkJaWYgKCFmN19t
c2ctPnNtYnVzKQo+ICsJCQkJaTJjX3B1dF9kbWFfc2FmZV9tc2dfYnVmKGY3X21zZy0+YnVmLCBp
MmNfZGV2LT5tc2csIGZhbHNlKTsKPiAgCQl9Cj4gIAkJZjdfbXNnLT5yZXN1bHQgPSAtRU5YSU87
Cj4gIAl9Cj4gQEAgLTE2NDgsNiArMTY2MCw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmY3
X2kyY19pc3JfZXZlbnRfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gIAkJCQlkbWFlbmdp
bmVfdGVybWluYXRlX2FzeW5jKGRtYS0+Y2hhbl91c2luZyk7Cj4gIAkJCQlkbWFfdW5tYXBfc2lu
Z2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sCj4gIAkJCQkJCSBk
bWEtPmRtYV9kYXRhX2Rpcik7Cj4gKwkJCQlpZiAoIWY3X21zZy0+c21idXMpCj4gKwkJCQkJaTJj
X3B1dF9kbWFfc2FmZV9tc2dfYnVmKGY3X21zZy0+YnVmLCBpMmNfZGV2LT5tc2csIGZhbHNlKTsK
PiAgCQkJCWY3X21zZy0+cmVzdWx0ID0gLUVUSU1FRE9VVDsKPiAgCQkJfQo+ICAJCX0KPiAKClRo
eCBmb3IgdGhpcyBWMyBzdWJtaXNzaW9uCgpSZXZpZXdlZC1ieTogUGllcnJlLVl2ZXMgTU9SRFJF
VCA8cGllcnJlLXl2ZXMubW9yZHJldEBmb3NzLnN0LmNvbT4KClJlZ2FyZHMKCi0tIAotLQp+IFB5
IE1PUkRSRVQKLS0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
