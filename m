Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BA4AEDE53
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 15:09:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43EA7C32E92;
	Mon, 30 Jun 2025 13:09:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2CB3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 13:09:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAxWXY001329;
 Mon, 30 Jun 2025 15:09:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +gPiTecoRPlnJ7Fm5WOws1ntoipek0S7ruHePGX3IMk=; b=UaJlchgAJfu5jbwv
 xXTiLCcPL8RYmS8Jgjxawh24Elz5ge9gN2ap04aErAnLM9OfMtvwOjbHxktjizaJ
 1ed/Y5EGLxsfF5OWihCiDgkpBrxyZf0wIBokFNu64lqvLep52pXLlG8A3Iv6OyDX
 7SgL/J46RE4hNbsh3maton4NGSSKjQ7tf77CZRgSq/vzW9BTFOurv91W/8P8yURM
 R2QLztwEjYAWz7pNjDls+HN3fwNFVcsYpVYXYkWddSkzrVklhYRTPGZj+pNzHWpu
 dml5KaZkaaGw9dvwDMDhxxU2KX/Xv46AI6NILcr31U4PELoqigVf6LQwyI2zLx7V
 tksNJA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tm0402-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 15:09:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CFD5F4004C;
 Mon, 30 Jun 2025 15:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8DFAB4A79D;
 Mon, 30 Jun 2025 15:06:56 +0200 (CEST)
Received: from [10.252.14.13] (10.252.14.13) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 15:06:55 +0200
Message-ID: <117094db-1b6d-4284-917a-ac69cfaa4d96@foss.st.com>
Date: Mon, 30 Jun 2025 15:06:54 +0200
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
 <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 2/3] i2c: stm32f7: unmap DMA mapped
	buffer
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

SGkgQ2xlbWVudCwKCgpPbiA2LzMwLzI1IDE0OjU1LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6
Cj4gRml4IGFuIGlzc3VlIHdoZXJlIHRoZSBtYXBwZWQgRE1BIGJ1ZmZlciB3YXMgbm90IHVubWFw
cGVkLgo+IAo+IEZpeGVzOiA3ZWNjOGNmZGU1NTMgKCJpMmM6IGkyYy1zdG0zMmY3OiBBZGQgRE1B
IHN1cHBvcnQiKQo+IEFja2VkLWJ5OiBBbGFpbiBWb2xtYXQgPGFsYWluLnZvbG1hdEBmb3NzLnN0
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2Zm
aWNAZm9zcy5zdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5j
IHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyBiL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtc3RtMzJmNy5jCj4gaW5kZXggZTRhYWViMjI2MmQwLi4wNDIzODZiNGNhYmUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMKPiArKysgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYwo+IEBAIC0xNTU0LDYgKzE1NTQsOCBAQCBzdGF0
aWMgaXJxcmV0dXJuX3Qgc3RtMzJmN19pMmNfaGFuZGxlX2lzcl9lcnJzKHN0cnVjdCBzdG0zMmY3
X2kyY19kZXYgKmkyY19kZXYsCj4gIAlpZiAoaTJjX2Rldi0+dXNlX2RtYSkgewo+ICAJCXN0bTMy
ZjdfaTJjX2Rpc2FibGVfZG1hX3JlcShpMmNfZGV2KTsKPiAgCQlkbWFlbmdpbmVfdGVybWluYXRl
X2FzeW5jKGRtYS0+Y2hhbl91c2luZyk7Cj4gKwkJZG1hX3VubWFwX3NpbmdsZShpMmNfZGV2LT5k
ZXYsIGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAo+ICsJCQkJIGRtYS0+ZG1hX2RhdGFfZGly
KTsKPiAgCX0KPiAgCj4gIAlpMmNfZGV2LT5tYXN0ZXJfbW9kZSA9IGZhbHNlOwo+IEBAIC0xNjIy
LDYgKzE2MjQsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtMzJmN19pMmNfaXNyX2V2ZW50X3Ro
cmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICAJCWlmIChpMmNfZGV2LT51c2VfZG1hKSB7Cj4g
IAkJCXN0bTMyZjdfaTJjX2Rpc2FibGVfZG1hX3JlcShpMmNfZGV2KTsKPiAgCQkJZG1hZW5naW5l
X3Rlcm1pbmF0ZV9hc3luYyhkbWEtPmNoYW5fdXNpbmcpOwo+ICsJCQlkbWFfdW5tYXBfc2luZ2xl
KGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sCj4gKwkJCQkJIGRtYS0+
ZG1hX2RhdGFfZGlyKTsKPiAgCQl9Cj4gIAkJZjdfbXNnLT5yZXN1bHQgPSAtRU5YSU87Cj4gIAl9
Cj4gQEAgLTE2NDIsNiArMTY0Niw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmY3X2kyY19p
c3JfZXZlbnRfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gIAkJCQlkZXZfZGJnKGkyY19k
ZXYtPmRldiwgIjwlcz46IFRpbWVkIG91dFxuIiwgX19mdW5jX18pOwo+ICAJCQkJc3RtMzJmN19p
MmNfZGlzYWJsZV9kbWFfcmVxKGkyY19kZXYpOwo+ICAJCQkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9h
c3luYyhkbWEtPmNoYW5fdXNpbmcpOwo+ICsJCQkJZG1hX3VubWFwX3NpbmdsZShpMmNfZGV2LT5k
ZXYsIGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAo+ICsJCQkJCQkgZG1hLT5kbWFfZGF0YV9k
aXIpOwo+ICAJCQkJZjdfbXNnLT5yZXN1bHQgPSAtRVRJTUVET1VUOwo+ICAJCQl9Cj4gIAkJfQo+
IAoKVGh4IGZvciB0aGlzIFYzIHN1Ym1pc3Npb24KClJldmlld2VkLWJ5OiBQaWVycmUtWXZlcyBN
T1JEUkVUIDxwaWVycmUteXZlcy5tb3JkcmV0QGZvc3Muc3QuY29tPgoKUmVnYXJkcwoKLS0gCi0t
Cn4gUHkgTU9SRFJFVAotLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
