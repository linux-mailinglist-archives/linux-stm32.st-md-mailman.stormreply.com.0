Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2DCABDE1F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 17:04:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72FDEC7A823;
	Tue, 20 May 2025 15:04:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BB55C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 15:04:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KD0WJa009394;
 Tue, 20 May 2025 17:04:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=tWA7zfIJL8NOL8PgFDUk3K
 GRBtuH2ewpE9P64TjssUg=; b=Qkn9lUJ9qezBGTlonCPfE+5j9jeX/mIKuOGXfc
 9DoXsBxyGO/Xpf8lHgAooic9/wbYDQXAci8St94t1mQz9gE96WD8s/rH6EqvFpt1
 ju58Pt8HLZzTMCk1fhiHT/zJiIGENN5RQyxK9vl9VMXgRkOvjNqOU8PIVRMzEyiC
 6O9KxgAx3YqbEqh2ADt4WMM1xH/VlBy4hI1zQkvSaeCH6KojFU15wDrkXQfj6xst
 vXmkPyAc1eM8/q/Caa/46J/GP9G26N41oG8xwmIP1kX/Y6FZA0GRaf98xj15pcWN
 AOhQC9JrdXMlZeCGFKGCwv+XhMfbUsRI8MtDOnndh6MOPBpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfvke9h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 17:04:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52F5040053;
 Tue, 20 May 2025 17:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1DA2B20848;
 Tue, 20 May 2025 17:02:31 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:31 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 20 May 2025 17:02:27 +0200
Message-ID: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIOZLGgC/1XMQQ6DIBCF4auYWReDo5jYVe/RuCAwFhaKYShpY
 7h7qUkXXf4ved8BTNETw7U5IFL27MNWAy8NGKe3BwlvawNKVBJxEM7u4rlziqRXMSKSsrob9LR
 AveyRFv86uftc23lOIb5PPXff9Qepfyh3QorJymEyo+p7qW9LYG45tSasMJdSPpWS/xOqAAAA
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/8] Introduce HDP support for STM32MP
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
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNoYW5nZXMg
aW4gdjI6Ci0gUmVtb3ZlIGJpbmRpbmdzIGhlYWRlciBmaWxlcyB3aXRoIGZ1bmN0aW9uIG5hbWUg
YXMgI2RlZmluZQotIEFkZCBtYXRjaF9kYXRhIHdpdGggZnVuY3Rpb24gbmFtZSBmb3IgdGhyZWUg
Y29tcGF0aWJsZToKICAic3Qsc3RtMzJtcDEzMS1oZHAiLCAic3Qsc3RtMzJtcDE1MS1oZHAiIGFu
ZCAic3Qsc3RtMzJtcDI1MS1oZHAiLgotIFJld29yayBhIGJpdCB0aGUgZHJpdmVyIHRvIHVzZSBt
YXRjaF9kYXRhLgotIFJlbW92ZSB0aGUgdXNlIG9mIGBkZXZfZXJyX3Byb2JlKGAgaW4gdGhlIHJl
c3VtZSBvcHMuCi0gUmVtb3ZlIGBNT0RVTEVfQUxJQVMoYC4KLSBSZW1vdmUgdGhlIHZlcnRpY2Fs
IGJhciBpbiBiaW5kaW5ncyBkZXNjcmlwdGlvbiBwYXJhZ3JhcGguCi0gRml4IGFuIGVycm9yIGlu
IHRoZSBgcGluY3RybC0wYCBwYXJhbWV0ZXIgb2YgdGhlIGJpbmRpbmcgZXhhbXBsZSwgaXQKICB3
YXMgcmVmZXJpbmcgYSBub2RlIHRoYXQgd2Fzbid0IGV4aXN0aW5nLgotIFVzZSB1cHBlcmNhc2Ug
cGluIG5hbWVzLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAy
MjUtaGRwLXVwc3RyZWFtLXYxLTAtOWQwNDljNjUzMzBhQGZvc3Muc3QuY29tCgotLS0KQ2zDqW1l
bnQgTGUgR29mZmljICg4KToKICAgICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IHN0bTMyOiBJbnRy
b2R1Y2UgSERQCiAgICAgIHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2UgSERQIGRyaXZlcgogICAg
ICBNQUlOVEFJTkVSUzogQWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0zMiBIRFAgbWFpbnRh
aW5lcgogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFAp
IG9uIHN0bTMybXAxMwogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBw
b3J0IChIRFApIG9uIHN0bTMybXAxNQogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2Fy
ZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAyNQogICAgICBBUk06IGR0czogc3RtMzI6IGFk
ZCBhbHRlcm5hdGUgcGlubXV4IGZvciBIRFAgcGluIGFuZCBhZGQgSERQIHBpbmN0cmwgbm9kZQog
ICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0
bTMybXAxNTdjLWRrMiBib2FyZAoKIC4uLi9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0
cmwtaGRwLnlhbWwgICAgIHwgMTg4ICsrKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJtcDEzMS5kdHNpICAgICAgICAgICAgICAgfCAgIDYgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1LXBpbmN0cmwuZHRzaSAgICAgICAgfCAgMjUgKwogYXJjaC9hcm0vYm9vdC9kdHMv
c3Qvc3RtMzJtcDE1MS5kdHNpICAgICAgICAgICAgICAgfCAgIDcgKwogYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJtcDE1N2MtZGsyLmR0cyAgICAgICAgICAgfCAgIDYgKwogYXJjaC9hcm02NC9i
b290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kgICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9w
aW5jdHJsL3N0bTMyL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKwogZHJpdmVy
cy9waW5jdHJsL3N0bTMyL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJp
dmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMgICAgICAgICAgfCA3MzYgKysr
KysrKysrKysrKysrKysrKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCA5OTYgaW5zZXJ0aW9ucygrKQot
LS0KYmFzZS1jb21taXQ6IDA5ZmFjNWM1NzZiYmZmNzY0ZGRkZjJiYWNhMDAzOGIzNTkzNzZmZDgK
Y2hhbmdlLWlkOiAyMDI1MDIyNC1oZHAtdXBzdHJlYW0tNjIyZTVkYTE0YTlmCgpCZXN0IHJlZ2Fy
ZHMsCi0tIApDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
