Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E515C8AEA7B
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 17:15:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8974FC6DD6D;
	Tue, 23 Apr 2024 15:15:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90038C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 15:15:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43NCH14A018378;
 Tue, 23 Apr 2024 17:15:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=
 selector1; bh=sORmSAf9vacArCUQo8K1St5wRolQtpbAu5JoPjjIy14=; b=ii
 NNHVRAEhwXhr+niTwSdwL4ktGCL2b1QSYUaSPeh4ZHBjPZLuf2J3Xx9wWzqtg5Bt
 O6ufbjV5uAybP3SOX7vvMkiSM0vnNppdbDpMcXf7UKDRSg4JiOixxi24Q+jRyK/w
 lOyKyTs3y/be+CeJEkV/FVUeXVv5Tum+FBunU9PBDcZTTuP2D7wdoFKIRPqdguac
 e6ap/qrbyncVrdciLBFSY2Dxk56enOgBA8YCADsIHQE+Ms2LV5RKWf5PlbrqJ1Mb
 nbGcXlwo5wlXWTddQw2Vl4krKG8ziaOiJfvdA4byPKOscaK40ml/7YAvvd7qTCB4
 sjuwBbDnrLyP0f39ReuQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4cncfun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Apr 2024 17:15:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2BFCD4002D;
 Tue, 23 Apr 2024 17:14:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE988223664;
 Tue, 23 Apr 2024 17:14:16 +0200 (CEST)
Received: from localhost (10.48.86.103) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 17:14:16 +0200
From: Maxime MERE <maxime.mere@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 23 Apr 2024 17:14:09 +0200
Message-ID: <20240423151409.902490-4-maxime.mere@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 3/3] crypto: stm32/cryp - add
	CRYPTO_ALG_KERN_DRIVER_ONLY flag
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

