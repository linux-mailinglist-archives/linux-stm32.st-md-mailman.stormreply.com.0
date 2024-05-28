Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F08D1DE2
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 16:07:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3FE7C6C855;
	Tue, 28 May 2024 14:07:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FDABC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 14:07:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SDcOdO029891;
 Tue, 28 May 2024 16:06:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 v7E8OMWYxR1Y6IK0L9YNl8ouxqDGEKTc3SeFud18MwE=; b=ebzQdQu2CehgUyU7
 I6S/9JAO5LGTr9OHe4jtdL+pmGJiYoVdjU9sYsHGSd47FJUDB7xpND8fBtIUIqPi
 98eZemtcvN2KrARhVtZwZYjNylqZIlEGu5phIoF35Lq/YKmLb1OScRgORu2w1bOU
 G6+MpFfSMJq4Eib0cC4JnNXzUuuEhwPDuutMOLg0HN+tQbjAiAfpHFsARSPoxDOx
 kv4gaEpI4/jsdbEseiKLinhpRsVzbXDwTPAPQFSaU7HhN0AAryLJWX7DCsO9lhrz
 rKgy6yqKm4T6CeekMUSUQA3O1yS+k4W4lhBwUpE+BtK6ffW1GAGJUhDwQAoV2aAW
 Pe+WtA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yb9yjcf3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 16:06:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D84A840048;
 Tue, 28 May 2024 16:06:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D58D21BF45;
 Tue, 28 May 2024 16:06:13 +0200 (CEST)
Received: from localhost (10.48.86.103) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 May
 2024 16:06:12 +0200
