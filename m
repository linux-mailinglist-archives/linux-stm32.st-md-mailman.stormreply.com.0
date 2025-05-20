Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C095ABDE23
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 17:04:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5B10C7A82D;
	Tue, 20 May 2025 15:04:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49888C78F99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 15:04:38 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KEwcAo005730;
 Tue, 20 May 2025 17:04:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 q1Xe+iFfoFaZmcBVvqZtaLKC4sE7WOeQvKFEpMrwsnw=; b=VVHhb1fPzD9GbMMj
 yl76tGZD/Gh/TCKkfrV3q4zny1IjXC36sWST2QdyPBCppzCW/AgIrZ4mDXg7K1hL
 711L6VXnPtD6kYTYprfgk8Jah15WKPPPj1EE9i99NdFUSuS5jpz4QrJqN7X0TPBg
 Y7N8qA+djA0uT9W9JepWnUmOeeYAo9TPxFz/ZY5pxDmSa5fJhcUfg2mwOJfLwuip
 a2/CtTLgSa58x+Ds7G1k3DpCUO/UYgiY08xgJBoQIdSPLz3PhEKLbHAiNabmJ8bk
 wlIdjQAZy+ve/89vnbshJx5aTcXHo5hUI74HtfbEy7UbZa8/K/vjbQ1e0Z6G4AX5
 3QX73Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46q41ebs5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 17:04:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5134540068;
 Tue, 20 May 2025 17:02:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A151B20AF1;
 Tue, 20 May 2025 17:02:36 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:36 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 20 May 2025 17:02:33 +0200
MIME-Version: 1.0
Message-ID: <20250520-hdp-upstream-v2-6-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/8] ARM: dts: stm32: add Hardware debug
 port (HDP) on stm32mp25
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

QWRkIHRoZSBoZHAgZGV2aWNldHJlZSBub2RlIGZvciBzdG0zMm1wMjUgU29DIGZhbWlseQoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIHwgNyArKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0
L3N0bTMybXAyNTEuZHRzaQppbmRleCA4NzExMGY5MWU0ODkuLjBmZDc5YWNkNDU4ZiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKQEAgLTkxNyw2ICs5MTcsMTMgQEAgcGFj
a2FnZV9vdHBAMWU4IHsKIAkJCX07CiAJCX07CiAKKwkJaGRwOiBwaW5jdHJsQDQ0MDkwMDAwIHsK
KwkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1MS1oZHAiOworCQkJcmVnID0gPDB4NDQwOTAw
MDAgMHg0MDA+OworCQkJY2xvY2tzID0gPCZyY2MgQ0tfQlVTX0hEUD47CisJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOworCQl9OworCiAJCXJjYzogY2xvY2stY29udHJvbGxlckA0NDIwMDAwMCB7CiAJ
CQljb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1yY2MiOwogCQkJcmVnID0gPDB4NDQyMDAwMDAg
MHgxMDAwMD47CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
