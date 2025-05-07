Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AEAAD7F0
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 09:28:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C6FAC7A821;
	Wed,  7 May 2025 07:28:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1107FC78F9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 07:27:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5475tPOD018103;
 Wed, 7 May 2025 09:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 z2Wz+02biPobkFgq4687ds23RCGZHo5ebYaXPazcgac=; b=Hs3+pgg8FusUda+P
 uxcmX7XGetPt2IKMSb6nYiOSmwJwe39Qs+rU3AbHk98vY8sLq0Ecvbx9oD4SUKM/
 0rkFT/co2QkWcbctVRnhvSptIjpglNVeMI6iw04QMdbjOd+HlGEa0rjV36Zd60/d
 kxEvzgF9VOfmp+LUXae9OBTuZ6jmji4VNQ/huCM5h7OZUtWdUYvkdsbkPT6fuqFj
 aVikcnmCd96hOzk8zIdxTx020B/tZut3xlDI9DFwS2sNt0bs74chdFlu61ioLk19
 anMeeE37k50lhak9fc3s0oqwIi+/ji5JO/8MohaNtzxKPe1KnAr2zVQa41/MJaAP
 8CVSmQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46g1sx8cdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 May 2025 09:27:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2EBBD4005B;
 Wed,  7 May 2025 09:26:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1142BACBA60;
 Wed,  7 May 2025 09:25:17 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 09:25:16 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 7 May 2025 09:25:14 +0200
MIME-Version: 1.0
Message-ID: <20250507-upstream_ospi_v6-v13-1-32290b21419a@foss.st.com>
References: <20250507-upstream_ospi_v6-v13-0-32290b21419a@foss.st.com>
In-Reply-To: <20250507-upstream_ospi_v6-v13-0-32290b21419a@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v13 1/4] firewall: Always expose firewall
	prototype
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

