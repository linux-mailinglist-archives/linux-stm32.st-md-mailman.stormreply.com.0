Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 290778D1DF1
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 16:08:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E687DC6DD72;
	Tue, 28 May 2024 14:08:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8156C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 14:08:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SDhLnC025707;
 Tue, 28 May 2024 16:08:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WID1Xn8lAVeZgvgjfAvIZ5toir+39YNbyOYV1Sn5tIE=; b=iMdtq39PTNMpN5q0
 qF5bJ4MgHOGVhw1mZ69E37DDykQPYq78VRyRC8xOcDTIiHo8t1p5l7oZahTlfk0f
 62z7DDATzMDcsBvM9BD7OGFShvez3iYvQr5XabiKWFIxf1f0351qZxdZyFDmvnxd
 GoPFlJ3hA3qQASc8S351Qr8UAwzmTx6IN8L35oG2mTJ8HBYVxzGT1rhCD04nT8Q3
 Un5yiNA+05t0WBvnKJiWdURvtWfMNoYRiQhfDHpDPnRX1HTJLWWgH8tk29MRAEMF
 ZUoMTJzQW5S2qMI0c3XwQT+lqG3Z0Ree23XiH4o8uAVgvMLxRZfRL4i2crNBTggv
 eKlDiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yb9yjuyq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 16:08:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A0824004B;
 Tue, 28 May 2024 16:08:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D470621BF47;
 Tue, 28 May 2024 16:07:23 +0200 (CEST)
Received: from localhost (10.48.86.103) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 May
 2024 16:07:23 +0200
From: Maxime MERE <maxime.mere@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 28 May 2024 16:05:48 +0200
Message-ID: <20240528140548.1632562-5-maxime.mere@foss.st.com>
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
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 =?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 4/4] crypto: stm32/cryp - call finalize
	with bh disabled
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

RnJvbTogTWF4aW1lIE3DqXLDqSA8bWF4aW1lLm1lcmVAZm9zcy5zdC5jb20+CgpUaGUgZmluYWxp
emUgb3BlcmF0aW9uIGluIGludGVycnVwdCBtb2RlIHByb2R1Y2UgYSBwcm9kdWNlcyBhIHNwaW5s
b2NrCnJlY3Vyc2lvbiB3YXJuaW5nLiBUaGUgcmVhc29uIGlzIHRoZSBmYWN0IHRoYXQgQkggbXVz
dCBiZSBkaXNhYmxlZApkdXJpbmcgdGhpcyBwcm9jZXNzLgoKU2lnbmVkLW9mZi1ieTogTWF4aW1l
IE3DqXLDqSA8bWF4aW1lLm1lcmVAZm9zcy5zdC5jb20+Ci0tLQogZHJpdmVycy9jcnlwdG8vc3Rt
MzIvc3RtMzItY3J5cC5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0z
Mi1jcnlwLmMgYi9kcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMKaW5kZXggNDQ1Mjc2
Yjg0OGVkLi45MzdmNmRhYjg5NTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0
bTMyLWNyeXAuYworKysgYi9kcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1jcnlwLmMKQEAgLTEx
LDYgKzExLDcgQEAKICNpbmNsdWRlIDxjcnlwdG8vaW50ZXJuYWwvZGVzLmg+CiAjaW5jbHVkZSA8
Y3J5cHRvL2ludGVybmFsL3NrY2lwaGVyLmg+CiAjaW5jbHVkZSA8Y3J5cHRvL3NjYXR0ZXJ3YWxr
Lmg+CisjaW5jbHVkZSA8bGludXgvYm90dG9tX2hhbGYuaD4KICNpbmNsdWRlIDxsaW51eC9jbGsu
aD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5n
Lmg+CkBAIC0yMjAzLDggKzIyMDQsMTEgQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyX2NyeXBf
aXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICphcmcpCiAJCWl0X21hc2sgJj0gfklNU0NSX09VVDsK
IAlzdG0zMl9jcnlwX3dyaXRlKGNyeXAsIGNyeXAtPmNhcHMtPmltc2MsIGl0X21hc2spOwogCi0J
aWYgKCFjcnlwLT5wYXlsb2FkX2luICYmICFjcnlwLT5oZWFkZXJfaW4gJiYgIWNyeXAtPnBheWxv
YWRfb3V0KQorCWlmICghY3J5cC0+cGF5bG9hZF9pbiAmJiAhY3J5cC0+aGVhZGVyX2luICYmICFj
cnlwLT5wYXlsb2FkX291dCkgeworCQlsb2NhbF9iaF9kaXNhYmxlKCk7CiAJCXN0bTMyX2NyeXBf
ZmluaXNoX3JlcShjcnlwLCAwKTsKKwkJbG9jYWxfYmhfZW5hYmxlKCk7CisJfQogCiAJcmV0dXJu
IElSUV9IQU5ETEVEOwogfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
