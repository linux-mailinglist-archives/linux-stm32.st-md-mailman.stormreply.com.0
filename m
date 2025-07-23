Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD30B0F333
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 15:09:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A582C3F92F;
	Wed, 23 Jul 2025 13:09:41 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A04A4C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 13:09:39 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NCqWxc004974;
 Wed, 23 Jul 2025 15:09:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 /PSRDUQqpavKCK+qf73ZwNuazN17nx7wwyTUKOPPPZQ=; b=dgRIiCIHOb4Aeki7
 b9bxrt1hft1vndxtBVWOXuSj7xnCB54exxKOc9hJH3FcTGJX8BsFnXCIyasjv6uZ
 lB3YJatSXNaXLPB/vIYr6jNIJEwEm/DNtvO3auvNlTx8N6rNJa4Cd/TGxT8KT4t0
 ggKC/MH60RAJN+SGnzWojEWNabrIOmdGCar+JNA80tP3yHGOZQMpnMVlZnr5A/JC
 fNXOE2vXpyv2dWoerDY3u8Di/AahyvzAcIu81+evg6JfcV1Li0NMZmlVdhb4yJoo
 v1KqCwG8M+u4dJ761nqZ66/EtmjBDpVvIjoW7e1JXoVnX8T7pI2ajUY7TU18wo4y
 YM/rnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480pan0reh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 15:09:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CAF154004F;
 Wed, 23 Jul 2025 15:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F6A0799A42;
 Wed, 23 Jul 2025 15:06:11 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:06:10 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 23 Jul 2025 15:05:55 +0200
MIME-Version: 1.0
Message-ID: <20250723-ddrperfm-upstream-v4-11-1aa53ca319f4@foss.st.com>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
In-Reply-To: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>, Julius Werner <jwerner@chromium.org>
X-Mailer: b4 0.15-dev-8018a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 11/20] arm64: dts: st: add DDR channel to
 stm32mp257f-ev1 board
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

QWRkIDMyYml0cyBERFI0IGNoYW5uZWwgdG8gdGhlIHN0bTMybXAyNTdmLWRrIGJvYXJkLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyB8IDcg
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cwppbmRleCAyZjU2MWFkNDA2NjUuLmUxMWNlNjZi
ZTk0OCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1ldjEu
ZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cwpAQCAt
NDEsNiArNDEsMTMgQEAgcGFkX2NsazogcGFkLWNsayB7CiAJCX07CiAJfTsKIAorCWRkcl9jaGFu
bmVsOiBzZHJhbS1jaGFubmVsLTAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUt
Y2VsbHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAiamVkZWMsZGRyNC1jaGFubmVsIjsKKwkJaW8t
d2lkdGggPSA8MzI+OworCX07CisKIAlpbXgzMzVfMnY5OiByZWd1bGF0b3ItMnY5IHsKIAkJY29t
cGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0b3ItbmFtZSA9ICJpbXgzMzUt
YXZkZCI7CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
