Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1873D9F6160
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 10:24:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF1ECC7129D;
	Wed, 18 Dec 2024 09:24:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEFA6C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 09:24:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60N1n011765;
 Wed, 18 Dec 2024 10:24:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3LYXoEwAJCj2ohknL9orR3/jQcCX9UQUNp+RkioFs/s=; b=QLQb+rNaPGsLRKCL
 vxTe1kMHFocrEpOpXo5JVXEJs3ri5oYjn6FjuM7OLs9VUHUilYrL0e9WWrV8Xt1C
 sSCxe3P95YWNdY3aXu0sFLf8jEx9iM/0VrwNFzxkB2QZcArx3LmRVr6BYhgdesLG
 Bf8tjGMMZBjR6XgxaWnfFkdqbq4w6ku2hY7FSCYyuMPFi7vkzqZd//3JYDmlOaEr
 fGB+5HCQH/hZp9cZEWxFdUpG2CIbnyCw7x1dyiGGAnZ7SRvtQlIicmN4zlEcX7Nv
 1cB8sPM7xCd0M4fWAr0ZqsCMqRoaK3ZwiXg2W3ZEG674PjtiMD0ZeAYcW4OLV6zJ
 jG6QXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcrrt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 10:24:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B14094004B;
 Wed, 18 Dec 2024 10:23:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63B9025F1E3;
 Wed, 18 Dec 2024 10:22:30 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:22:30 +0100
From: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 18 Dec 2024 10:22:27 +0100
Message-ID: <20241218092227.771133-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
References: <20241212102050.374501-1-clement.legoffic@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.108]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] watchdog: stm32_iwdg: fix error message
	during driver probe
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

VGhlIGNvbW1pdCAzYWIxNjYzYWY2YzEgKCJ3YXRjaGRvZzogc3RtMzJfaXdkZzogQWRkIHByZXRp
bWVvdXQgc3VwcG9ydCIpCmludHJvZHVjZXMgdGhlIHN1cHBvcnQgZm9yIHRoZSBwcmUtdGltZW91
dCBpbnRlcnJ1cHQuCgpUaGUgc3VwcG9ydCBmb3IgdGhpcyBpbnRlcnJ1cHQgaXMgb3B0aW9uYWwg
YnV0IHRoZSBkcml2ZXIgdXNlcyB0aGUKcGxhdGZvcm1fZ2V0X2lycSgpIHdoaWNoIHByb2R1Y2Vz
IGFuIGVycm9yIG1lc3NhZ2UgZHVyaW5nIHRoZSBkcml2ZXIKcHJvYmUgaWYgd2UgZG9uJ3QgaGF2
ZSBhbnkgYGludGVycnVwdHNgIHByb3BlcnR5IGluIHRoZSBEVC4KClVzZSB0aGUgcGxhdGZvcm1f
Z2V0X2lycV9vcHRpb25hbCgpIEFQSSB0byBnZXQgcmlkIG9mIHRoZSBlcnJvciBtZXNzYWdlCmFz
IHRoaXMgcHJvcGVydHkgaXMgb3B0aW9uYWwuCgpGaXhlczogM2FiMTY2M2FmNmMxICgid2F0Y2hk
b2c6IHN0bTMyX2l3ZGc6IEFkZCBwcmV0aW1lb3V0IHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+ClJldmlld2Vk
LWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KUmV2aWV3ZWQtYnk6IEd1ZW50ZXIgUm9l
Y2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KLS0tCnYxIC0+IHYyOiBDaGFuZ2UgdGhlIGNvbW1pdCBt
ZXNzYWdlIGJlY2F1c2UgaXQgb25seSBwcmludHMgYW4gZXJyb3IKbWVzc2FnZSBhbmQgZG9udCBi
cmVhayB0aGUgRFQgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KCnYyIC0+IHYzOiBGaXggdHlwbyBp
biBjb21taXQgbWVzc2FnZSAncy93aWNoL3doaWNoL2cnLgoKZHJpdmVycy93YXRjaGRvZy9zdG0z
Ml9pd2RnLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL3N0bTMyX2l3ZGcuYyBiL2RyaXZl
cnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCmluZGV4IGQ3MDBlMGQ0OWJiOTUuLjhhZDA2YjU0YzVh
ZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCisrKyBiL2RyaXZl
cnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCkBAIC0yODYsNyArMjg2LDcgQEAgc3RhdGljIGludCBz
dG0zMl9pd2RnX2lycV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJaWYgKCF3
ZHQtPmRhdGEtPmhhc19lYXJseV93YWtldXApCiAJCXJldHVybiAwOwoKLQlpcnEgPSBwbGF0Zm9y
bV9nZXRfaXJxKHBkZXYsIDApOworCWlycSA9IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwocGRl
diwgMCk7CiAJaWYgKGlycSA8PSAwKQogCQlyZXR1cm4gMDsKCgpiYXNlLWNvbW1pdDogZmFjMDRl
ZmM1Yzc5M2RjY2JkMDdlMmQ1OWFmOWY5MGI3ZmMwZGNhNAotLQoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
