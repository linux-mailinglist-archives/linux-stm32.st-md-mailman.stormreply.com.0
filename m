Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F01B05FB2
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 16:08:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3266AC3F93D;
	Tue, 15 Jul 2025 14:08:43 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 792AAC349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 14:08:41 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FCHV1x025665;
 Tue, 15 Jul 2025 16:08:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yR8g1TnehdXPtqND1guWgOqQk7y3bbB49iAAeS8Eoe8=; b=LGenW84/agl32pbZ
 GwigvX658DWTobcrJ+pT9MxM5t30LUsgrpU3y9nV9rUsQDCrR1Yc5Q1xV7tVXi9G
 2nmBsOH5pDWMLdmAmO1glR4IXA6ngzObODaMVyOn/zVLQqPRpGLCRWm78CizJX1p
 AXfsmhc78BchuJzIibZm4fDC48CxYmMpbFxoc+cIvLPJLL7ZBtCbPxb3uO/PD1iG
 YAMfbHXtSG+MrHBkccO+9vq5o7uE9WeU35n10ljIbvLIkKcvhxjXax+ynJpCktI3
 ywjd4oG0PBEOUZyIFS3Q5TeRaCHcH+IpoMtYn2S7JPDsSCE2RGt8T+veM/aMPuA9
 c+4C8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2nntncp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 16:08:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27D1040053;
 Tue, 15 Jul 2025 16:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4C02B9C3CB;
 Tue, 15 Jul 2025 16:07:25 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:07:25 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 15 Jul 2025 16:07:14 +0200
MIME-Version: 1.0
Message-ID: <20250715-upstream-optee-rtc-v1-2-e0fdf8aae545@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 2/3] rtc: optee: remove unnecessary memory
	operations
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

