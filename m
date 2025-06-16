Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9376ADABC6
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 11:23:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7294DC36B2C;
	Mon, 16 Jun 2025 09:23:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FD18C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 09:23:57 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G7qXNA001111;
 Mon, 16 Jun 2025 11:23:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 g+teT4hcWlE6FbbDd8cFYpmDv8L8s8toVgg8l99SV50=; b=tPNEq1gwIwCMGT1O
 zShj60AR3KvMaxqHUr1gonPu1q5PSb3u4Il3S1pGyDpR0f5BicdqadtheYmia7L9
 xUMR+75OZSMXaTB/QKd145RsmVGtsNMdGdujJ6kAOVAhJk+6pOC/C8UTe2HctrxA
 lZErrSRksn9RluAkr3jlvSZaTILINPfEmxuS1ui4/Yut+Kd5SA1yIZpkJiTPMAX+
 DYsTcDLj/Pu+Y6U/y3gjW5PnRqaRYrWh0anBSzQSYedUIXbd40JC2vz/VEGa/59N
 fa1Kwdzwf8KPHUf+1I0XngPZ6oOii2R1kBS9rRYq4XPtciWzVH+tYLXp65ZmccDu
 D4Qiew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 479jn4mm80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:23:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0832F40050;
 Mon, 16 Jun 2025 11:22:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30AADAA6EE7;
 Mon, 16 Jun 2025 11:21:11 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:10 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:06 +0200
MIME-Version: 1.0
Message-ID: <20250616-spi-upstream-v1-5-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 5/6] spi: stm32: deprecate `st,
	spi-midi-ns` property
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

