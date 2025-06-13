Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9090BAD8920
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 12:16:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51BADC36B35;
	Fri, 13 Jun 2025 10:16:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB0DC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 10:16:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D7c4F6008338;
 Fri, 13 Jun 2025 12:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ZMyyj5buSxftlccdSeuM3libTxcs3x9i/7d96dILmVM=; b=t+zAykKv3En48ZF5
 XcPFD221B7uMJCV8s2FBGNAWIRMt1RtxWnX0gHG9Kk7Y+mkuxxHPFieXC5TIZ2eS
 fS4P+Ufo0XKac7groNILF6jQEw7UMuyt99vz1zQWUmzvXcWITTe7YUITaEEobGdV
 6pZav/9ciVGkNwiDw8RjAcBBHqhe+N0kdqVwQ8Q2TRAA73o5xTLFv0nqqOHV6KiA
 TQHTaIEdmeipO1KWlg93oCsrRPXLsm4icF6sdh1CIWp0rQeG2if5dtszqJk+fLvz
 B0Zl8dQVx9cyQsZ6jt73C1GdqtZy/JaPGGksV+n4qKaIJBMjb/pWZpQT4Pcd4/fE
 5BpqAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumwhuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jun 2025 12:16:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CFCC640057;
 Fri, 13 Jun 2025 12:15:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 208F2210235;
 Fri, 13 Jun 2025 12:14:18 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:17 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 13 Jun 2025 12:14:12 +0200
MIME-Version: 1.0
Message-ID: <20250613-hdp-upstream-v5-1-6fd6f0dc527c@foss.st.com>
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-0537a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag
 for GPO gpiochip
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

V2hlbiB1c2luZyBiZ3Bpb19pbml0IHdpdGggYSBncGlvY2hpcCBhY3RpbmcgYXMgYSBHUE8gKG91
dHB1dCBvbmx5KSwgdGhlCmdwaW9jaGlwIG9wcyBgZGlyZWN0aW9uX2lucHV0YCB3YXMgc2V0IHRv
IGBiZ3Bpb19zaW1wbGVfZGlyX2luYCBieQpkZWZhdWx0IGJ1dCB3ZSBoYXZlIG5vIGlucHV0IGFi
aWxpdHkuCgpBZGRpbmcgdGhpcyBmbGFnIGFsbG93cyB0byBzZXQgYSB2YWxpZCBvcHMgZm9yIHRo
ZSBgZGlyZWN0aW9uX291dHB1dGAKb3BzIHdpdGhvdXQgc2V0dGluZyBhIHZhbGlkIG9wcyBmb3Ig
YGRpcmVjdGlvbl9pbnB1dGAgYnkgZGVmYXVsdC4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdv
ZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwaW8vZ3Bp
by1tbWlvLmMgICAgfCAxMSArKysrKysrKysrLQogaW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5o
IHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jIGIvZHJpdmVycy9ncGlvL2dw
aW8tbW1pby5jCmluZGV4IDQ4NDFlNGViZTdhNi4uMDliOWUxMjc1ZTdlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwaW8vZ3Bpby1tbWlvLmMKKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jCkBA
IC0zMzUsNiArMzM1LDExIEBAIHN0YXRpYyBpbnQgYmdwaW9fZGlyX3JldHVybihzdHJ1Y3QgZ3Bp
b19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8sIGJvb2wgZGlyX291CiAJCXJldHVybiBwaW5j
dHJsX2dwaW9fZGlyZWN0aW9uX2lucHV0KGdjLCBncGlvKTsKIH0KIAorc3RhdGljIGludCBiZ3Bp
b19kaXJfaW5fZXJyKHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3BpbykKK3sK
KwlyZXR1cm4gLUVJTlZBTDsKK30KKwogc3RhdGljIGludCBiZ3Bpb19zaW1wbGVfZGlyX2luKHN0
cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3BpbykKIHsKIAlyZXR1cm4gYmdwaW9f
ZGlyX3JldHVybihnYywgZ3BpbywgZmFsc2UpOwpAQCAtNTY2LDcgKzU3MSwxMSBAQCBzdGF0aWMg
aW50IGJncGlvX3NldHVwX2RpcmVjdGlvbihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywKIAkJCWdjLT5k
aXJlY3Rpb25fb3V0cHV0ID0gYmdwaW9fZGlyX291dF9lcnI7CiAJCWVsc2UKIAkJCWdjLT5kaXJl
Y3Rpb25fb3V0cHV0ID0gYmdwaW9fc2ltcGxlX2Rpcl9vdXQ7Ci0JCWdjLT5kaXJlY3Rpb25faW5w
dXQgPSBiZ3Bpb19zaW1wbGVfZGlyX2luOworCisJCWlmIChmbGFncyAmIEJHUElPRl9OT19JTlBV
VCkKKwkJCWdjLT5kaXJlY3Rpb25faW5wdXQgPSBiZ3Bpb19kaXJfaW5fZXJyOworCQllbHNlCisJ
CQlnYy0+ZGlyZWN0aW9uX2lucHV0ID0gYmdwaW9fc2ltcGxlX2Rpcl9pbjsKIAl9CiAKIAlyZXR1
cm4gMDsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZ3Bpby9kcml2ZXIuaCBiL2luY2x1ZGUv
bGludXgvZ3Bpby9kcml2ZXIuaAppbmRleCBiNTMyMzMwNTFiZWUuLjk3Y2M3NTYyMzI2MSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5oCisrKyBiL2luY2x1ZGUvbGludXgv
Z3Bpby9kcml2ZXIuaApAQCAtNzUwLDYgKzc1MCw3IEBAIGludCBiZ3Bpb19pbml0KHN0cnVjdCBn
cGlvX2NoaXAgKmdjLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAjZGVmaW5lIEJHUElPRl9OT19PVVRQ
VVQJCUJJVCg1KSAvKiBvbmx5IGlucHV0ICovCiAjZGVmaW5lIEJHUElPRl9OT19TRVRfT05fSU5Q
VVQJCUJJVCg2KQogI2RlZmluZSBCR1BJT0ZfUElOQ1RSTF9CQUNLRU5ECQlCSVQoNykgLyogQ2Fs
bCBwaW5jdHJsIGRpcmVjdGlvbiBzZXR0ZXJzICovCisjZGVmaW5lIEJHUElPRl9OT19JTlBVVAkJ
CUJJVCg4KSAvKiBvbmx5IG91dHB1dCAqLwogCiAjaWZkZWYgQ09ORklHX0dQSU9MSUJfSVJRQ0hJ
UAogaW50IGdwaW9jaGlwX2lycWNoaXBfYWRkX2RvbWFpbihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywK
Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
