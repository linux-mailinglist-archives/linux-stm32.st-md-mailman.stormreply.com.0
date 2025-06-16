Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C2ADAB3E
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 10:57:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 436C9C36B17;
	Mon, 16 Jun 2025 08:57:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01A7BC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 08:57:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8nbMS018924;
 Mon, 16 Jun 2025 10:57:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=hZLfO/aZyhMByPrSvo6tyt
 gTdrnVnO5xyKlmjUCAvKw=; b=RMUr56cGnt2/RKuJ4spaAqR0emvF93V4UccXgy
 LMZbSVE+1tjfHj1tM/nNO0xtDGv8ZNjsp5EWl/h7LRsAaEU+dQU7iGVWopOKSTTx
 SmMxOcsDq5+kooCeQHsQGojp3Ea2kzjQKhVnA+5rvfQ+j9qocvU2AcXgW5uJLqQJ
 ftcScyP45zUgIiwv3ZyFa+YreFS93Rbd8Af6sguAbUFc0A4765p1UKOM/z6KwyKq
 WUkjBpIvNRIpAjIrGZRlzYY4ilz+qNGXPX6OFYBBlKD3RNn+s3rM5g2GKUn1srO6
 C7DbbaN/1GPmPG33jvn4XYGy6AyXTbqXovPbFKJ4tgWp3G/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1yqwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 10:57:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 01A4740074;
 Mon, 16 Jun 2025 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29F025D40BC;
 Mon, 16 Jun 2025 10:54:42 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:54:41 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 10:53:53 +0200
Message-ID: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKLbT2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3UyjZN3SguKSotTEXN1U0yQzS1MDQ2NTy0QloJaCotS0zAqwcdG
 xtbUABnEo6l4AAAA=
X-Change-ID: 20250527-i2c-upstream-e5b69501359a
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
Subject: [Linux-stm32] [PATCH 0/3] Fix STM32 I2C dma operations
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

VGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBmaXggc29tZSBpc3N1ZXMgaW5zaWRlIHRoZSBkcml2
ZXIncyBETUEKaGFuZGxpbmcuCkl0IGFsc28gdXNlcyBuZXdlciBJMkMgRE1BIEFQSS4KClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNv
bT4KLS0tCkNsw6ltZW50IExlIEdvZmZpYyAoMyk6CiAgICAgIGkyYzogc3RtMzI6IGZpeCB0aGUg
ZGV2aWNlIHVzZWQgZm9yIHRoZSBETUEgbWFwCiAgICAgIGkyYzogc3RtMzJmNzogdW5tYXAgRE1B
IG1hcHBlZCBidWZmZXIKICAgICAgaTJjOiBzdG0zMmY3OiBzdXBwb3J0IGkyY18qX2RtYV9zYWZl
X21zZ19idWYgQVBJcwoKIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzIuYyAgIHwgIDIgKy0K
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIHwgNDAgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBlMDRjNzhkODZhOTY5OWQxMzY5MTBj
ZmMwYmRjZjAxMDg3ZTMyNjdlCmNoYW5nZS1pZDogMjAyNTA1MjctaTJjLXVwc3RyZWFtLWU1YjY5
NTAxMzU5YQoKQmVzdCByZWdhcmRzLAotLSAKQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50Lmxl
Z29mZmljQGZvc3Muc3QuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
