Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B894AC22C2
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 14:40:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A3D1C7A833;
	Fri, 23 May 2025 12:40:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48CF6C7A830
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 12:40:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCZhFe031186;
 Fri, 23 May 2025 14:40:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VsJ9BwEz1wd8EF9lpOMOQsDImQr6kHRBw5n5nBd+jPE=; b=dSJFUzna92t/zgBC
 S1sp7Z+NOk3Y28GTkHoqUKNtjea80RjvD3W5VSgdBGo4+YykKCHZSI36sYk2q7kz
 lmVi+14ylO8SwY4MowMF3tZihvrRw4akokVt/ROu+fVCff1X/QB2aTBBBgw5Uvlp
 Tu8In8DePdxrQbL+iD6GCCmhKxqx4H1zcPsnby0x3aU7JWHauECZwMZ9wKppbwAZ
 Mz4VdbUwVbqPoeCHBc3UxdHWfJN9+P0qXSLPF+WWbrmNQSMeRwSq1mjd3/PdQ92G
 WanmUZ2ONX6zKRS7O3ZhLlGUSCVW064eGq0/nhO+QNJ9RDcmBLlyb48g/OE4IY0S
 8ZJQvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4e7u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 14:40:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2D57740055;
 Fri, 23 May 2025 14:39:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C44BEA0D6D9;
 Fri, 23 May 2025 14:38:27 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:27 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 23 May 2025 14:38:17 +0200
MIME-Version: 1.0
Message-ID: <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug
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

QWRkIHRoZSBoZHAgZGV2aWNldHJlZSBub2RlIGZvciBzdG0zMm1wMTMgU29DIGZhbWlseQoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEuZHRzaSB8IDYgKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3Qvc3RtMzJtcDEzMS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJt
cDEzMS5kdHNpCmluZGV4IDg1MTJhNmU0NmIzMy4uYjA1MzdiY2RiOWQ1IDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJtcDEzMS5kdHNpCkBAIC05NTEsNiArOTUxLDEyIEBAIGR0czogdGhlcm1hbEA1
MDAyODAwMCB7CiAJCQljbG9ja3MgPSA8JnJjYyBEVFM+OwogCQkJY2xvY2stbmFtZXMgPSAicGNs
ayI7CiAJCQkjdGhlcm1hbC1zZW5zb3ItY2VsbHMgPSA8MD47CisJCX07CisKKwkJaGRwOiBwaW5j
dHJsQDUwMDJhMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEzMS1oZHAiOworCQkJ
cmVnID0gPDB4NTAwMmEwMDAgMHg0MDA+OworCQkJY2xvY2tzID0gPCZyY2MgSERQPjsKIAkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
