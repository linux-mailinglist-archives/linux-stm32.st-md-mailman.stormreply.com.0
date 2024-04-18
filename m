Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6494E8A9D5E
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 16:44:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC0EC6DD94;
	Thu, 18 Apr 2024 14:44:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89611C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 14:44:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43IE6PO6030179; Thu, 18 Apr 2024 16:44:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=selector1; bh=vhAIipHO+m7PSgyeEztd
 ns8sMS1ah/Ng1G9Fc0eikUA=; b=ZtruPcUqXI8KB/V93yloOv7dlzaouJZyraYT
 sxfBYYIfb95wVhckrTuq/Y1ttHalUl9YciCN9LPyzHiz8jjQ5gUwf5AdqCCU1xLP
 5Zk8GstFdCE39aGAdPoe+P92c+Cpr7qeo6gzmodHdxCIzrKB+l7YuBkokUpsubAR
 0C+xeB87nTNaxgNGo7GWbPQOlKrK+UVDZXyqJbvWP8iYQZzFwnf0UCsm5uYHBxil
 vSQP34UfcreRf/IMsIwgPUv5DKZtQTyAdhZNCbuXsgbBhOTHG5/ebPzwkAxpJadM
 akj/TBv12HAoy0sRWyIIpQk0nZduW8CihbwicLUoqlBsppjtKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecym5dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Apr 2024 16:44:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 248FE40044;
 Thu, 18 Apr 2024 16:43:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37A4621ED2A;
 Thu, 18 Apr 2024 16:43:01 +0200 (CEST)
Received: from localhost (10.48.86.103) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 16:43:00 +0200
From: Maxime MERE <maxime.mere@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 18 Apr 2024 16:42:53 +0200
Message-ID: <20240418144256.3736800-1-maxime.mere@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_12,2024-04-17_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] crypto: stm32/cryp - Improve stm32-cryp
	driver
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
d28gcGF0Y2hlcyBhcmUgbmVlZGVkCnRvIGVuaGFuY2UgdGhlIGRyaXZlcidzIHZpc2liaWxpdHkg
Zm9yIFNUIHBsYXRmb3Jtcy4KCk1heGltZSBNw6lyw6kgKDMpOgogIGNyeXB0bzogc3RtMzIvY3J5
cCAtIHVzZSBkbWEgd2hlbiBwb3NzaWJsZS4KICBjcnlwdG86IHN0bTMyL2NyeXAgLSBpbmNyZWFz
ZSBwcmlvcml0eQogIGNyeXB0bzogc3RtMzIvY3J5cCAtIGFkZCBDUllQVE9fQUxHX0tFUk5fRFJJ
VkVSX09OTFkgZmxhZwoKIGRyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYyB8IDcyMiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2NzggaW5zZXJ0
aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
