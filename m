Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62083AC6A84
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 15:33:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DC69C36B3D;
	Wed, 28 May 2025 13:33:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51AB6C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 13:33:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SDCReO030453;
 Wed, 28 May 2025 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=3ZdAYLi+zIrBjJb1+1raCe
 B2n0nRobcH9FY//yBTp6s=; b=rQMBYRe993nQCtuSSzJVisWB/h5StgWmgGoxkP
 uUNNq3m5acVbtH0YnJtQcSTmtGqhsYjtK91/N7upA/Gx1A7HWX5EmgR4tWKIfIzu
 luqu0HID2e7hn35j7jL4XCtwuRNOTGs8txL27/TeqjNv+1B4yf6VF4vTpNhvBqcB
 vDTAHahsBvfDkA79lyWzp4U+5ckfmh1Nb/HCwwr4/t946eHsfAVlJjtD2c+fOTb1
 HG45HR4JAVnjQBm5bwdo7DUQJwbPEKeK0J9rbytdTV/6y7VGiAr7xR3xvvpTxfCf
 I2nFq8+F4pmJvuTOuuxUxkUZcyNfFekV2dY7Z9r6gEavHbVQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hka5qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 15:33:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0F76B4006F;
 Wed, 28 May 2025 15:31:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 455D56CBDEC;
 Wed, 28 May 2025 15:31:00 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:30:59 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:30:53 +0200
