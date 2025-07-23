Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFBFB0F339
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 15:09:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70239C36B3F;
	Wed, 23 Jul 2025 13:09:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C56A8C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 13:09:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NCdO5R011745;
 Wed, 23 Jul 2025 15:09:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 9SVEF8WXui/rvJlaHwlNLMXiePzshiHlU6XnxEDuFv0=; b=B85fv+6Jm3uAuFs+
 1XCFgeO84bxuO66g1O+aPvhMm3jdI1JdRdIaYVQeJBpwLmhs/Q3HYWRGUQVdj4+0
 3dacAbGfEz3sovc2DwXbNGJ/vmM3xIHYngc4A+GU4JBLrDkXWdqaT0YJIfowPxSq
 P0I3SS4uVsRwDw/Nm1saeAvQTxaAKhyTT2UNbdf7Bd3grPiZQK2+/BslfDwAeIaZ
 Zxv8gp4r2E5W2aeRAqjIgiFn6+dfJB2Xv/aijlqscC7Oly4cSnak9cHAWBYpAMqY
 bi2hBttUG1hrwos0n0jHtc6m3exSTL4jBZLuwtHiN8EN4NMgPHeSNi9auE2FdF5J
 w3pHpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8uva3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 15:09:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C29274004D;
 Wed, 23 Jul 2025 15:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8B3879989B;
 Wed, 23 Jul 2025 15:06:09 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:06:09 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 23 Jul 2025 15:05:53 +0200
MIME-Version: 1.0
Message-ID: <20250723-ddrperfm-upstream-v4-9-1aa53ca319f4@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v4 09/20] dt-bindings: memory: SDRAM channel:
 standardise node name
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

QWRkIGEgcGF0dGVybiBmb3Igc2RyYW0gY2hhbm5lbCBub2RlIG5hbWUuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQog
Li4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tY2hhbm5lbC55
YW1sICAgICAgIHwgNyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5uZWwueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2pl
ZGVjLHNkcmFtLWNoYW5uZWwueWFtbAppbmRleCA4NjZhZjQwYjY1NGQuLjVjZGQ4ZWY0NTEwMCAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tY2hhbm5lbC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNo
YW5uZWwueWFtbApAQCAtMTcsNiArMTcsOSBAQCBtYWludGFpbmVyczoKICAgLSBKdWxpdXMgV2Vy
bmVyIDxqd2VybmVyQGNocm9taXVtLm9yZz4KIAogcHJvcGVydGllczoKKyAgJG5vZGVuYW1lOgor
ICAgIHBhdHRlcm46ICJzZHJhbS1jaGFubmVsLVswLTldKyQiCisKICAgY29tcGF0aWJsZToKICAg
ICBlbnVtOgogICAgICAgLSBqZWRlYyxkZHI0LWNoYW5uZWwKQEAgLTExOCw3ICsxMjEsNyBAQCBh
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6CiAgIC0gfAotICAgIGxwZGRy
LWNoYW5uZWwwIHsKKyAgICBzZHJhbS1jaGFubmVsLTAgewogICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47CiAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKICAgICAgIGNvbXBhdGlibGUgPSAiamVk
ZWMsbHBkZHIzLWNoYW5uZWwiOwpAQCAtMTMzLDcgKzEzNiw3IEBAIGV4YW1wbGVzOgogICAgICAg
fTsKICAgICB9OwogCi0gICAgbHBkZHItY2hhbm5lbDEgeworICAgIHNkcmFtLWNoYW5uZWwtMSB7
CiAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICNzaXplLWNlbGxzID0gPDA+Owog
ICAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxscGRkcjQtY2hhbm5lbCI7CgotLSAKMi40My4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
