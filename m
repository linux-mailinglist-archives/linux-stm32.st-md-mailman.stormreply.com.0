Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD28A9D5D
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 16:44:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FCEBC6DD6D;
	Thu, 18 Apr 2024 14:44:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16546C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 14:44:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43I9ZrBH012295; Thu, 18 Apr 2024 16:43:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=
 selector1; bh=6NIHXnPi2/F1Fg1UZ+58Nla4m2nGFD2Orsz8Fiuy0lU=; b=tf
 9UAxTVCQ34SJRJhZFeA0c/7GSc5sytw5pB1n/I0UqO+8bJ30EbETwuk4yildqC1X
 6ghftpvefU0Grr21G50z+H5XBEkjz1mf80KOADBZBCMCHjyCjWJ8M8BDhZM45iJM
 vqUwJoLxpRTp2Uv18Wmf5bxyPdMJ0t3G5Sv2aa0Xhf/8rQYPcjpmey2I/ZV3EGuR
 ez8Fp/wbMGqRG9qEuO0SrhjnaFsg21TCTPbSABZNxQQIPblqo+9vQ5TVzG3VbUVg
 X+4U55SGwWlF/gx722I8pafTGWVLWOE0lBIGqqXXXHNzV+h5YdYlHTtlXpLE/fYV
 ieDOc5G45d9L4lTWQCug==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xffffre01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Apr 2024 16:43:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 24A0E40046;
 Thu, 18 Apr 2024 16:43:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF974221951;
 Thu, 18 Apr 2024 16:43:03 +0200 (CEST)
