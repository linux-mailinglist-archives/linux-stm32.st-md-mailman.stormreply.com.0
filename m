Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5993EAEDE4A
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 15:08:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2859BC32E92;
	Mon, 30 Jun 2025 13:08:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2182C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 13:08:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAxWXM001329;
 Mon, 30 Jun 2025 15:08:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 nzcuf3ALxiZnugdRzIcsnWWDfy0C8Ttz0HVMvwBD/F8=; b=1vzjvOCIUogiQ6hQ
 NLYkokAyh7ZxRBSd0VrOeQTfxEuzxqoDgDzsOLksLlBcXxP0eHr2P5GML6mho29s
 p2ACWhsSgT7UDQKE3nnPv8jh1wlmyJWtMhl9HWRqSkjUZ+UaptO0RSFyurI4eZCa
 l1OEHVBpy6Xsfcsyz8O8S07M+2sDlAW8iwJmnLdH8m9a1kOo8zTsIfqP5JkILBt/
 q3HrQDvamN86Iyj8wnep7MpDtOyLDjTjqU00CetPKKGS07feG7y9tatFBU0lPLAq
 ZulowVvlk0Vt+ucnYgPE7LXtsYaPfxAZpigJ/mTJJA0CG6cM7TaHP6blDSnCTMww
 paklIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tm03v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 15:08:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CD1AE40044;
 Mon, 30 Jun 2025 15:07:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE232B4CA85;
 Mon, 30 Jun 2025 15:06:13 +0200 (CEST)
Received: from [10.252.14.13] (10.252.14.13) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 15:06:12 +0200
Message-ID: <b0ea55b6-32fe-43ca-b815-29888a3eba59@foss.st.com>
Date: Mon, 30 Jun 2025 15:05:52 +0200
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
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 1/3] i2c: stm32: fix the device used
	for the DMA map
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
PiBJZiB0aGUgRE1BIG1hcHBpbmcgZmFpbGVkLCBpdCBwcm9kdWNlZCBhbiBlcnJvciBsb2cgd2l0
aCB0aGUgd3JvbmcKPiBkZXZpY2UgbmFtZToKPiAic3RtMzItZG1hMyA0MDQwMDAwMC5kbWEtY29u
dHJvbGxlcjogcmVqZWN0aW5nIERNQSBtYXAgb2Ygdm1hbGxvYyBtZW1vcnkiCj4gRml4IHRoaXMg
aXNzdWUgYnkgcmVwbGFjaW5nIHRoZSBkZXYgd2l0aCB0aGUgSTJDIGRldi4KPiAKPiBGaXhlczog
YmI4ODIyY2JiYzUzICgiaTJjOiBpMmMtc3RtMzI6IEFkZCBnZW5lcmljIERNQSBBUEkiKQo+IEFj
a2VkLWJ5OiBBbGFpbiBWb2xtYXQgPGFsYWluLnZvbG1hdEBmb3NzLnN0LmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzIuYyB8IDQgKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLXN0bTMyLmMKPiBpbmRleCAxNTdjNjRlMjdkMGIuLjI3MmE1ZGZmYjA4ZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXN0bTMyLmMKPiBAQCAtMTE4LDcgKzExOCw3IEBAIGludCBzdG0zMl9pMmNfcHJl
cF9kbWFfeGZlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzdG0zMl9pMmNfZG1hICpkbWEs
Cj4gIAlkbWEtPmRtYV9sZW4gPSBsZW47Cj4gIAljaGFuX2RldiA9IGRtYS0+Y2hhbl91c2luZy0+
ZGV2aWNlLT5kZXY7Cj4gIAo+IC0JZG1hLT5kbWFfYnVmID0gZG1hX21hcF9zaW5nbGUoY2hhbl9k
ZXYsIGJ1ZiwgZG1hLT5kbWFfbGVuLAo+ICsJZG1hLT5kbWFfYnVmID0gZG1hX21hcF9zaW5nbGUo
ZGV2LCBidWYsIGRtYS0+ZG1hX2xlbiwKPiAgCQkJCSAgICAgIGRtYS0+ZG1hX2RhdGFfZGlyKTsK
PiAgCWlmIChkbWFfbWFwcGluZ19lcnJvcihjaGFuX2RldiwgZG1hLT5kbWFfYnVmKSkgewo+ICAJ
CWRldl9lcnIoZGV2LCAiRE1BIG1hcHBpbmcgZmFpbGVkXG4iKTsKPiBAQCAtMTUwLDcgKzE1MCw3
IEBAIGludCBzdG0zMl9pMmNfcHJlcF9kbWFfeGZlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBzdG0zMl9pMmNfZG1hICpkbWEsCj4gIAlyZXR1cm4gMDsKPiAgCj4gIGVycjoKPiAtCWRtYV91
bm1hcF9zaW5nbGUoY2hhbl9kZXYsIGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAo+ICsJZG1h
X3VubWFwX3NpbmdsZShkZXYsIGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAo+ICAJCQkgZG1h
LT5kbWFfZGF0YV9kaXIpOwo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IAoKVGh4IGZvciB0aGlzIFYz
IHN1Ym1pc3Npb24KClJldmlld2VkLWJ5IDogUGllcnJlLVl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2
ZXMubW9yZHJldEBmb3NzLnN0LmNvbT4KClJlZ2FyZHMKCi0tIAotLQp+IFB5IE1PUkRSRVQKLS0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
