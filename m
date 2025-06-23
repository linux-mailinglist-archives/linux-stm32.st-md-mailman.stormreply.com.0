Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF77AE3A46
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 11:30:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57891C3F942;
	Mon, 23 Jun 2025 09:30:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62149C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 09:30:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7hfSA011850;
 Mon, 23 Jun 2025 11:30:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 pTsJ/+q2VqHoq0n9xQoDMSflxAq/mEpvyBw7OSlMNVw=; b=TLmOwndvBslAgTa7
 TRp1M7ievNHL7EPTswHRzuAHl8ZKIZ+qVBhFC4noOmeYaRSsKV3dnqH4mh5iqOJC
 7grku4sOD0xJg0yqyOi52ypfCYt0jDzN9YCG1GlsZ09l9mwswuy5S97f/eiX3CFT
 VuXoFfNNNOcyKcrNN2DIMymw+UCZLapQ2Eh77M+XHihruAKV/MkSn0A+A++E0r5i
 y1CGuHWeZFRKNhoR4wM7k5HTZCgmcndjogKz1RamJkOiTCirWQI8pNqcf65qql50
 kdMwWL81GtlIO/a2iFSbNhwWjGBghmRa82teXLkp+tdYtNFAzYMLXKtAFhezZL/5
 QdVLOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm3372rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jun 2025 11:30:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3113440057;
 Mon, 23 Jun 2025 11:28:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6856E5C2DF9;
 Mon, 23 Jun 2025 11:27:28 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 11:27:28 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 11:27:13 +0200
MIME-Version: 1.0
Message-ID: <20250623-ddrperfm-upstream-v1-8-7dffff168090@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 08/13] MAINTAINERS: add myself as STM32 DDR
	PMU maintainer
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

QWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0zMiBERFIgUE1VIG1haW50YWluZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5j
b20+Ci0tLQogTUFJTlRBSU5FUlMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGMz
ZjdmYmQwZDY3YS4uNDIxMTEzM2U3MzFlIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9N
QUlOVEFJTkVSUwpAQCAtMjM0NTEsNiArMjM0NTEsMTMgQEAgUzoJTWFpbnRhaW5lZAogRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3N1cHBseS9zdCxzdGMzMTE3Lnlh
bWwKIEY6CWRyaXZlcnMvcG93ZXIvc3VwcGx5L3N0YzMxMTdfZnVlbF9nYXVnZS5jCiAKK1NUIFNU
TTMyIEREUiBQTVUKK006CUNsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3Nz
LnN0LmNvbT4KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVy
Zi9zdG0zMi1kZHItcG11LnJzdAorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCitGOglkcml2ZXJzL3BlcmYvc3RtMzJfZGRyLXBt
dS5jCisKIFNUIFNUTTMyIEZJUkVXQUxMCiBNOglHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNo
ZXZhbGxpZXJAZm9zcy5zdC5jb20+CiBTOglNYWludGFpbmVkCgotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