RnJvbTogTWF4aW1lIE3DqXLDqSA8bWF4aW1lLm1lcmVAZm9zcy5zdC5jb20+CgpUaGlzIGZsYWcg
aXMgbmVlZGVkIHRvIG1ha2UgdGhlIGRyaXZlciB2aXNpYmxlIGZyb20gb3BlbnNzbCBhbmQgY3J5
cHRvZGV2LgoKU2lnbmVkLW9mZi1ieTogTWF4aW1lIE3DqXLDqSA8bWF4aW1lLm1lcmVAc3QuY29t
PgotLS0KIGRyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYyB8IDE4ICsrKysrKysrKy0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMgYi9kcml2ZXJz
L2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMKaW5kZXggMzYyNDg5NzUxOTFjLi5lMWE0YjVkOWQw
MDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYworKysgYi9k
cml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMKQEAgLTIyOTQsNyArMjI5NCw3IEBAIHN0
YXRpYyBzdHJ1Y3Qgc2tjaXBoZXJfZW5naW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCQkuYmFz
ZS5jcmFfbmFtZQkJPSAiZWNiKGFlcykiLAogCQkuYmFzZS5jcmFfZHJpdmVyX25hbWUJPSAic3Rt
MzItZWNiLWFlcyIsCiAJCS5iYXNlLmNyYV9wcmlvcml0eQk9IDMwMCwKLQkJLmJhc2UuY3JhX2Zs
YWdzCQk9IENSWVBUT19BTEdfQVNZTkMsCisJCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxH
X0FTWU5DIHwgQ1JZUFRPX0FMR19LRVJOX0RSSVZFUl9PTkxZLAogCQkuYmFzZS5jcmFfYmxvY2tz
aXplCT0gQUVTX0JMT0NLX1NJWkUsCiAJCS5iYXNlLmNyYV9jdHhzaXplCT0gc2l6ZW9mKHN0cnVj
dCBzdG0zMl9jcnlwX2N0eCksCiAJCS5iYXNlLmNyYV9hbGlnbm1hc2sJPSAwLApAQCAtMjMxNiw3
ICsyMzE2LDcgQEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVfYWxnIGNyeXB0b19hbGdz
W10gPSB7CiAJCS5iYXNlLmNyYV9uYW1lCQk9ICJjYmMoYWVzKSIsCiAJCS5iYXNlLmNyYV9kcml2
ZXJfbmFtZQk9ICJzdG0zMi1jYmMtYWVzIiwKIAkJLmJhc2UuY3JhX3ByaW9yaXR5CT0gMzAwLAot
CQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJLmJhc2UuY3JhX2ZsYWdz
CQk9IENSWVBUT19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJVkVSX09OTFksCiAJCS5i
YXNlLmNyYV9ibG9ja3NpemUJPSBBRVNfQkxPQ0tfU0laRSwKIAkJLmJhc2UuY3JhX2N0eHNpemUJ
PSBzaXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2UuY3JhX2FsaWdubWFzawk9
IDAsCkBAIC0yMzM5LDcgKzIzMzksNyBAQCBzdGF0aWMgc3RydWN0IHNrY2lwaGVyX2VuZ2luZV9h
bGcgY3J5cHRvX2FsZ3NbXSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0gImN0cihhZXMpIiwKIAkJ
LmJhc2UuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWN0ci1hZXMiLAogCQkuYmFzZS5jcmFfcHJp
b3JpdHkJPSAzMDAsCi0JCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5DLAorCQku
YmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQyB8IENSWVBUT19BTEdfS0VSTl9EUklW
RVJfT05MWSwKIAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IDEsCiAJCS5iYXNlLmNyYV9jdHhzaXpl
CT0gc2l6ZW9mKHN0cnVjdCBzdG0zMl9jcnlwX2N0eCksCiAJCS5iYXNlLmNyYV9hbGlnbm1hc2sJ
PSAwLApAQCAtMjM2Miw3ICsyMzYyLDcgQEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVf
YWxnIGNyeXB0b19hbGdzW10gPSB7CiAJCS5iYXNlLmNyYV9uYW1lCQk9ICJlY2IoZGVzKSIsCiAJ
CS5iYXNlLmNyYV9kcml2ZXJfbmFtZQk9ICJzdG0zMi1lY2ItZGVzIiwKIAkJLmJhc2UuY3JhX3By
aW9yaXR5CT0gMzAwLAotCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJ
LmJhc2UuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJ
VkVSX09OTFksCiAJCS5iYXNlLmNyYV9ibG9ja3NpemUJPSBERVNfQkxPQ0tfU0laRSwKIAkJLmJh
c2UuY3JhX2N0eHNpemUJPSBzaXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2Uu
Y3JhX2FsaWdubWFzawk9IDAsCkBAIC0yMzg0LDcgKzIzODQsNyBAQCBzdGF0aWMgc3RydWN0IHNr
Y2lwaGVyX2VuZ2luZV9hbGcgY3J5cHRvX2FsZ3NbXSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0g
ImNiYyhkZXMpIiwKIAkJLmJhc2UuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWNiYy1kZXMiLAog
CQkuYmFzZS5jcmFfcHJpb3JpdHkJPSAzMDAsCi0JCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9f
QUxHX0FTWU5DLAorCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQyB8IENSWVBU
T19BTEdfS0VSTl9EUklWRVJfT05MWSwKIAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IERFU19CTE9D
S19TSVpFLAogCQkuYmFzZS5jcmFfY3R4c2l6ZQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5cF9j
dHgpLAogCQkuYmFzZS5jcmFfYWxpZ25tYXNrCT0gMCwKQEAgLTI0MDcsNyArMjQwNyw3IEBAIHN0
YXRpYyBzdHJ1Y3Qgc2tjaXBoZXJfZW5naW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCQkuYmFz
ZS5jcmFfbmFtZQkJPSAiZWNiKGRlczNfZWRlKSIsCiAJCS5iYXNlLmNyYV9kcml2ZXJfbmFtZQk9
ICJzdG0zMi1lY2ItZGVzMyIsCiAJCS5iYXNlLmNyYV9wcmlvcml0eQk9IDMwMCwKLQkJLmJhc2Uu
Y3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMsCisJCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQ
VE9fQUxHX0FTWU5DIHwgQ1JZUFRPX0FMR19LRVJOX0RSSVZFUl9PTkxZLAogCQkuYmFzZS5jcmFf
YmxvY2tzaXplCT0gREVTX0JMT0NLX1NJWkUsCiAJCS5iYXNlLmNyYV9jdHhzaXplCT0gc2l6ZW9m
KHN0cnVjdCBzdG0zMl9jcnlwX2N0eCksCiAJCS5iYXNlLmNyYV9hbGlnbm1hc2sJPSAwLApAQCAt
MjQyOSw3ICsyNDI5LDcgQEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVfYWxnIGNyeXB0
b19hbGdzW10gPSB7CiAJCS5iYXNlLmNyYV9uYW1lCQk9ICJjYmMoZGVzM19lZGUpIiwKIAkJLmJh
c2UuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWNiYy1kZXMzIiwKIAkJLmJhc2UuY3JhX3ByaW9y
aXR5CT0gMzAwLAotCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJLmJh
c2UuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJVkVS
X09OTFksCiAJCS5iYXNlLmNyYV9ibG9ja3NpemUJPSBERVNfQkxPQ0tfU0laRSwKIAkJLmJhc2Uu
Y3JhX2N0eHNpemUJPSBzaXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2UuY3Jh
X2FsaWdubWFzawk9IDAsCkBAIC0yNDYzLDcgKzI0NjMsNyBAQCBzdGF0aWMgc3RydWN0IGFlYWRf
ZW5naW5lX2FsZyBhZWFkX2FsZ3NbXSA9IHsKIAkJLmNyYV9uYW1lCQk9ICJnY20oYWVzKSIsCiAJ
CS5jcmFfZHJpdmVyX25hbWUJPSAic3RtMzItZ2NtLWFlcyIsCiAJCS5jcmFfcHJpb3JpdHkJCT0g
MzAwLAotCQkuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMsCisJCS5jcmFfZmxhZ3MJCT0g
Q1JZUFRPX0FMR19BU1lOQyB8IENSWVBUT19BTEdfS0VSTl9EUklWRVJfT05MWSwKIAkJLmNyYV9i
bG9ja3NpemUJCT0gMSwKIAkJLmNyYV9jdHhzaXplCQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5
cF9jdHgpLAogCQkuY3JhX2FsaWdubWFzawkJPSAwLApAQCAtMjQ4Niw3ICsyNDg2LDcgQEAgc3Rh
dGljIHN0cnVjdCBhZWFkX2VuZ2luZV9hbGcgYWVhZF9hbGdzW10gPSB7CiAJCS5jcmFfbmFtZQkJ
PSAiY2NtKGFlcykiLAogCQkuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWNjbS1hZXMiLAogCQku
Y3JhX3ByaW9yaXR5CQk9IDMwMCwKLQkJLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5DLAor
CQkuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJVkVS
X09OTFksCiAJCS5jcmFfYmxvY2tzaXplCQk9IDEsCiAJCS5jcmFfY3R4c2l6ZQkJPSBzaXplb2Yo
c3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmNyYV9hbGlnbm1hc2sJCT0gMCwKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
