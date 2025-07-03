Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDAAF6B64
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 09:23:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D0E5C35E2E;
	Thu,  3 Jul 2025 07:23:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA395C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 07:23:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5636iKQV002403;
 Thu, 3 Jul 2025 09:23:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 npzxxQg3AAleq0Lybv60/mXXydV8H5IHVXqUHauWTxs=; b=Uj1QAxdPfx6LqXSh
 1+ryb8pe7ooyPtWVa7Z+iCLzfHWV92go8qbzCrCafplRgwUiZqCVBFK4pH5+Ifvt
 u+62KttT2B0xFNxEoDnMRW5bhqezQaYJLLxHsBP9XCO+2GH4wThfQuNe5TWfGuf2
 zI0aC3ls5dNIr+S9RCNLGu4S8EJSiuP1rz4LmSSyApYqyewv66QrhQTRPzFbUeU7
 I4s96SUsp8XocexpRUPm2ur2TZ2AKAS6gthIggspdBJPwPIlRFLbPJjv8ZgAvzXl
 zb0NCzKvoUKnbVibDymFj+qbXxUNatvAV1wU5wzXOeH5un+Fyi5bH2Q0/8dCS5DY
 Lm0dJA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r6e53n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jul 2025 09:23:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CFA24002D;
 Thu,  3 Jul 2025 09:21:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABD54AF01A6;
 Thu,  3 Jul 2025 09:20:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 09:20:26 +0200
Message-ID: <44f4f1a4-0225-4fda-b17b-f3159e00851d@foss.st.com>
Date: Thu, 3 Jul 2025 09:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andi Shyti <andi.shyti@kernel.org>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
 <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves
 MORDRET <pierre-yves.mordret@st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQW5keSwKCk9uIDcvMi8yNSAxODo1NywgQW5kaSBTaHl0aSB3cm90ZToKPiBIaSBDbGVtZW50
LAo+IAo+IC4uLgo+IAo+PiBAQCAtMTE4LDcgKzExOCw3IEBAIGludCBzdG0zMl9pMmNfcHJlcF9k
bWFfeGZlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzdG0zMl9pMmNfZG1hICpkbWEsCj4+
ICAgCWRtYS0+ZG1hX2xlbiA9IGxlbjsKPj4gICAJY2hhbl9kZXYgPSBkbWEtPmNoYW5fdXNpbmct
PmRldmljZS0+ZGV2Owo+PiAgIAo+PiAtCWRtYS0+ZG1hX2J1ZiA9IGRtYV9tYXBfc2luZ2xlKGNo
YW5fZGV2LCBidWYsIGRtYS0+ZG1hX2xlbiwKPj4gKwlkbWEtPmRtYV9idWYgPSBkbWFfbWFwX3Np
bmdsZShkZXYsIGJ1ZiwgZG1hLT5kbWFfbGVuLAo+PiAgIAkJCQkgICAgICBkbWEtPmRtYV9kYXRh
X2Rpcik7Cj4+ICAgCWlmIChkbWFfbWFwcGluZ19lcnJvcihjaGFuX2RldiwgZG1hLT5kbWFfYnVm
KSkgewo+IAkJCSAgICAgIF5eXl5eXl5eCj4gCj4gdGhpcyBvbmUgc2hvdWxkIGJlICJkZXYiIHRv
bywgd2hpY2ggcmVuZGVycyB0aGUgY2hhbl9kZXYgdmFyaWFibGUKPiB1bnVzZWQuCgpPaCB5ZXMg
d2lsbCBzZW5kIGEgdjQKCkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