UmVtb3ZlIG1lbWNweSBieSB1c2luZyBkaXJlY3RseSB0aGUgc2hhcmVkIG1lbW9yeS4KUmVtb3Zl
IG1lbXNldCBiZSBpbml0aWFsaXplIHZhcmlhYmxlIHRvIDAgb24gc3RhY2suCgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0t
LQogZHJpdmVycy9ydGMvcnRjLW9wdGVlLmMgfCAyOSArKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1vcHRlZS5jIGIvZHJpdmVycy9ydGMvcnRjLW9w
dGVlLmMKaW5kZXggNmI3N2MxMjJmZGMxLi5iNjU5NTNlYjdjYTEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvcnRjL3J0Yy1vcHRlZS5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1vcHRlZS5jCkBAIC05Nywx
OCArOTcsOSBAQCBzdGF0aWMgaW50IG9wdGVlX3J0Y19zZXR0aW1lKHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IHJ0Y190aW1lICp0bSkKIAlzdHJ1Y3Qgb3B0ZWVfcnRjICpwcml2ID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7CiAJc3RydWN0IHRlZV9pb2N0bF9pbnZva2VfYXJnIGludl9hcmcgPSB7
MH07CiAJc3RydWN0IHRlZV9wYXJhbSBwYXJhbVs0XSA9IHswfTsKLQlzdHJ1Y3Qgb3B0ZWVfcnRj
X3RpbWUgb3B0ZWVfdG07Ci0Jdm9pZCAqcnRjX2RhdGE7CisJc3RydWN0IG9wdGVlX3J0Y190aW1l
ICpvcHRlZV90bTsKIAlpbnQgcmV0OwogCi0Jb3B0ZWVfdG0udG1fc2VjID0gdG0tPnRtX3NlYzsK
LQlvcHRlZV90bS50bV9taW4gPSB0bS0+dG1fbWluOwotCW9wdGVlX3RtLnRtX2hvdXIgPSB0bS0+
dG1faG91cjsKLQlvcHRlZV90bS50bV9tZGF5ID0gdG0tPnRtX21kYXk7Ci0Jb3B0ZWVfdG0udG1f
bW9uID0gdG0tPnRtX21vbjsKLQlvcHRlZV90bS50bV95ZWFyID0gdG0tPnRtX3llYXIgKyAxOTAw
OwotCW9wdGVlX3RtLnRtX3dkYXkgPSB0bS0+dG1fd2RheTsKLQogCWludl9hcmcuZnVuYyA9IFRB
X0NNRF9SVENfU0VUX1RJTUU7CiAJaW52X2FyZy5zZXNzaW9uID0gcHJpdi0+c2Vzc2lvbl9pZDsK
IAlpbnZfYXJnLm51bV9wYXJhbXMgPSA0OwpAQCAtMTE3LDExICsxMDgsMTcgQEAgc3RhdGljIGlu
dCBvcHRlZV9ydGNfc2V0dGltZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGNfdGltZSAq
dG0pCiAJcGFyYW1bMF0udS5tZW1yZWYuc2htID0gcHJpdi0+c2htOwogCXBhcmFtWzBdLnUubWVt
cmVmLnNpemUgPSBzaXplb2Yoc3RydWN0IG9wdGVlX3J0Y190aW1lKTsKIAotCXJ0Y19kYXRhID0g
dGVlX3NobV9nZXRfdmEocHJpdi0+c2htLCAwKTsKLQlpZiAoSVNfRVJSKHJ0Y19kYXRhKSkKLQkJ
cmV0dXJuIFBUUl9FUlIocnRjX2RhdGEpOworCW9wdGVlX3RtID0gdGVlX3NobV9nZXRfdmEocHJp
di0+c2htLCAwKTsKKwlpZiAoSVNfRVJSKG9wdGVlX3RtKSkKKwkJcmV0dXJuIFBUUl9FUlIob3B0
ZWVfdG0pOwogCi0JbWVtY3B5KHJ0Y19kYXRhLCAmb3B0ZWVfdG0sIHNpemVvZihzdHJ1Y3Qgb3B0
ZWVfcnRjX3RpbWUpKTsKKwlvcHRlZV90bS0+dG1fbWluID0gdG0tPnRtX21pbjsKKwlvcHRlZV90
bS0+dG1fc2VjID0gdG0tPnRtX3NlYzsKKwlvcHRlZV90bS0+dG1faG91ciA9IHRtLT50bV9ob3Vy
OworCW9wdGVlX3RtLT50bV9tZGF5ID0gdG0tPnRtX21kYXk7CisJb3B0ZWVfdG0tPnRtX21vbiA9
IHRtLT50bV9tb247CisJb3B0ZWVfdG0tPnRtX3llYXIgPSB0bS0+dG1feWVhciArIDE5MDA7CisJ
b3B0ZWVfdG0tPnRtX3dkYXkgPSB0bS0+dG1fd2RheTsKIAogCXJldCA9IHRlZV9jbGllbnRfaW52
b2tlX2Z1bmMocHJpdi0+Y3R4LCAmaW52X2FyZywgcGFyYW0pOwogCWlmIChyZXQgPCAwIHx8IGlu
dl9hcmcucmV0ICE9IDApCkBAIC0yNDEsMTQgKzIzOCwxMiBAQCBzdGF0aWMgaW50IG9wdGVlX2N0
eF9tYXRjaChzdHJ1Y3QgdGVlX2lvY3RsX3ZlcnNpb25fZGF0YSAqdmVyLCBjb25zdCB2b2lkICpk
YXRhKQogc3RhdGljIGludCBvcHRlZV9ydGNfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQogewog
CXN0cnVjdCB0ZWVfY2xpZW50X2RldmljZSAqcnRjX2RldmljZSA9IHRvX3RlZV9jbGllbnRfZGV2
aWNlKGRldik7Ci0Jc3RydWN0IHRlZV9pb2N0bF9vcGVuX3Nlc3Npb25fYXJnIHNlc3NfYXJnOwor
CXN0cnVjdCB0ZWVfaW9jdGxfb3Blbl9zZXNzaW9uX2FyZyBzZXNzX2FyZyA9IHswfTsKIAlzdHJ1
Y3Qgb3B0ZWVfcnRjICpwcml2OwogCXN0cnVjdCBydGNfZGV2aWNlICpydGM7CiAJc3RydWN0IHRl
ZV9zaG0gKnNobTsKIAlpbnQgcmV0LCBlcnI7CiAKLQltZW1zZXQoJnNlc3NfYXJnLCAwLCBzaXpl
b2Yoc2Vzc19hcmcpKTsKLQogCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYp
LCBHRlBfS0VSTkVMKTsKIAlpZiAoIXByaXYpCiAJCXJldHVybiAtRU5PTUVNOwoKLS0gCjIuNDMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
