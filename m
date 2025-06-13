Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CDAAD8922
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 12:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72810C36B35;
	Fri, 13 Jun 2025 10:16:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8E9AC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 10:16:26 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9SlWh003048;
 Fri, 13 Jun 2025 12:16:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dqAz444oyv1tNExXQ6LB+NGBTHbnGCQW3fM6rAo+GF0=; b=ohQeI3bxVkreqjGT
 34N9nhR41a0f1tBVInsWw9zJHHPSfXI1NxWIJPxHL3cDWPbOQm/Barzp97TnkzmM
 nDKT3uzr/Mh8k+Qdv5Zax/8Cuxn/ukS1QInImq0jZa98Rp43rTnLNDHpR0do5B03
 fkYzpJxXlzS1PAEYtOvhVjKs8C61f3Kouuj9g5i6tFl/kmn8pNDxjbUoWvp9pLLC
 12o6Z2vKGTnoUf8C2ksZa5J1bFyyF9iOL4Mt6Wbd0tX7URtf5EvLvWoBFIZBWJ8B
 PZW1ZGy8B5AvmSEtBJKCUYPMuEFhE6tsn6nXMFkwkcPuv8b4gU3wYM/vufCPdye4
 37RMfw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y05jqsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jun 2025 12:16:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 35C614005C;
 Fri, 13 Jun 2025 12:15:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2DF938C44E;
 Fri, 13 Jun 2025 12:14:21 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:21 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 13 Jun 2025 12:14:17 +0200
MIME-Version: 1.0
Message-ID: <20250613-hdp-upstream-v5-6-6fd6f0dc527c@foss.st.com>
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-0537a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 6/9] ARM: dts: stm32: add Hardware debug
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
