Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00DB0F332
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 15:09:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 368DAC36B3F;
	Wed, 23 Jul 2025 13:09:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CD0DC3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 13:09:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NCYuVC013793;
 Wed, 23 Jul 2025 15:09:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 a7LWlOLtHEVsw7QyER6FfjOKmrZdqB2/hdIwi6Hbs9U=; b=RNUdW3xLRK+T7n4N
 OsclMBk/a2oLLihjjH3s2svJ3bjJSNQWVdQk1N2MLkS/uo+rXIAKnERQFmubMzQK
 q2WjUUuHnOLQekjWuOCROU1DJAlbZ/paaM5pyVH4PwpfEge8OvXS1NT74Y4ucyr2
 q3DYYrei6xRhThGtEqUjRUHflytfqZd3Q/b3tTra38SDeUXKVbTnzBpR7+SGrR2S
 Zf3IQoJgMzbrNatpz9HddWcGWlg/3R0BF5yKChYG3bqpumdUKQjawyDcyKzPbv3+
 TYYpXtwJwyZ2NWszogiMbGPaMdHa7fU96s1L4vQSm+Tgdr5hze4L6XYkv5HyqZNF
 J8/8UA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028gbkkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 15:09:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 555834004B;
 Wed, 23 Jul 2025 15:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75A83799890;
 Wed, 23 Jul 2025 15:06:07 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:06:07 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 23 Jul 2025 15:05:50 +0200
MIME-Version: 1.0
Message-ID: <20250723-ddrperfm-upstream-v4-6-1aa53ca319f4@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v4 06/20] dt-bindings: memory: introduce DDR4
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
