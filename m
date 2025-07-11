Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67642B014EE
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 09:43:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BE56C3F933;
	Fri, 11 Jul 2025 07:43:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB046C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 07:43:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B52O6J021363;
 Fri, 11 Jul 2025 09:43:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dqAz444oyv1tNExXQ6LB+NGBTHbnGCQW3fM6rAo+GF0=; b=knCdc4IlckrjBG18
 2mPI9uOryNcsstLUEu3o2IllKsq2jZMNInEK7Uv6+UitSAL+dZ2R0dBs6C7Fi6U/
 y6mLrC+ISuXKqDfK0FgNPfCgSvpKxQScIgD6EQTw7U0sqVFY/8OB3fOUArTTCfqB
 QjspOeO9rW35Kx5kGm6YtwOugV5R9rMfXDqBhNkMVp0ClKkZBwbRHO+AzF5/qMTp
 2yIFjPQ6dV5VlxMgebCYt/l8B3Rf4Ok8fVSj8wrN+QYB9s6pNG0coKydBaJk3AMO
 5R8sFcNkBqvy6Lb5B8Z3RMiu/9+uUHyYLc+zt4Hld0VqhYgVSl1sC/EOcAp9PomB
 /TZGzw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3ne8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 09:43:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B4C4C40054;
 Fri, 11 Jul 2025 09:42:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81732B1114C;
 Fri, 11 Jul 2025 09:41:41 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:41 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 09:41:23 +0200
MIME-Version: 1.0
Message-ID: <20250711-hdp-upstream-v7-5-faeecf7aaee1@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v7 5/8] ARM: dts: stm32: add Hardware debug
 port (HDP) on stm32mp15
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

QWRkIHRoZSBoZHAgZGV2aWNldHJlZSBub2RlIGZvciBzdG0zMm1wMTUgU29DIGZhbWlseQoKS2Vl
cCB0aGUgbm9kZSBkaXNhYmxlZCBhcyBIRFAgbmVlZHMgdGhlIHBpbmN0cmwgU29DIGNvbmZpZ3Vy
YXRpb24gdG8gYmUKYWJsZSB0byBvdXRwdXQgaXRzIG11eCBvdXRwdXQgc2lnbmFsIG91dHNpZGUg
b2YgdGhlIFNvQywgb24gdGhlIFNvQyBwYWQuClRoaXMgY29uZmlndXJhdGlvbiBpcyBwcm92aWRl
ZCBpbiB0aGUgYm9hcmQgZHRzaSBmaWxlIHRocm91Z2ggJ3BpbmN0cmwtKicKcHJvcGVydGllcyBh
cyB3ZWxsIGFzIEhEUCBtdXggY29uZmlndXJhdGlvbi4KVGh1cywgaWYgbmVlZGVkLCBIRFAgc2hv
dWxkIGJlIGVuYWJsZWQgaW4gYm9hcmQgZHRzaSBmaWxlLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEuZHRzaSB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
bXAxNTEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEuZHRzaQppbmRleCAw
ZGFhOGZmZTJmZjUuLmIxYjU2OGRmZDEyNiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
c3Qvc3RtMzJtcDE1MS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEu
ZHRzaQpAQCAtMjcwLDYgKzI3MCwxMyBAQCBkdHM6IHRoZXJtYWxANTAwMjgwMDAgewogCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKIAkJfTsKIAorCQloZHA6IHBpbmN0cmxANTAwMmEwMDAgeworCQkJ
Y29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTUxLWhkcCI7CisJCQlyZWcgPSA8MHg1MDAyYTAwMCAw
eDQwMD47CisJCQljbG9ja3MgPSA8JnJjYyBIRFA+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
KwkJfTsKKwogCQltZG1hMTogZG1hLWNvbnRyb2xsZXJANTgwMDAwMDAgewogCQkJY29tcGF0aWJs
ZSA9ICJzdCxzdG0zMmg3LW1kbWEiOwogCQkJcmVnID0gPDB4NTgwMDAwMDAgMHgxMDAwPjsKCi0t
IAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
