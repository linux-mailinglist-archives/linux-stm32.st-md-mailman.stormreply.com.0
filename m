Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D53ABAED6FE
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 10:21:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93772C32E8F;
	Mon, 30 Jun 2025 08:21:50 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63AF9C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 08:21:49 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7peFA026641;
 Mon, 30 Jun 2025 10:21:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=IpPSj43m1cefXVsku8pwgV
 hOCIYnHfCUw3HEbomrVW0=; b=6yrs2Wn+1eiPM/Wk0jH/GOVMrh9S63bUTG2ds+
 xCMDGGXmYgD9ds9POLQ8Yw4gQ28ugSurkbOV9sS3O6kc0EnV03Ne7R7G5o4+I3Yk
 J3ujCzgnWaRa3BE5R6MARkC0rY59SFPystbaVy2sDP15B8VaEVHM8fnIXipgN6aH
 lKsC8T5px89cq/uPBu1Sk8xziHK4XEcc94V9CU7ipiB0MdeT66zCBHBPBsv4GcIt
 xsLsExjaf3iH33nZTjHIrdd1FZziAVQCBoU8ShedLcLimJTBTwaKGgiiv+wESMYy
 5+asimpNUK8W9VoqyU/vcd45xnT9ck2LZxhG5aktWzfKza4Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubnkrwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 10:21:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 28D1A40045;
 Mon, 30 Jun 2025 10:20:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC2F34A24F6;
 Mon, 30 Jun 2025 10:20:16 +0200 (CEST)
Received: from localhost (10.252.20.7) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 10:20:16 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 30 Jun 2025 10:20:13 +0200
MIME-Version: 1.0
Message-ID: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
X-B4-Tracking: v=1; b=H4sIALxIYmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM2MD3eKCTN20zApdCzMDE0OzpLQkS7MUJaDqgqJUoDDYpOjY2loA4dS
 aHFkAAAA=
X-Change-ID: 20250630-spi-fix-860416bfb96d
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [Linux-stm32] [PATCH] spi: stm32: fix sram pool free in probe error
	path
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

QWRkIGEgdGVzdCB0byBjaGVjayB3aGV0aGVyIHRoZSBzcmFtX3Bvb2wgaXMgTlVMTCBiZWZvcmUg
ZnJlZWluZyBpdC4KCkZpeGVzOiBkMTdkZDJmMWQ4YTEgKCJzcGk6IHN0bTMyOiB1c2UgU1RNMzIg
RE1BIHdpdGggU1RNMzIgTURNQSB0byBlbmhhbmNlIEREUiB1c2UiKQpSZXBvcnRlZC1ieTogRGFu
IENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBDbMOp
bWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogZHJpdmVy
cy9zcGkvc3BpLXN0bTMyLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktc3RtMzIuYyBi
L2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCmluZGV4IDNkMjBmMDlmMWFlNy4uODU4NDcwYTJjYWI1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktc3RtMzIuYworKysgYi9kcml2ZXJzL3NwaS9z
cGktc3RtMzIuYwpAQCAtMjQ4Niw3ICsyNDg2LDkgQEAgc3RhdGljIGludCBzdG0zMl9zcGlfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoc3BpLT5tZG1hX3J4KQogCQlk
bWFfcmVsZWFzZV9jaGFubmVsKHNwaS0+bWRtYV9yeCk7CiBlcnJfcG9vbF9mcmVlOgotCWdlbl9w
b29sX2ZyZWUoc3BpLT5zcmFtX3Bvb2wsICh1bnNpZ25lZCBsb25nKXNwaS0+c3JhbV9yeF9idWYs
IHNwaS0+c3JhbV9yeF9idWZfc2l6ZSk7CisJaWYgKHNwaS0+c3JhbV9wb29sKQorCQlnZW5fcG9v
bF9mcmVlKHNwaS0+c3JhbV9wb29sLCAodW5zaWduZWQgbG9uZylzcGktPnNyYW1fcnhfYnVmLAor
CQkJICAgICAgc3BpLT5zcmFtX3J4X2J1Zl9zaXplKTsKIGVycl9kbWFfcmVsZWFzZToKIAlpZiAo
c3BpLT5kbWFfdHgpCiAJCWRtYV9yZWxlYXNlX2NoYW5uZWwoc3BpLT5kbWFfdHgpOwoKLS0tCmJh
c2UtY29tbWl0OiAwNDU3MTliMWQwYWFiOThlNmFiZGQ3NzE1ZTg1ODdiOTk3ZDFjZWZhCmNoYW5n
ZS1pZDogMjAyNTA2MzAtc3BpLWZpeC04NjA0MTZiZmI5NmQKCkJlc3QgcmVnYXJkcywKLS0gCkNs
w6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
