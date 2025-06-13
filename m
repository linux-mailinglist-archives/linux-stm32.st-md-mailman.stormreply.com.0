Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D91AD8924
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 12:16:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FEFAC36B35;
	Fri, 13 Jun 2025 10:16:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 310A0C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 10:16:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6x3fp024607;
 Fri, 13 Jun 2025 12:16:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vCMmTABrSBqeAhv7e77caexkaudNwZFg/B0FOzQ1fiU=; b=m27n3SdG369Vt4bz
 KRQtTMX3cNShryz6qllgM4fO86MSkLyfwAaqh51xYOj+9M9KZ1oALA2LCJi/ar0V
 MfEAGvpcDx3laHsP4VXCsMPuju5wwvQJ/YFYp69ju5pfWU460rVlYzazFyo2gtxx
 b/iLY1Z52iQSKpIQCn5Dyq4veM8m9To8f2sL2okYkPG0eeYKTXPEoyKbtTPEoXoa
 u0EByOI1X4ue6UdaTxqro6fisBeGJCqQQ+x2BmmmldZQzEHFN5WOuBlp6cpEtZF4
 59HSfPVLVtLHC4mCbWEMQqwgxBLJIWZHyEnYHjkEkXxwov1YzCXpcq+XU/nlF9g7
 8jdcmg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs356an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jun 2025 12:16:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E03E44005E;
 Fri, 13 Jun 2025 12:15:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 964F92F6EF1;
 Fri, 13 Jun 2025 12:14:22 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:22 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 13 Jun 2025 12:14:18 +0200
MIME-Version: 1.0
Message-ID: <20250613-hdp-upstream-v5-7-6fd6f0dc527c@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v5 7/9] ARM: dts: stm32: add Hardware debug
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

QWRkIHRoZSBoZHAgZGV2aWNldHJlZSBub2RlIGZvciBzdG0zMm1wMjUgU29DIGZhbWlseQoKS2Vl
cCB0aGUgbm9kZSBkaXNhYmxlZCBhcyBIRFAgbmVlZHMgdGhlIHBpbmN0cmwgU29DIGNvbmZpZ3Vy
YXRpb24gdG8gYmUKYWJsZSB0byBvdXRwdXQgaXRzIG11eCBvdXRwdXQgc2lnbmFsIG91dHNpZGUg
b2YgdGhlIFNvQywgb24gdGhlIFNvQyBwYWQuClRoaXMgY29uZmlndXJhdGlvbiBpcyBwcm92aWRl
ZCBpbiB0aGUgYm9hcmQgZHRzaSBmaWxlIHRocm91Z2ggJ3BpbmN0cmwtKicKcHJvcGVydGllcyBh
cyB3ZWxsIGFzIEhEUCBtdXggY29uZmlndXJhdGlvbi4KVGh1cywgaWYgbmVlZGVkLCBIRFAgc2hv
dWxkIGJlIGVuYWJsZWQgaW4gYm9hcmQgZHRzaSBmaWxlLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9z
dG0zMm1wMjUxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaQpp
bmRleCA4ZDg3ODY1ODUwYTcuLmZhMmI2YTE4ODFmMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9z
dG0zMm1wMjUxLmR0c2kKQEAgLTExNDgsNiArMTE0OCwxMyBAQCBwYWNrYWdlX290cEAxZTggewog
CQkJfTsKIAkJfTsKIAorCQloZHA6IHBpbmN0cmxANDQwOTAwMDAgeworCQkJY29tcGF0aWJsZSA9
ICJzdCxzdG0zMm1wMjUxLWhkcCI7CisJCQlyZWcgPSA8MHg0NDA5MDAwMCAweDQwMD47CisJCQlj
bG9ja3MgPSA8JnJjYyBDS19CVVNfSERQPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07
CisKIAkJcmNjOiBjbG9jay1jb250cm9sbGVyQDQ0MjAwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAi
c3Qsc3RtMzJtcDI1LXJjYyI7CiAJCQlyZWcgPSA8MHg0NDIwMDAwMCAweDEwMDAwPjsKCi0tIAoy
LjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
