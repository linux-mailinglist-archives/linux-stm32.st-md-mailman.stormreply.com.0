Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07AAEDDAF
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 14:58:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CF2DC3089E;
	Mon, 30 Jun 2025 12:58:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95846C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 12:58:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAX7hQ009897;
 Mon, 30 Jun 2025 14:57:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=uzwpacVr2LDq5kXvxCDUAt
 NWqyaw9cIFdQ9xmj0ioPk=; b=Esr/VsQn/f4180soFFWYt9BFaYfONy5OyL4uY7
 bWHr81wKH7xj8/aPYzLmpbHVWKiBZS6MKchZJWGmyolwKMvl+9Lu5jl4Qa8wiNz7
 BxUwJ2/RTmqnktLySHmr3zDI8RVftAuqg1BZ18tZPJ9+zjj46CcAe6G9diP0l6lk
 1cM9NXXntZHnb2gJg4tOdW7LWmMOwV8Aggc/Wo+lUFDz7VVATsqEs6F28eev9ecT
 ujfuAjQK4w7oiP8XNJ7i61nxhHmhr868Ytoj8RBXxS/OJMAfP8PzJE113WZm+9Vo
 8oSILwgrWBYmoG7K/AhxR+L16nU4B0pAvg8OCQtMwP2Drhxw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j79h7b9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 14:57:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 962744004D;
 Mon, 30 Jun 2025 14:56:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80204B42908;
 Mon, 30 Jun 2025 14:55:23 +0200 (CEST)
Received: from localhost (10.252.20.7) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 14:55:23 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 30 Jun 2025 14:55:12 +0200
Message-ID: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADCJYmgC/12Oyw6CMBQFf4V0bUlft4Ar/8O4wLZIF1DSi42G8
 O8W3IjLOclMzkLQRe+QnIuFRJc8+jBmkKeCmL4dH456m5kIJoCBqKgXhj4nnKNrB+rgrhtgXEL
 TkqxM0XX+teeut8y9xznE915PfFu/Ic31MZQ4ZVQJKy3ISjkNly4gljiXJgxkSyXxo///SCLrt
 eEKhFQ1t+aor+v6AZ5tRpHpAAAA
X-Change-ID: 20250527-i2c-upstream-e5b69501359a
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
Subject: [Linux-stm32] [PATCH v3 0/3] Fix STM32 I2C dma operations
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
bT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gQWRkIEFsYWluIFZvbG1hdCdzICJBY2tlZC1ieSIgb24g
cGF0Y2ggMSBhbmQgMgotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NTA2MjctaTJjLXVwc3RyZWFtLXYyLTAtOGMxNDUyMzQ4MWRjQGZvc3Muc3QuY29tCgpDaGFuZ2Vz
IGluIHYyOgotIEZpeCB0aGUgZGV2IHVzZWQgaW4gZG1hX3VubWFwIGFsc28gaW4gdGhlIGVycm9y
IHBhdGggb2YKICBgc3RtMzJfaTJjX3ByZXBfZG1hX3hmZXJgCi0gQWRkIGEgZG1hX3VubWFwX3Np
bmdsZSBhbHNvIGluIHRoZSBJVHMgZXJyb3IgaGFuZGxlcgotIEFkZCBBbGFpbiBWb2xtYXQncyAi
QWNrZWQtYnkiIG9uIHBhdGNoIDMKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjUwNjE2LWkyYy11cHN0cmVhbS12MS0wLTQyZDNkNTM3NGU2NUBmb3NzLnN0LmNvbQoK
LS0tCkNsw6ltZW50IExlIEdvZmZpYyAoMyk6CiAgICAgIGkyYzogc3RtMzI6IGZpeCB0aGUgZGV2
aWNlIHVzZWQgZm9yIHRoZSBETUEgbWFwCiAgICAgIGkyYzogc3RtMzJmNzogdW5tYXAgRE1BIG1h
cHBlZCBidWZmZXIKICAgICAgaTJjOiBzdG0zMmY3OiBzdXBwb3J0IGkyY18qX2RtYV9zYWZlX21z
Z19idWYgQVBJcwoKIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzIuYyAgIHwgIDQgKystLQog
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMgfCA0MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGQwYjNiN2IyMmRmYTFmNGI1MTVmZDNh
Mjk1YjNmZDk1OGY5ZTgxYWYKY2hhbmdlLWlkOiAyMDI1MDUyNy1pMmMtdXBzdHJlYW0tZTViNjk1
MDEzNTlhCgpCZXN0IHJlZ2FyZHMsCi0tIApDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVn
b2ZmaWNAZm9zcy5zdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
