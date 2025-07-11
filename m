Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC5B01F9D
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 16:52:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10457C3F932;
	Fri, 11 Jul 2025 14:52:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B04AC3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 14:52:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BEHQjM027785;
 Fri, 11 Jul 2025 16:52:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 F0RaanQr/Y01Kr3e9l6yvosGEYhnzl8fsIwEj1CuG6c=; b=GLwIa/U4Pms3zJYJ
 Vf6J02Gisg1Ta4puNDbzsRHGlPFLIH6DIxCks5O8Xa1cKnjO0hXVB7a4cISVoN1n
 q8zYShB0re5FueScRBFZN1aQ5rdOfisRaiYktnzX+qK0abR4UCG1yuGbZJOtEV9I
 X5W6esz3NDy1OWP4hO6pJLsQfdKxn9BMlNqA/DvYXUBaXY2zfZ+zVPtaL9SuiKU7
 vgVx68hnzZUh5nbPyAhp5JPDt/IqI60gLjHi771kfkVnqRYSMjndzDKt1UYCrx0G
 6XYxO8IrkeXgCrx0NygjkS++agXq9iYTFatMUGSRUdVHpvE/JGMMdIikmZN92LaN
 t8o0ag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3qfjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 16:52:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B7B5C4004D;
 Fri, 11 Jul 2025 16:51:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9575B56893;
 Fri, 11 Jul 2025 16:49:26 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:26 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:49:08 +0200
MIME-Version: 1.0
Message-ID: <20250711-ddrperfm-upstream-v2-16-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
In-Reply-To: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 16/16] arm64: dts: st: support ddrperfm on
 stm32mp257f-ev1
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

Q29uZmlndXJlIEREUlBFUkZNIG5vZGUgb24gc3RtMzJtcDI1N2YtZXYxIGJvYXJkLgpEaXNhYmxl
IHRoZSBub2RlIGFzIEREUlBFUkZNIHdpbGwgcHJvZHVjZSBhbiBlcnJvciBtZXNzYWdlIGlmIGl0
J3MgY2xvY2sKKHNoYXJlZCB3aXRoIHRoZSBERFJDVFJMIG9uIFNUTTMyTVAyNXgpIGlzIHNlY3Vy
ZWQgYnkgY29tbW9uIGJvb3Rsb2FkZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29m
ZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NTdmLWV2MS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2MS5kdHMK
aW5kZXggZjk4N2Q4NmQzNTBmLi43NTMzYjUwMDEzNWMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3N0L3N0bTMybXAyNTdmLWV2MS5kdHMKQEAgLTEyOCw2ICsxMjgsMTEgQEAgY3NpX3NvdXJjZTog
ZW5kcG9pbnQgewogCX07CiB9OwogCismZGRycGVyZm0geworCW1lbW9yeS1jaGFubmVsID0gPCZk
ZHJfY2hhbm5lbD47CisJc3RhdHVzID0gImRpc2FibGVkIjsKK307CisKICZkY21pcHAgewogCXN0
YXR1cyA9ICJva2F5IjsKIAlwb3J0IHsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
