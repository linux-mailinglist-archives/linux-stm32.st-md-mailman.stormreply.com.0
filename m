Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133AAF8C2E
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 10:42:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8D78C36B2F;
	Fri,  4 Jul 2025 08:42:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74971C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 08:42:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647Zri2028234;
 Fri, 4 Jul 2025 10:41:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 cgoDMkiMUHk+EBU8CkARm75mSZLtYpIM4Qjcl0JBQBc=; b=jg8HObSVt9+kCgyh
 RArNtuTm17TbJNYsK/+0X/DEGGKA3cWUwz/nil05Kj8armM9uqqy/k18JvPEjadn
 Iut3Yrl7nOJpV0ygQcCpAAhBUeoEqEnGTq09kZ5mQJwYo9ymu6vE38JK6M1z19zT
 2Med9uWLlLacPa+KD+vPVyyl/fPv2dpfU7jYVYct21SrVW+m3IrP4fdO3k71kIKN
 Tkm4BlEwdgddfkSYs86VpXT3i9tG+6AWDRcOdDLPjrMcL++X7Li2jV8unHFj5zIn
 1jWhXZq3W4r49MLhGJl6FXxnlfkqmtX9lUHhTqhUh/T2G/79/iz1tUmVGXyVQat2
 gX/Dew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmmaph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jul 2025 10:41:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98D5A4004C;
 Fri,  4 Jul 2025 10:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B39E7483152;
 Fri,  4 Jul 2025 10:39:38 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 10:39:38 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 4 Jul 2025 10:39:16 +0200
MIME-Version: 1.0
Message-ID: <20250704-i2c-upstream-v4-3-84a095a2c728@foss.st.com>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 3/3] i2c: stm32f7: support
	i2c_*_dma_safe_msg_buf APIs
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

