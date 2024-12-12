Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E98659EE403
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 11:23:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00EECC7128A;
	Thu, 12 Dec 2024 10:23:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CF30C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 10:23:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6PZoi025473;
 Thu, 12 Dec 2024 11:22:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 imvmMoXZ9/lX7k57eRk+iPS5zu2P97QZjz1NfVU5Z6A=; b=NMKWlrZJKJ6GxD7r
 rCaYfH803/je5mfEepO6UXg4n9wv+cfKDkcZaVRqvu6kR4e54N80P0VafKtbg4Sy
 ovDkNyw4i6c0E+A+XZr4FnI0GaV/xz9EXW20bLTeI/zHNarRXIOtQkXzoJcS6iCD
 AvcWqshiK4iFC6J5nHHetdCDG6XpamqKZkd+YniA91sYrLj+tsovoLcJPbl8kuf2
 T7ikeHdfFrzWXbWE9IonQys1rrlUxVudIHxEg6l2wiYQywMukTdkzBRG2LxMUFgF
 bcNWRLAKDfKjD5bRudV2i9aKix+9dqppc0IbwS8ah6W2G4OuQc9guIynzgSOX/sL
 rnxdYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj7131f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 11:22:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9B35A40044;
 Thu, 12 Dec 2024 11:21:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8C3A2698EA;
 Thu, 12 Dec 2024 11:20:55 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 11:20:52 +0100
From: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 12 Dec 2024 11:20:50 +0100
Message-ID: <20241212102050.374501-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211163457.301140-1-clement.legoffic@foss.st.com>
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2] watchdog: stm32_iwdg: fix error message
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
YnV0IHRoZSBkcml2ZXIgdXNlcyB0aGUKcGxhdGZvcm1fZ2V0X2lycSgpIHdpY2ggcHJvZHVjZXMg
YW4gZXJyb3IgbWVzc2FnZSBkdXJpbmcgdGhlIGRyaXZlcgpwcm9iZSBpZiB3ZSBkb24ndCBoYXZl
IGFueSBgaW50ZXJydXB0c2AgcHJvcGVydHkgaW4gdGhlIERULgoKVXNlIHRoZSBwbGF0Zm9ybV9n
ZXRfaXJxX29wdGlvbmFsKCkgQVBJIHRvIGdldCByaWQgb2YgdGhlIGVycm9yIG1lc3NhZ2UKYXMg
dGhpcyBwcm9wZXJ0eSBpcyBvcHRpb25hbC4KCkZpeGVzOiAzYWIxNjYzYWY2YzEgKCJ3YXRjaGRv
Zzogc3RtMzJfaXdkZzogQWRkIHByZXRpbWVvdXQgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCnYxIC0+
IHYyOiBDaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlIGJlY2F1c2UgaXQgb25seSBwcmludHMgYW4g
ZXJyb3IKbWVzc2FnZSBhbmQgZG9udCBicmVhayB0aGUgRFQgYmFja3dhcmQgY29tcGF0aWJpbGl0
eS4KCmRyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRj
aGRvZy9zdG0zMl9pd2RnLmMgYi9kcml2ZXJzL3dhdGNoZG9nL3N0bTMyX2l3ZGcuYwppbmRleCBk
NzAwZTBkNDliYjk1Li44YWQwNmI1NGM1YWRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3dhdGNoZG9n
L3N0bTMyX2l3ZGcuYworKysgYi9kcml2ZXJzL3dhdGNoZG9nL3N0bTMyX2l3ZGcuYwpAQCAtMjg2
LDcgKzI4Niw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfaXdkZ19pcnFfaW5pdChzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2LAogCWlmICghd2R0LT5kYXRhLT5oYXNfZWFybHlfd2FrZXVwKQogCQly
ZXR1cm4gMDsKCi0JaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKKwlpcnEgPSBwbGF0
Zm9ybV9nZXRfaXJxX29wdGlvbmFsKHBkZXYsIDApOwogCWlmIChpcnEgPD0gMCkKIAkJcmV0dXJu
IDA7CgoKYmFzZS1jb21taXQ6IGZhYzA0ZWZjNWM3OTNkY2NiZDA3ZTJkNTlhZjlmOTBiN2ZjMGRj
YTQKLS0KMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
