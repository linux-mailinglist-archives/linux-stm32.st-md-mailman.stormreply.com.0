Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67617B0DCF5
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 16:07:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B340C3F942;
	Tue, 22 Jul 2025 14:07:25 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F230C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 14:07:23 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ME4Fs8028578;
 Tue, 22 Jul 2025 16:07:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qThLZiY/wcF/wXoPU6DZ22JEMA0Tul4CRJwH6uwAl+U=; b=WNnGLIJSfd0kS1Z1
 GC9V6SakdifVIaT5JBReeNxtb5y2DvTw3DgcvWubb3YK3ahSrLidGW/cNIPh2nLs
 nPvCvZSJPfn26cNU/DhWti37QPw/UC9lx3p6Mfi1rpsna2RjMRI3ZHcttSmy/nuw
 SzB1ZJ8MtEb8J5NbM3N5AZQ89l8agoXiy8Rny6+kMuthEzCWqDtofkG9unv4tT8W
 /vkg9T64rXSCFx16sJPeR0b9JNgcJLROaEUHtbSq3zTd+DtbDX/k3zSRZ398P6ZL
 CGCqRqg8h8Q9ZeAnaRAEwhw3UfnqCyp1QhKlPUKMO3qLDM0V7PZif3xwvZZxkkp+
 OXF/wg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480pamu7mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jul 2025 16:07:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 215B34005F;
 Tue, 22 Jul 2025 16:05:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73C757A320B;
 Tue, 22 Jul 2025 16:04:01 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 16:04:01 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 22 Jul 2025 16:03:33 +0200
MIME-Version: 1.0
Message-ID: <20250722-ddrperfm-upstream-v3-16-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
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
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 16/19] ARM: dts: stm32: add ddrperfm on
	stm32mp151
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
VE0zMk1QMTUxIFNvQy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVu
dC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1w
MTUxLmR0c2kgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kKaW5kZXggMGRhYThmZmUyZmY1Li5lMTIxZGU1
MmEwNTQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEuZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kKQEAgLTM4Myw2ICszODMs
MTMgQEAgdXNicGh5Y19wb3J0MTogdXNiLXBoeUAxIHsKIAkJCX07CiAJCX07CiAKKwkJZGRycGVy
Zm06IHBlcmZANWEwMDcwMDAgeworCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTUxLWRkci1w
bXUiLCAic3Qsc3RtMzJtcDEzMS1kZHItcG11IjsKKwkJCXJlZyA9IDwweDVhMDA3MDAwIDB4NDAw
PjsKKwkJCWNsb2NrcyA9IDwmcmNjIEREUlBFUkZNPjsKKwkJCXJlc2V0cyA9IDwmcmNjIEREUlBF
UkZNX1I+OworCQl9OworCiAJCXJ0YzogcnRjQDVjMDA0MDAwIHsKIAkJCWNvbXBhdGlibGUgPSAi
c3Qsc3RtMzJtcDEtcnRjIjsKIAkJCXJlZyA9IDwweDVjMDA0MDAwIDB4NDAwPjsKCi0tIAoyLjQz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
