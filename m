Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0CAEDDAE
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 14:58:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46333C30883;
	Mon, 30 Jun 2025 12:58:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DD98C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 12:58:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8mfZl011728;
 Mon, 30 Jun 2025 14:57:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OM4qEJBb0Q3JHjpYV6uTT5JxCF8eDkNfwEjYMoecZg8=; b=4JnjG6lf/RxF5fA6
 QisoqspaK74+Z9UkDQlz8Lg2md3foRIsHNUFAYpmpnP7YzTRiVUtthx20xEuKNZW
 PeIJglIDwj+hIwd5cHmOUqAHeyGB0KjixT0iyFKeZ/3Y3l+GGZxuHdUYFtwTl+Il
 bDQhBvgBKrZD0CDWCwQscW0vFELd/rZf+JEUwfoREa9ffIx/WSYCY5sDLIXgNJrL
 rjQwFUHuvwohgLVDSrOq0S3CGG/9h7zdeOFSj7sbUVHdpM3nCfT3QG3l0ub1ObAF
 9Weq77j5VaW0EteajI1TfSQzhFeCXjbr6jYI/tKkElcxjiM9Mm5zEYYlUE7Y4N39
 o6x6cQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j79h7b9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 14:57:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 172BB4004F;
 Mon, 30 Jun 2025 14:56:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65C64B42910;
 Mon, 30 Jun 2025 14:55:25 +0200 (CEST)
Received: from localhost (10.252.20.7) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 14:55:25 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 30 Jun 2025 14:55:14 +0200
MIME-Version: 1.0
Message-ID: <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 2/3] i2c: stm32f7: unmap DMA mapped buffer
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
dCIpCkFja2VkLWJ5OiBBbGFpbiBWb2xtYXQgPGFsYWluLnZvbG1hdEBmb3NzLnN0LmNvbT4KU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgotLS0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIHwgNiArKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXN0bTMyZjcuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCmlu
ZGV4IGU0YWFlYjIyNjJkMC4uMDQyMzg2YjRjYWJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXN0bTMyZjcuYworKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcu
YwpAQCAtMTU1NCw2ICsxNTU0LDggQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyZjdfaTJjX2hh
bmRsZV9pc3JfZXJycyhzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICppMmNfZGV2LAogCWlmIChpMmNf
ZGV2LT51c2VfZG1hKSB7CiAJCXN0bTMyZjdfaTJjX2Rpc2FibGVfZG1hX3JlcShpMmNfZGV2KTsK
IAkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYyhkbWEtPmNoYW5fdXNpbmcpOworCQlkbWFfdW5t
YXBfc2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sCisJCQkJ
IGRtYS0+ZG1hX2RhdGFfZGlyKTsKIAl9CiAKIAlpMmNfZGV2LT5tYXN0ZXJfbW9kZSA9IGZhbHNl
OwpAQCAtMTYyMiw2ICsxNjI0LDggQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyZjdfaTJjX2lz
cl9ldmVudF90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJaWYgKGkyY19kZXYtPnVzZV9k
bWEpIHsKIAkJCXN0bTMyZjdfaTJjX2Rpc2FibGVfZG1hX3JlcShpMmNfZGV2KTsKIAkJCWRtYWVu
Z2luZV90ZXJtaW5hdGVfYXN5bmMoZG1hLT5jaGFuX3VzaW5nKTsKKwkJCWRtYV91bm1hcF9zaW5n
bGUoaTJjX2Rldi0+ZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xlbiwKKwkJCQkJIGRtYS0+
ZG1hX2RhdGFfZGlyKTsKIAkJfQogCQlmN19tc2ctPnJlc3VsdCA9IC1FTlhJTzsKIAl9CkBAIC0x
NjQyLDYgKzE2NDYsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtMzJmN19pMmNfaXNyX2V2ZW50
X3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQogCQkJCWRldl9kYmcoaTJjX2Rldi0+ZGV2LCAi
PCVzPjogVGltZWQgb3V0XG4iLCBfX2Z1bmNfXyk7CiAJCQkJc3RtMzJmN19pMmNfZGlzYWJsZV9k
bWFfcmVxKGkyY19kZXYpOwogCQkJCWRtYWVuZ2luZV90ZXJtaW5hdGVfYXN5bmMoZG1hLT5jaGFu
X3VzaW5nKTsKKwkJCQlkbWFfdW5tYXBfc2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVm
LCBkbWEtPmRtYV9sZW4sCisJCQkJCQkgZG1hLT5kbWFfZGF0YV9kaXIpOwogCQkJCWY3X21zZy0+
cmVzdWx0ID0gLUVUSU1FRE9VVDsKIAkJCX0KIAkJfQoKLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
