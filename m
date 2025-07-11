Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A37B014EA
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 09:43:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14613C3F93C;
	Fri, 11 Jul 2025 07:43:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75C0EC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 07:43:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B3ZEgs001305;
 Fri, 11 Jul 2025 09:43:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KMUGHm3QVTRF55PjM41tSNEI5PAu4F3il2UUUVh0avs=; b=WFVONt4CaPQkNTti
 Us4a9bN7b7BIAGETF4wcyDC4/yIsPMXfQqS8XvjvjfP5OcF+oG6J1yoNG/Y1VBl4
 8BbQIy2O/2LR2rTSpMbg3BG9ejFKaxcAWlE9X7dSlypQWLVJ38//gf7ncqoLTDW/
 rcDRsT5F34SvdYcOUz2OnxuQjWj4oemODrGqj4gRMclQc4Qu7/Q6vx2CNIRDICT0
 Ko0fZ+nOoShL0nRR6bqvjQEOHLqwPooKbVzrB//j3UsPj4UPeuRIbYldP6i7iPzE
 SO4rAHukVpJXaRxvdjmhZgFxT6gDMKipAtAofEF1DnT2o3eCYdp4ziFcurfAeLVJ
 dsR2EQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3ne8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 09:43:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CB6E240052;
 Fri, 11 Jul 2025 09:42:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B07B5B14190;
 Fri, 11 Jul 2025 09:41:39 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:40 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 09:41:21 +0200
MIME-Version: 1.0
Message-ID: <20250711-hdp-upstream-v7-3-faeecf7aaee1@foss.st.com>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] =?utf-8?q?=5BPATCH_v7_3/8=5D_MAINTAINERS=3A_add_Cl?=
 =?utf-8?q?=C3=A9ment_Le_Goffic_as_STM32_HDP_maintainer?=
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

QWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0zMiBIRFAgbWFpbnRhaW5lci4KClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4K
LS0tCiBNQUlOVEFJTkVSUyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA4YWZjOTlk
NDI4NGQuLmQ3N2EzNjQxMTMwYSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRB
SU5FUlMKQEAgLTIzNDYwLDYgKzIzNDYwLDEyIEBAIEY6CWRyaXZlcnMvYnVzL3N0bTMyX2V0enBj
LmMKIEY6CWRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKIEY6CWRyaXZlcnMvYnVzL3N0bTMy
X3JpZnNjLmMKIAorU1QgU1RNMzIgSERQIFBJTkNUUkwgRFJJVkVSCitNOglDbMOpbWVudCBMZSBH
b2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgorUzoJTWFpbnRhaW5lZAorRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItaGRwLnlhbWwK
K0Y6CWRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jCisKIFNUIFNUTTMy
IEkyQy9TTUJVUyBEUklWRVIKIE06CVBpZXJyZS1ZdmVzIE1PUkRSRVQgPHBpZXJyZS15dmVzLm1v
cmRyZXRAZm9zcy5zdC5jb20+CiBNOglBbGFpbiBWb2xtYXQgPGFsYWluLnZvbG1hdEBmb3NzLnN0
LmNvbT4KCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
