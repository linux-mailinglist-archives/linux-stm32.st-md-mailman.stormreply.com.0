Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FDA43822
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 09:52:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85A6BC7A84E;
	Tue, 25 Feb 2025 08:52:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96F03C7A83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 08:52:14 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7lqXB000766;
 Tue, 25 Feb 2025 09:52:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LaAawBxHrP/Zdl9CUAAHINe2LNOs/APWLWxG/IaBMvI=; b=iigsMeMhVW4+XeWU
 q/U4Khvug/WntIoxjtV5zrIyYKIbHnuML8JdrRkA9jcmSANpIa3P81JPXPAlPsZS
 XEx0gv5ULsfiKEdDsB9aSXrSi4N1EiEtyyPq7Jwk/Y63aqENmlcHYWGybddCD74G
 ClylOM7Odv4w6vQo+DeXQ9MIMRbaqMtyz+/6/Ytgyac1EpAFuHSlJC4j7WJP/k/r
 PqQgg2WdLTB4w8pQqqarWfmwynsCtnT9lBCRm+pQme/R/MWa2Dw09WeNklrOuPNu
 th6VTVJi460SHAOW8pzQt06U3mU5wdufYPvpKtHa56P5Ias2McagXwY6yMGU1n4H
 fa+HSQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1t4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 09:52:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5A43C4005C;
 Tue, 25 Feb 2025 09:50:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B81647A7B3;
 Tue, 25 Feb 2025 09:48:10 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:10 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:05 +0100
MIME-Version: 1.0
Message-ID: <20250225-hdp-upstream-v1-6-9d049c65330a@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 6/9] ARM: dts: stm32: add Hardware debug port
 (HDP) on stm32mp15
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

QWRkIHRoZSBoZHAgZGV2aWNldHJlZSBub2RlIGZvciBzdG0zMm1wMTUgU29DIGZhbWlseQoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEuZHRzaSB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
bXAxNTEuZHRzaQppbmRleCBiOWE4N2ZiZTk3MWQuLmYxNjMwNzg4NzQ4OCAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxNTEuZHRzaQpAQCAtMjcwLDYgKzI3MCwxMyBAQCBkdHM6IHRoZXJtYWxA
NTAwMjgwMDAgewogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKIAorCQloZHA6IHBpbmN0
cmxANTAwMmEwMDAgeworCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wLWhkcCI7CisJCQlyZWcg
PSA8MHg1MDAyYTAwMCAweDQwMD47CisJCQljbG9ja3MgPSA8JnJjYyBIRFA+OworCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKwkJfTsKKwogCQltZG1hMTogZG1hLWNvbnRyb2xsZXJANTgwMDAwMDAg
ewogCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMmg3LW1kbWEiOwogCQkJcmVnID0gPDB4NTgwMDAw
MDAgMHgxMDAwPjsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
