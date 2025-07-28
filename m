Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D14B8B13E6C
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 17:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 267F3C36B2E;
	Mon, 28 Jul 2025 15:33:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBFF6C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 15:32:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SDmqUL025850;
 Mon, 28 Jul 2025 17:32:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 L5U4iOIMzTLQcNGAWLcYUHl7amMuMgZWgZO8MaFVrQk=; b=BKjbs/xs31c7FSK6
 R7Hw18HQ/9sqBmYKB0lJ24Om3mySIoCQUhNKsOM9eaxfgWKe1vxufD07ZCSE7a6b
 VI4iAG0DRoeerDPWNPUUAi2++vS0oGTT4mUMNZAfmehmY1mc+7Tpj5T4zT/lDW0A
 Wy5v6lI01wD/63+TaMivxAbpjZ1OhYmWdJKZMODqtgFu/hyPWd4IUQRQRIPfSO6g
 UQGOmuWcLg1r4nJ6QmCdriRfKje71aZ5yhK7foBX+WP0P1rhiDvF+W6FPRdYF1Oc
 N8/5Tak5VIaC4pC8FAAbc2rCxOee3BauQ4G1SvwemaxM0OgZpU+V6sruODTUrMeo
 6M4rPA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc28w27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 17:32:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4637940045;
 Mon, 28 Jul 2025 17:31:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F84776DC2C;
 Mon, 28 Jul 2025 17:29:51 +0200 (CEST)
Received: from localhost (10.252.23.100) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 17:29:51 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 28 Jul 2025 17:29:33 +0200
MIME-Version: 1.0
Message-ID: <20250728-ddrperfm-upstream-v5-2-03f1be8ad396@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v5 02/20] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
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

UkNDIGlzIGFibGUgdG8gY2hlY2sgdGhlIGF2YWlsYWJpbGl0eSBvZiBhIGNsb2NrLgpBbGxvdyB0
byBxdWVyeSB0aGUgUkNDIHdpdGggYSBmaXJld2FsbCBJRC4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy55YW1sIHwg
NyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2Mu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1w
MjUtcmNjLnlhbWwKaW5kZXggODhlNTJmMTBkMWVjLi40ZDQ3MWUzZDg5YmMgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNj
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0
bTMybXAyNS1yY2MueWFtbApAQCAtMzEsNiArMzEsMTEgQEAgcHJvcGVydGllczoKICAgJyNyZXNl
dC1jZWxscyc6CiAgICAgY29uc3Q6IDEKIAorICAnI2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzJzoK
KyAgICBjb25zdDogMQorICAgIGRlc2NyaXB0aW9uOgorICAgICAgQ29udGFpbnMgdGhlIGZpcmV3
YWxsIElEIGFzc29jaWF0ZWQgdG8gdGhlIHBlcmlwaGVyYWwuCisKICAgY2xvY2tzOgogICAgIGl0
ZW1zOgogICAgICAgLSBkZXNjcmlwdGlvbjogQ0tfU0NNSV9IU0UgSGlnaCBTcGVlZCBFeHRlcm5h
bCBvc2NpbGxhdG9yICg4IHRvIDQ4IE1IeikKQEAgLTEyMyw2ICsxMjgsNyBAQCByZXF1aXJlZDoK
ICAgLSByZWcKICAgLSAnI2Nsb2NrLWNlbGxzJwogICAtICcjcmVzZXQtY2VsbHMnCisgIC0gJyNh
Y2Nlc3MtY29udHJvbGxlci1jZWxscycKICAgLSBjbG9ja3MKIAogYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCkBAIC0xMzYsNiArMTQyLDcgQEAgZXhhbXBsZXM6CiAgICAgICAgIHJlZyA9IDww
eDQ0MjAwMDAwIDB4MTAwMDA+OwogICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47CiAgICAgICAg
ICNyZXNldC1jZWxscyA9IDwxPjsKKyAgICAgICAgI2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzID0g
PDE+OwogICAgICAgICBjbG9ja3MgPSAgPCZzY21pX2NsayBDS19TQ01JX0hTRT4sCiAgICAgICAg
ICAgICAgICAgICA8JnNjbWlfY2xrIENLX1NDTUlfSFNJPiwKICAgICAgICAgICAgICAgICAgIDwm
c2NtaV9jbGsgQ0tfU0NNSV9NU0k+LAoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
