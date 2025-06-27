Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E11AEB406
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 12:15:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00AB0C35E00;
	Fri, 27 Jun 2025 10:15:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4E0FC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 10:15:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R8PVHO022240;
 Fri, 27 Jun 2025 12:15:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=mVBgEXGskFGd1kZHXy9461
 TXv3u/WKz4hFmABhGynE8=; b=TUnaDvBduVytL1jo7TCMT9l4v5t7cPtAhaslCI
 eeZG5KnvL8984S665vwrxF/h4FgS4nXZxGIK9p6whXltR+1tDJ7Jmcl1Ti59j4NK
 vGqwCJK64JivfCHSFmbBgzPdxilY07HaDRQrJjzs89Q4xJRp/LkSzeDZJrQYWRFJ
 IxP5ewno/C/wLfzG0JkMXJalE2neRoa6xAvnfm2rsa/aC3dGU+pMbEn7VhFsA3lj
 Uq+VN7TNk7brpGOrICzNwHFseHDg5eZmV8A+R7fFP1CWYExducr04tVQpbuLGIUx
 Fm6p7wNA9o0qdtgKICgU64mQYM6/fjktlUGIn0lB8Wcs8jHg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5p3xqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 12:15:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 00FB840045;
 Fri, 27 Jun 2025 12:13:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75734B65697;
 Fri, 27 Jun 2025 12:12:57 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:12:57 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 27 Jun 2025 12:12:55 +0200
Message-ID: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKduXmgC/1XMQQ6CMBCF4auQWVvSFqYEV9zDsEAYZBZQ0qlEQ
 7i7FVcu/5e8bwehwCRwzXYItLGwX1LYSwb91C0PUjykBqstarSVYtur5yoxUDcrwrurUZsC6w7
 SZQ008uvkbm3qiSX68D71zXzXH+SM+4c2o7Qq7VAMWFQlOWxGL5JLzHs/Q3scxwcajC4EqgAAA
 A==
X-Change-ID: 20250527-i2c-upstream-e5b69501359a
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
Subject: [Linux-stm32] [PATCH v2 0/3] Fix STM32 I2C dma operations
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
bT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gRml4IHRoZSBkZXYgdXNlZCBpbiBkbWFfdW5tYXAgYWxz
byBpbiB0aGUgZXJyb3IgcGF0aCBvZgogIGBzdG0zMl9pMmNfcHJlcF9kbWFfeGZlcmAKLSBBZGQg
YSBkbWFfdW5tYXBfc2luZ2xlIGFsc28gaW4gdGhlIElUcyBlcnJvciBoYW5kbGVyCi0gQWRkIEFs
YWluIFZvbG1hdCdzICJBY2tlZC1ieSIgb24gcGF0Y2ggMwotIExpbmsgdG8gdjE6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNTA2MTYtaTJjLXVwc3RyZWFtLXYxLTAtNDJkM2Q1Mzc0ZTY1
QGZvc3Muc3QuY29tCgotLS0KQ2zDqW1lbnQgTGUgR29mZmljICgzKToKICAgICAgaTJjOiBzdG0z
MjogZml4IHRoZSBkZXZpY2UgdXNlZCBmb3IgdGhlIERNQSBtYXAKICAgICAgaTJjOiBzdG0zMmY3
OiB1bm1hcCBETUEgbWFwcGVkIGJ1ZmZlcgogICAgICBpMmM6IHN0bTMyZjc6IHN1cHBvcnQgaTJj
XypfZG1hX3NhZmVfbXNnX2J1ZiBBUElzCgogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5j
ICAgfCAgNCArKy0tCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyB8IDQyICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogODY3MzFhMmE2
NTFlNTg5NTNmYzk0OTU3Mzg5NWYyZmE2ZDQ1Njg0MQpjaGFuZ2UtaWQ6IDIwMjUwNTI3LWkyYy11
cHN0cmVhbS1lNWI2OTUwMTM1OWEKCkJlc3QgcmVnYXJkcywKLS0gIApDbMOpbWVudCBMZSBHb2Zm
aWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