SW4gY2FzZSBDT05GSUdfU1RNMzJfRklSRVdBTEwgaXMgbm90IHNldCwgcHJvdG90eXBlIGFyZSBu
b3QgdmlzaWJsZQp3aGljaCBsZWFkcyB0byBmb2xsb3dpbmcgZXJyb3JzIHdoZW4gZW5hYmxpbmcs
IGZvciBleGFtcGxlLCBDT01QSUxFX1RFU1QKYW5kIFNUTTMyX09NTToKCnN0bTMyX2ZpcmV3YWxs
X2RldmljZS5oOjExNzo1OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvcgrigJhzdG0z
Ml9maXJld2FsbF9nZXRfZmlyZXdhbGzigJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQog
IDExNyB8IGludCBzdG0zMl9maXJld2FsbF9nZXRfZmlyZXdhbGwoc3RydWN0IGRldmljZV9ub2Rl
ICpucCwgc3RydWN0CnN0bTMyX2ZpcmV3YWxsICpmaXJld2FsbCwKICAgICAgfCAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmluY2x1ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2Rl
dmljZS5oOjEyMzo1OgplcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhzdG0zMl9m
aXJld2FsbF9ncmFudF9hY2Nlc3PigJkKWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQogIDEy
MyB8IGludCBzdG0zMl9maXJld2FsbF9ncmFudF9hY2Nlc3Moc3RydWN0IHN0bTMyX2ZpcmV3YWxs
ICpmaXJld2FsbCkKICAgICAgfCAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmluY2x1
ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2RldmljZS5oOjEyODo2OgplcnJvcjogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhzdG0zMl9maXJld2FsbF9yZWxlYXNlX2FjY2Vzc+KAmQpb
LVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXNdCiAgMTI4IHwgdm9pZCBzdG0zMl9maXJld2FsbF9y
ZWxlYXNlX2FjY2VzcyhzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGwgKmZpcmV3YWxsKQogICAgICB8ICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KaW5jbHVkZS9saW51eC9idXMvc3RtMzJf
ZmlyZXdhbGxfZGV2aWNlLmg6MTMyOjU6CmVycm9yOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
IOKAmHN0bTMyX2ZpcmV3YWxsX2dyYW50X2FjY2Vzc19ieV9pZOKAmQpbLVdlcnJvcj1taXNzaW5n
LXByb3RvdHlwZXNdCiAgMTMyIHwgaW50IHN0bTMyX2ZpcmV3YWxsX2dyYW50X2FjY2Vzc19ieV9p
ZChzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGwgKmZpcmV3YWxsLCB1MzIgc3Vic3lzdGVtX2lkKQogICAg
ICB8ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KaW5jbHVkZS9saW51eC9i
dXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg6MTM3OjY6CmVycm9yOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmHN0bTMyX2ZpcmV3YWxsX3JlbGVhc2VfYWNjZXNzX2J5X2lk4oCZClstV2Vy
cm9yPW1pc3NpbmctcHJvdG90eXBlc10KICAxMzcgfCB2b2lkIHN0bTMyX2ZpcmV3YWxsX3JlbGVh
c2VfYWNjZXNzX2J5X2lkKHN0cnVjdCBzdG0zMl9maXJld2FsbCAqZmlyZXdhbGwsIHUzMiBzdWJz
eXN0ZW1faWQpCiAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgoKTWFrZSBwcm90b3R5cGVzIGFsd2F5cyBleHBvc2VkIHRvIGZpeCB0aGlzIGlzc3VlLgoKQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpGaXhlczogNWM5NjY4Y2ZjNmQ3ICgiZmlyZXdhbGw6
IGludHJvZHVjZSBzdG0zMl9maXJld2FsbCBmcmFtZXdvcmsiKQoKU2lnbmVkLW9mZi1ieTogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Ci0tLQogaW5jbHVkZS9s
aW51eC9idXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmggfCAxMCArKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9idXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmggYi9pbmNsdWRlL2xpbnV4L2J1
cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaAppbmRleCA1MTc4YjcyYmM5MjA5ODZiYjZjNTU4ODc0
NTNkMTQ2ZjM4MmE4ZTc3Li5iYTZlZjQ0NjhhMGE4ZGZlYjNlMTQ2ZWM5MDUwMmUyZjM1MTcyZWRj
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaAor
KysgYi9pbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaApAQCAtMzUsNyAr
MzUsNiBAQCBzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGwgewogCXUzMiBmaXJld2FsbF9pZDsKIH07CiAK
LSNpZiBJU19FTkFCTEVEKENPTkZJR19TVE0zMl9GSVJFV0FMTCkKIC8qKgogICogc3RtMzJfZmly
ZXdhbGxfZ2V0X2ZpcmV3YWxsIC0gR2V0IHRoZSBmaXJld2FsbChzKSBhc3NvY2lhdGVkIHRvIGdp
dmVuIGRldmljZS4KICAqCQkJCSBUaGUgZmlyZXdhbGwgY29udHJvbGxlciByZWZlcmVuY2UgaXMg
YWx3YXlzIHRoZSBmaXJzdCBhcmd1bWVudApAQCAtMTEyLDYgKzExMSwxNSBAQCBpbnQgc3RtMzJf
ZmlyZXdhbGxfZ3JhbnRfYWNjZXNzX2J5X2lkKHN0cnVjdCBzdG0zMl9maXJld2FsbCAqZmlyZXdh
bGwsIHUzMiBzdWJzeQogICovCiB2b2lkIHN0bTMyX2ZpcmV3YWxsX3JlbGVhc2VfYWNjZXNzX2J5
X2lkKHN0cnVjdCBzdG0zMl9maXJld2FsbCAqZmlyZXdhbGwsIHUzMiBzdWJzeXN0ZW1faWQpOwog
CisjaWYgSVNfRU5BQkxFRChDT05GSUdfU1RNMzJfRklSRVdBTEwpCisKK2V4dGVybiBpbnQgc3Rt
MzJfZmlyZXdhbGxfZ2V0X2ZpcmV3YWxsKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIHN0cnVjdCBz
dG0zMl9maXJld2FsbCAqZmlyZXdhbGwsCisJCQkJdW5zaWduZWQgaW50IG5iX2ZpcmV3YWxsKTsK
K2V4dGVybiBpbnQgc3RtMzJfZmlyZXdhbGxfZ3JhbnRfYWNjZXNzKHN0cnVjdCBzdG0zMl9maXJl
d2FsbCAqZmlyZXdhbGwpOworZXh0ZXJuIHZvaWQgc3RtMzJfZmlyZXdhbGxfcmVsZWFzZV9hY2Nl
c3Moc3RydWN0IHN0bTMyX2ZpcmV3YWxsICpmaXJld2FsbCk7CitleHRlcm4gaW50IHN0bTMyX2Zp
cmV3YWxsX2dyYW50X2FjY2Vzc19ieV9pZChzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGwgKmZpcmV3YWxs
LCB1MzIgc3Vic3lzdGVtX2lkKTsKK2V4dGVybiB2b2lkIHN0bTMyX2ZpcmV3YWxsX3JlbGVhc2Vf
YWNjZXNzX2J5X2lkKHN0cnVjdCBzdG0zMl9maXJld2FsbCAqZmlyZXdhbGwsIHUzMiBzdWJzeXN0
ZW1faWQpOworCiAjZWxzZSAvKiBDT05GSUdfU1RNMzJfRklSRVdBTEwgKi8KIAogaW50IHN0bTMy
X2ZpcmV3YWxsX2dldF9maXJld2FsbChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBzdHJ1Y3Qgc3Rt
MzJfZmlyZXdhbGwgKmZpcmV3YWxsLAoKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