YGkyY18qX2RtYV9zYWZlX21zZ19idWZgIEFQSXMgb3BlcmF0ZSBvbiBhIGBzdHJ1Y3QgaTJjX21z
Z2AuClRoZSBnZXQgb3BlcmF0aW9uIG1ha2Ugc3VyZSB0aGUgSTJDIGJ1ZmZlciBpcyBETUEnYWJs
ZSBhY2NvcmRpbmcgdG8gaXRzCmJ1ZmZlciBsZW5ndGgsIG9yIGlmIHRoZSBtZW1vcnkgdXNlIGlz
IERNQSBjb2hlcmVudCBmb3IgZXhhbXBsZSBhbmQKcmV0dXJuIGEgdmFsaWQgcG9pbnRlciBmb3Ig
c2FmZSBETUEgYWNjZXNzIHRvIGJlIHVzZWQuClRoZSBwdXQgb3BlcmF0aW9uIHJlbGVhc2UgdGhl
IHBvaW50ZXIuClByZWZlciB1c2luZyBnZW5lcmljIEFQSSdzIHRoYW4gcmVseWluZyBvbiBwcml2
YXRlIHRlc3RzLgoKQWNrZWQtYnk6IEFsYWluIFZvbG1hdCA8YWxhaW4udm9sbWF0QGZvc3Muc3Qu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNA
Zm9zcy5zdC5jb20+Ci0tLQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMgfCAzMiAr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtc3RtMzJmNy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMKaW5kZXgg
NzNhN2I4ODk0YzBkLi45OTQyMzI2NDY3ODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtc3RtMzJmNy5jCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCkBA
IC03NDEsMTEgKzc0MSwxNCBAQCBzdGF0aWMgdm9pZCBzdG0zMmY3X2kyY19kbWFfY2FsbGJhY2so
dm9pZCAqYXJnKQogewogCXN0cnVjdCBzdG0zMmY3X2kyY19kZXYgKmkyY19kZXYgPSBhcmc7CiAJ
c3RydWN0IHN0bTMyX2kyY19kbWEgKmRtYSA9IGkyY19kZXYtPmRtYTsKKwlzdHJ1Y3Qgc3RtMzJm
N19pMmNfbXNnICpmN19tc2cgPSAmaTJjX2Rldi0+ZjdfbXNnOwogCiAJc3RtMzJmN19pMmNfZGlz
YWJsZV9kbWFfcmVxKGkyY19kZXYpOwogCWRtYWVuZ2luZV90ZXJtaW5hdGVfYXN5bmMoZG1hLT5j
aGFuX3VzaW5nKTsKIAlkbWFfdW5tYXBfc2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVm
LCBkbWEtPmRtYV9sZW4sCiAJCQkgZG1hLT5kbWFfZGF0YV9kaXIpOworCWlmICghZjdfbXNnLT5z
bWJ1cykKKwkJaTJjX3B1dF9kbWFfc2FmZV9tc2dfYnVmKGY3X21zZy0+YnVmLCBpMmNfZGV2LT5t
c2csIHRydWUpOwogCWNvbXBsZXRlKCZkbWEtPmRtYV9jb21wbGV0ZSk7CiB9CiAKQEAgLTg4MSw2
ICs4ODQsNyBAQCBzdGF0aWMgdm9pZCBzdG0zMmY3X2kyY194ZmVyX21zZyhzdHJ1Y3Qgc3RtMzJm
N19pMmNfZGV2ICppMmNfZGV2LAogewogCXN0cnVjdCBzdG0zMmY3X2kyY19tc2cgKmY3X21zZyA9
ICZpMmNfZGV2LT5mN19tc2c7CiAJdm9pZCBfX2lvbWVtICpiYXNlID0gaTJjX2Rldi0+YmFzZTsK
Kwl1OCAqZG1hX2J1ZjsKIAl1MzIgY3IxLCBjcjI7CiAJaW50IHJldDsKIApAQCAtOTMwLDE3ICs5
MzQsMjMgQEAgc3RhdGljIHZvaWQgc3RtMzJmN19pMmNfeGZlcl9tc2coc3RydWN0IHN0bTMyZjdf
aTJjX2RldiAqaTJjX2RldiwKIAogCS8qIENvbmZpZ3VyZSBETUEgb3IgZW5hYmxlIFJYL1RYIGlu
dGVycnVwdCAqLwogCWkyY19kZXYtPnVzZV9kbWEgPSBmYWxzZTsKLQlpZiAoaTJjX2Rldi0+ZG1h
ICYmIGY3X21zZy0+Y291bnQgPj0gU1RNMzJGN19JMkNfRE1BX0xFTl9NSU4KLQkgICAgJiYgIWky
Y19kZXYtPmF0b21pYykgewotCQlyZXQgPSBzdG0zMl9pMmNfcHJlcF9kbWFfeGZlcihpMmNfZGV2
LT5kZXYsIGkyY19kZXYtPmRtYSwKLQkJCQkJICAgICAgbXNnLT5mbGFncyAmIEkyQ19NX1JELAot
CQkJCQkgICAgICBmN19tc2ctPmNvdW50LCBmN19tc2ctPmJ1ZiwKLQkJCQkJICAgICAgc3RtMzJm
N19pMmNfZG1hX2NhbGxiYWNrLAotCQkJCQkgICAgICBpMmNfZGV2KTsKLQkJaWYgKCFyZXQpCi0J
CQlpMmNfZGV2LT51c2VfZG1hID0gdHJ1ZTsKLQkJZWxzZQotCQkJZGV2X3dhcm4oaTJjX2Rldi0+
ZGV2LCAiY2FuJ3QgdXNlIERNQVxuIik7CisJaWYgKGkyY19kZXYtPmRtYSAmJiAhaTJjX2Rldi0+
YXRvbWljKSB7CisJCWRtYV9idWYgPSBpMmNfZ2V0X2RtYV9zYWZlX21zZ19idWYobXNnLCBTVE0z
MkY3X0kyQ19ETUFfTEVOX01JTik7CisJCWlmIChkbWFfYnVmKSB7CisJCQlmN19tc2ctPmJ1ZiA9
IGRtYV9idWY7CisJCQlyZXQgPSBzdG0zMl9pMmNfcHJlcF9kbWFfeGZlcihpMmNfZGV2LT5kZXYs
IGkyY19kZXYtPmRtYSwKKwkJCQkJCSAgICAgIG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCwKKwkJCQkJ
CSAgICAgIGY3X21zZy0+Y291bnQsIGY3X21zZy0+YnVmLAorCQkJCQkJICAgICAgc3RtMzJmN19p
MmNfZG1hX2NhbGxiYWNrLAorCQkJCQkJICAgICAgaTJjX2Rldik7CisJCQlpZiAocmV0KSB7CisJ
CQkJZGV2X3dhcm4oaTJjX2Rldi0+ZGV2LCAiY2FuJ3QgdXNlIERNQVxuIik7CisJCQkJaTJjX3B1
dF9kbWFfc2FmZV9tc2dfYnVmKGY3X21zZy0+YnVmLCBtc2csIGZhbHNlKTsKKwkJCQlmN19tc2ct
PmJ1ZiA9IG1zZy0+YnVmOworCQkJfSBlbHNlIHsKKwkJCQlpMmNfZGV2LT51c2VfZG1hID0gdHJ1
ZTsKKwkJCX0KKwkJfQogCX0KIAogCWlmICghaTJjX2Rldi0+dXNlX2RtYSkgewoKLS0gCjIuNDMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
