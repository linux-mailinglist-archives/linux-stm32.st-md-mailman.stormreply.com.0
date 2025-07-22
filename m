Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF92B0DCEF
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 16:07:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B15A3C3F93F;
	Tue, 22 Jul 2025 14:07:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0215BC3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 14:07:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDrxTc028380;
 Tue, 22 Jul 2025 16:07:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ny+3xzEB69ONOaOL63xU/9wLRbXsLXDOET4jNRuZ8J8=; b=yOx7wKLNTVqywQmJ
 fBoiNFt7VNo+jfO1W9Wl+wBgwYT8OP2MAA5WJ1+BGXkM+R+eZ60MgRdXMuL4LgKN
 My7N2hwSp8CCimU629SMhztyHM51LFOfL1mpZ6vJh12+OL+V0fTWWRndL6qSmRr4
 fle4Rc9cE6RIIiDQw+9s1mzW0sodkVsiQvlrLKds/AI6QDbK2m9bdx1EuR/reLfr
 Nxs0atvIp8+Rr1VH6X1UjIMrWO0yrrozbn2TTjgsfQbvjRMoW/0jUqsrnsnfpqf8
 m0WNw1jKTyKxDD2sMiNQfPeO5/ZEDRism7VPyn1EiWFbJba0ZRRl4gA8hezA7dGP
 veMilA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028g63ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jul 2025 16:07:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 288D44005D;
 Tue, 22 Jul 2025 16:05:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6083C7A31E7;
 Tue, 22 Jul 2025 16:03:55 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 16:03:55 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 22 Jul 2025 16:03:25 +0200
MIME-Version: 1.0
Message-ID: <20250722-ddrperfm-upstream-v3-8-7b7a4f3dc8a0@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v3 08/19] dt-binding: memory: add DDR4 channel
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
ZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLG1lbW9yeS1jaGFubmVsLnlhbWwgIHwgMTAgKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9q
ZWRlYyxtZW1vcnktY2hhbm5lbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsbWVtb3J5LWNoYW5uZWwueWFtbAppbmRl
eCAzYmYzYTYzNDY2ZWIuLjAzMjUyZDk3YWMzOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsbWVtb3J5LWNo
YW5uZWwueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5
LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxtZW1vcnktY2hhbm5lbC55YW1sCkBAIC0xOCw2ICsxOCw3
IEBAIG1haW50YWluZXJzOgogcHJvcGVydGllczoKICAgY29tcGF0aWJsZToKICAgICBlbnVtOgor
ICAgICAgLSBqZWRlYyxkZHI0LWNoYW5uZWwKICAgICAgIC0gamVkZWMsbHBkZHIyLWNoYW5uZWwK
ICAgICAgIC0gamVkZWMsbHBkZHIzLWNoYW5uZWwKICAgICAgIC0gamVkZWMsbHBkZHI0LWNoYW5u
ZWwKQEAgLTYwLDYgKzYxLDE1IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgICAgLSByZWcKIAog
YWxsT2Y6CisgIC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgor
ICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IGplZGVjLGRkcjQtY2hhbm5l
bAorICAgIHRoZW46CisgICAgICBwYXR0ZXJuUHJvcGVydGllczoKKyAgICAgICAgIl5yYW5rQFsw
LTldKyQiOgorICAgICAgICAgICRyZWY6IC9zY2hlbWFzL21lbW9yeS1jb250cm9sbGVycy9kZHIv
amVkZWMsZGRyNC55YW1sIwogICAtIGlmOgogICAgICAgcHJvcGVydGllczoKICAgICAgICAgY29t
cGF0aWJsZToKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
