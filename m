Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC480AD8925
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 12:16:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89973C36B3C;
	Fri, 13 Jun 2025 10:16:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 832DEC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 10:16:28 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9ZixC007076;
 Fri, 13 Jun 2025 12:16:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 akMVwoF+N7VsrL9WTTtCNnfp5uG51OqdAtK0k00xxME=; b=tuIpcw4bNXqJLpNB
 N/LWNV/rO4nmOFmmCpsc1WKf5mxaFL2Bs4YfX7dJkwj5/rYdDFWnXltW2rJmAVcB
 CLBV66ehwx5IMbQNkbHJWCsoGlkSC1KMLwzIc/JPXd2Tvp+WlYfJWKkDEJbALzR1
 +vwAxkiCqd3aLkJHWgQUq869IqYUueWy5ACP8s5+EVLLDjnx/9rViKYQxbt1i3T4
 6KymEp9HO7z7oBR+NLmk1/CiMA/LbUnT/9cinuDf/mQV5CjCTac9naGkW2u0ZyZh
 q2h63ZK6rCgsUIgL3RcxrHe1MEaeuhqymgz++fspBlo8QvuzNcO4teTehssXPmgO
 n08gcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y05jqsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jun 2025 12:16:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BCDC04005A;
 Fri, 13 Jun 2025 12:15:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60D7C210215;
 Fri, 13 Jun 2025 12:14:20 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:20 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 13 Jun 2025 12:14:15 +0200
MIME-Version: 1.0
Message-ID: <20250613-hdp-upstream-v5-4-6fd6f0dc527c@foss.st.com>
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
Subject: [Linux-stm32] =?utf-8?q?=5BPATCH_v5_4/9=5D_MAINTAINERS=3A_add_Cl?=
 =?utf-8?q?=C3=A9ment_Le_Goffic_as_STM32_HDP_maintainer?=
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

QWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0zMiBIRFAgbWFpbnRhaW5lci4KClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4K
LS0tCiBNQUlOVEFJTkVSUyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA0ZjE3YWY1
ZDcyNDAuLjJhMjIzZDkyZTQ2YiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRB
SU5FUlMKQEAgLTIzNDU4LDYgKzIzNDU4LDEyIEBAIEY6CWRyaXZlcnMvYnVzL3N0bTMyX2V0enBj
LmMKIEY6CWRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKIEY6CWRyaXZlcnMvYnVzL3N0bTMy
X3JpZnNjLmMKIAorU1QgU1RNMzIgSERQIFBJTkNUUkwgRFJJVkVSCitNOglDbMOpbWVudCBMZSBH
b2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CitTOglNYWludGFpbmVkCitGOglE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1oZHAueWFt
bAorRjoJZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMKKwogU1QgU1RN
MzIgSTJDL1NNQlVTIERSSVZFUgogTToJUGllcnJlLVl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2ZXMu
bW9yZHJldEBmb3NzLnN0LmNvbT4KIE06CUFsYWluIFZvbG1hdCA8YWxhaW4udm9sbWF0QGZvc3Mu
c3QuY29tPgoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
