Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF5CB014F1
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 09:44:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49EBFC3F933;
	Fri, 11 Jul 2025 07:44:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04B01C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 07:44:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B59Vu0019846;
 Fri, 11 Jul 2025 09:43:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Cp2gFOEZRolrC1cu3ilAyN1wQaeSGonjrUSYtHJ5W+g=; b=K6gWwSiYbNkqYpoa
 QYaAjGONUeFIayYu742y4olXGmzwIVN13jSSfkHzPJzTuVv81cSxnGgDLCYyf5xb
 9DEE25tJGeC1QVTRi0LJULrDnufmHv71k4Kzah3QRXgkMjK4TW/OW+OHbII10Nft
 PvJdMrfPssdval11VsaN2vIlrk4rL6h4dWfnOh5JlpsxIVNK7vlU2VaVFwYtMv02
 vrq2J87SlIzR0Jmx9JbABjeGvXwX1DAfCvgMSskXVrur8ePogU+HYyqRdoWkd/up
 uQNi/bR/3AZgk/fmcxlil8cYhGL/+UOYAMMKF2dEL0cRlAoZOTpyB2muESCJ3rtZ
 M5GGGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3ne9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 09:43:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A00494004D;
 Fri, 11 Jul 2025 09:42:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99ACBB157C6;
 Fri, 11 Jul 2025 09:41:40 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:40 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 09:41:22 +0200
MIME-Version: 1.0
Message-ID: <20250711-hdp-upstream-v7-4-faeecf7aaee1@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v7 4/8] ARM: dts: stm32: add Hardware debug
 port (HDP) on stm32mp13
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

QWRkIHRoZSBoZHAgZGV2aWNldHJlZSBub2RlIGZvciBzdG0zMm1wMTMgU29DIGZhbWlseS4KCktl
ZXAgdGhlIG5vZGUgZGlzYWJsZWQgYXMgSERQIG5lZWRzIHRoZSBwaW5jdHJsIFNvQyBjb25maWd1
cmF0aW9uIHRvIGJlCmFibGUgdG8gb3V0cHV0IGl0cyBtdXggb3V0cHV0IHNpZ25hbCBvdXRzaWRl
IG9mIHRoZSBTb0MsIG9uIHRoZSBTb0MgcGFkLgpUaGlzIGNvbmZpZ3VyYXRpb24gaXMgcHJvdmlk
ZWQgaW4gdGhlIGJvYXJkIGR0c2kgZmlsZSB0aHJvdWdoICdwaW5jdHJsLSonCnByb3BlcnRpZXMg
YXMgd2VsbCBhcyBIRFAgbXV4IGNvbmZpZ3VyYXRpb24uClRodXMsIGlmIG5lZWRlZCwgSERQIHNo
b3VsZCBiZSBlbmFibGVkIGluIGJvYXJkIGR0c2kgZmlsZS4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTMxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kKaW5kZXgg
NDkyYmNmNTg2MzYxLi43NTE5ZmZhMGRiYTggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxMzEuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMx
LmR0c2kKQEAgLTk1NCw2ICs5NTQsMTMgQEAgZHRzOiB0aGVybWFsQDUwMDI4MDAwIHsKIAkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKKwkJaGRwOiBwaW5jdHJsQDUwMDJhMDAwIHsKKwkJ
CWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEzMS1oZHAiOworCQkJcmVnID0gPDB4NTAwMmEwMDAg
MHg0MDA+OworCQkJY2xvY2tzID0gPCZyY2MgSERQPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CisJCX07CisKIAkJbWRtYTogZG1hLWNvbnRyb2xsZXJANTgwMDAwMDAgewogCQkJY29tcGF0aWJs
ZSA9ICJzdCxzdG0zMmg3LW1kbWEiOwogCQkJcmVnID0gPDB4NTgwMDAwMDAgMHgxMDAwPjsKCi0t
IAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
