Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CFA43820
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 09:52:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D5DEC7A84B;
	Tue, 25 Feb 2025 08:52:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14D6DC7A83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 08:52:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7qIWK025335;
 Tue, 25 Feb 2025 09:52:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PoNUkbtMyBQo7qulpQlZywD2O/n9xiN+esl2pnpD4vg=; b=3ZF/nRpStXZOGnf2
 vM4VyTdNSt9jGqT0xjc2XyKN7YoEZhDHDTV02qeF0soWaLqQ8ujLTx8QiOdvDqHB
 ckgK87sTTrqMyvRZCjlDXc2qmgQtonZrqlEBk6ua3tw2p3ONPDRg4NTK6gc7soVj
 g+m+Txsh5gIah26Y3V4UwAxupbqgI0WQMO4c5aE0ViY26xihskl7HHG31pHpnFn9
 3ALjP4rakPFCAQY0WEJJU7IpJPA8c3zdVkRKnSujiOi08DNJr64JWJ052fllBYN6
 1FKZM7PB7UixJNlUzdK05BiCoAEnXMyOrvt0hJU8Ij2okKUzE4hbKPkQlqoLi8CF
 ZrQMaA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spstfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 09:52:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BAE040057;
 Tue, 25 Feb 2025 09:50:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7698047A7A3;
 Tue, 25 Feb 2025 09:48:07 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:07 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:01 +0100
MIME-Version: 1.0
Message-ID: <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
In-Reply-To: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-42535
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/9] dt-bindings: pinctrl: stm32: Introduce HDP
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

SW50cm9kdWNlIGR0LWJpbmRpbmdzIGZvciBIRFAgZHJpdmVyLgoKJ0hEUCcgc3RhbmRzIGZvciBI
YXJkd2FyZSBEZWJ1ZyBQb3J0LCBpdCBpcyBhbiBoYXJkd2FyZSBibG9jayBpbgpTVE1pY3JvbGVj
dHJvbmljcycgTVBVcyB0aGF0IGxldCB0aGUgdXNlciBkZWNpZGUgd2hpY2ggaW50ZXJuYWwgU29D
J3MKc2lnbmFsIHRvIG9ic2VydmUuCkl0IHByb3ZpZGVzIDggcG9ydHMgYW5kIGZvciBlYWNoIHBv
cnQgdGhlcmUgaXMgdXAgdG8gMTYgZGlmZmVyZW50CnNpZ25hbHMgdGhhdCBjYW4gYmUgb3V0cHV0
LgpTaWduYWxzIGFyZSBkaWZmZXJlbnQgZm9yIGVhY2ggTVBVLgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIC4uLi9i
aW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwtaGRwLnlhbWwgICAgIHwgNzIgKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0z
Mi1waW5jdHJsLWhkcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvc3Qsc3RtMzItcGluY3RybC1oZHAueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLmI2Nzg3MTYyZmFhYQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwtaGRwLnlh
bWwKQEAgLTAsMCArMSw3MiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UpCisjIENvcHlyaWdodCAoQykgU1RNaWNyb2VsZWN0cm9uaWNz
IDIwMjUuCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwtaGRwLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNUTTMyIEhhcmR3
YXJlIERlYnVnIFBvcnQgTXV4L0NvbmZpZworCittYWludGFpbmVyczoKKyAgLSBDbMOpbWVudCBM
RSBHT0ZGSUMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CisKK2Rlc2NyaXB0aW9uOiB8
CisgIFNUTWljcm9lbGVjdHJvbmljcydzIFNUTTMyIE1QVXMgaW50ZWdyYXRlIGEgSGFyZHdhcmUg
RGVidWcgUG9ydCAoSERQKS4KKyAgSXQgYWxsb3dzIHRvIG91dHB1dCBpbnRlcm5hbCBzaWduYWxz
IG9uIFNvQydzIEdQSU8uCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6
IHN0LHN0bTMybXAtaGRwCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2tzOgor
ICAgIG1heEl0ZW1zOiAxCisKK3BhdHRlcm5Qcm9wZXJ0aWVzOgorICAnLXBpbnMkJzoKKyAgICB0
eXBlOiBvYmplY3QKKyAgICAkcmVmOiBwaW5tdXgtbm9kZS55YW1sIworCisgICAgcHJvcGVydGll
czoKKyAgICAgIGZ1bmN0aW9uOgorICAgICAgICBlbnVtOiBbICIwIiwgIjEiLCAiMiIsICIzIiwg
IjQiLCAiNSIsICI2IiwgIjciLAorICAgICAgICAgICAgICAgICI4IiwgIjkiLCAiMTAiLCAiMTEi
LCAiMTIiLCAiMTMiLCAiMTQiLAorICAgICAgICAgICAgICAgICIxNSIgXQorCisgICAgICBwaW5z
OgorICAgICAgICBlbnVtOiBbIGhkcDAsIGhkcDEsIGhkcDIsIGhkcDMsIGhkcDQsIGhkcDUsIGhk
cDYsIGhkcDcgXQorCisgICAgcmVxdWlyZWQ6CisgICAgICAtIGZ1bmN0aW9uCisgICAgICAtIHBp
bnMKKworICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCithbGxPZjoKKyAgLSAkcmVm
OiBwaW5jdHJsLnlhbWwjCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAg
LSBjbG9ja3MKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAt
IHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3RtMzJtcDEtY2xrcy5oPgorICAg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMybXAxNS1oZHAuaD4KKyAgICAvL0V4
YW1wbGUgMQorICAgIHBpbmN0cmxANTQwOTAwMDAgeworICAgICAgY29tcGF0aWJsZSA9ICJzdCxz
dG0zMm1wLWhkcCI7CisgICAgICByZWcgPSA8MHg1NDA5MDAwMCAweDQwMD47CisgICAgICBjbG9j
a3MgPSA8JnJjYyBIRFA+OworICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKyAgICAg
IHBpbmN0cmwtMCA9IDwmaGRwMj47CisgICAgICBoZHAyLXBpbnMgeworICAgICAgICBmdW5jdGlv
biA9IEhEUDJfR1BPVkFMXzI7CisgICAgICAgIHBpbnMgPSAiaGRwMiI7CisgICAgICB9OworICAg
IH07CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
