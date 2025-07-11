Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BF0B01F98
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 16:52:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBF03C3F931;
	Fri, 11 Jul 2025 14:52:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02D36C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 14:52:35 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BChEqB006517;
 Fri, 11 Jul 2025 16:52:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Bc/v1axb6utVOQjnTP/Qv3nkmKL0VE0rqaXdGeFNbUU=; b=1IsJsXu9DcR4m3aR
 SNzkoYkvHSyhhJHIvJeZ0VLT8Twer2llLePGtWpuzXvGtXPCCcFPkqJ2vIbvFDbR
 1AOp6UMm+RoVIDrBk7MYYlavG1EWdGL8NA7P28m/tvEg0zmn+27/S3weo7SmVoZi
 /8J+H3c8IyyL8AzSk+w4QnYml9JCyxyqpAt+eBUP7CMKF3t5pe2JiFK4HxMEjywW
 3uVrsWNsNWX03P/xJIYGNU8RD1JCLHAW1XOou0PKpg8mfM/XkOs6onxeoJSNZnyY
 MXml9+4RKOw878wD82leu0DUio3DPKPju3KL9fEWndmebboqEEMpQnlX3WmyixGV
 aJn9fw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfmyt7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 16:52:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 71BD440049;
 Fri, 11 Jul 2025 16:51:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 913D4B52715;
 Fri, 11 Jul 2025 16:49:19 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:19 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:49:00 +0200
MIME-Version: 1.0
Message-ID: <20250711-ddrperfm-upstream-v2-8-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
In-Reply-To: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/16] dt-bindings: perf: stm32: introduce
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
IDg3ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4NyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYv
c3Qsc3RtMzItZGRyLXBtdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uM2MxMjNhNGEwZTgwCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCkBAIC0wLDAg
KzEsODcgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKworbWFpbnRhaW5lcnM6CisgIC0gQ2zD
qW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KKwordGl0bGU6IFNU
TWljcm9lbGVjdHJvbmljcyBTVE0zMiBERFIgUGVyZm9ybWFuY2UgTW9uaXRvciAoRERSUEVSRk0p
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gc3Qsc3Rt
MzJtcDEzMS1kZHItcG11CisgICAgICAtIHN0LHN0bTMybXAxNTEtZGRyLXBtdQorICAgICAgLSBz
dCxzdG0zMm1wMjUxLWRkci1wbXUKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9j
a3M6CisgICAgbWF4SXRlbXM6IDEKKworICByZXNldHM6CisgICAgbWF4SXRlbXM6IDEKKworICBh
Y2Nlc3MtY29udHJvbGxlcnM6CisgICAgbWluSXRlbXM6IDEKKyAgICBtYXhJdGVtczogMgorCisg
IG1lbW9yeS1jaGFubmVsOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhlIG1lbW9yeSBjaGFu
bmVsIHRoaXMgRERSUEVSRk0gaXMgYXR0YWNoZWQgdG8uCisgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxl
CisgIC0gcmVnCisKK2FsbE9mOgorICAtIGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAg
Y29tcGF0aWJsZToKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiBzdCxz
dG0zMm1wMTMxLWRkci1wbXUKKyAgICB0aGVuOgorICAgICAgcmVxdWlyZWQ6CisgICAgICAgIC0g
Y2xvY2tzCisgICAgICAgIC0gcmVzZXRzCisKKyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6Cisg
ICAgICAgIGNvbXBhdGlibGU6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25z
dDogc3Qsc3RtMzJtcDI1MS1kZHItcG11CisgICAgdGhlbjoKKyAgICAgIHJlcXVpcmVkOgorICAg
ICAgICAtIGFjY2Vzcy1jb250cm9sbGVycworICAgICAgICAtIG1lbW9yeS1jaGFubmVsCisKK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0bTMybXAxLWNsa3MuaD4KKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvcmVzZXQvc3RtMzJtcDEtcmVzZXRzLmg+CisKKyAgICBwZXJmQDVhMDA3MDAwIHsK
KyAgICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTUxLWRkci1wbXUiOworICAgICAgICBy
ZWcgPSA8MHg1YTAwNzAwMCAweDQwMD47CisgICAgICAgIGNsb2NrcyA9IDwmcmNjIEREUlBFUkZN
PjsKKyAgICAgICAgcmVzZXRzID0gPCZyY2MgRERSUEVSRk1fUj47CisgICAgfTsKKworICAtIHwK
KyAgICBkZHJfY2hhbm5lbDogZGRyMy1jaGFubmVsIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJq
ZWRlYyxkZHIzLWNoYW5uZWwiOworICAgICAgICBpby13aWR0aCA9IDwxNj47CisgICAgfTsKKwor
ICAgIHBlcmZANDgwNDEwMDAgeworICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUxLWRk
ci1wbXUiOworICAgICAgcmVnID0gPDB4NDgwNDEwMDAgMHg0MDA+OworICAgICAgYWNjZXNzLWNv
bnRyb2xsZXJzID0gPCZyY2MgMTA0PjsKKyAgICAgIG1lbW9yeS1jaGFubmVsID0gPCZkZHJfY2hh
bm5lbD47CisgICAgfTsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
