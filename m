Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AAB01F9A
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 16:52:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E31DCC3F932;
	Fri, 11 Jul 2025 14:52:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33725C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 14:52:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBCecB004273;
 Fri, 11 Jul 2025 16:52:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UlvgFLkq2jemy3eeMnwVN+pbz6Mlls5h0vESyT1iEYI=; b=8Hd9VdV8ctD+bDJz
 0gNvrZDTZWQAZN80szPcIQP6ybDSN4IS75EBq4IhYKctMGGpLhsuBzr9XTcdXW9e
 hr619bgFvR/CkHrwnuMfTtfrCyZhY7Iiad5BdIYBorIuiQEBbgAxRi8Vq9OhA+VJ
 dc3/0V4W7B7i81ODN3gRNUYW61B0gdlvu9D6z+jvDcN6rwFcx4G9uYyR0trjZUek
 UV4KsPru/r/bcHOOEfXzRD3oVupugbTg69RlOmui04lBYKGyNnNAPmsxtc/g/GpD
 FdZJENHqIbn4E4X0ka+RPdbQsLksuBdbAKGoUIWeKQ0sLuW3fNLq507efx0u9lE6
 hlAWNw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ptxjpwyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 16:52:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D00E84004B;
 Fri, 11 Jul 2025 16:51:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 083DBB56890;
 Fri, 11 Jul 2025 16:49:26 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:25 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:49:07 +0200
MIME-Version: 1.0
Message-ID: <20250711-ddrperfm-upstream-v2-15-cdece720348f@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 15/16] arm64: dts: st: support ddrperfm on
 stm32mp257f-dk
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

Q29uZmlndXJlIEREUlBFUkZNIG5vZGUgb24gc3RtMzJtcDI1N2YtZGsgYm9hcmQuCkRpc2FibGUg
dGhlIG5vZGUgYXMgRERSUEVSRk0gd2lsbCBwcm9kdWNlIGFuIGVycm9yIG1lc3NhZ2UgaWYgaXQn
cyBjbG9jawooc2hhcmVkIHdpdGggdGhlIEREUkNUUkwgb24gU1RNMzJNUDI1eCkgaXMgc2VjdXJl
ZCBieSBjb21tb24gYm9vdGxvYWRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2Zm
aWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3
Zi1kay5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cwppbmRl
eCBhOTdiNDFmMTRlY2MuLmQyMzZlYmYyYmIxMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9z
dG0zMm1wMjU3Zi1kay5kdHMKQEAgLTg0LDYgKzg0LDExIEBAICZhcm1fd2R0IHsKIAlzdGF0dXMg
PSAib2theSI7CiB9OwogCismZGRycGVyZm0geworCW1lbW9yeS1jaGFubmVsID0gPCZscGRkcl9j
aGFubmVsPjsKKwlzdGF0dXMgPSAiZGlzYWJsZWQiOworfTsKKwogJnNjbWlfcmVndSB7CiAJc2Nt
aV92ZGRpbzE6IHJlZ3VsYXRvckAwIHsKIAkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgw
MDAwMD47CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
