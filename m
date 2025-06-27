Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8146AEB407
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 12:15:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C44AC30883;
	Fri, 27 Jun 2025 10:15:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6F58C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 10:15:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R9RL6N000707;
 Fri, 27 Jun 2025 12:15:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Zdo1eCOF4VOtCudJbd1E6new56U7OZpmLHyb1jyPiLQ=; b=EInUqIPChS2tXgag
 fN1JsGh7PmOZsYCv5wDkuBgNh+fF93d3i9XC9uV0Hh8jD4eVPtYoMaFIrTI47oaw
 J5SxUg/LgzH0PLSn9lnuTDzJDN0lQ7Q16TdEItZ0OjAO5bnUiq7i5cGNKOF8cs55
 0bOHLDKNiDaNQbBQXEkX386Fnx/IZlbEIVaH6UUd8w0KEoU+/TPGVdrEsVUsYXv0
 TqtH7hoCIDwESXbQOoeYKSCHJwX6kapve7paMIZLtob/OHzaIJfMJIOhS4TA4iHn
 0TWRn9fIgblDsyKWdFOaP2PhA3EIGdvaerWnNCD3s8jCmR2dIp/S/oq80ntUbrco
 ViL2kA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33uktv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 12:15:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E8E840051;
 Fri, 27 Jun 2025 12:13:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE244B423A2;
 Fri, 27 Jun 2025 12:12:58 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:12:58 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 27 Jun 2025 12:12:57 +0200
MIME-Version: 1.0
Message-ID: <20250627-i2c-upstream-v2-2-8c14523481dc@foss.st.com>
References: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
In-Reply-To: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: b4 0.15-dev-07fe9
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/3] i2c: stm32f7: unmap DMA mapped buffer
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
b3NzLnN0LmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyB8IDYgKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMy
ZjcuYwppbmRleCBlNGFhZWIyMjYyZDAuLjA0MjM4NmI0Y2FiZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1z
dG0zMmY3LmMKQEAgLTE1NTQsNiArMTU1NCw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmY3
X2kyY19oYW5kbGVfaXNyX2VycnMoc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldiwKIAlp
ZiAoaTJjX2Rldi0+dXNlX2RtYSkgewogCQlzdG0zMmY3X2kyY19kaXNhYmxlX2RtYV9yZXEoaTJj
X2Rldik7CiAJCWRtYWVuZ2luZV90ZXJtaW5hdGVfYXN5bmMoZG1hLT5jaGFuX3VzaW5nKTsKKwkJ
ZG1hX3VubWFwX3NpbmdsZShpMmNfZGV2LT5kZXYsIGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVu
LAorCQkJCSBkbWEtPmRtYV9kYXRhX2Rpcik7CiAJfQogCiAJaTJjX2Rldi0+bWFzdGVyX21vZGUg
PSBmYWxzZTsKQEAgLTE2MjIsNiArMTYyNCw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmY3
X2kyY19pc3JfZXZlbnRfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJCWlmIChpMmNfZGV2
LT51c2VfZG1hKSB7CiAJCQlzdG0zMmY3X2kyY19kaXNhYmxlX2RtYV9yZXEoaTJjX2Rldik7CiAJ
CQlkbWFlbmdpbmVfdGVybWluYXRlX2FzeW5jKGRtYS0+Y2hhbl91c2luZyk7CisJCQlkbWFfdW5t
YXBfc2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sCisJCQkJ
CSBkbWEtPmRtYV9kYXRhX2Rpcik7CiAJCX0KIAkJZjdfbXNnLT5yZXN1bHQgPSAtRU5YSU87CiAJ
fQpAQCAtMTY0Miw2ICsxNjQ2LDggQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyZjdfaTJjX2lz
cl9ldmVudF90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJCQlkZXZfZGJnKGkyY19kZXYt
PmRldiwgIjwlcz46IFRpbWVkIG91dFxuIiwgX19mdW5jX18pOwogCQkJCXN0bTMyZjdfaTJjX2Rp
c2FibGVfZG1hX3JlcShpMmNfZGV2KTsKIAkJCQlkbWFlbmdpbmVfdGVybWluYXRlX2FzeW5jKGRt
YS0+Y2hhbl91c2luZyk7CisJCQkJZG1hX3VubWFwX3NpbmdsZShpMmNfZGV2LT5kZXYsIGRtYS0+
ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAorCQkJCQkJIGRtYS0+ZG1hX2RhdGFfZGlyKTsKIAkJCQlm
N19tc2ctPnJlc3VsdCA9IC1FVElNRURPVVQ7CiAJCQl9CiAJCX0KCi0tIAoyLjQzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
