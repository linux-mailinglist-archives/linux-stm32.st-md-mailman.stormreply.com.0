Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3922B0F338
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 15:09:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D47AC36B3D;
	Wed, 23 Jul 2025 13:09:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1AB6C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 13:09:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NCQVTE022126;
 Wed, 23 Jul 2025 15:09:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JdpWMONuLacNIbyReTtl5COFJvZED0p6KDWBUgWc1mA=; b=PjFCCpZLypXpFblR
 4LVLMYn3OXeoVNLrMYSIgUpS/5LujeE+OnDOU2nR08nWIaT63sFD9+nDqkS3nOYX
 za+4Ukd/wO3j/8+uzaSTt6AHwdw7P3sVVynVlpnkB8ML83Cw/10Hzjbk3MVuPd0v
 WBcACXAS8oHJKByF/rBFeY0XoA3VsifrILKxIpa4lcIINhR7azhRP0SDmhxMUREv
 jY0UxVASwNzasiEiHNB3wMkhEIeBr/Y9PiRQqHt8LQAEzsX4CMn5IG/S1HCaihRD
 Dv0oi4f0YleolbqphISUKFuOoCgVi8rKc1+kfNm+fO51/yiwKpooYiJKaCVHAr9p
 DXrjjA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8uv9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 15:09:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4F25F40049;
 Wed, 23 Jul 2025 15:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0EB6798911;
 Wed, 23 Jul 2025 15:06:08 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:06:08 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 23 Jul 2025 15:05:52 +0200
MIME-Version: 1.0
Message-ID: <20250723-ddrperfm-upstream-v4-8-1aa53ca319f4@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v4 08/20] dt-binding: memory: add DDR4 channel
	compatible
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

QWRkIGluIHRoZSBtZW1vcnkgY2hhbm5lbCBiaW5kaW5nIHRoZSBERFI0IGNvbXBhdGlibGUgdG8g
c3VwcG9ydCBERFI0Cm1lbW9yeSBjaGFubmVsLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUg
R29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5uZWwueWFtbCAgIHwgMTAgKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9q
ZWRlYyxzZHJhbS1jaGFubmVsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVsLnlhbWwKaW5kZXgg
OTg5MmRhNTIwZmU0Li44NjZhZjQwYjY1NGQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5u
ZWwueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNv
bnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVsLnlhbWwKQEAgLTE5LDYgKzE5LDcgQEAg
bWFpbnRhaW5lcnM6CiBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgogICAgIGVudW06CisgICAg
ICAtIGplZGVjLGRkcjQtY2hhbm5lbAogICAgICAgLSBqZWRlYyxscGRkcjItY2hhbm5lbAogICAg
ICAgLSBqZWRlYyxscGRkcjMtY2hhbm5lbAogICAgICAgLSBqZWRlYyxscGRkcjQtY2hhbm5lbApA
QCAtNjEsNiArNjIsMTUgQEAgcGF0dGVyblByb3BlcnRpZXM6CiAgICAgICAtIHJlZwogCiBhbGxP
ZjoKKyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIGNvbXBhdGlibGU6CisgICAg
ICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogamVkZWMsZGRyNC1jaGFubmVsCisg
ICAgdGhlbjoKKyAgICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOgorICAgICAgICAiXnJhbmtAWzAtOV0r
JCI6CisgICAgICAgICAgJHJlZjogL3NjaGVtYXMvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRl
YyxkZHI0LnlhbWwjCiAgIC0gaWY6CiAgICAgICBwcm9wZXJ0aWVzOgogICAgICAgICBjb21wYXRp
YmxlOgoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
