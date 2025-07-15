Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B3B05FAF
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 16:08:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05DD1C349C0;
	Tue, 15 Jul 2025 14:08:42 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD57AC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 14:08:40 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FE6WrE015016;
 Tue, 15 Jul 2025 16:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=470mP4bxBH7G0P09+MOOw3
 OPj3nyNTjTISkkwVkIIc4=; b=HJLuOnXmaQvZrUzwkQcXXgslkkD+u1VMvT7vBn
 F33ISkO/VfJBpPf+Kt23F27yyEt8g+lNXlu40ruiLIFiQJESuoGmrKI72Ws5dxcK
 /zFtUG+KKd7pUQ7kJZJIB9KgiQ1gDTAI4kv1tpZq7PK2m2SvNvP261SZvwSnzXPy
 bGQOiGcdWn7/X4pzuRi9qB6xJww1WZyEl7tk2GUw2QJ5RSo3Bha+OgHVVLwVcCa/
 Dz3K9odL4IjmERl503i584/tmbL4CbqKX4kqLTWKxqtBW0eklNoOFM3mdb3LAfeQ
 W3PxLF/FrsJddENCGRSJ14/g1UKEJ5NZtXVkqfCc+WQ5mnTg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2nntncq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 16:08:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 90B6240054;
 Tue, 15 Jul 2025 16:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57141B885C8;
 Tue, 15 Jul 2025 16:07:24 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:07:24 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 15 Jul 2025 16:07:12 +0200
Message-ID: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJBgdmgC/x3MMQ6AIAxA0auQzjZBlEGvYhwQi3ZQSUFjYry7x
 PEN/z+QSJgS9OoBoYsTH3tBXSnwq9sXQp6LwWhjtTEtnjFlIbfhETMRSvaofdBTF1rb2BpKGIU
 C3/90GN/3A9lKAH5kAAAA
X-Change-ID: 20250224-upstream-optee-rtc-0cf0b9f45351
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
Subject: [Linux-stm32] [PATCH 0/3] Add alarm operation to the rtc-optee
	driver
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

VGhlIG9wdGVlLXJ0YyBkcml2ZXIgaXMgdXNlZCB0byBxdWVyeSB0aGUgcnRjIGhhbmRsZWQgYnkg
T1AtVEVFIE9TCnRocm91Z2ggUFRBIChQc2V1ZG8gVHJ1c3RlZCBBcHBsaWNhdGlvbikgY2FsbC4K
VGhpcyBzZXJpZSBmaXhlcyBtZW1vcnkgY29uY2VybnMgYW5kIGFkZCBhbGFybSBvcGVyYXRpb25z
IGZvciB0aGUKcnRjLW9wdGVlIGRyaXZlciBhcyB0aGUgUlRDIFBUQSBub3cgc3VwcG9ydCB0aGVt
IFsxXS4KCkZvciB0aGUgYWxhcm0gbm90aWZpY2F0aW9uLCB0aGUgT1AtVEVFIE9TIHNlY3VyZSB3
b3JsZCB3aWxsIGJlCmFibGUgdG8gaW5mb3JtIHRoZSBrZXJuZWwgd2hlbiBhIHNlY3VyZWQgYWxh
cm0gd2lsbCBvY2N1cmVkCnRocm91Z2ggYSBub3RpZmljYXRpb24gc2VudCB0byBhIGtlcm5lbCB0
aHJlYWQgd2FpdGluZyBpbiBPUC1URUUgT1MuCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1U
RUUvb3B0ZWVfb3MvcHVsbC83NDQwCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMg
PGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQpDbMOpbWVudCBMZSBHb2ZmaWMgKDMp
OgogICAgICBydGM6IHJ0Yy1vcHRlZTogZml4IG1lbW9yeSBsZWFrIG9uIGRyaXZlciByZW1vdmFs
CiAgICAgIHJ0Yzogb3B0ZWU6IHJlbW92ZSB1bm5lY2Vzc2FyeSBtZW1vcnkgb3BlcmF0aW9ucwog
ICAgICBydGM6IG9wdGVlOiBhZGQgYWxhcm0gcmVsYXRlZCBydGMgb3BzIHRvIG9wdGVlIHJ0YyBk
cml2ZXIKCiBkcml2ZXJzL3J0Yy9ydGMtb3B0ZWUuYyB8IDQ2NCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0MjYgaW5zZXJ0
aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogMTU1YTNjMDAzZTU1NWE3
MzAwZDE1NmE1MjUyYzAwNGMzOTJlYzZiMApjaGFuZ2UtaWQ6IDIwMjUwMjI0LXVwc3RyZWFtLW9w
dGVlLXJ0Yy0wY2YwYjlmNDUzNTEKCkJlc3QgcmVnYXJkcywKLS0gIApDbMOpbWVudCBMZSBHb2Zm
aWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