From: Maxime MERE <maxime.mere@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Date: Tue, 28 May 2024 16:05:47 +0200
Message-ID: <20240528140548.1632562-4-maxime.mere@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240528140548.1632562-1-maxime.mere@foss.st.com>
References: <20240528140548.1632562-1-maxime.mere@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@st.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 =?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/4] crypto: stm32/cryp - add
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
L2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMKaW5kZXggYjBkMjc4NDIxNDYxLi40NDUyNzZiODQ4
ZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYworKysgYi9k
cml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMKQEAgLTIyODMsNyArMjI4Myw3IEBAIHN0
YXRpYyBzdHJ1Y3Qgc2tjaXBoZXJfZW5naW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCQkuYmFz
ZS5jcmFfbmFtZQkJPSAiZWNiKGFlcykiLAogCQkuYmFzZS5jcmFfZHJpdmVyX25hbWUJPSAic3Rt
MzItZWNiLWFlcyIsCiAJCS5iYXNlLmNyYV9wcmlvcml0eQk9IDMwMCwKLQkJLmJhc2UuY3JhX2Zs
YWdzCQk9IENSWVBUT19BTEdfQVNZTkMsCisJCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxH
X0FTWU5DIHwgQ1JZUFRPX0FMR19LRVJOX0RSSVZFUl9PTkxZLAogCQkuYmFzZS5jcmFfYmxvY2tz
aXplCT0gQUVTX0JMT0NLX1NJWkUsCiAJCS5iYXNlLmNyYV9jdHhzaXplCT0gc2l6ZW9mKHN0cnVj
dCBzdG0zMl9jcnlwX2N0eCksCiAJCS5iYXNlLmNyYV9hbGlnbm1hc2sJPSAwLApAQCAtMjMwNSw3
ICsyMzA1LDcgQEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVfYWxnIGNyeXB0b19hbGdz
W10gPSB7CiAJCS5iYXNlLmNyYV9uYW1lCQk9ICJjYmMoYWVzKSIsCiAJCS5iYXNlLmNyYV9kcml2
ZXJfbmFtZQk9ICJzdG0zMi1jYmMtYWVzIiwKIAkJLmJhc2UuY3JhX3ByaW9yaXR5CT0gMzAwLAot
CQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJLmJhc2UuY3JhX2ZsYWdz
CQk9IENSWVBUT19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJVkVSX09OTFksCiAJCS5i
YXNlLmNyYV9ibG9ja3NpemUJPSBBRVNfQkxPQ0tfU0laRSwKIAkJLmJhc2UuY3JhX2N0eHNpemUJ
PSBzaXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2UuY3JhX2FsaWdubWFzawk9
IDAsCkBAIC0yMzI4LDcgKzIzMjgsNyBAQCBzdGF0aWMgc3RydWN0IHNrY2lwaGVyX2VuZ2luZV9h
bGcgY3J5cHRvX2FsZ3NbXSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0gImN0cihhZXMpIiwKIAkJ
LmJhc2UuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWN0ci1hZXMiLAogCQkuYmFzZS5jcmFfcHJp
b3JpdHkJPSAzMDAsCi0JCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5DLAorCQku
YmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQyB8IENSWVBUT19BTEdfS0VSTl9EUklW
RVJfT05MWSwKIAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IDEsCiAJCS5iYXNlLmNyYV9jdHhzaXpl
CT0gc2l6ZW9mKHN0cnVjdCBzdG0zMl9jcnlwX2N0eCksCiAJCS5iYXNlLmNyYV9hbGlnbm1hc2sJ
PSAwLApAQCAtMjM1MSw3ICsyMzUxLDcgQEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVf
YWxnIGNyeXB0b19hbGdzW10gPSB7CiAJCS5iYXNlLmNyYV9uYW1lCQk9ICJlY2IoZGVzKSIsCiAJ
CS5iYXNlLmNyYV9kcml2ZXJfbmFtZQk9ICJzdG0zMi1lY2ItZGVzIiwKIAkJLmJhc2UuY3JhX3By
aW9yaXR5CT0gMzAwLAotCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJ
LmJhc2UuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJ
VkVSX09OTFksCiAJCS5iYXNlLmNyYV9ibG9ja3NpemUJPSBERVNfQkxPQ0tfU0laRSwKIAkJLmJh
c2UuY3JhX2N0eHNpemUJPSBzaXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2Uu
Y3JhX2FsaWdubWFzawk9IDAsCkBAIC0yMzczLDcgKzIzNzMsNyBAQCBzdGF0aWMgc3RydWN0IHNr
Y2lwaGVyX2VuZ2luZV9hbGcgY3J5cHRvX2FsZ3NbXSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0g
ImNiYyhkZXMpIiwKIAkJLmJhc2UuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWNiYy1kZXMiLAog
CQkuYmFzZS5jcmFfcHJpb3JpdHkJPSAzMDAsCi0JCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9f
QUxHX0FTWU5DLAorCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQyB8IENSWVBU
T19BTEdfS0VSTl9EUklWRVJfT05MWSwKIAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IERFU19CTE9D
S19TSVpFLAogCQkuYmFzZS5jcmFfY3R4c2l6ZQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5cF9j
dHgpLAogCQkuYmFzZS5jcmFfYWxpZ25tYXNrCT0gMCwKQEAgLTIzOTYsNyArMjM5Niw3IEBAIHN0
YXRpYyBzdHJ1Y3Qgc2tjaXBoZXJfZW5naW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCQkuYmFz
ZS5jcmFfbmFtZQkJPSAiZWNiKGRlczNfZWRlKSIsCiAJCS5iYXNlLmNyYV9kcml2ZXJfbmFtZQk9
ICJzdG0zMi1lY2ItZGVzMyIsCiAJCS5iYXNlLmNyYV9wcmlvcml0eQk9IDMwMCwKLQkJLmJhc2Uu
Y3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMsCisJCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQ
VE9fQUxHX0FTWU5DIHwgQ1JZUFRPX0FMR19LRVJOX0RSSVZFUl9PTkxZLAogCQkuYmFzZS5jcmFf
YmxvY2tzaXplCT0gREVTX0JMT0NLX1NJWkUsCiAJCS5iYXNlLmNyYV9jdHhzaXplCT0gc2l6ZW9m
KHN0cnVjdCBzdG0zMl9jcnlwX2N0eCksCiAJCS5iYXNlLmNyYV9hbGlnbm1hc2sJPSAwLApAQCAt
MjQxOCw3ICsyNDE4LDcgQEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVfYWxnIGNyeXB0
b19hbGdzW10gPSB7CiAJCS5iYXNlLmNyYV9uYW1lCQk9ICJjYmMoZGVzM19lZGUpIiwKIAkJLmJh
c2UuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWNiYy1kZXMzIiwKIAkJLmJhc2UuY3JhX3ByaW9y
aXR5CT0gMzAwLAotCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJLmJh
c2UuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJVkVS
X09OTFksCiAJCS5iYXNlLmNyYV9ibG9ja3NpemUJPSBERVNfQkxPQ0tfU0laRSwKIAkJLmJhc2Uu
Y3JhX2N0eHNpemUJPSBzaXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2UuY3Jh
X2FsaWdubWFzawk9IDAsCkBAIC0yNDUyLDcgKzI0NTIsNyBAQCBzdGF0aWMgc3RydWN0IGFlYWRf
ZW5naW5lX2FsZyBhZWFkX2FsZ3NbXSA9IHsKIAkJLmNyYV9uYW1lCQk9ICJnY20oYWVzKSIsCiAJ
CS5jcmFfZHJpdmVyX25hbWUJPSAic3RtMzItZ2NtLWFlcyIsCiAJCS5jcmFfcHJpb3JpdHkJCT0g
MzAwLAotCQkuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMsCisJCS5jcmFfZmxhZ3MJCT0g
Q1JZUFRPX0FMR19BU1lOQyB8IENSWVBUT19BTEdfS0VSTl9EUklWRVJfT05MWSwKIAkJLmNyYV9i
bG9ja3NpemUJCT0gMSwKIAkJLmNyYV9jdHhzaXplCQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5
cF9jdHgpLAogCQkuY3JhX2FsaWdubWFzawkJPSAwLApAQCAtMjQ3NSw3ICsyNDc1LDcgQEAgc3Rh
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
