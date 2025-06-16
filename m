Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA065ADAB41
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 10:57:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7394AC36B17;
	Mon, 16 Jun 2025 08:57:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EA62C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 08:57:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G5bVRv010526;
 Mon, 16 Jun 2025 10:57:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 j9gCtZXn8FCUpQCQz+XhhMFUE2JWeUNDp3ENgTfCvvI=; b=8WpuCS/Cd0CRXgFF
 tc4Z5nD2wMCzQa1jwQBrt/ngnDr7lQW0hvxGU8lW+x7DOH4oavFMAq2LON8YiBwv
 kFx1OgFpFf26d4Ujf4Zj6FMfVQXlfOOtGhytaQL08Ius3hs6rhJpi6IPoxgrAFDt
 UgEHGMQ8EiTDNEMbFL6/Ss/dw7m5HeAcQgtkQkB6QhAVN220aW5m3kEpncplIFzw
 f7SYPa62woJbfRWC8EKv3pIu7zJb43+x7/UxKQoPQcDuQbjvWuE+39eseIDgpnSo
 SPsWHHJoFzytm/YxV1iqWKZwirAef2RmDq6Q6ABhzTI49UV9nVyDY2B/yb+p9rRe
 1LxQKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478x79qk3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 10:57:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA5DE40073;
 Mon, 16 Jun 2025 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 100F95D5B26;
 Mon, 16 Jun 2025 10:54:44 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:54:43 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 10:53:55 +0200
MIME-Version: 1.0
Message-ID: <20250616-i2c-upstream-v1-2-42d3d5374e65@foss.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
In-Reply-To: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/3] i2c: stm32f7: unmap DMA mapped buffer
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

Rml4IGFuIGlzc3VlIHdoZXJlIHRoZSBtYXBwZWQgRE1BIGJ1ZmZlciB3YXMgbm90IHVubWFwcGVk
LgoKRml4ZXM6IDdlY2M4Y2ZkZTU1MyAoImkyYzogaTJjLXN0bTMyZjc6IEFkZCBETUEgc3VwcG9y
dCIpClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bm
b3NzLnN0LmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3
LmMKaW5kZXggOTczYTNhOGM2ZDRhLi5hMDVjYWM1ZWU5ZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3Rt
MzJmNy5jCkBAIC0xNjIyLDYgKzE2MjIsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtMzJmN19p
MmNfaXNyX2V2ZW50X3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQogCQlpZiAoaTJjX2Rldi0+
dXNlX2RtYSkgewogCQkJc3RtMzJmN19pMmNfZGlzYWJsZV9kbWFfcmVxKGkyY19kZXYpOwogCQkJ
ZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYyhkbWEtPmNoYW5fdXNpbmcpOworCQkJZG1hX3VubWFw
X3NpbmdsZShpMmNfZGV2LT5kZXYsIGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAorCQkJCQkg
ZG1hLT5kbWFfZGF0YV9kaXIpOwogCQl9CiAJCWY3X21zZy0+cmVzdWx0ID0gLUVOWElPOwogCX0K
QEAgLTE2NDIsNiArMTY0NCw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmY3X2kyY19pc3Jf
ZXZlbnRfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJCQkJZGV2X2RiZyhpMmNfZGV2LT5k
ZXYsICI8JXM+OiBUaW1lZCBvdXRcbiIsIF9fZnVuY19fKTsKIAkJCQlzdG0zMmY3X2kyY19kaXNh
YmxlX2RtYV9yZXEoaTJjX2Rldik7CiAJCQkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYyhkbWEt
PmNoYW5fdXNpbmcpOworCQkJCWRtYV91bm1hcF9zaW5nbGUoaTJjX2Rldi0+ZGV2LCBkbWEtPmRt
YV9idWYsIGRtYS0+ZG1hX2xlbiwKKwkJCQkJCSBkbWEtPmRtYV9kYXRhX2Rpcik7CiAJCQkJZjdf
bXNnLT5yZXN1bHQgPSAtRVRJTUVET1VUOwogCQkJfQogCQl9CgotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
