Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843DAE3A39
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 11:30:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D99E0C32EB5;
	Mon, 23 Jun 2025 09:30:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51C0AC36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 09:30:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N91VaZ013223;
 Mon, 23 Jun 2025 11:29:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 HxYJdm+vIW2mkVXU2bP4ej7pG694JeHb3sv9IaD0GlM=; b=Zh/vzDdMFPiarDuj
 9VlLwmbUlKhvIXvJ+C5gC/Dqxg/moeDlyqc/tuzr4YUIT//o4Ad+SobW7iSqREDH
 GbBVMfwHtlMNNdqSj7tV4EH7fMsuuuhX7IroRoSA7RDhUqjO2gmNYNTPqRM+IaXx
 wknXBfoH7zwvb16Vamxfhboi5FzsCucqUlthwNWvAhD+n9gJAVMrXlcU+vlDVpIF
 4Sn7n8BfDx9nTF5lZ/rJn+1BgE4d/dt5jpbiJoqkYhaYbNbb7PjSMG+85LHb43kW
 Quq7hf1z9QR/cYjtOQ94g4949HSx0+oWLiDX8pkR85yxD+qt/B30ycXrqZPi4s5T
 ygTzIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbevd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jun 2025 11:29:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4420940047;
 Mon, 23 Jun 2025 11:28:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D3AA5C3DD9;
 Mon, 23 Jun 2025 11:27:25 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 11:27:25 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 11:27:10 +0200
MIME-Version: 1.0
Message-ID: <20250623-ddrperfm-upstream-v1-5-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
In-Reply-To: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/13] dt-bindings: perf: stm32: introduce
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
IDkzICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYv
c3Qsc3RtMzItZGRyLXBtdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uMzVkMzQ3ODI4NjViCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCkBAIC0wLDAg
KzEsOTMgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKworbWFpbnRhaW5lcnM6CisgIC0gQ2zD
qW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgorCit0aXRsZTog
U1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIChERFJQRVJG
TSkKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVtOgorICAgICAgLSBzdCxz
dG0zMm1wMTMxLWRkci1wbXUKKyAgICAgIC0gc3Qsc3RtMzJtcDE1MS1kZHItcG11CisgICAgICAt
IHN0LHN0bTMybXAyNTEtZGRyLXBtdQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGNs
b2NrczoKKyAgICBkZXNjcmlwdGlvbjogUmVmZXJlbmNlIGNsb2NrIGZvciB0aGUgRERSIFBlcmZv
cm1hbmNlIE1vbml0b3IKKyAgICBtYXhJdGVtczogMQorCisgIHJlc2V0czoKKyAgICBkZXNjcmlw
dGlvbjogUmVzZXQgY29udHJvbCBmb3IgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yCisgICAg
bWF4SXRlbXM6IDEKKworICBhY2Nlc3MtY29udHJvbGxlcnM6CisgICAgbWluSXRlbXM6IDEKKyAg
ICBtYXhJdGVtczogMgorCisgIHN0LGRyYW0tdHlwZToKKyAgICBkZXNjcmlwdGlvbjogfAorICAg
ICAgVGhpcyBwcm9wZXJ0eSBpcyB1c2VkIHRvIHNwZWNpZnkgdGhlIHR5cGUgb2YgRFJBTSBtZW1v
cnkgY29ubmVjdGVkIHRvIHRoZQorICAgICAgYXNzb2NpYXRlZCBtZW1vcnkgY29udHJvbGxlci4g
SXQgaXMgcmVxdWlyZWQgZm9yIHRoZSBERFIgUGVyZm9ybWFuY2UgTW9uaXRvcgorICAgICAgdG8g
Y29ycmVjdGx5IGludGVycHJldCB0aGUgcGVyZm9ybWFuY2UgZGF0YS4KKyAgICAgIDAgPSBMUERE
UjQsCisgICAgICAxID0gTFBERFIzLAorICAgICAgMiA9IEREUjQsCisgICAgICAzID0gRERSMwor
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGVu
dW06IFswLCAxLCAyLCAzXQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisK
K2FsbE9mOgorICAtIGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToK
KyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGVudW06CisgICAgICAgICAgICAgIC0g
c3Qsc3RtMzJtcDEzMS1kZHItcG11CisgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDE1MS1kZHIt
cG11CisgICAgdGhlbjoKKyAgICAgIHJlcXVpcmVkOgorICAgICAgICAtIGNsb2NrcworICAgICAg
ICAtIHJlc2V0cworCisgIC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRp
YmxlOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHN0LHN0bTMybXAy
NTEtZGRyLXBtdQorICAgIHRoZW46CisgICAgICByZXF1aXJlZDoKKyAgICAgICAgLSBhY2Nlc3Mt
Y29udHJvbGxlcnMKKyAgICAgICAgLSBzdCxkcmFtLXR5cGUKKworYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svc3RtMzJtcDEtY2xrcy5oPgorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9z
dG0zMm1wMS1yZXNldHMuaD4KKworICAgIHBlcmZANWEwMDcwMDAgeworICAgICAgICBjb21wYXRp
YmxlID0gInN0LHN0bTMybXAxNTEtZGRyLXBtdSI7CisgICAgICAgIHJlZyA9IDwweDVhMDA3MDAw
IDB4NDAwPjsKKyAgICAgICAgY2xvY2tzID0gPCZyY2MgRERSUEVSRk0+OworICAgICAgICByZXNl
dHMgPSA8JnJjYyBERFJQRVJGTV9SPjsKKyAgICB9OworCisgIC0gfAorICAgIHBlcmZANDgwNDEw
MDAgeworICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUxLWRkci1wbXUiOworICAgICAg
cmVnID0gPDB4NDgwNDEwMDAgMHg0MDA+OworICAgICAgYWNjZXNzLWNvbnRyb2xsZXJzID0gPCZy
Y2MgMTA0PjsKKyAgICAgIHN0LGRyYW0tdHlwZSA9IDwyPjsKKyAgICB9OwoKLS0gCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
