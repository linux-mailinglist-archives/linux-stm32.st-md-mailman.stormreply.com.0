Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3118AEA7D
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 17:15:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1F99C6DD6D;
	Tue, 23 Apr 2024 15:15:30 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48631C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 15:15:29 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43NBd3ME013106;
 Tue, 23 Apr 2024 17:15:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=
 selector1; bh=W5kriCTlwtswYN7XF7ASYU4t8GUwuuzQNeua46yCkMs=; b=0S
 SYQ5J85N5KCRVpjUXd+eHOFttpIcmbuGx+SH3nzSMjrxMR2BpdlroSjMvcAviYg8
 lU7oR9AxrUcY3GR1MA63vM+iFjTaX2JIsJu+1CuphywQHDJGrrJM2U/BwwthbIZU
 FgXHLepnK4UmIga3NvQpGpw0L+mhyfX64IJf6ICloN3Va2yjpLqohzkSejKIiq3A
 N+ymWZ1vSfZ8VEJYo/vG//2QoKSEJov1X3nAQrhlXAGo5DZRgn+WwvjbbO3e6RfE
 2skbS0z/EjkNkmJGzECM2SfBqRPKCm6S1U9Ag4Us20PgHUc/GVKsdgN2utsbLCbK
 zbxlC6JsTQ4gfHre5RoQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmrnj1q9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Apr 2024 17:15:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C05440044;
 Tue, 23 Apr 2024 17:14:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A28122365F;
 Tue, 23 Apr 2024 17:14:16 +0200 (CEST)
Received: from localhost (10.48.86.103) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 17:14:15 +0200
From: Maxime MERE <maxime.mere@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 23 Apr 2024 17:14:08 +0200
Message-ID: <20240423151409.902490-3-maxime.mere@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423151409.902490-1-maxime.mere@foss.st.com>
References: <20240423151409.902490-1-maxime.mere@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_12,2024-04-23_02,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] crypto: stm32/cryp - increase priority
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

