Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDE9AB2FC
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 17:59:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90745C6DD6B;
	Tue, 22 Oct 2024 15:59:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6782CC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 15:59:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBW0Se024761;
 Tue, 22 Oct 2024 17:59:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=RtDggdY2iW+robAFxHqAEs
 sSQfrLj5YNuaQVcXG5m80=; b=j1Dlhm8lgIJT3NwzUPHpY72H4qB/AH6b8RHHrK
 IXIC4lrTjmirBYpFI5/GKng/oDBWFKUgam9jgKgc4UipdsxnA3MIxaviAo0J460S
 4LWhcxtqPRd5UQlCklx6h5YJu+ajWUOx5eCyLCQpOoz6fG4L8inaR/nGg8ZkRZML
 w9+ray9EZaqvhqijL9/cFlO0I3kkCrUsg0rrNuTnexmis6WzsZ9w8NLXzJ5XO/zn
 ErZi53zTWJa33ukr+CepqVYHzk1Ai0S02HeMMnF75UYWa9rE82GPOApqhDyB3rSk
 zaeE3inRr50S8QoFMM2P5TNFJtinl0dKmuW4LRajc/s7oL9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42c7316cmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2024 17:59:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BB6894004F;
 Tue, 22 Oct 2024 17:58:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B654C26D665;
 Tue, 22 Oct 2024 17:57:16 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:16 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 22 Oct 2024 17:56:44 +0200
Message-ID: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Cheick Traore <cheick.traore@foss.st.com>, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 00/14] pinctrl: stm32: Add new features and
	support for more SoC
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

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyB0aGUgc3VwcG9ydCBmb3IgdGhlIG5ldyBTb0MKLSBTVE0z
Mk1QMjE1LAotIFNUTTMyTVAyMzUsCgpieSBhZGRpbmcgdGhlIHN1cHBvcnQgZm9yIHRoZSBuZXcg
ZnVuY3Rpb25hbGl0aWVzCi0gaXJxIGFmZmluaXR5LAotIFJlc291cmNlIElzb2xhdGlvbiBGcmFt
ZXdvcmsgKFJJRiksCi0gUmVzZXJ2ZWQgKFJTVkQpIHBpbm11eCBmdW5jdGlvbiwKLSBJTyBzeW5j
aHJvbml6YXRpb24gcGFyYW1ldGVycywKLSBjb21waWxlIHRoZSBkcml2ZXIgYXMgbW9kdWxlLgoK
U29tZSBtaW5vciBjb2RlIHJlb3JnYW5pemF0aW9uIGlzIGFsc28gaW50cm9kdWNlZC4KClJlZ2Fy
ZHMsCkFudG9uaW8gQm9ybmVvCgoKQW1lbGllIERlbGF1bmF5ICgyKToKICBwaW5jdHJsOiBzdG0z
MjogQWRkIHN0bTMybXAyMTUgcGluY3RybCBzdXBwb3J0CiAgZHQtYmluZGluZ3M6IHBpbmN0cmw6
IHN0bTMyOiBzdXBwb3J0IGZvciBzdG0zMm1wMjE1IGFuZCBhZGRpdGlvbmFsCiAgICBwYWNrYWdl
cwoKQW50b25pbyBCb3JuZW8gKDQpOgogIHBpbmN0cmw6IHN0bTMyOiBEZWNsYXJlIHN0bTMyX3Bt
eF9nZXRfbW9kZSgpIGFzIHN0YXRpYwogIHBpbmN0cmw6IHN0bTMyOiBSZXdvcmsgc3RtMzJfcGNv
bmZfcGFyc2VfY29uZigpCiAgcGluY3RybDogc3RtMzI6IEFkZCBSSUYgc3VwcG9ydCBmb3Igc3Rt
MzJtcDI1NwogIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBzdG0zMjogYWRkIHN1cHBvcnQgZm9yIHN0
bTMybXAyMzUKCkNoZWljayBUcmFvcmUgKDEpOgogIHBpbmN0cmw6IHN0bTMyOiBNYW5hZ2UgaXJx
IGFmZmluaXR5IHNldHRpbmdzCgpDbMOpbWVudCBMZSBHb2ZmaWMgKDIpOgogIHBpbmN0cmw6IHN0
bTMyOiBBZGQgc3RtMzJtcDIzNSBwaW5jdHJsIHN1cHBvcnQKICBwaW5jdHJsOiBzdG0zMjogQWRk
IG5ldyBwYWNrYWdlIHRvIHN0bTMybXAyNTcgcGluY3RybCBzdXBwb3J0CgpGYWJpZW4gRGVzc2Vu
bmUgKDQpOgogIHBpbmN0cmw6IHN0bTMyOiBIYW5kbGUgUlNWRCBwaW4gY29uZmlndXJhdGlvbgog
IGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBzdG0zMjogYWRkIFJTVkQgbXV4IGZ1bmN0aW9uCiAgcGlu
Y3RybDogc3RtMzI6IFN1cHBvcnQgSU8gc3luY2hyb25pemF0aW9uIHBhcmFtZXRlcnMKICBkdC1i
aW5kaW5nczogcGluY3RybDogc3RtMzI6IHN1cHBvcnQgSU8gc3luY2hyb25pemF0aW9uIHBhcmFt
ZXRlcnMKClN0ZXBoYW5lIERhbmllYXUgKDEpOgogIHBpbmN0cmw6IHN0bTMyOiBBbGxvdyBjb21w
aWxlIGFzIG1vZHVsZSBmb3Igc3RtMzJtcDI1NwoKIC4uLi9iaW5kaW5ncy9waW5jdHJsL3N0LHN0
bTMyLXBpbmN0cmwueWFtbCAgICB8ICAgNjIgKy0KIGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9y
bXMgICAgICAgICAgICAgICAgICB8ICAgIDEgLQogZHJpdmVycy9waW5jdHJsL3N0bTMyL0tjb25m
aWcgICAgICAgICAgICAgICAgIHwgICAxOCArLQogZHJpdmVycy9waW5jdHJsL3N0bTMyL01ha2Vm
aWxlICAgICAgICAgICAgICAgIHwgICAgMiArCiBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3Ry
bC1zdG0zMi5jICAgICAgICAgfCAgMzY1ICsrKy0KIGRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5j
dHJsLXN0bTMyLmggICAgICAgICB8ICAgMjcgKy0KIGRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5j
dHJsLXN0bTMybXAyMTUuYyAgICB8IDE4MDcgKysrKysrKysrKysrKysrKwogZHJpdmVycy9waW5j
dHJsL3N0bTMyL3BpbmN0cmwtc3RtMzJtcDIzNS5jICAgIHwgMTkwNiArKysrKysrKysrKysrKysr
KwogZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzJtcDI1Ny5jICAgIHwgIDMwNSAr
LS0KIGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMi1waW5mdW5jLmggICB8ICAgIDQg
KwogMTAgZmlsZXMgY2hhbmdlZCwgNDMyNiBpbnNlcnRpb25zKCspLCAxNzEgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzJt
cDIxNS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwt
c3RtMzJtcDIzNS5jCgoKYmFzZS1jb21taXQ6IDk4NTJkODVlYzlkNDkyZWJlZjU2ZGM1ZjIyOTQx
NmM5MjU3NThlZGMKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