Received: from localhost (10.48.86.103) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 16:43:03 +0200
From: Maxime MERE <maxime.mere@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 18 Apr 2024 16:42:56 +0200
Message-ID: <20240418144256.3736800-4-maxime.mere@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418144256.3736800-1-maxime.mere@foss.st.com>
References: <20240418144256.3736800-1-maxime.mere@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_12,2024-04-17_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] crypto: stm32/cryp - add
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
cHRvZGV2LgoKU2lnbmVkLW9mZi1ieTogTWF4aW1lIE3DqXLDqSA8bWF4aW1lLm1lcmVAZm9zcy5z
dC5jb20+Ci0tLQogZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItY3J5cC5jIHwgMTggKysrKysr
KysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYyBiL2Ry
aXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYwppbmRleCA0NDgwZDBlNTIyNjAuLjU2Nzll
YTEwMzJhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItY3J5cC5jCisr
KyBiL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYwpAQCAtMjI5Miw3ICsyMjkyLDcg
QEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVfYWxnIGNyeXB0b19hbGdzW10gPSB7CiAJ
CS5iYXNlLmNyYV9uYW1lCQk9ICJlY2IoYWVzKSIsCiAJCS5iYXNlLmNyYV9kcml2ZXJfbmFtZQk9
ICJzdG0zMi1lY2ItYWVzIiwKIAkJLmJhc2UuY3JhX3ByaW9yaXR5CT0gMzAwLAotCQkuYmFzZS5j
cmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJLmJhc2UuY3JhX2ZsYWdzCQk9IENSWVBU
T19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJVkVSX09OTFksCiAJCS5iYXNlLmNyYV9i
bG9ja3NpemUJPSBBRVNfQkxPQ0tfU0laRSwKIAkJLmJhc2UuY3JhX2N0eHNpemUJPSBzaXplb2Yo
c3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2UuY3JhX2FsaWdubWFzawk9IDAsCkBAIC0y
MzE0LDcgKzIzMTQsNyBAQCBzdGF0aWMgc3RydWN0IHNrY2lwaGVyX2VuZ2luZV9hbGcgY3J5cHRv
X2FsZ3NbXSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0gImNiYyhhZXMpIiwKIAkJLmJhc2UuY3Jh
X2RyaXZlcl9uYW1lCT0gInN0bTMyLWNiYy1hZXMiLAogCQkuYmFzZS5jcmFfcHJpb3JpdHkJPSAz
MDAsCi0JCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5DLAorCQkuYmFzZS5jcmFf
ZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQyB8IENSWVBUT19BTEdfS0VSTl9EUklWRVJfT05MWSwK
IAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IEFFU19CTE9DS19TSVpFLAogCQkuYmFzZS5jcmFfY3R4
c2l6ZQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5cF9jdHgpLAogCQkuYmFzZS5jcmFfYWxpZ25t
YXNrCT0gMCwKQEAgLTIzMzcsNyArMjMzNyw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tjaXBoZXJfZW5n
aW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCQkuYmFzZS5jcmFfbmFtZQkJPSAiY3RyKGFlcyki
LAogCQkuYmFzZS5jcmFfZHJpdmVyX25hbWUJPSAic3RtMzItY3RyLWFlcyIsCiAJCS5iYXNlLmNy
YV9wcmlvcml0eQk9IDMwMCwKLQkJLmJhc2UuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZTkMs
CisJCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5DIHwgQ1JZUFRPX0FMR19LRVJO
X0RSSVZFUl9PTkxZLAogCQkuYmFzZS5jcmFfYmxvY2tzaXplCT0gMSwKIAkJLmJhc2UuY3JhX2N0
eHNpemUJPSBzaXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2UuY3JhX2FsaWdu
bWFzawk9IDAsCkBAIC0yMzYwLDcgKzIzNjAsNyBAQCBzdGF0aWMgc3RydWN0IHNrY2lwaGVyX2Vu
Z2luZV9hbGcgY3J5cHRvX2FsZ3NbXSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0gImVjYihkZXMp
IiwKIAkJLmJhc2UuY3JhX2RyaXZlcl9uYW1lCT0gInN0bTMyLWVjYi1kZXMiLAogCQkuYmFzZS5j
cmFfcHJpb3JpdHkJPSAzMDAsCi0JCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5D
LAorCQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQyB8IENSWVBUT19BTEdfS0VS
Tl9EUklWRVJfT05MWSwKIAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IERFU19CTE9DS19TSVpFLAog
CQkuYmFzZS5jcmFfY3R4c2l6ZQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5cF9jdHgpLAogCQku
YmFzZS5jcmFfYWxpZ25tYXNrCT0gMCwKQEAgLTIzODIsNyArMjM4Miw3IEBAIHN0YXRpYyBzdHJ1
Y3Qgc2tjaXBoZXJfZW5naW5lX2FsZyBjcnlwdG9fYWxnc1tdID0gewogCQkuYmFzZS5jcmFfbmFt
ZQkJPSAiY2JjKGRlcykiLAogCQkuYmFzZS5jcmFfZHJpdmVyX25hbWUJPSAic3RtMzItY2JjLWRl
cyIsCiAJCS5iYXNlLmNyYV9wcmlvcml0eQk9IDMwMCwKLQkJLmJhc2UuY3JhX2ZsYWdzCQk9IENS
WVBUT19BTEdfQVNZTkMsCisJCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5DIHwg
Q1JZUFRPX0FMR19LRVJOX0RSSVZFUl9PTkxZLAogCQkuYmFzZS5jcmFfYmxvY2tzaXplCT0gREVT
X0JMT0NLX1NJWkUsCiAJCS5iYXNlLmNyYV9jdHhzaXplCT0gc2l6ZW9mKHN0cnVjdCBzdG0zMl9j
cnlwX2N0eCksCiAJCS5iYXNlLmNyYV9hbGlnbm1hc2sJPSAwLApAQCAtMjQwNSw3ICsyNDA1LDcg
QEAgc3RhdGljIHN0cnVjdCBza2NpcGhlcl9lbmdpbmVfYWxnIGNyeXB0b19hbGdzW10gPSB7CiAJ
CS5iYXNlLmNyYV9uYW1lCQk9ICJlY2IoZGVzM19lZGUpIiwKIAkJLmJhc2UuY3JhX2RyaXZlcl9u
YW1lCT0gInN0bTMyLWVjYi1kZXMzIiwKIAkJLmJhc2UuY3JhX3ByaW9yaXR5CT0gMzAwLAotCQku
YmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJLmJhc2UuY3JhX2ZsYWdzCQk9
IENSWVBUT19BTEdfQVNZTkMgfCBDUllQVE9fQUxHX0tFUk5fRFJJVkVSX09OTFksCiAJCS5iYXNl
LmNyYV9ibG9ja3NpemUJPSBERVNfQkxPQ0tfU0laRSwKIAkJLmJhc2UuY3JhX2N0eHNpemUJPSBz
aXplb2Yoc3RydWN0IHN0bTMyX2NyeXBfY3R4KSwKIAkJLmJhc2UuY3JhX2FsaWdubWFzawk9IDAs
CkBAIC0yNDI3LDcgKzI0MjcsNyBAQCBzdGF0aWMgc3RydWN0IHNrY2lwaGVyX2VuZ2luZV9hbGcg
Y3J5cHRvX2FsZ3NbXSA9IHsKIAkJLmJhc2UuY3JhX25hbWUJCT0gImNiYyhkZXMzX2VkZSkiLAog
CQkuYmFzZS5jcmFfZHJpdmVyX25hbWUJPSAic3RtMzItY2JjLWRlczMiLAogCQkuYmFzZS5jcmFf
cHJpb3JpdHkJPSAzMDAsCi0JCS5iYXNlLmNyYV9mbGFncwkJPSBDUllQVE9fQUxHX0FTWU5DLAor
CQkuYmFzZS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQyB8IENSWVBUT19BTEdfS0VSTl9E
UklWRVJfT05MWSwKIAkJLmJhc2UuY3JhX2Jsb2Nrc2l6ZQk9IERFU19CTE9DS19TSVpFLAogCQku
YmFzZS5jcmFfY3R4c2l6ZQk9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfY3J5cF9jdHgpLAogCQkuYmFz
ZS5jcmFfYWxpZ25tYXNrCT0gMCwKQEAgLTI0NjEsNyArMjQ2MSw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
YWVhZF9lbmdpbmVfYWxnIGFlYWRfYWxnc1tdID0gewogCQkuY3JhX25hbWUJCT0gImdjbShhZXMp
IiwKIAkJLmNyYV9kcml2ZXJfbmFtZQk9ICJzdG0zMi1nY20tYWVzIiwKIAkJLmNyYV9wcmlvcml0
eQkJPSAzMDAsCi0JCS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQywKKwkJLmNyYV9mbGFn
cwkJPSBDUllQVE9fQUxHX0FTWU5DIHwgQ1JZUFRPX0FMR19LRVJOX0RSSVZFUl9PTkxZLAogCQku
Y3JhX2Jsb2Nrc2l6ZQkJPSAxLAogCQkuY3JhX2N0eHNpemUJCT0gc2l6ZW9mKHN0cnVjdCBzdG0z
Ml9jcnlwX2N0eCksCiAJCS5jcmFfYWxpZ25tYXNrCQk9IDAsCkBAIC0yNDg0LDcgKzI0ODQsNyBA
QCBzdGF0aWMgc3RydWN0IGFlYWRfZW5naW5lX2FsZyBhZWFkX2FsZ3NbXSA9IHsKIAkJLmNyYV9u
YW1lCQk9ICJjY20oYWVzKSIsCiAJCS5jcmFfZHJpdmVyX25hbWUJPSAic3RtMzItY2NtLWFlcyIs
CiAJCS5jcmFfcHJpb3JpdHkJCT0gMzAwLAotCQkuY3JhX2ZsYWdzCQk9IENSWVBUT19BTEdfQVNZ
TkMsCisJCS5jcmFfZmxhZ3MJCT0gQ1JZUFRPX0FMR19BU1lOQyB8IENSWVBUT19BTEdfS0VSTl9E
UklWRVJfT05MWSwKIAkJLmNyYV9ibG9ja3NpemUJCT0gMSwKIAkJLmNyYV9jdHhzaXplCQk9IHNp
emVvZihzdHJ1Y3Qgc3RtMzJfY3J5cF9jdHgpLAogCQkuY3JhX2FsaWdubWFzawkJPSAwLAotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
