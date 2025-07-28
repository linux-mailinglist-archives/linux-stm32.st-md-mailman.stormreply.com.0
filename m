Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2046B13E71
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 17:33:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92D9CC36B2E;
	Mon, 28 Jul 2025 15:33:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B050BC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 15:33:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SDnfmq008418;
 Mon, 28 Jul 2025 17:32:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 a7LWlOLtHEVsw7QyER6FfjOKmrZdqB2/hdIwi6Hbs9U=; b=BIJYTa99Mpig0rQc
 wd+FwDNdRmK1zEh5JSgDPnTn9UH+2V80VAbm09FKd9sUjx1XU9Sfncy0wrTL5KHA
 r4vzSz0kBwT93R8JDq95SOocQkcJsM4s2CrsX3f8EF0m+JoZgfzoZ1Zy8ObRilei
 JTeoLfJ4meHaI8vR3KL8G3IZQ+rXmn6MgFriiSJ6LCE5ioYCmhqCK+OvbRMX5B+R
 HvTYi8on1jPP1fxNHWOB9jSEqHN3WhhLE8PkhqiUQTTz/rMAc3tTBOUQCnVCoMyh
 I9wB2++t/tELyOfJ2Av5cDFVr1AtofHCuvud/O7DPuxFQ3J5GppxcldBYU45sDkp
 Kbb9Cw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484memha9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 17:32:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3E114004B;
 Mon, 28 Jul 2025 17:31:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C6F8787C26;
 Mon, 28 Jul 2025 17:29:55 +0200 (CEST)
Received: from localhost (10.252.23.100) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 17:29:55 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 28 Jul 2025 17:29:37 +0200
MIME-Version: 1.0
Message-ID: <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
In-Reply-To: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
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
X-Originating-IP: [10.252.23.100]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 06/20] dt-bindings: memory: introduce DDR4
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

SW50cm9kdWNlIEpFREVDIGNvbXBsaWFudCBERFIgYmluZGluZ3MsIHRoYXQgdXNlIG5ldyBtZW1v
cnktcHJvcHMgYmluZGluZy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rk
ci9qZWRlYyxkZHI0LnlhbWwgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyNC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVy
cy9kZHIvamVkZWMsZGRyNC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uZjQ1NzA2NmEyZjhiCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyNC55YW1sCkBA
IC0wLDAgKzEsMzQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwjCiskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0
bGU6IEREUjMgU0RSQU0gY29tcGxpYW50IHRvIEpFREVDIEpFU0Q3OS00RAorCittYWludGFpbmVy
czoKKyAgLSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CisKK2FsbE9mOgor
ICAtICRyZWY6IGplZGVjLHNkcmFtLXByb3BzLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBh
dGlibGU6CisgICAgaXRlbXM6CisgICAgICAtIHBhdHRlcm46ICJeZGRyNC1bMC05YS1mXXsyfSxb
MC05YS1mXXsxfSQiCisgICAgICAtIGNvbnN0OiBqZWRlYyxkZHI0CisKK3JlcXVpcmVkOgorICAt
IGNvbXBhdGlibGUKKyAgLSBkZW5zaXR5CisgIC0gaW8td2lkdGgKKwordW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgZGRyIHsKKyAgICAgICAgY29t
cGF0aWJsZSA9ICJkZHI0LWZmLGYiLCAiamVkZWMsZGRyNCI7CisgICAgICAgIGRlbnNpdHkgPSA8
ODE5Mj47CisgICAgICAgIGlvLXdpZHRoID0gPDg+OworICAgIH07CgotLSAKMi40My4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
