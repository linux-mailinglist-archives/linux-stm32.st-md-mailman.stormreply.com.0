Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6151CA4381B
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 09:52:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11883C78F9C;
	Tue, 25 Feb 2025 08:52:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E239C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 08:52:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7sKDe025535;
 Tue, 25 Feb 2025 09:52:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qshWsQ62zn+WBqylxlNNYzQrO9nvJuXPz/RW+NlbInI=; b=OobzFqHwO918AGM1
 cBTd87yWWmntg6r2Wv0VD04NrPthmT7TVY/qtxFxsCGOhuEHe5d9PCr2S5UK2JsI
 OK5GYxPxCePUV6K5lkYspI7CW0a9AZWLo5unIfnUvnmPzjaXT8kzEiZV9Yzb0zAk
 0aehEflp28CWSh/2y3YS89Ek04/K8nbkrBYqkubU6JZwPyrDkReyPlDwLBJao0t0
 uy5nwJOvRebLukuz7/DsdXI3TC6aIE27tExhHFFzUTHJckNAatYbnIpzN1sz5V5l
 kwi94Jm1IuUJs8wUibReOAwRildp1ZZeO3ZG8maKilqs35BPOY66EIyXsj6QTZ8f
 OLTgDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spstfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 09:52:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BDBD64005E;
 Tue, 25 Feb 2025 09:50:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCCBD47A7D4;
 Tue, 25 Feb 2025 09:48:11 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:11 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:07 +0100
MIME-Version: 1.0
Message-ID: <20250225-hdp-upstream-v1-8-9d049c65330a@foss.st.com>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
In-Reply-To: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-42535
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/9] ARM: dts: stm32: add alternate pinmux for
 HDP pin and add HDP pinctrl node
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
bXAxNS1waW5jdHJsLmR0c2kgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMm1wMTUtcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJt
cDE1LXBpbmN0cmwuZHRzaQppbmRleCA5NWZhZmM1MWExYzguLjc2ZmYwZDY2MzRiNCAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaQorKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUtcGluY3RybC5kdHNpCkBAIC00LDYgKzQsMTUg
QEAKICAqIEF1dGhvcjogTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJyZUBzdC5jb20+IGZvciBT
VE1pY3JvZWxlY3Ryb25pY3MuCiAgKi8KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3N0
bTMyLXBpbmZ1bmMuaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMybXAxNS1o
ZHAuaD4KKworJmhkcCB7CisJL29taXQtaWYtbm8tcmVmLworCWhkcDJfZ3BvOiBoZHAyLXBpbnMg
eworCQlmdW5jdGlvbiA9IEhEUDJfR1BPVkFMXzI7CisJCXBpbnMgPSAiaGRwMiI7CisJfTsKK307
CiAKICZwaW5jdHJsIHsKIAkvb21pdC1pZi1uby1yZWYvCkBAIC02ODcsNiArNjk2LDIzIEBAIHBp
bnMgewogCQl9OwogCX07CiAKKwkvb21pdC1pZi1uby1yZWYvCisJaGRwMl9waW5zX2E6IGhkcDIt
MCB7CisJCXBpbnMgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRScsIDEzLCBBRjApPjsg
LyogSERQMiAqLworCQkJYmlhcy1kaXNhYmxlOworCQkJZHJpdmUtcHVzaC1wdWxsOworCQkJc2xl
dy1yYXRlID0gPDI+OworCQl9OworCX07CisKKwkvb21pdC1pZi1uby1yZWYvCisJaGRwMl9zbGVl
cF9waW5zX2E6IGhkcDItc2xlZXAtMCB7CisJCXBpbnMgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJ
Tk1VWCgnRScsIDEzLCBBTkFMT0cpPjsgLyogSERQMiAqLworCQl9OworCX07CisKIAkvb21pdC1p
Zi1uby1yZWYvCiAJaTJjMV9waW5zX2E6IGkyYzEtMCB7CiAJCXBpbnMgewoKLS0gCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
