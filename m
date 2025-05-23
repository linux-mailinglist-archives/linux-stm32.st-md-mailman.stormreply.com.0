Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD276AC22C9
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 14:40:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D00EC7A82F;
	Fri, 23 May 2025 12:40:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5036C7A832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 12:40:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCdHn2020184;
 Fri, 23 May 2025 14:40:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 /fb3UPZu5WN39hqyomy18YDn8fBiBvMNblbm+Y5i2po=; b=F9IwTXXmarj9zcYn
 7sBebl8u+W/70ktx+a2G6ORdsRrTsQ6SxwIT/O6CXoQjGXboV/3f7xZqfn4YtzeB
 mXrE7t8H6e4mSIMefSw4+mgN1u+f+WvTRQ/zo0wjJV5Ra0GW1VcpnLD2kSG8Lk3y
 H0wzyiwWehSJF4N2LnPLfeK42ai7LOMiAAqOFysbtRdNQIZnheKu3pDiCJvLlDBl
 tYnwRqziInR+1Bc5qE03td1IACDA8qvEnkQzChVW48D2j2Es08dQWr+02bdUvenp
 totCqQCpP58PMcHBF65HLZX3krM1UYSXP0xwHSdOlh3ACSaVJLYKgfVO1edeySkW
 e1ivig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwffe5nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 14:40:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F11414004F;
 Fri, 23 May 2025 14:39:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 986AEA0D915;
 Fri, 23 May 2025 14:38:24 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:24 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 23 May 2025 14:38:13 +0200
MIME-Version: 1.0
Message-ID: <20250523-hdp-upstream-v3-1-bd6ca199466a@foss.st.com>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag
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
YGRpcmVjdGlvbl9pbnB1dGAgYnkgZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExl
IEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwaW8v
Z3Bpby1tbWlvLmMgICAgfCAxMSArKysrKysrKysrLQogaW5jbHVkZS9saW51eC9ncGlvL2RyaXZl
ci5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jIGIvZHJpdmVycy9ncGlv
L2dwaW8tbW1pby5jCmluZGV4IDQ4NDFlNGViZTdhNi4uMDliOWUxMjc1ZTdlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwaW8vZ3Bpby1tbWlvLmMKKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tbW1pby5j
CkBAIC0zMzUsNiArMzM1LDExIEBAIHN0YXRpYyBpbnQgYmdwaW9fZGlyX3JldHVybihzdHJ1Y3Qg
Z3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8sIGJvb2wgZGlyX291CiAJCXJldHVybiBw
aW5jdHJsX2dwaW9fZGlyZWN0aW9uX2lucHV0KGdjLCBncGlvKTsKIH0KIAorc3RhdGljIGludCBi
Z3Bpb19kaXJfaW5fZXJyKHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3BpbykK
K3sKKwlyZXR1cm4gLUVJTlZBTDsKK30KKwogc3RhdGljIGludCBiZ3Bpb19zaW1wbGVfZGlyX2lu
KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3BpbykKIHsKIAlyZXR1cm4gYmdw
aW9fZGlyX3JldHVybihnYywgZ3BpbywgZmFsc2UpOwpAQCAtNTY2LDcgKzU3MSwxMSBAQCBzdGF0
aWMgaW50IGJncGlvX3NldHVwX2RpcmVjdGlvbihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywKIAkJCWdj
LT5kaXJlY3Rpb25fb3V0cHV0ID0gYmdwaW9fZGlyX291dF9lcnI7CiAJCWVsc2UKIAkJCWdjLT5k
aXJlY3Rpb25fb3V0cHV0ID0gYmdwaW9fc2ltcGxlX2Rpcl9vdXQ7Ci0JCWdjLT5kaXJlY3Rpb25f
aW5wdXQgPSBiZ3Bpb19zaW1wbGVfZGlyX2luOworCisJCWlmIChmbGFncyAmIEJHUElPRl9OT19J
TlBVVCkKKwkJCWdjLT5kaXJlY3Rpb25faW5wdXQgPSBiZ3Bpb19kaXJfaW5fZXJyOworCQllbHNl
CisJCQlnYy0+ZGlyZWN0aW9uX2lucHV0ID0gYmdwaW9fc2ltcGxlX2Rpcl9pbjsKIAl9CiAKIAly
ZXR1cm4gMDsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZ3Bpby9kcml2ZXIuaCBiL2luY2x1
ZGUvbGludXgvZ3Bpby9kcml2ZXIuaAppbmRleCA0YzAyOTRhOTEwNGQuLjQyODkwZGI5YjEwZSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvZ3Bpby9kcml2ZXIuaApAQCAtNzQ5LDYgKzc0OSw3IEBAIGludCBiZ3Bpb19pbml0KHN0cnVj
dCBncGlvX2NoaXAgKmdjLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAjZGVmaW5lIEJHUElPRl9OT19P
VVRQVVQJCUJJVCg1KSAvKiBvbmx5IGlucHV0ICovCiAjZGVmaW5lIEJHUElPRl9OT19TRVRfT05f
SU5QVVQJCUJJVCg2KQogI2RlZmluZSBCR1BJT0ZfUElOQ1RSTF9CQUNLRU5ECQlCSVQoNykgLyog
Q2FsbCBwaW5jdHJsIGRpcmVjdGlvbiBzZXR0ZXJzICovCisjZGVmaW5lIEJHUElPRl9OT19JTlBV
VAkJCUJJVCg4KSAvKiBvbmx5IG91dHB1dCAqLwogCiAjaWZkZWYgQ09ORklHX0dQSU9MSUJfSVJR
Q0hJUAogaW50IGdwaW9jaGlwX2lycWNoaXBfYWRkX2RvbWFpbihzdHJ1Y3QgZ3Bpb19jaGlwICpn
YywKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
