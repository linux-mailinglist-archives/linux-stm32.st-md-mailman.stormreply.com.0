Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E055DAEB408
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 12:15:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16F57C3089F;
	Fri, 27 Jun 2025 10:15:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 309CEC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 10:15:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R9gRbv028837;
 Fri, 27 Jun 2025 12:15:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 /3ZCpaipyqCYqd5OdQJrn1XFbXzyjjO0XsPjRFisX/Q=; b=iWBJVfHUFS05Bd0L
 JBdGIGZd1WpeIupqcmXfyHuMwuOcVCvfSqLCLpKvw6TN5H1QNme2XjJ6Q+fSVnm9
 ZVsX5a5N+t4YzzIY9BWair+D/4KeiQS12/GO50JTY7eVXiN5OJeNA5/S2DjzkEMW
 n2mg9TERgajczR7Q2M0TO05RVFz6aHoV6ntCFIWlFrcphvEqaNtZyswvkzmAp0C3
 ycSdFbzjcjesjIQw7KuT7bFhdZD/ie6K7yKNm1KrMkB+Se5wdIk0AGswSHKZ7R+J
 1opgWgGVFpEZiH06Ye+7PiHbVnFw4vk05ug3k8E7/CdZBWCMgWe9zxC5yxBvrE9D
 AdOcwQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33uktw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 12:15:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DE5540050;
 Fri, 27 Jun 2025 12:13:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30FFFB6569B;
 Fri, 27 Jun 2025 12:12:58 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:12:57 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 27 Jun 2025 12:12:56 +0200
MIME-Version: 1.0
Message-ID: <20250627-i2c-upstream-v2-1-8c14523481dc@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 1/3] i2c: stm32: fix the device used for
	the DMA map
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

SWYgdGhlIERNQSBtYXBwaW5nIGZhaWxlZCwgaXQgcHJvZHVjZWQgYW4gZXJyb3IgbG9nIHdpdGgg
dGhlIHdyb25nCmRldmljZSBuYW1lOgoic3RtMzItZG1hMyA0MDQwMDAwMC5kbWEtY29udHJvbGxl
cjogcmVqZWN0aW5nIERNQSBtYXAgb2Ygdm1hbGxvYyBtZW1vcnkiCkZpeCB0aGlzIGlzc3VlIGJ5
IHJlcGxhY2luZyB0aGUgZGV2IHdpdGggdGhlIEkyQyBkZXYuCgpGaXhlczogYmI4ODIyY2JiYzUz
ICgiaTJjOiBpMmMtc3RtMzI6IEFkZCBnZW5lcmljIERNQSBBUEkiKQpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtc3RtMzIuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzIuYwppbmRleCAx
NTdjNjRlMjdkMGIuLjI3MmE1ZGZmYjA4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1zdG0zMi5jCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzIuYwpAQCAtMTE4
LDcgKzExOCw3IEBAIGludCBzdG0zMl9pMmNfcHJlcF9kbWFfeGZlcihzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBzdG0zMl9pMmNfZG1hICpkbWEsCiAJZG1hLT5kbWFfbGVuID0gbGVuOwogCWNo
YW5fZGV2ID0gZG1hLT5jaGFuX3VzaW5nLT5kZXZpY2UtPmRldjsKIAotCWRtYS0+ZG1hX2J1ZiA9
IGRtYV9tYXBfc2luZ2xlKGNoYW5fZGV2LCBidWYsIGRtYS0+ZG1hX2xlbiwKKwlkbWEtPmRtYV9i
dWYgPSBkbWFfbWFwX3NpbmdsZShkZXYsIGJ1ZiwgZG1hLT5kbWFfbGVuLAogCQkJCSAgICAgIGRt
YS0+ZG1hX2RhdGFfZGlyKTsKIAlpZiAoZG1hX21hcHBpbmdfZXJyb3IoY2hhbl9kZXYsIGRtYS0+
ZG1hX2J1ZikpIHsKIAkJZGV2X2VycihkZXYsICJETUEgbWFwcGluZyBmYWlsZWRcbiIpOwpAQCAt
MTUwLDcgKzE1MCw3IEBAIGludCBzdG0zMl9pMmNfcHJlcF9kbWFfeGZlcihzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBzdG0zMl9pMmNfZG1hICpkbWEsCiAJcmV0dXJuIDA7CiAKIGVycjoKLQlk
bWFfdW5tYXBfc2luZ2xlKGNoYW5fZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xlbiwKKwlk
bWFfdW5tYXBfc2luZ2xlKGRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sCiAJCQkgZG1h
LT5kbWFfZGF0YV9kaXIpOwogCXJldHVybiByZXQ7CiB9CgotLSAKMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
