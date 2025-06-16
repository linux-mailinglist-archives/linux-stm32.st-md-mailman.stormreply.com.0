Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D679ADABC2
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 11:23:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4080CC36B3E;
	Mon, 16 Jun 2025 09:23:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 213C7C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 09:23:52 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G9HgW0009690;
 Mon, 16 Jun 2025 11:23:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=1VW7Pa1Gidi9hXrAppAz/z
 YkvYMUMSpLtKQNgis2pAs=; b=nGvHoSK9r/Yv+tQd5+u/IYuDVPowaAxR9jB+y0
 vlFUl5YmxwhAFmmMOnSBe0HXaK873nI7ZKsuE/QeZnoyw7h/O8he9jPCHdwhwBB8
 KLWxnl0Ed5wFb7wuZb2gnPKpzjqd1Jtpl04pOvadm1ujCNCIiKKLnvWKKaFUc/pz
 1i68Ewwmpq4hsBo4HQ/MW4U0hzy7UZRtLaW2zcxCwLpJosjF2o7ejNmaE0SGwEXm
 gGNxgJawgJRnsURShoR873GPTgiJj+aids0ojLnl4ZR/NfckPVmFrNq4ssz0iMh9
 ssh/zSut0yPiF5ILulMaUrudg5tkq1ZtkCHy2TYflWRIF2/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 479jn4mm6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:23:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 075084005D;
 Mon, 16 Jun 2025 11:22:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9066FAA69AC;
 Mon, 16 Jun 2025 11:21:06 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:06 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:01 +0200
Message-ID: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP3hT2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3eKCTN3SguKSotTEXF3DpEQTC4sUC0OTVHMloJaCotS0zAqwcdG
 xtbUAWkKrH14AAAA=
X-Change-ID: 20250527-spi-upstream-1ba488d814e7
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/6] Add few updates to the STM32 SPI driver
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

VGhpcyBzZXJpZXMgYWltcyB0byBpbXByb3ZlIHRoZSBTVE0zMiBTUEkgZHJpdmVyIGluIGRpZmZl
cmVudCBhcmVhcy4KSXQgYWRkcyBTUElfUkVBRFkgbW9kZSwgZml4ZXMgYW4gaXNzdWUgcmFpc2Vk
IGJ5IGEga2VybmVsIGJvdCwKYWRkIHRoZSBhYmlsaXR5IHRvIHVzZSBETUEtTURNQSBjaGFpbmlu
ZyBmb3IgUlggYW5kIGRlcHJlY2F0ZSBhbiBTVCBiaW5kaW5ncwp2ZW5kb3IgcHJvcGVydHkuCgpT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5z
dC5jb20+Ci0tLQpDbMOpbWVudCBMZSBHb2ZmaWMgKDYpOgogICAgICBzcGk6IHN0bTMyOiBBZGQg
U1BJX1JFQURZIG1vZGUgdG8gc3BpIGNvbnRyb2xsZXIKICAgICAgc3BpOiBzdG0zMjogQ2hlY2sg
Zm9yIGNmZyBhdmFpbGFiaWxpdHkgaW4gc3RtMzJfc3BpX3Byb2JlCiAgICAgIGR0LWJpbmRpbmdz
OiBzcGk6IHN0bTMyOiB1cGRhdGUgYmluZGluZ3Mgd2l0aCBTUEkgUnggRE1BLU1ETUEgY2hhaW5p
bmcKICAgICAgc3BpOiBzdG0zMjogdXNlIFNUTTMyIERNQSB3aXRoIFNUTTMyIE1ETUEgdG8gZW5o
YW5jZSBERFIgdXNlCiAgICAgIHNwaTogc3RtMzI6IGRlcHJlY2F0ZSBgc3Qsc3BpLW1pZGktbnNg
IHByb3BlcnR5CiAgICAgIGR0LWJpbmRpbmdzOiBzcGk6IHN0bTMyOiBkZXByZWNhdGUgYHN0LHNw
aS1taWRpLW5zYCBwcm9wZXJ0eQoKIC4uLi9iaW5kaW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJv
cHMueWFtbCAgICAgICAgIHwgICAxICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zdCxz
dG0zMi1zcGkueWFtbCAgICAgIHwgIDQ4ICsrKy0KIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzEwICsrKysrKysrKysrKysrKysrKy0tLQogMyBm
aWxlcyBjaGFuZ2VkLCAzMjUgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCi0tLQpiYXNl
LWNvbW1pdDogZTA0Yzc4ZDg2YTk2OTlkMTM2OTEwY2ZjMGJkY2YwMTA4N2UzMjY3ZQpjaGFuZ2Ut
aWQ6IDIwMjUwNTI3LXNwaS11cHN0cmVhbS0xYmE0ODhkODE0ZTcKCkJlc3QgcmVnYXJkcywKLS0g
CkNsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