RnJvbTogTWF4aW1lIE3DqXLDqSA8bWF4aW1lLm1lcmVAZm9zcy5zdC5jb20+CgpJbmNyZWFzZSBT
VE0zMiBDUllQIHByaW9yaXR5LCB0byBiZSBncmVhdGVyIHRoYW4gdGhlIEFSTS1ORU9OCmFjY2Vs
ZXJhdGVkIHZlcnNpb24uCgpTaWduZWQtb2YtYnk6IE1heGltZSBNw6lyw6kgPG1heGltZS5tZXJl
QGZvc3Muc3QuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNvbGFzIFRvcm9tYW5vZmYgPG5pY29sYXMu
dG9yb21hbm9mZkBmb3NzLnN0LmNvbT4KLS0tCiBkcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1j
cnlwLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vc3RtMzIv
c3RtMzItY3J5cC5jIGIvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItY3J5cC5jCmluZGV4IDVi
NmQyZmM2OGZlYS4uMzYyNDg5NzUxOTFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NyeXB0by9zdG0z
Mi9zdG0zMi1jcnlwLmMKKysrIGIvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItY3J5cC5jCkBA
IC0yMjkzLDcgKzIyOTMsNyBAQCBzdGF0aWMgc3RydWN0IHNrY2lwaGVyX2VuZ2luZV9hbGcgY3J5
cHRvX2FsZ3NbXSA9IHsKIAkuYmFzZSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0gImVjYihhZXMp
IiwKIAkJLmJhc2UuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWVjYi1hZXMiLAotCQkuYmFzZS5j
cmFfcHJpb3JpdHkJPSAyMDAsCisJCS5iYXNlLmNyYV9wcmlvcml0eQk9IDMwMCwKIAkJLmJhc2Uu
Y3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMsCiAJCS5iYXNlLmNyYV9ibG9ja3NpemUJPSBB
RVNfQkxPQ0tfU0laRSwKIAkJLmJhc2UuY3JhX2N0eHNpemUJPSBzaXplb2Yoc3RydWN0IHN0bTMy
X2NyeXBfY3R4KSwKQEAgLTIzMTUsNyArMjMxNSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tjaXBoZXJf
ZW5naW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCS5iYXNlID0gewogCQkuYmFzZS5jcmFfbmFt
ZQkJPSAiY2JjKGFlcykiLAogCQkuYmFzZS5jcmFfZHJpdmVyX25hbWUJPSAic3RtMzItY2JjLWFl
cyIsCi0JCS5iYXNlLmNyYV9wcmlvcml0eQk9IDIwMCwKKwkJLmJhc2UuY3JhX3ByaW9yaXR5CT0g
MzAwLAogCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKIAkJLmJhc2UuY3Jh
X2Jsb2Nrc2l6ZQk9IEFFU19CTE9DS19TSVpFLAogCQkuYmFzZS5jcmFfY3R4c2l6ZQk9IHNpemVv
ZihzdHJ1Y3Qgc3RtMzJfY3J5cF9jdHgpLApAQCAtMjMzOCw3ICsyMzM4LDcgQEAgc3RhdGljIHN0
cnVjdCBza2NpcGhlcl9lbmdpbmVfYWxnIGNyeXB0b19hbGdzW10gPSB7CiAJLmJhc2UgPSB7CiAJ
CS5iYXNlLmNyYV9uYW1lCQk9ICJjdHIoYWVzKSIsCiAJCS5iYXNlLmNyYV9kcml2ZXJfbmFtZQk9
ICJzdG0zMi1jdHItYWVzIiwKLQkJLmJhc2UuY3JhX3ByaW9yaXR5CT0gMjAwLAorCQkuYmFzZS5j
cmFfcHJpb3JpdHkJPSAzMDAsCiAJCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5D
LAogCQkuYmFzZS5jcmFfYmxvY2tzaXplCT0gMSwKIAkJLmJhc2UuY3JhX2N0eHNpemUJPSBzaXpl
b2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKQEAgLTIzNjEsNyArMjM2MSw3IEBAIHN0YXRpYyBz
dHJ1Y3Qgc2tjaXBoZXJfZW5naW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCS5iYXNlID0gewog
CQkuYmFzZS5jcmFfbmFtZQkJPSAiZWNiKGRlcykiLAogCQkuYmFzZS5jcmFfZHJpdmVyX25hbWUJ
PSAic3RtMzItZWNiLWRlcyIsCi0JCS5iYXNlLmNyYV9wcmlvcml0eQk9IDIwMCwKKwkJLmJhc2Uu
Y3JhX3ByaW9yaXR5CT0gMzAwLAogCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lO
QywKIAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IERFU19CTE9DS19TSVpFLAogCQkuYmFzZS5jcmFf
Y3R4c2l6ZQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5cF9jdHgpLApAQCAtMjM4Myw3ICsyMzgz
LDcgQEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVfYWxnIGNyeXB0b19hbGdzW10gPSB7
CiAJLmJhc2UgPSB7CiAJCS5iYXNlLmNyYV9uYW1lCQk9ICJjYmMoZGVzKSIsCiAJCS5iYXNlLmNy
YV9kcml2ZXJfbmFtZQk9ICJzdG0zMi1jYmMtZGVzIiwKLQkJLmJhc2UuY3JhX3ByaW9yaXR5CT0g
MjAwLAorCQkuYmFzZS5jcmFfcHJpb3JpdHkJPSAzMDAsCiAJCS5iYXNlLmNyYV9mbGFncwkJPSBD
UllQVE9fQUxHX0FTWU5DLAogCQkuYmFzZS5jcmFfYmxvY2tzaXplCT0gREVTX0JMT0NLX1NJWkUs
CiAJCS5iYXNlLmNyYV9jdHhzaXplCT0gc2l6ZW9mKHN0cnVjdCBzdG0zMl9jcnlwX2N0eCksCkBA
IC0yNDA2LDcgKzI0MDYsNyBAQCBzdGF0aWMgc3RydWN0IHNrY2lwaGVyX2VuZ2luZV9hbGcgY3J5
cHRvX2FsZ3NbXSA9IHsKIAkuYmFzZSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0gImVjYihkZXMz
X2VkZSkiLAogCQkuYmFzZS5jcmFfZHJpdmVyX25hbWUJPSAic3RtMzItZWNiLWRlczMiLAotCQku
YmFzZS5jcmFfcHJpb3JpdHkJPSAyMDAsCisJCS5iYXNlLmNyYV9wcmlvcml0eQk9IDMwMCwKIAkJ
LmJhc2UuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMsCiAJCS5iYXNlLmNyYV9ibG9ja3Np
emUJPSBERVNfQkxPQ0tfU0laRSwKIAkJLmJhc2UuY3JhX2N0eHNpemUJPSBzaXplb2Yoc3RydWN0
IHN0bTMyX2NyeXBfY3R4KSwKQEAgLTI0MjgsNyArMjQyOCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tj
aXBoZXJfZW5naW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCS5iYXNlID0gewogCQkuYmFzZS5j
cmFfbmFtZQkJPSAiY2JjKGRlczNfZWRlKSIsCiAJCS5iYXNlLmNyYV9kcml2ZXJfbmFtZQk9ICJz
dG0zMi1jYmMtZGVzMyIsCi0JCS5iYXNlLmNyYV9wcmlvcml0eQk9IDIwMCwKKwkJLmJhc2UuY3Jh
X3ByaW9yaXR5CT0gMzAwLAogCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywK
IAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IERFU19CTE9DS19TSVpFLAogCQkuYmFzZS5jcmFfY3R4
c2l6ZQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5cF9jdHgpLApAQCAtMjQ2Miw3ICsyNDYyLDcg
QEAgc3RhdGljIHN0cnVjdCBhZWFkX2VuZ2luZV9hbGcgYWVhZF9hbGdzW10gPSB7CiAJLmJhc2Uu
YmFzZSA9IHsKIAkJLmNyYV9uYW1lCQk9ICJnY20oYWVzKSIsCiAJCS5jcmFfZHJpdmVyX25hbWUJ
PSAic3RtMzItZ2NtLWFlcyIsCi0JCS5jcmFfcHJpb3JpdHkJCT0gMjAwLAorCQkuY3JhX3ByaW9y
aXR5CQk9IDMwMCwKIAkJLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5DLAogCQkuY3JhX2Js
b2Nrc2l6ZQkJPSAxLAogCQkuY3JhX2N0eHNpemUJCT0gc2l6ZW9mKHN0cnVjdCBzdG0zMl9jcnlw
X2N0eCksCkBAIC0yNDg1LDcgKzI0ODUsNyBAQCBzdGF0aWMgc3RydWN0IGFlYWRfZW5naW5lX2Fs
ZyBhZWFkX2FsZ3NbXSA9IHsKIAkuYmFzZS5iYXNlID0gewogCQkuY3JhX25hbWUJCT0gImNjbShh
ZXMpIiwKIAkJLmNyYV9kcml2ZXJfbmFtZQk9ICJzdG0zMi1jY20tYWVzIiwKLQkJLmNyYV9wcmlv
cml0eQkJPSAyMDAsCisJCS5jcmFfcHJpb3JpdHkJCT0gMzAwLAogCQkuY3JhX2ZsYWdzCQk9IENS
WVBUT19BTEdfQVNZTkMsCiAJCS5jcmFfYmxvY2tzaXplCQk9IDEsCiAJCS5jcmFfY3R4c2l6ZQkJ
PSBzaXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
