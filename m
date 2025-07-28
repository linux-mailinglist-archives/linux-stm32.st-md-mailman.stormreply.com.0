Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D685B13E95
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 17:35:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF04BC36B3A;
	Mon, 28 Jul 2025 15:35:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24C66C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 15:35:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SDmqUh025850;
 Mon, 28 Jul 2025 17:35:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 H6V/0Vtel7CGpYiJefJ3wfM3AtMizX6MiI5SBYa0KkU=; b=Xo8JKen4e7R2XUYE
 1iMOf9BEougWjV9Egmv+lYSTRMrnRZRWWRg3+S3evLAsXqarZZEB2SNv+Ba8USqZ
 j9qqlF8pXqWn0Z9KL8/VXe8H0CzotxxCUBdyDN1DtDklYZVW3eY2sL/ED8RUYSWc
 Fxpomgt2wG1HNvmQVugkB+Cf0/1bhR+RmCu6AXXCOrvhJE+xoXGXb0qTyqMwReYU
 VKv1FsK00rHiUa+Bt+eojhfykFBW4W5/dQcB/Gu0rmNLu3Fgyynn7aL112tuUOqf
 dpQGE9b9a22Dwoypg75IvedQXSK36DpC0BpvAigiuBYrzRFcUjJbEMyRvqhG0/Vn
 uP0OvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc28wap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 17:35:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DC96F40049;
 Mon, 28 Jul 2025 17:33:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D223A78C908;
 Mon, 28 Jul 2025 17:30:01 +0200 (CEST)
Received: from localhost (10.252.23.100) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 17:30:01 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 28 Jul 2025 17:29:43 +0200
MIME-Version: 1.0
Message-ID: <20250728-ddrperfm-upstream-v5-12-03f1be8ad396@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v5 12/20] dt-bindings: perf: stm32: introduce
 DDRPERFM dt-bindings
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

RERSUEVSRk0gaXMgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIGVtYmVkZGVkIGluIFNUTTMy
TVBVIFNvQy4KSXQgYWxsb3dzIHRvIG1vbml0b3IgRERSIGV2ZW50cyB0aGF0IGNvbWUgZnJvbSB0
aGUgRERSIENvbnRyb2xsZXIKc3VjaCBhcyByZWFkIG9yIHdyaXRlIGV2ZW50cy4KClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4K
LS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wZXJmL3N0LHN0bTMyLWRkci1wbXUueWFtbCB8
IDk0ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5NCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYv
c3Qsc3RtMzItZGRyLXBtdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uMWQ5Nzg2MWUzZDQ0Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCkBAIC0wLDAg
KzEsOTQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKworbWFpbnRhaW5lcnM6CisgIC0gQ2zD
qW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KKwordGl0bGU6IFNU
TWljcm9lbGVjdHJvbmljcyBTVE0zMiBERFIgUGVyZm9ybWFuY2UgTW9uaXRvciAoRERSUEVSRk0p
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgb25lT2Y6CisgICAgICAtIGl0ZW1z
OgorICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAxMzEtZGRyLXBtdQorICAgICAgLSBpdGVt
czoKKyAgICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDE1MS1kZHIt
cG11CisgICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzJtcDEzMS1kZHItcG11CisgICAgICAtIGl0
ZW1zOgorICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAyNTEtZGRyLXBtdQorCisgIHJlZzoK
KyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrczoKKyAgICBtYXhJdGVtczogMQorCisgIHJlc2V0
czoKKyAgICBtYXhJdGVtczogMQorCisgIGFjY2Vzcy1jb250cm9sbGVyczoKKyAgICBtaW5JdGVt
czogMQorICAgIG1heEl0ZW1zOiAyCisKKyAgbWVtb3J5LWNoYW5uZWw6CisgICAgZGVzY3JpcHRp
b246CisgICAgICBUaGUgbWVtb3J5IGNoYW5uZWwgdGhpcyBERFJQRVJGTSBpcyBhdHRhY2hlZCB0
by4KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCisK
K3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKworYWxsT2Y6CisgIC0gaWY6Cisg
ICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAgICAgICAgIGNvbnRhaW5z
OgorICAgICAgICAgICAgY29uc3Q6IHN0LHN0bTMybXAxMzEtZGRyLXBtdQorICAgIHRoZW46Cisg
ICAgICByZXF1aXJlZDoKKyAgICAgICAgLSBjbG9ja3MKKyAgICAgICAgLSByZXNldHMKKworICAt
IGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICBj
b250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiBzdCxzdG0zMm1wMjUxLWRkci1wbXUKKyAgICB0
aGVuOgorICAgICAgcmVxdWlyZWQ6CisgICAgICAgIC0gYWNjZXNzLWNvbnRyb2xsZXJzCisgICAg
ICAgIC0gbWVtb3J5LWNoYW5uZWwKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4
YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3RtMzJtcDEt
Y2xrcy5oPgorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9zdG0zMm1wMS1yZXNldHMu
aD4KKworICAgIHBlcmZANWEwMDcwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMy
bXAxNTEtZGRyLXBtdSIsICJzdCxzdG0zMm1wMTMxLWRkci1wbXUiOworICAgICAgICByZWcgPSA8
MHg1YTAwNzAwMCAweDQwMD47CisgICAgICAgIGNsb2NrcyA9IDwmcmNjIEREUlBFUkZNPjsKKyAg
ICAgICAgcmVzZXRzID0gPCZyY2MgRERSUEVSRk1fUj47CisgICAgfTsKKworICAtIHwKKyAgICBk
ZHJfY2hhbm5lbDogc2RyYW0tY2hhbm5lbC0wIHsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICBjb21wYXRpYmxlID0gImpl
ZGVjLGRkcjQtY2hhbm5lbCI7CisgICAgICAgIGlvLXdpZHRoID0gPDE2PjsKKyAgICB9OworCisg
ICAgcGVyZkA0ODA0MTAwMCB7CisgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMybXAyNTEtZGRy
LXBtdSI7CisgICAgICByZWcgPSA8MHg0ODA0MTAwMCAweDQwMD47CisgICAgICBhY2Nlc3MtY29u
dHJvbGxlcnMgPSA8JnJjYyAxMDQ+OworICAgICAgbWVtb3J5LWNoYW5uZWwgPSA8JmRkcl9jaGFu
bmVsPjsKKyAgICB9OwoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
