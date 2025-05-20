Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A5ABDE1B
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 17:04:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 277CEC78F9B;
	Tue, 20 May 2025 15:04:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C3BBC78F99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 15:04:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDnjY0020033;
 Tue, 20 May 2025 17:04:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 E50xYFA31UxV2r8i4ZX3G+C/OQH/OeYpXAFoahXjSdE=; b=heNo7AI6keTGRoSg
 D6m4qP7hfRf4sjLajY1bZBtmQAKLlSqr84pVbZmMlXYbWbgdxI3MkyB86YGbAuA7
 M0IH+ZQfS9ME4C9Nu0qCeqNOMAlEdT/LWhH6JKwZ/rjIuCUOlFS5cri6xxms8j7e
 AAVQw5Zi8jWAhwG3rC52rZqrpUzdyNUTvxo5poX1bIyZ3oohmFaNX3HG7KaQMdOb
 tzErUdV6oHF0scfhPEADpNonY5pEGolWmWPIbck496E3SOwDyVkTMoEURiQ1Iq0O
 0WApu1uRhhgzsfse8o34U3xuSNNfXfu8nsXaHaS2q53/tP6LHpLXFMW91HkVIqJy
 vUt/HQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgnja2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 17:04:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51DB94005B;
 Tue, 20 May 2025 17:03:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 176B2B20B01;
 Tue, 20 May 2025 17:02:37 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:36 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 20 May 2025 17:02:34 +0200
MIME-Version: 1.0
Message-ID: <20250520-hdp-upstream-v2-7-53f6b8b5ffc8@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 7/8] ARM: dts: stm32: add alternate pinmux
 for HDP pin and add HDP pinctrl node
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

SW50cm9kdWNlIGhkcCBub2RlIHRvIG91dHB1dCBhIHVzZXIgZGVmaW5lZCB2YWx1ZSBvbiBwb3J0
IGhkcDIuCkFkZCBwaW5jdHJsIG5vZGVzIHRvIGJlIGFibGUgdG8gb3V0cHV0IHRoaXMgc2lnbmFs
IG9uIG9uZSBTb0MgcGluLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVt
ZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
bXAxNS1waW5jdHJsLmR0c2kgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxNS1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1w
MTUtcGluY3RybC5kdHNpCmluZGV4IDQwNjA1ZWE4NWVlMS4uNGEzMWU5ZjdhODk3IDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUtcGluY3RybC5kdHNpCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNS1waW5jdHJsLmR0c2kKQEAgLTUsNiArNSwxNCBA
QAogICovCiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMi1waW5mdW5jLmg+CiAK
KyZoZHAgeworCS9vbWl0LWlmLW5vLXJlZi8KKwloZHAyX2dwbzogaGRwMi1waW5zIHsKKwkJZnVu
Y3Rpb24gPSAiZ3BvdmFsMiI7CisJCXBpbnMgPSAiSERQMiI7CisJfTsKK307CisKICZwaW5jdHJs
IHsKIAkvb21pdC1pZi1uby1yZWYvCiAJYWRjMV9haW5fcGluc19hOiBhZGMxLWFpbi0wIHsKQEAg
LTczMSw2ICs3MzksMjMgQEAgcGlucyB7CiAJCX07CiAJfTsKIAorCS9vbWl0LWlmLW5vLXJlZi8K
KwloZHAyX3BpbnNfYTogaGRwMi0wIHsKKwkJcGlucyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElO
TVVYKCdFJywgMTMsIEFGMCk+OyAvKiBIRFAyICovCisJCQliaWFzLWRpc2FibGU7CisJCQlkcml2
ZS1wdXNoLXB1bGw7CisJCQlzbGV3LXJhdGUgPSA8Mj47CisJCX07CisJfTsKKworCS9vbWl0LWlm
LW5vLXJlZi8KKwloZHAyX3NsZWVwX3BpbnNfYTogaGRwMi1zbGVlcC0wIHsKKwkJcGlucyB7CisJ
CQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdFJywgMTMsIEFOQUxPRyk+OyAvKiBIRFAyICovCisJ
CX07CisJfTsKKwogCS9vbWl0LWlmLW5vLXJlZi8KIAlpMmMxX3BpbnNfYTogaTJjMS0wIHsKIAkJ
cGlucyB7CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
