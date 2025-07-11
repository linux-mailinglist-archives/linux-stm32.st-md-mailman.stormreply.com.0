Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3EDB014E8
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 09:43:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2395C3F932;
	Fri, 11 Jul 2025 07:43:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65E91C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 07:43:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B6d1H1005183;
 Fri, 11 Jul 2025 09:43:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 soCA1TZ0DhY5YcbIv8yTONB+anARgZKgPRV/EvTfcRg=; b=U5tJqTX58u5gclYU
 gZP8ypa6Es0JxUubJoRquJEJZhTgwwqn/S2Q7JIK9Tr8yA9103NebQbDu4YDIYly
 gpWSkWyI1shezADYrcoNo35UTuM4rFpNjNpHYCr27uFuj8xlQXc0Tex04Zt4ytfE
 5LuntdNu+QY4/0ZPIQBN3E/uxon2WKTPPOD4cOG1sgxVquWibD+f4FvRtzmUV8x+
 UeccT6J7Zo1UoREI6hWjvWgOvlhzvBrVNZamt4upCmyVjX/vTRligvWSvnQxBUVV
 hZa4EsxkmijI4SnHgV4FJnIYvOoK3Xvh48rNPb5Gl2dQsA6kEop0OBPJ9FgRWkxw
 TX/4MA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3ne8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 09:43:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BAE1D40050;
 Fri, 11 Jul 2025 09:42:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55C8DB157CA;
 Fri, 11 Jul 2025 09:41:43 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:43 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 09:41:25 +0200
MIME-Version: 1.0
Message-ID: <20250711-hdp-upstream-v7-7-faeecf7aaee1@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v7 7/8] ARM: dts: stm32: add alternate pinmux
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
IG9uIG9uZSBTb0MgcGluLgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50
LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NS1waW5jdHJsLmR0c2kgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxNS1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUt
cGluY3RybC5kdHNpCmluZGV4IDQwNjA1ZWE4NWVlMS4uNGEzMWU5ZjdhODk3IDEwMDY0NAotLS0g
YS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUtcGluY3RybC5kdHNpCisrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNS1waW5jdHJsLmR0c2kKQEAgLTUsNiArNSwxNCBAQAog
ICovCiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMi1waW5mdW5jLmg+CiAKKyZo
ZHAgeworCS9vbWl0LWlmLW5vLXJlZi8KKwloZHAyX2dwbzogaGRwMi1waW5zIHsKKwkJZnVuY3Rp
b24gPSAiZ3BvdmFsMiI7CisJCXBpbnMgPSAiSERQMiI7CisJfTsKK307CisKICZwaW5jdHJsIHsK
IAkvb21pdC1pZi1uby1yZWYvCiAJYWRjMV9haW5fcGluc19hOiBhZGMxLWFpbi0wIHsKQEAgLTcz
MSw2ICs3MzksMjMgQEAgcGlucyB7CiAJCX07CiAJfTsKIAorCS9vbWl0LWlmLW5vLXJlZi8KKwlo
ZHAyX3BpbnNfYTogaGRwMi0wIHsKKwkJcGlucyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVY
KCdFJywgMTMsIEFGMCk+OyAvKiBIRFAyICovCisJCQliaWFzLWRpc2FibGU7CisJCQlkcml2ZS1w
dXNoLXB1bGw7CisJCQlzbGV3LXJhdGUgPSA8Mj47CisJCX07CisJfTsKKworCS9vbWl0LWlmLW5v
LXJlZi8KKwloZHAyX3NsZWVwX3BpbnNfYTogaGRwMi1zbGVlcC0wIHsKKwkJcGlucyB7CisJCQlw
aW5tdXggPSA8U1RNMzJfUElOTVVYKCdFJywgMTMsIEFOQUxPRyk+OyAvKiBIRFAyICovCisJCX07
CisJfTsKKwogCS9vbWl0LWlmLW5vLXJlZi8KIAlpMmMxX3BpbnNfYTogaTJjMS0wIHsKIAkJcGlu
cyB7CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
