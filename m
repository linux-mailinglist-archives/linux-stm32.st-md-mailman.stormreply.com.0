Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 927C1AC22C3
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 14:40:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35734C7A835;
	Fri, 23 May 2025 12:40:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57F00C7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 12:40:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N825Qc007894;
 Fri, 23 May 2025 14:40:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vOKCvrg9T946MeKb54UlHJZ6LDnhr4kD9B8NCELZ49s=; b=T5ig/Rhci7gH5O3q
 PchuSn3gn3+wap6i8tbRvjrMcyEz0apdkDSsVEXhgMjZORRdOZqY1FARIC8pjHl2
 HkFzBr6l6y4/HsSVKW62pJXzflphmM9W5O8iApUSxZfh3uYQd5PUid/K0EkiC9bV
 fbyu8/GOO9WsKVYRib11IXdhFmF8i5aC7e69BWNuo2FvTPpLgvxh0ZhT+BPldG5/
 BtTaIupJztUEsUL4AA+DVfAqyHgVwlQX25XpBOeUUs3NARkrsCs0Zhv3Gzn4DiRw
 xZecO4xOkJ5EgeMIolE2uQet3il2c5vnvN5kWHlBwcC8Ep6nyKWrDDGzFk/d3bo7
 fiimIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwffe5nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 14:40:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B20540054;
 Fri, 23 May 2025 14:39:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BDB3A0D91C;
 Fri, 23 May 2025 14:38:27 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:26 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 23 May 2025 14:38:16 +0200
MIME-Version: 1.0
Message-ID: <20250523-hdp-upstream-v3-4-bd6ca199466a@foss.st.com>
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
Subject: [Linux-stm32] =?utf-8?q?=5BPATCH_v3_4/9=5D_MAINTAINERS=3A_Add_Cl?=
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
KCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBmMjFmMWRh
YmI1ZmUuLmMwYzMwZmUwMGEyYSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRB
SU5FUlMKQEAgLTIzMDIzLDYgKzIzMDIzLDEyIEBAIEY6CWRyaXZlcnMvYnVzL3N0bTMyX2V0enBj
LmMKIEY6CWRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKIEY6CWRyaXZlcnMvYnVzL3N0bTMy
X3JpZnNjLmMKIAorU1QgU1RNMzIgSERQIFBJTkNUUkwgRFJJVkVSCitNOglDbMOpbWVudCBMZSBH
b2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CitTOglNYWludGFpbmVkCitGOglE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJs
LWhkcC55YW1sCitGOglkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAuYwor
CiBTVCBTVE0zMiBJMkMvU01CVVMgRFJJVkVSCiBNOglQaWVycmUtWXZlcyBNT1JEUkVUIDxwaWVy
cmUteXZlcy5tb3JkcmV0QGZvc3Muc3QuY29tPgogTToJQWxhaW4gVm9sbWF0IDxhbGFpbi52b2xt
YXRAZm9zcy5zdC5jb20+CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
