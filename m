Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411DB05FB1
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 16:08:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20453C3F93B;
	Tue, 15 Jul 2025 14:08:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D444C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 14:08:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDoK8E030276;
 Tue, 15 Jul 2025 16:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 uXGw9WUeFha5lfSOB+Dp3arpnW5I3Ss/rTV2qKNDad4=; b=uGS0bm18zxhCbfyn
 jIT+2Xi5vbZxfdeskXesd3o4AuPJBoOXN2E2Skz36fv4UB8dFl6NotMRww5Hx4V3
 v0AcQIy+pCw0zmXfaOiVqtuV+4dWsHSF64XzqrUJ6qEwBayfrR7rhEdwqKOHRBs5
 qMYbHPom/9E5jiw4sW1SGJFQWSm9oRbMRgkKsNVkJ5J0DzDprnkcquicZTSIw/zP
 eLpYtgYtBzz+Uj23nsZ9sbq9MEf6hbWpJMLffqSI1YKe6j1/aMNrD7pSdsSmX9We
 9UcOnMn+xREuCBCwJB7NlLAfscro3CW7n6+fKYHvK9yPNW+SjwMpM+wKZKvdt9Ex
 PlomMg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47uekgwahs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 16:08:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B28B240055;
 Tue, 15 Jul 2025 16:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 111D9BA56B7;
 Tue, 15 Jul 2025 16:07:25 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:07:24 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 15 Jul 2025 16:07:13 +0200
MIME-Version: 1.0
Message-ID: <20250715-upstream-optee-rtc-v1-1-e0fdf8aae545@foss.st.com>
References: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
In-Reply-To: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Jens Wiklander
 <jens.wiklander@linaro.org>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] rtc: rtc-optee: fix memory leak on driver
	removal
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

Rml4IGEgbWVtb3J5IGxlYWsgaW4gY2FzZSBvZiBkcml2ZXIgcmVtb3ZhbC4KRnJlZSB0aGUgc2hh
cmVkIG1lbW9yeSB1c2VkIGZvciBhcmd1bWVudHMgZXhjaGFuZ2VzIGJldHdlZW4ga2VybmVsIGFu
ZApPUC1URUUgUlRDIFBUQS4KCkZpeGVzOiA4MWMyZjA1OWFiOTAgKCJydGM6IG9wdGVlOiBhZGQg
UlRDIGRyaXZlciBmb3IgT1AtVEVFIFJUQyBQVEEiKQpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
ZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogZHJpdmVycy9ydGMv
cnRjLW9wdGVlLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1vcHRlZS5jIGIvZHJpdmVycy9ydGMvcnRjLW9wdGVlLmMK
aW5kZXggOWY4YjVkNGE4ZjZiLi42Yjc3YzEyMmZkYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcnRj
L3J0Yy1vcHRlZS5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1vcHRlZS5jCkBAIC0zMjAsNiArMzIw
LDcgQEAgc3RhdGljIGludCBvcHRlZV9ydGNfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsK
IAlzdHJ1Y3Qgb3B0ZWVfcnRjICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAKKwl0ZWVf
c2htX2ZyZWUocHJpdi0+c2htKTsKIAl0ZWVfY2xpZW50X2Nsb3NlX3Nlc3Npb24ocHJpdi0+Y3R4
LCBwcml2LT5zZXNzaW9uX2lkKTsKIAl0ZWVfY2xpZW50X2Nsb3NlX2NvbnRleHQocHJpdi0+Y3R4
KTsKIAoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
