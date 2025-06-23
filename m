Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FEAE3A45
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 11:30:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C38CC3F93F;
	Mon, 23 Jun 2025 09:30:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33327C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 09:30:16 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9FWgh021128;
 Mon, 23 Jun 2025 11:30:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SuBSodyyqcKAz1sJaFnr1XdxWrUs+npg1uqS49q9/0Y=; b=tfTKsqoN8IhNoUxP
 RVIKVe+P/8Q9oMNMZ2lQJpg1UIpGxmqE8Wjms1EfUFDAmJd/yn56VMlGKDDEtGjg
 4+f+a0dEXakxTp4Vws/ebiPiDhpCM8I7yF64kmJAXeylzlgKvOWFhKqR71vOH1Bv
 UlbZcWgZ5CUc4rm9uRMm1nQtstBKPjRPYHWtHKy3xsSrL2FnRxh3gdS+Rpf6gmEh
 vYUak6G/PVBCVtFHDL7LgXR/cx2a9dvb4xRXHCmkAP9GqYViE/x5EqA+xIDvGLgp
 GawEqRZ/2CMhUfuqSatsBkfV+tdgPvAIv2OgcAHu82t9LfNGhQaHWROk/psZD5aQ
 bPMKYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e6a6cjrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jun 2025 11:30:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2515A40054;
 Mon, 23 Jun 2025 11:28:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A1475C2DF3;
 Mon, 23 Jun 2025 11:27:31 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 11:27:30 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 11:27:16 +0200
MIME-Version: 1.0
Message-ID: <20250623-ddrperfm-upstream-v1-11-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
In-Reply-To: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 11/13] arm64: dts: st: add ddrperfm on
	stm32mp251
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

VGhlIEREUlBFUkZNIGlzIHRoZSBERFIgUGVyZm9ybWFuY2UgTW9uaXRvciBlbWJlZGRlZCBpbiBT
VE0zMk1QMjUxIFNvQy4KCktlZXAgdGhlIG5vZGUgZGlzYWJsZWQgYXQgU29DIGxldmVsIGFzIGl0
IHJlcXVpcmVzIHRoZSBwcm9wZXJ0eQpgc3QsZHJhbS10eXBlYCB3aGljaCBpcyBwcm92aWRlZCBp
biBib2FyZCBkdHNpIGZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNs
ZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9zdC9z
dG0zMm1wMjUxLmR0c2kgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCmluZGV4IDA2ODNjMmQ1Y2I2
Zi4uN2YxMzgzMjQ2MTBhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMy
bXAyNTEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaQpA
QCAtMTU3Nyw1ICsxNTc3LDEyIEBAIGV4dGkyOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0NjIzMDAw
MCB7CiAJCQkJPDA+LAogCQkJCTwmaW50YyBHSUNfU1BJIDIxMyBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsJLyogRVhUSV83MCAqLwogCQl9OworCisJCWRkcnBlcmZtOiBwZXJmQDQ4MDQxMDAwIHsKKwkJ
CWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1MS1kZHItcG11IjsKKwkJCXJlZyA9IDwweDQ4MDQx
MDAwIDB4NDAwPjsKKwkJCWFjY2Vzcy1jb250cm9sbGVycyA9IDwmcmNjIDEwND47CisJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOworCQl9OwogCX07CiB9OwoKLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
