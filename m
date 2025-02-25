Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF45A4381E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 09:52:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41AE8C7A847;
	Tue, 25 Feb 2025 08:52:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE202C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 08:52:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7nJ8V022886;
 Tue, 25 Feb 2025 09:51:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=hJp37HjRsS682VOG5jU/XH
 JBc6aQu3148SnFqqYYIJs=; b=wokAmkmNpW2iVOAoTyplt01g7lc3I6lK1JoBYv
 5ukC+rWeH/OUKA6tcVveTCTqohwD+FQFBxAkroO50xd2+xp0tgbVg6tQ6myJn/N0
 lyeL7PeVQ5dIents9G6bl8VMQNSS3W2sEtSMWsGEzEDgl7x5f6nt9ah/SsJlpXns
 63rWLs+63cui536rbOoI88B+z8kP4s04Dbve5AZyBVMk5XyysyfsDqnPvlXYI6Ht
 e+3tErD9obpGTVFpMaSTFKHn8A6FwIcBSjRvMW2/FrWmtbB4hT0TYhE5FwM5nXiH
 +DXxQKzkHArsgWBkg7zKoteVc4BkmtduikXKly5OvKPtR8TA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1td1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 09:51:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BA7B40056;
 Tue, 25 Feb 2025 09:50:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06FFC479F61;
 Tue, 25 Feb 2025 09:48:06 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:05 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:47:59 +0100
Message-ID: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL+DvWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMT3YyUAt3SguKSotTEXF0zI6NU05REQ5NEyzQloJaCotS0zAqwcdG
 xtbUAc+Fd+l4AAAA=
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
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
Subject: [Linux-stm32] [PATCH 0/9] Introduce HDP support for STM32MP
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
KSBzdXBwb3J0IGZvcgpTVE0zMk1QIHBsYXRmb3Jtcy4KCkl0IGluY2x1ZGVzIHRoZSBhZGRpdGlv
biBvZiBkZXZpY2UgdHJlZSBiaW5kaW5ncywgdGhlIEhEUCBkcml2ZXIsCmFuZCB1cGRhdGVzIHRv
IHRoZSBkZXZpY2UgdHJlZSBmaWxlcyBmb3IgU1RNMzJNUDEzLCBTVE0zMk1QMTUsCmFuZCBTVE0z
Mk1QMjUgU29Dcy4KVGhlIHNlcmllcyBhbHNvIHVwZGF0ZXMgdGhlIE1BSU5UQUlORVJTIGZpbGUg
dG8gaW5jbHVkZSBteXNlbGYgYXMgdGhlCm1haW50YWluZXIgZm9yIHRoZSBTVE0zMiBIRFAgZHJp
dmVyIGFuZCBhZGRzIHRoZSBuZWNlc3NhcnkKcGlubXV4IGNvbmZpZ3VyYXRpb25zIGZvciBIRFAg
cGlucyBvbiBTVE0zMk1QMTU3Qy1ESzIgYXMgZXhhbXBsZS4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNsw6ltZW50
IExlIEdvZmZpYyAoOSk6CiAgICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBzdG0zMjogQWRkIEhE
UCBpbmNsdWRlcyBmb3Igc3RtMzJtcCBwbGF0Zm9ybXMKICAgICAgZHQtYmluZGluZ3M6IHBpbmN0
cmw6IHN0bTMyOiBJbnRyb2R1Y2UgSERQCiAgICAgIHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2Ug
SERQIGRyaXZlcgogICAgICBNQUlOVEFJTkVSUzogQWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBT
VE0zMiBIRFAgbWFpbnRhaW5lcgogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBk
ZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxMwogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBI
YXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxNQogICAgICBBUk06IGR0czogc3Rt
MzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAyNQogICAgICBBUk06
IGR0czogc3RtMzI6IGFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBIRFAgcGluIGFuZCBhZGQgSERQ
IHBpbmN0cmwgbm9kZQogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBw
b3J0IChIRFApIG9uIHN0bTMybXAxNTdjLWRrMiBib2FyZAoKIC4uLi9iaW5kaW5ncy9waW5jdHJs
L3N0LHN0bTMyLXBpbmN0cmwtaGRwLnlhbWwgICAgIHwgIDcyICsrKysrCiBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBhcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgICAgICAgICAgICAgICB8ICAgNyArCiBhcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTUtcGluY3RybC5kdHNpICAgICAgICB8ICAyNiArKwogYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MS5kdHNpICAgICAgICAgICAgICAgfCAgIDcgKwog
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtZGsyLmR0cyAgICAgICAgICAgfCAgIDYg
KwogYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kgICAgICAgICAgICAgfCAg
IDcgKwogZHJpdmVycy9waW5jdHJsL3N0bTMyL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
fCAgMTQgKwogZHJpdmVycy9waW5jdHJsL3N0bTMyL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwogZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMgICAg
ICAgICAgfCAzMDEgKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2R0LWJpbmRpbmdzL3Bp
bmN0cmwvc3RtMzJtcDEzLWhkcC5oICAgICAgICB8IDEzMCArKysrKysrKysKIGluY2x1ZGUvZHQt
YmluZGluZ3MvcGluY3RybC9zdG0zMm1wMTUtaGRwLmggICAgICAgIHwgMTE2ICsrKysrKysrCiBp
bmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzJtcDI1LWhkcC5oICAgICAgICB8IDE0NCAr
KysrKysrKysrCiAxMyBmaWxlcyBjaGFuZ2VkLCA4MzggaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1j
b21taXQ6IGQwMTg5NWM1YjExODQ5MTEzZTcwZjAxMmQ5ZDE0MmYxZDg4ODUyZjAKY2hhbmdlLWlk
OiAyMDI1MDIyNC1oZHAtdXBzdHJlYW0tNjIyZTVkYTE0YTlmCgpCZXN0IHJlZ2FyZHMsCi0tIApD
bMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