VGhlIGBzdCxzcGktbWlkaS1uc2AgcHJvcGVydHksIHdoaWNoIHdhcyB1c2VkIHRvIHNldCBhIG5h
bm9zZWNvbmQgZGVsYXkKYmV0d2VlbiB0cmFuc2ZlcnJlZCB3b3JkcywgaXMgbm93IGRlcHJlY2F0
ZWQuClRoaXMgZnVuY3Rpb25hbGl0eSBpcyBub3cgc3VwcG9ydGVkIGJ5IHRoZSBTUEkgZnJhbWV3
b3JrIHRocm91Z2ggdGhlCmBzcGlfdHJhbnNmZXJgIHN0cnVjdCdzIGB3b3JkX2RlbGF5YCB2YXJp
YWJsZS4KVGhlcmVmb3JlLCB0aGUgcHJpdmF0ZSBgc3Qsc3BpLW1pZGktbnNgIHByb3BlcnR5IGlz
IG5vIGxvbmdlciBuZWVkZWQgYW5kCmhhcyBiZWVuIGRlcHJlY2F0ZWQgaW4gZmF2b3Igb2YgdGhl
IGdlbmVyaWMgc29sdXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNs
ZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMg
fCAyMyArKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXN0bTMy
LmMgYi9kcml2ZXJzL3NwaS9zcGktc3RtMzIuYwppbmRleCA4NTgxZjI0YzExMWYuLjNkMjBmMDlm
MWFlNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKKysrIGIvZHJpdmVycy9z
cGkvc3BpLXN0bTMyLmMKQEAgLTI4Myw3ICsyODMsNyBAQCBzdHJ1Y3Qgc3RtMzJfc3BpX2NmZyB7
CiAJaW50ICgqY29uZmlnKShzdHJ1Y3Qgc3RtMzJfc3BpICpzcGkpOwogCXZvaWQgKCpzZXRfYnB3
KShzdHJ1Y3Qgc3RtMzJfc3BpICpzcGkpOwogCWludCAoKnNldF9tb2RlKShzdHJ1Y3Qgc3RtMzJf
c3BpICpzcGksIHVuc2lnbmVkIGludCBjb21tX3R5cGUpOwotCXZvaWQgKCpzZXRfZGF0YV9pZGxl
bmVzcykoc3RydWN0IHN0bTMyX3NwaSAqc3BpLCB1MzIgbGVuZ3RoKTsKKwl2b2lkICgqc2V0X2Rh
dGFfaWRsZW5lc3MpKHN0cnVjdCBzdG0zMl9zcGkgKnNwaSwgc3RydWN0IHNwaV90cmFuc2ZlciAq
eGZlcik7CiAJaW50ICgqc2V0X251bWJlcl9vZl9kYXRhKShzdHJ1Y3Qgc3RtMzJfc3BpICpzcGks
IHUzMiBsZW5ndGgpOwogCXZvaWQgKCp3cml0ZV90eCkoc3RydWN0IHN0bTMyX3NwaSAqc3BpKTsK
IAl2b2lkICgqcmVhZF9yeCkoc3RydWN0IHN0bTMyX3NwaSAqc3BpKTsKQEAgLTE4ODAsMTEgKzE4
ODAsMjYgQEAgc3RhdGljIGludCBzdG0zMmg3X3NwaV9zZXRfbW9kZShzdHJ1Y3Qgc3RtMzJfc3Bp
ICpzcGksIHVuc2lnbmVkIGludCBjb21tX3R5cGUpCiAgKiBzdG0zMmg3X3NwaV9kYXRhX2lkbGVu
ZXNzIC0gY29uZmlndXJlIG1pbmltdW0gdGltZSBkZWxheSBpbnNlcnRlZCBiZXR3ZWVuIHR3bwog
ICoJCQkgICAgICAgY29uc2VjdXRpdmUgZGF0YSBmcmFtZXMgaW4gaG9zdCBtb2RlCiAgKiBAc3Bp
OiBwb2ludGVyIHRvIHRoZSBzcGkgY29udHJvbGxlciBkYXRhIHN0cnVjdHVyZQotICogQGxlbjog
dHJhbnNmZXIgbGVuCisgKiBAeGZlcjogcG9pbnRlciB0byBzcGkgdHJhbnNmZXIKICAqLwotc3Rh
dGljIHZvaWQgc3RtMzJoN19zcGlfZGF0YV9pZGxlbmVzcyhzdHJ1Y3Qgc3RtMzJfc3BpICpzcGks
IHUzMiBsZW4pCitzdGF0aWMgdm9pZCBzdG0zMmg3X3NwaV9kYXRhX2lkbGVuZXNzKHN0cnVjdCBz
dG0zMl9zcGkgKnNwaSwgc3RydWN0IHNwaV90cmFuc2ZlciAqeGZlcikKIHsKIAl1MzIgY2ZnMl9j
bHJiID0gMCwgY2ZnMl9zZXRiID0gMDsKKwl1MzIgbGVuID0geGZlci0+bGVuOworCXUzMiBzcGlf
ZGVsYXlfbnM7CisKKwlzcGlfZGVsYXlfbnMgPSBzcGlfZGVsYXlfdG9fbnMoJnhmZXItPndvcmRf
ZGVsYXksIHhmZXIpOworCisJaWYgKHNwaS0+Y3VyX21pZGkgIT0gMCkgeworCQlkZXZfd2Fybihz
cGktPmRldiwgInN0LHNwaS1taWRpLW5zIERUIHByb3BlcnR5IGlzIGRlcHJlY2F0ZWRcbiIpOwor
CQlpZiAoc3BpX2RlbGF5X25zKSB7CisJCQlkZXZfd2FybihzcGktPmRldiwgIk92ZXJyaWRpbmcg
c3Qsc3BpLW1pZGktbnMgd2l0aCB3b3JkX2RlbGF5X25zICVkXG4iLAorCQkJCSBzcGlfZGVsYXlf
bnMpOworCQkJCXNwaS0+Y3VyX21pZGkgPSBzcGlfZGVsYXlfbnM7CisJCQl9CisJfSBlbHNlIHsK
KwkJc3BpLT5jdXJfbWlkaSA9IHNwaV9kZWxheV9uczsKKwl9CiAKIAljZmcyX2NscmIgfD0gU1RN
MzJIN19TUElfQ0ZHMl9NSURJOwogCWlmICgobGVuID4gMSkgJiYgKHNwaS0+Y3VyX21pZGkgPiAw
KSkgewpAQCAtMTk3NSw3ICsxOTkwLDcgQEAgc3RhdGljIGludCBzdG0zMl9zcGlfdHJhbnNmZXJf
b25lX3NldHVwKHN0cnVjdCBzdG0zMl9zcGkgKnNwaSwKIAlzcGktPmN1cl9jb21tID0gY29tbV90
eXBlOwogCiAJaWYgKFNUTTMyX1NQSV9IT1NUX01PREUoc3BpKSAmJiBzcGktPmNmZy0+c2V0X2Rh
dGFfaWRsZW5lc3MpCi0JCXNwaS0+Y2ZnLT5zZXRfZGF0YV9pZGxlbmVzcyhzcGksIHRyYW5zZmVy
LT5sZW4pOworCQlzcGktPmNmZy0+c2V0X2RhdGFfaWRsZW5lc3Moc3BpLCB0cmFuc2Zlcik7CiAK
IAlpZiAoc3BpLT5jdXJfYnB3IDw9IDgpCiAJCW5iX3dvcmRzID0gdHJhbnNmZXItPmxlbjsKCi0t
IAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
