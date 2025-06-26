Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9263AEA754
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jun 2025 21:50:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBBB8C3089F;
	Thu, 26 Jun 2025 19:50:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB7ADC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 19:50:49 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QG1Q14008318;
 Thu, 26 Jun 2025 21:50:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 042xV4VlLkROsxC1ICsYPcF8y4C6Cn6Xw+YzbxHSTMU=; b=MrnGOIWE7r+kS90h
 9LnZK0oLmgeEvYzrrBf3lTrGPn/OX56n9ShtT/Bb6S1jaK3khoAvKPiueSAarg19
 FF8Mn+9eMJtRBLwl5VCHXlqv36Aj1MhaWLM+Ru7gLee+JGrXodrB0HVq75fBGByI
 c8DInhYHpKHnfIBf1x+wuMATy58kN4v/SwWbqAdCymDvnEIfpk4y76vAW0rIhvL8
 Mg69LS/7wFCgMbUxE5REX3l/5xpHHcNaczSZ+wlAWM471J5CT6WfT2T0TMelgWyF
 1nfqDJlQ6rw/NCaPIkLY6QTMeEb89mXNJvOo4jLc+vPBJTZE02Mw8f7sWZhp/7MA
 4mNdXg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e6a6x9hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 21:50:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4126840047;
 Thu, 26 Jun 2025 21:49:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C46DBD23CA;
 Thu, 26 Jun 2025 21:48:47 +0200 (CEST)
Received: from localhost (10.252.1.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 21:48:46 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Thu, 26 Jun 2025 21:48:35 +0200
MIME-Version: 1.0
Message-ID: <20250626-ddr-bindings-v1-2-cae30933c54c@foss.st.com>
References: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
In-Reply-To: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.1.90]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 2/2] dt-bindings: perf: stm32: introduce
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
IDkwICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5MCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYv
c3Qsc3RtMzItZGRyLXBtdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uOTg3NzVmMzI0NzVhCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCkBAIC0wLDAg
KzEsOTAgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKworbWFpbnRhaW5lcnM6CisgIC0gQ2zD
qW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgorCit0aXRsZTog
U1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIChERFJQRVJG
TSkKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIGVudW06
CisgICAgICAgIC0gc3Qsc3RtMzJtcDEzMS1kZHItcG11CisgICAgICAgIC0gc3Qsc3RtMzJtcDE1
MS1kZHItcG11CisgICAgICBjb25zdDogc3Qsc3RtMzJtcDI1MS1kZHItcG11CisKKyAgcmVnOgor
ICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2tzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgcmVzZXRz
OgorICAgIG1heEl0ZW1zOiAxCisKKyAgYWNjZXNzLWNvbnRyb2xsZXJzOgorICAgIG1pbkl0ZW1z
OiAxCisgICAgbWF4SXRlbXM6IDIKKworICBtZW1vcnktY2hhbm5lbDoKKyAgICBkZXNjcmlwdGlv
bjogfAorICAgICAgVGhlIG1lbW9yeSBjaGFubmVsIHRoaXMgRERSUEVSRk0gaXMgYXR0YWNoZWQg
dG8uCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQor
CityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisKK2FsbE9mOgorICAtIGlmOgor
ICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICBjb250YWlu
czoKKyAgICAgICAgICAgIGVudW06CisgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDEzMS1kZHIt
cG11CisgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDE1MS1kZHItcG11CisgICAgdGhlbjoKKyAg
ICAgIHJlcXVpcmVkOgorICAgICAgICAtIGNsb2NrcworICAgICAgICAtIHJlc2V0cworCisgIC0g
aWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAgICAgICAgIGNv
bnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHN0LHN0bTMybXAyNTEtZGRyLXBtdQorICAgIHRo
ZW46CisgICAgICByZXF1aXJlZDoKKyAgICAgICAgLSBhY2Nlc3MtY29udHJvbGxlcnMKKyAgICAg
ICAgLSBzdCxkcmFtLXR5cGUKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1w
bGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3RtMzJtcDEtY2xr
cy5oPgorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9zdG0zMm1wMS1yZXNldHMuaD4K
KworICAgIHBlcmZANWEwMDcwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMybXAx
NTEtZGRyLXBtdSI7CisgICAgICAgIHJlZyA9IDwweDVhMDA3MDAwIDB4NDAwPjsKKyAgICAgICAg
Y2xvY2tzID0gPCZyY2MgRERSUEVSRk0+OworICAgICAgICByZXNldHMgPSA8JnJjYyBERFJQRVJG
TV9SPjsKKyAgICB9OworCisgIC0gfAorICAgIGRkcl9jaGFubmVsOiBkZHI0LWNoYW5uZWxAMCB7
CisgICAgICAgIGNvbXBhdGlibGUgPSAiamVkZWMsZGRyNC1jaGFubmVsIjsKKyAgICAgICAgaW8t
d2lkdGggPSA8MzI+OworICAgIH07CisKKyAgICBwZXJmQDQ4MDQxMDAwIHsKKyAgICAgIGNvbXBh
dGlibGUgPSAic3Qsc3RtMzJtcDI1MS1kZHItcG11IjsKKyAgICAgIHJlZyA9IDwweDQ4MDQxMDAw
IDB4NDAwPjsKKyAgICAgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwmcmNjIDEwND47CisgICAgICBt
ZW1vcnktY2hhbm5lbCA9IDwmZGRyX2NoYW5uZWw+OworICAgIH07CgotLSAKMi40My4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
