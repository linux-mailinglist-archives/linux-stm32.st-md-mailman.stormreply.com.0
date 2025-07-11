Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0555B01F96
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 16:52:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FFF5C3F931;
	Fri, 11 Jul 2025 14:52:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76736C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 14:52:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BCHMEZ027003;
 Fri, 11 Jul 2025 16:52:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 L5U4iOIMzTLQcNGAWLcYUHl7amMuMgZWgZO8MaFVrQk=; b=DgtqeFb0weOrJedN
 RnVU8286JR+TYdgI2nOeoJVBc3Mac2I12x8bSzsJ2Xy05G/3tAkYbWq1ZvGk3zFi
 XeFf38dYsQLYjTnKmNjzFhsZ/8xUh3h9WQHTcy+5KjDIc/hjQWec3iQpRCdr+pe1
 5lPUg1SwtGng6AdrHfx07jyy03zXqBCtKrH/gfdMgOKyPUlwuaYfKR4qCoqhuztX
 /W7cyzJ1gHtocVXdzCrdc9xiAth/vdN1i+pv9nFY1x14FM241OXyT0JSKRZ+Oppb
 o5JWZ/VTrr3Et+2MDj2AD/HTwkQsrKQLSThxV0XspaKukeiQ+8ghrDCSvITb1jZF
 n7ZC8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfmyt7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 16:52:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C75EB40048;
 Fri, 11 Jul 2025 16:50:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01070B4BE8B;
 Fri, 11 Jul 2025 16:49:14 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:13 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:48:54 +0200
MIME-Version: 1.0
Message-ID: <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 02/16] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
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
