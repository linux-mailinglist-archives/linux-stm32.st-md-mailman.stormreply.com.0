Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F0EAC6A7F
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 15:33:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96260C36B38;
	Wed, 28 May 2025 13:33:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C29A9C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 13:33:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SC8uDe028907;
 Wed, 28 May 2025 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 R4Em2WOCtNmZnECHj9cB8orbqHwuCdEzrhZKZaFoeaU=; b=baW+lHSG6gqHQtNc
 WioG13qng65SbE66I+iN7vtV2Bfhy7OpljEHKFm9tgq5sEfkke044NNyjCqszh0h
 oinxydP5M3D8WElRd9PfrGJtwa94KGvlr8w8PW56fljMYLnbcSE0eFa2ityk5EgZ
 9D+2+qDvj8yYv7YPhwfWpKuP6Q+w2zFWPx8u2Ci4vzIr+fymwJxgHYJWQ13k/U5B
 6vr5EQ/SzM7CWdZdj9Yar6cpwngbaTLU152SYi7fEkloqEBHsXz4YTDGPjso0Jcy
 jzWcrlLUjcTMwBxjtIVc4ruM59sXMA2AO0zcFp1+bjIr6oGqRdW2+MDBDJetZJLD
 PUpSXg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3891qv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 15:33:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CA49F4005C;
 Wed, 28 May 2025 15:31:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0326E6CCEFD;
 Wed, 28 May 2025 15:31:07 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:31:06 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:31:02 +0200
MIME-Version: 1.0
Message-ID: <20250528-hdp-upstream-v4-9-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 9/9] ARM: dts: stm32: add Hardware debug
 port (HDP) on stm32mp157c-dk2 board
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

T24gdGhlIHN0bTMybXAxNTdmYy1kazIgYm9hcmQsIHdlIGNhbiBvYnNlcnZlIHRoZSBoZHAgR1BP
VkFMIGZ1bmN0aW9uIG9uClNvQyBwaW4gRTEzIGFjY2Vzc2libGUgb24gdGhlIHBpbiA1IG9uIHRo
ZSBBcmR1aW5vIGNvbm5lY3RvciBDTjEzLgpBZGQgdGhlIHJlbGV2YW50IGNvbmZpZ3VyYXRpb24g
YnV0IGtlZXAgaXQgZGlzYWJsZWQgYXMgaXQncyB1c2VkIGZvcgpkZWJ1ZyBvbmx5LgoKU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29t
PgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMgfCA2ICsrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTU3Yy1kazIuZHRzCmluZGV4IDMyNGY3YmI5ODhkMS4uOGE4ZmRmMzM4ZDFkIDEwMDY0
NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1kazIuZHRzCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMKQEAgLTYzLDYgKzYzLDEyIEBA
ICZkc2lfb3V0IHsKIAlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luPjsKIH07CiAKKyZoZHAg
eworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CisJcGluY3RybC0wID0gPCZo
ZHAyX2dwbyAmaGRwMl9waW5zX2E+OworCXBpbmN0cmwtMSA9IDwmaGRwMl9zbGVlcF9waW5zX2E+
OworfTsKKwogJmkyYzEgewogCXRvdWNoc2NyZWVuQDM4IHsKIAkJY29tcGF0aWJsZSA9ICJmb2Nh
bHRlY2gsZnQ2MjM2IjsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
