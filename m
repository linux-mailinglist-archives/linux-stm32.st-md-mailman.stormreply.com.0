Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE88D1DE0
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 16:07:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A22A5C6C855;
	Tue, 28 May 2024 14:07:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DBC6CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 14:07:14 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SDR8wI010710;
 Tue, 28 May 2024 16:06:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=TBFeaRVOwuBL7TVI4j/ZaW
 iGYwaVC/tbXpkAWdf9bPE=; b=ziBpEmvrFGtLYCAW9omokSfNYI19n7bX+cEdn7
 YEKS4p4/e4uhugDPPzE1ujj9T/k1YTL0+PpvTKZKkyNl2bbVbdNd7VAOhEHlU7rQ
 umPo475zPwDUNYyZFuBwPGv6sUPfjz06aqViiYOjAIlAcuS9qfPKIEyPEA+C4yDb
 TqebbY8I25yIaZvU2hd26huTcVYfP5K0H7XqtWrDwLWlfS/Dg91uMkUH/CgYtG8n
 EOHHry/S2RL3PZ0zXcD5yfzT52HvFgjn6Twd4Mo1GINxxCwlbIaJxr+dKTqknfO9
 kq6D5f6SYNCIfBRaiR5PBMbGwBm9NFSRfhA95rY324fyXkgQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ybsj0jdd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 16:06:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BD71D40045;
 Tue, 28 May 2024 16:06:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADC2A21B53C;
 Tue, 28 May 2024 16:06:10 +0200 (CEST)
Received: from localhost (10.48.86.103) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 May
 2024 16:06:10 +0200
From: Maxime MERE <maxime.mere@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 28 May 2024 16:05:44 +0200
Message-ID: <20240528140548.1632562-1-maxime.mere@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 =?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] crypto: stm32/cryp - Improve
	stm32-cryp driver
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

RnJvbTogTWF4aW1lIE3DqXLDqSA8bWF4aW1lLm1lcmVAZm9zcy5zdC5jb20+CgpUaGlzIHNlcmll
cyBvZiBwYXRjaGVzIG1haW5seSBhaW1zIHRvIGltcHJvdmUgdGhlIHVzYWdlIG9mIERNQSB3aXRo
IHRoZQpDUllQIHBlcmlwaGVyYWwgb2YgdGhlIFNUTTMyIE1QVSBzZXJpZXMuIFRoZSBvdGhlciB0
d28gcGF0Y2hlcyBhcmUKbmVlZGVkIHRvIGVuaGFuY2UgdGhlIGRyaXZlcidzIHZpc2liaWxpdHkg
Zm9yIFNUIHBsYXRmb3Jtcy4KClRoaXMgcGF0Y2hzZXQgdmVyc2lvbiAzIGFkZHJlc3NlcyB0aGUg
aXNzdWVzIGlkZW50aWZpZWQgYnkgSGVyYmVydC4KVGhlIGNvZGUgdGhhdCByYWlzZWQgYSB3YXJu
aW5nIHdhcyBpbiBmYWN0IHVzZWxlc3MgYXMgdGhlcmUgaXMgYWxyZWFkeQphbiBvdmVyZmxvdyBj
aGVjayBpbiB0aGUgInN0bTMyX2NyeXBfZG1hX2NoZWNrIiBmdW5jdGlvbiBzbyBJIHJlbW92ZWQK
aXQuCgpJJ3ZlIGFsc28gYWRkZWQgYSBuZXcgcGF0Y2ggdGhhdCBjb3JyZWN0IGEgc3BpbmxvY2sg
cmVjdXJzaW9uIHdhcm5pbmcuCgpNYXhpbWUgTcOpcsOpICg0KToKICBjcnlwdG86IHN0bTMyL2Ny
eXAgLSB1c2UgZG1hIHdoZW4gcG9zc2libGUuCiAgY3J5cHRvOiBzdG0zMi9jcnlwIC0gaW5jcmVh
c2UgcHJpb3JpdHkKICBjcnlwdG86IHN0bTMyL2NyeXAgLSBhZGQgQ1JZUFRPX0FMR19LRVJOX0RS
SVZFUl9PTkxZIGZsYWcKICBjcnlwdG86IHN0bTMyL2NyeXAgLSBjYWxsIGZpbmFsaXplIHdpdGgg
YmggZGlzYWJsZWQKCiBkcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMgfCA3MTkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNjc0IGluc2VydGlv
bnMoKyksIDQ1IGRlbGV0aW9ucygtKQoKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