Message-ID: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA4QN2gC/2XNSw6CMBSF4a2Yji0pt49QR+7DOCh9SAdQ0mKjI
 ezdQmJUHJ6bfP+dUbLR24ROhxlFm33yYSiDHQ9Id2q4WexN2QgIcALAcGdGfB/TFK3qsQCw3Ki
 aKelQIWO0zj+23OVadufTFOJzq+d6vb5D/DeUa0ywNIRJLTilRJ1dSKlKU6VDj9ZUhg/nQHYcC
 ufUibZpuXO6+ef0m9Mdp4W3RmhVS8mE2H1fluUFdChY5CgBAAA=
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/9] Introduce HDP support for STM32MP
	platforms
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

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyB0aGUgSGFyZHdhcmUgRGVidWcgUG9ydCAoSERQ
KSBzdXBwb3J0IGZvcgpTVE0zMk1QIHBsYXRmb3Jtcy4KCkl0IGluY2x1ZGVzIHVwZGF0ZXMgdG8g
dGhlIG1taW8gZ3BpbyBkcml2ZXIsIHRoZSBhZGRpdGlvbiBvZiBkZXZpY2UgdHJlZQpiaW5kaW5n
cywgdGhlIEhEUCBkcml2ZXIsIGFuZCB1cGRhdGVzIHRvIHRoZSBkZXZpY2UgdHJlZSBmaWxlcyBm
b3IKU1RNMzJNUDEzLCBTVE0zMk1QMTUsCmFuZCBTVE0zMk1QMjUgU29Dcy4KVGhlIHNlcmllcyBh
bHNvIHVwZGF0ZXMgdGhlIE1BSU5UQUlORVJTIGZpbGUgdG8gaW5jbHVkZSBteXNlbGYgYXMgdGhl
Cm1haW50YWluZXIgZm9yIHRoZSBTVE0zMiBIRFAgZHJpdmVyIGFuZCBhZGRzIHRoZSBuZWNlc3Nh
cnkKcGlubXV4IGNvbmZpZ3VyYXRpb25zIGZvciBIRFAgcGlucyBvbiBTVE0zMk1QMTU3Qy1ESzIg
YXMgZXhhbXBsZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5s
ZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gJ3MvQWRkL2FkZC9nJyBp
biBNQUlOVEFJTkVSUyBjb21taXQgbWVzc2FnZS4KLSBGaXggdGhlICh3cm9uZykgc3RhdHVzIHVw
ZGF0ZSBmb3IgdGhlIHRoZXJtYWwgbm9kZSBpbiBzdG0zMm1wMTMxLmR0c2kKICBmaWxlLgotIERv
IG5vdCBlbmFibGUgSERQIGJ5IGRlZmF1bHQgZHVyaW5nIGNvbXBpbGUgdGVzdGluZy4KLSBDaGFu
Z2UgdGhlIGJpbmRpbmdzIGZpbGUgbmFtZToKICAncy9zdCxzdG0zMi1waW5jdHJsLWhkcC55YW1s
L3N0LHN0bTMyLWhkcC55YW1sL2cnCi0gQWRkIEtyenlzenRvZiBLb3psb3dza2kncyAnUmV2aWV3
ZC1ieScgdHJhaWxlciBvbiBiaW5kaW5ncy4KLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjUwNTIzLWhkcC11cHN0cmVhbS12My0wLWJkNmNhMTk5NDY2YUBmb3NzLnN0
LmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBVc2UgYGJncGlvX2luaXQoKWAgZnVuY3Rpb246CiAgICAt
IEFkZCBhZGQgcGF0Y2ggdG8gY3JlYXRlIHRoZSBgQkdQSU9GX05PX0lOUFVUYCBmbGFnIG5lZWRl
ZCBmb3IgdGhlCiAgICAgYGJncGlvX3NldHVwX2RpcmVjdGlvbigpYCB1c2VkIGluIGBiZ3Bpb19p
bml0KClgCiAgICAtIFJlbW92ZSBgc3RtMzJfaGRwX2dwaW9fZ2V0YCBhbmQgYHN0bTMyX2hkcF9n
cGlvX3NldGAKLSBVc2UgYHN0YXRpY2AgcG0gb3BzCi0gVXBkYXRlIGJpbmRpbmdzOgogICAgLSBh
ZGQgcGF0dGVybiBpbnN0cnVjdGlvbiBmb3IgcGluIHZhbHVlcwogICAgLSByZW1vdmUgZnVuY3Rp
b24ncyBtYXhJdGVtcyB0byB1c2UgYGZ1bmN0aW9uOiB0cnVlYAogICAgLSBmaXggdGhlIGNvbXBh
dGlibGUgaW4gdGhlIGV4ZW1wbGVzCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MDUyMC1oZHAtdXBzdHJlYW0tdjItMC01M2Y2YjhiNWZmYzhAZm9zcy5zdC5jb20K
CkNoYW5nZXMgaW4gdjI6Ci0gUmVtb3ZlIGJpbmRpbmdzIGhlYWRlciBmaWxlcyB3aXRoIGZ1bmN0
aW9uIG5hbWUgYXMgI2RlZmluZQotIEFkZCBtYXRjaF9kYXRhIHdpdGggZnVuY3Rpb24gbmFtZSBm
b3IgdGhyZWUgY29tcGF0aWJsZToKICAic3Qsc3RtMzJtcDEzMS1oZHAiLCAic3Qsc3RtMzJtcDE1
MS1oZHAiIGFuZCAic3Qsc3RtMzJtcDI1MS1oZHAiLgotIFJld29yayBhIGJpdCB0aGUgZHJpdmVy
IHRvIHVzZSBtYXRjaF9kYXRhLgotIFJlbW92ZSB0aGUgdXNlIG9mIGBkZXZfZXJyX3Byb2JlKGAg
aW4gdGhlIHJlc3VtZSBvcHMuCi0gUmVtb3ZlIGBNT0RVTEVfQUxJQVMoYC4KLSBSZW1vdmUgdGhl
IHZlcnRpY2FsIGJhciBpbiBiaW5kaW5ncyBkZXNjcmlwdGlvbiBwYXJhZ3JhcGguCi0gRml4IGFu
IGVycm9yIGluIHRoZSBgcGluY3RybC0wYCBwYXJhbWV0ZXIgb2YgdGhlIGJpbmRpbmcgZXhhbXBs
ZSwgaXQKICB3YXMgcmVmZXJpbmcgYSBub2RlIHRoYXQgd2Fzbid0IGV4aXN0aW5nLgotIFVzZSB1
cHBlcmNhc2UgcGluIG5hbWVzLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTAyMjUtaGRwLXVwc3RyZWFtLXYxLTAtOWQwNDljNjUzMzBhQGZvc3Muc3QuY29tCgot
LS0KQ2zDqW1lbnQgTGUgR29mZmljICg5KToKICAgICAgZ3BpbzogbW1pbzogYWRkIEJHUElPRl9O
T19JTlBVVCBmbGFnIGZvciBHUE8gZ3Bpb2NoaXAKICAgICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6
IHN0bTMyOiBJbnRyb2R1Y2UgSERQCiAgICAgIHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2UgSERQ
IGRyaXZlcgogICAgICBNQUlOVEFJTkVSUzogYWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0z
MiBIRFAgbWFpbnRhaW5lcgogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1
ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxMwogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJk
d2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxNQogICAgICBBUk06IGR0czogc3RtMzI6
IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAyNQogICAgICBBUk06IGR0
czogc3RtMzI6IGFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBIRFAgcGluIGFuZCBhZGQgSERQIHBp
bmN0cmwgbm9kZQogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0
IChIRFApIG9uIHN0bTMybXAxNTdjLWRrMiBib2FyZAoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvc3Qsc3RtMzItaGRwLnlhbWwgIHwgMTg3ICsrKysrKwogTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJtcDEzMS5kdHNpICAgICAgICAgICAgICAgfCAgIDcgKwogYXJjaC9hcm0v
Ym9vdC9kdHMvc3Qvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaSAgICAgICAgfCAgMjUgKwogYXJjaC9h
cm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MS5kdHNpICAgICAgICAgICAgICAgfCAgIDcgKwogYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtZGsyLmR0cyAgICAgICAgICAgfCAgIDYgKwog
YXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kgICAgICAgICAgICAgfCAgIDcg
KwogZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MTEgKy0KIGRyaXZlcnMvcGluY3RybC9zdG0zMi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
IHwgIDE0ICsKIGRyaXZlcnMvcGluY3RybC9zdG0zMi9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jICAg
ICAgICAgIHwgNzIwICsrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9ncGlvL2Ry
aXZlci5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogMTIgZmlsZXMgY2hhbmdlZCwg
OTkxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLS0tCmJhc2UtY29tbWl0OiBhMDhiMmIz
NDIzOWU2M2JkODM5MDc4ZGU5ODkxMWQzNjUzY2RhYjgzCmNoYW5nZS1pZDogMjAyNTAyMjQtaGRw
LXVwc3RyZWFtLTYyMmU1ZGExNGE5ZgoKQmVzdCByZWdhcmRzLAotLSAKQ2zDqW1lbnQgTGUgR29m
ZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
