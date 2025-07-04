Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB2AF8C2F
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 10:42:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D98E8C3F959;
	Fri,  4 Jul 2025 08:42:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B533C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 08:42:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZtTI015069;
 Fri, 4 Jul 2025 10:41:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=SG1Uf3WWZKbhZvXehI/zWs
 a4U/GR4wtbqsoht1Gvc/s=; b=QmrquhH140RmkusdKGMoRkObmTKMLtwuLmEXU5
 wmSkUun+22sj1wVLDVEVRsnGu4tBT+iYggKLdQrW3tT3iB55Cndsx+sCwcbkLHSw
 qY/e4APbVTFRDu2IfqWzeL/Qk7Fz8guiua0XZUmiTySeKBPhTq0CTQOsyZ3+KqQU
 aHQomihSjdRo/ZmnxcxGvuxiXDOnmLRn5J06upV1tWs8JjSagMR4GIqmLs+hhKEO
 mJfUOjGFuzyRPluIjYqMaiw3Wi/sirTIirPmVe7jALRVTVSwgYr9bc4wNsrUQu4+
 5rpV+3eFvlRBQZuFsWd7EsnrGg2xbjoZVshkJtF76eLiEElg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r6kx8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jul 2025 10:41:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98DAB4004D;
 Fri,  4 Jul 2025 10:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8586A48213E;
 Fri,  4 Jul 2025 10:39:36 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 10:39:36 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 4 Jul 2025 10:39:13 +0200
Message-ID: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADGTZ2gC/2XOTQ6DIBCG4as0rIuBGUDtqvdoukCklYU/AUvaG
 O9etBu1y2+S581MJFjvbCCX00S8jS64vktDnE/ENLp7WurqtAkwkExCTh0Y+hrC6K1uqZWVKiX
 jKEtNEhm8fbj3mrvd025cGHv/WeuRL9dfSHG1D0VOGRVQYy0xF1bJ66MPIQtjZvqWLKkIG378I
 0LiheFCAoqC1+af44YjO3BMPNeAugKlCtR7Ps/zF4+/vAAoAQAA
X-Change-ID: 20250527-i2c-upstream-e5b69501359a
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 0/3] Fix STM32 I2C dma operations
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
bT4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gUGF0Y2hbMV06IFJlbW92ZSBhbGwgYGNoYW5fZGV2YCB2
YXJpYWJsZSBvY2N1cnJlbmNpZXMKLSBQYXRjaFsyXToKICAgIC0gUmVmaW5lIGNvbW1pdCBtZXNz
YWdlCiAgICAtIFVzZSB0aGUgZG1hX2NhbGxiYWNrIHRvIGZhY3Rvcml6ZSB0aGUgY29kZQotIFBh
dGNoWzNdOiBSZWZpbmUgY29tbWl0IG1lc3NhZ2UKLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjUwNjMwLWkyYy11cHN0cmVhbS12My0wLTdhMjNhYjI2NjgzYUBmb3Nz
LnN0LmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBBZGQgQWxhaW4gVm9sbWF0J3MgIkFja2VkLWJ5IiBv
biBwYXRjaCAxIGFuZCAyCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDYyNy1pMmMtdXBzdHJlYW0tdjItMC04YzE0NTIzNDgxZGNAZm9zcy5zdC5jb20KCkNoYW5n
ZXMgaW4gdjI6Ci0gRml4IHRoZSBkZXYgdXNlZCBpbiBkbWFfdW5tYXAgYWxzbyBpbiB0aGUgZXJy
b3IgcGF0aCBvZgogIGBzdG0zMl9pMmNfcHJlcF9kbWFfeGZlcmAKLSBBZGQgYSBkbWFfdW5tYXBf
c2luZ2xlIGFsc28gaW4gdGhlIElUcyBlcnJvciBoYW5kbGVyCi0gQWRkIEFsYWluIFZvbG1hdCdz
ICJBY2tlZC1ieSIgb24gcGF0Y2ggMwotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNTA2MTYtaTJjLXVwc3RyZWFtLXYxLTAtNDJkM2Q1Mzc0ZTY1QGZvc3Muc3QuY29t
CgotLS0KQ2zDqW1lbnQgTGUgR29mZmljICgzKToKICAgICAgaTJjOiBzdG0zMjogZml4IHRoZSBk
ZXZpY2UgdXNlZCBmb3IgdGhlIERNQSBtYXAKICAgICAgaTJjOiBzdG0zMmY3OiB1bm1hcCBETUEg
bWFwcGVkIGJ1ZmZlcgogICAgICBpMmM6IHN0bTMyZjc6IHN1cHBvcnQgaTJjXypfZG1hX3NhZmVf
bXNnX2J1ZiBBUElzCgogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5jICAgfCAgOCArKyst
LS0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIHwgNTYgKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25z
KCspLCAzMSBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBkMGIzYjdiMjJkZmExZjRiNTE1
ZmQzYTI5NWIzZmQ5NThmOWU4MWFmCmNoYW5nZS1pZDogMjAyNTA1MjctaTJjLXVwc3RyZWFtLWU1
YjY5NTAxMzU5YQoKQmVzdCByZWdhcmRzLAotLSAgCkNsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVu
dC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
