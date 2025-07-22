Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72306B0DCE5
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 16:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31FFAC3F93F;
	Tue, 22 Jul 2025 14:07:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4895BC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 14:07:01 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDXiGn010281;
 Tue, 22 Jul 2025 16:06:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 iltrvkkBDPNUkwWqDFThCKXQjo7LhI+eeBGbd3adnYk=; b=NvI9jpQS+JhmRmRq
 nxK2aoBTimL5MKRL8KLi4p61ZSy+o0019paPFiRiWz4NtFPqXoaBcDj5E5m7aXxK
 8iG6fTcFSAdlK3nmOA0TVRrdcqjX7rrzaJLKpNJ1y8+32nQOHXpxSmH6DoR7zHN7
 asA5JHawwVl6WkXT+HY/Brcc6ZoGHXxGu9bd8tJkAqJU8cxGo+H+mpuVTgBpCz2T
 YFcgonhukwIb3ndH7Tz/N5i6sRG1eM7vbK4vQOJcO1rcXzOByMZlSXdf62ku2MwY
 1BXAXj2D52jlUam3IfBux3F9/vjYNdjXF9d9tLLM3SIw7tM9jeMEDoOp9711osa4
 mhtcsQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800skxyhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jul 2025 16:06:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 12E464005E;
 Tue, 22 Jul 2025 16:05:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFE437A1A6D;
 Tue, 22 Jul 2025 16:03:59 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 16:03:59 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 22 Jul 2025 16:03:31 +0200
MIME-Version: 1.0
Message-ID: <20250722-ddrperfm-upstream-v3-14-7b7a4f3dc8a0@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v3 14/19] MAINTAINERS: add myself as STM32 DDR
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
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDEw
ODUwNTEyYzExOC4uMjQ3ZjA3YWU0MTc2IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9N
QUlOVEFJTkVSUwpAQCAtMjM0ODcsNiArMjM0ODcsMTMgQEAgUzoJTWFpbnRhaW5lZAogRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3N1cHBseS9zdCxzdGMzMTE3Lnlh
bWwKIEY6CWRyaXZlcnMvcG93ZXIvc3VwcGx5L3N0YzMxMTdfZnVlbF9nYXVnZS5jCiAKK1NUIFNU
TTMyIEREUiBQTVUKK006CUNsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFp
bC5jb20+CitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3BlcmYv
c3RtMzItZGRyLXBtdS5yc3QKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
ZXJmL3N0LHN0bTMyLWRkci1wbXUueWFtbAorRjoJZHJpdmVycy9wZXJmL3N0bTMyX2Rkci1wbXUu
YworCiBTVCBTVE0zMiBGSVJFV0FMTAogTToJR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2
YWxsaWVyQGZvc3Muc3QuY29tPgogUzoJTWFpbnRhaW5lZAoKLS0gCjIuNDMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
