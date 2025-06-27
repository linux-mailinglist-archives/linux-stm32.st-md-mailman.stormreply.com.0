Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE403AEB405
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 12:15:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21023C3F92E;
	Fri, 27 Jun 2025 10:15:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 448C5C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 10:15:34 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RA2wL1007309;
 Fri, 27 Jun 2025 12:15:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Q4s8pGA08nJ2ppMKYeSSJfjaUJqoOpavuQKbFXfOgfM=; b=1QV1Q7/Mfqca/ART
 QlwWh04EZZssmN5BsGA/NgUwiR2qnJl1ToxW5EUfQjqbyuOYHXPgZ0zjoFlBjSps
 izXY2MjSMJL8vd63v3HMNHHsIhD4qekaVRJn6cSI2SsIa8Udn/s9A2gJnQuIBSZi
 ggpRgV1rS1ouDm3EUoavv8Ui8DZrntJ9TKc2slgIKgYtUuNbkI+u5hmiD8DwpIpH
 zvUST++a/1Qu7qkbuUDCuFDrGHxWvUn41Fyeb9v6Va2pBeIqX/nuLcuPKDhCXEKP
 4DgC/Qa25oxcE75lyjZSz6eK3/IlthJcIqd5BQPEiNeiZzQfgZtZdLdabnCfBBZt
 sIPtMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5p3xqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 12:15:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B398E40053;
 Fri, 27 Jun 2025 12:13:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99C60B656AD;
 Fri, 27 Jun 2025 12:12:59 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:12:59 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 27 Jun 2025 12:12:58 +0200
MIME-Version: 1.0
Message-ID: <20250627-i2c-upstream-v2-3-8c14523481dc@foss.st.com>
References: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
In-Reply-To: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: b4 0.15-dev-07fe9
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 3/3] i2c: stm32f7: support
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

VXNlIHRoZSBpMmMtY29yZS1iYXNlIEFQSXMgdG8gYWxsb2NhdGUgYSBETUEgc2FmZSBidWZmZXIg
d2hlbiBuZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQu
bGVnb2ZmaWNAZm9zcy5zdC5jb20+CkFja2VkLWJ5OiBBbGFpbiBWb2xtYXQgPGFsYWluLnZvbG1h
dEBmb3NzLnN0LmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyB8IDM2
ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtc3RtMzJmNy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMK
aW5kZXggMDQyMzg2YjRjYWJlLi5kMDZmMGVmZGVjZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtc3RtMzJmNy5jCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJm
Ny5jCkBAIC03NDIsOSArNzQyLDEyIEBAIHN0YXRpYyB2b2lkIHN0bTMyZjdfaTJjX2RtYV9jYWxs
YmFjayh2b2lkICphcmcpCiAJc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldiA9IChzdHJ1
Y3Qgc3RtMzJmN19pMmNfZGV2ICopYXJnOwogCXN0cnVjdCBzdG0zMl9pMmNfZG1hICpkbWEgPSBp
MmNfZGV2LT5kbWE7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gZG1hLT5jaGFuX3VzaW5nLT5kZXZp
Y2UtPmRldjsKKwlzdHJ1Y3Qgc3RtMzJmN19pMmNfbXNnICpmN19tc2cgPSAmaTJjX2Rldi0+Zjdf
bXNnOwogCiAJc3RtMzJmN19pMmNfZGlzYWJsZV9kbWFfcmVxKGkyY19kZXYpOwogCWRtYV91bm1h
cF9zaW5nbGUoZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xlbiwgZG1hLT5kbWFfZGF0YV9k
aXIpOworCWlmICghZjdfbXNnLT5zbWJ1cykKKwkJaTJjX3B1dF9kbWFfc2FmZV9tc2dfYnVmKGY3
X21zZy0+YnVmLCBpMmNfZGV2LT5tc2csIHRydWUpOwogCWNvbXBsZXRlKCZkbWEtPmRtYV9jb21w
bGV0ZSk7CiB9CiAKQEAgLTg4MCw2ICs4ODMsNyBAQCBzdGF0aWMgdm9pZCBzdG0zMmY3X2kyY194
ZmVyX21zZyhzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICppMmNfZGV2LAogewogCXN0cnVjdCBzdG0z
MmY3X2kyY19tc2cgKmY3X21zZyA9ICZpMmNfZGV2LT5mN19tc2c7CiAJdm9pZCBfX2lvbWVtICpi
YXNlID0gaTJjX2Rldi0+YmFzZTsKKwl1OCAqZG1hX2J1ZjsKIAl1MzIgY3IxLCBjcjI7CiAJaW50
IHJldDsKIApAQCAtOTI5LDE3ICs5MzMsMjMgQEAgc3RhdGljIHZvaWQgc3RtMzJmN19pMmNfeGZl
cl9tc2coc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldiwKIAogCS8qIENvbmZpZ3VyZSBE
TUEgb3IgZW5hYmxlIFJYL1RYIGludGVycnVwdCAqLwogCWkyY19kZXYtPnVzZV9kbWEgPSBmYWxz
ZTsKLQlpZiAoaTJjX2Rldi0+ZG1hICYmIGY3X21zZy0+Y291bnQgPj0gU1RNMzJGN19JMkNfRE1B
X0xFTl9NSU4KLQkgICAgJiYgIWkyY19kZXYtPmF0b21pYykgewotCQlyZXQgPSBzdG0zMl9pMmNf
cHJlcF9kbWFfeGZlcihpMmNfZGV2LT5kZXYsIGkyY19kZXYtPmRtYSwKLQkJCQkJICAgICAgbXNn
LT5mbGFncyAmIEkyQ19NX1JELAotCQkJCQkgICAgICBmN19tc2ctPmNvdW50LCBmN19tc2ctPmJ1
ZiwKLQkJCQkJICAgICAgc3RtMzJmN19pMmNfZG1hX2NhbGxiYWNrLAotCQkJCQkgICAgICBpMmNf
ZGV2KTsKLQkJaWYgKCFyZXQpCi0JCQlpMmNfZGV2LT51c2VfZG1hID0gdHJ1ZTsKLQkJZWxzZQot
CQkJZGV2X3dhcm4oaTJjX2Rldi0+ZGV2LCAiY2FuJ3QgdXNlIERNQVxuIik7CisJaWYgKGkyY19k
ZXYtPmRtYSAmJiAhaTJjX2Rldi0+YXRvbWljKSB7CisJCWRtYV9idWYgPSBpMmNfZ2V0X2RtYV9z
YWZlX21zZ19idWYobXNnLCBTVE0zMkY3X0kyQ19ETUFfTEVOX01JTik7CisJCWlmIChkbWFfYnVm
KSB7CisJCQlmN19tc2ctPmJ1ZiA9IGRtYV9idWY7CisJCQlyZXQgPSBzdG0zMl9pMmNfcHJlcF9k
bWFfeGZlcihpMmNfZGV2LT5kZXYsIGkyY19kZXYtPmRtYSwKKwkJCQkJCSAgICAgIG1zZy0+Zmxh
Z3MgJiBJMkNfTV9SRCwKKwkJCQkJCSAgICAgIGY3X21zZy0+Y291bnQsIGY3X21zZy0+YnVmLAor
CQkJCQkJICAgICAgc3RtMzJmN19pMmNfZG1hX2NhbGxiYWNrLAorCQkJCQkJICAgICAgaTJjX2Rl
dik7CisJCQlpZiAocmV0KSB7CisJCQkJZGV2X3dhcm4oaTJjX2Rldi0+ZGV2LCAiY2FuJ3QgdXNl
IERNQVxuIik7CisJCQkJaTJjX3B1dF9kbWFfc2FmZV9tc2dfYnVmKGY3X21zZy0+YnVmLCBtc2cs
IGZhbHNlKTsKKwkJCQlmN19tc2ctPmJ1ZiA9IG1zZy0+YnVmOworCQkJfSBlbHNlIHsKKwkJCQlp
MmNfZGV2LT51c2VfZG1hID0gdHJ1ZTsKKwkJCX0KKwkJfQogCX0KIAogCWlmICghaTJjX2Rldi0+
dXNlX2RtYSkgewpAQCAtMTYyNiw2ICsxNjM2LDggQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMy
ZjdfaTJjX2lzcl9ldmVudF90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJCWRtYWVuZ2lu
ZV90ZXJtaW5hdGVfYXN5bmMoZG1hLT5jaGFuX3VzaW5nKTsKIAkJCWRtYV91bm1hcF9zaW5nbGUo
aTJjX2Rldi0+ZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xlbiwKIAkJCQkJIGRtYS0+ZG1h
X2RhdGFfZGlyKTsKKwkJCWlmICghZjdfbXNnLT5zbWJ1cykKKwkJCQlpMmNfcHV0X2RtYV9zYWZl
X21zZ19idWYoZjdfbXNnLT5idWYsIGkyY19kZXYtPm1zZywgZmFsc2UpOwogCQl9CiAJCWY3X21z
Zy0+cmVzdWx0ID0gLUVOWElPOwogCX0KQEAgLTE2NDgsNiArMTY2MCw4IEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCBzdG0zMmY3X2kyY19pc3JfZXZlbnRfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEp
CiAJCQkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYyhkbWEtPmNoYW5fdXNpbmcpOwogCQkJCWRt
YV91bm1hcF9zaW5nbGUoaTJjX2Rldi0+ZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xlbiwK
IAkJCQkJCSBkbWEtPmRtYV9kYXRhX2Rpcik7CisJCQkJaWYgKCFmN19tc2ctPnNtYnVzKQorCQkJ
CQlpMmNfcHV0X2RtYV9zYWZlX21zZ19idWYoZjdfbXNnLT5idWYsIGkyY19kZXYtPm1zZywgZmFs
c2UpOwogCQkJCWY3X21zZy0+cmVzdWx0ID0gLUVUSU1FRE9VVDsKIAkJCX0KIAkJfQoKLS0gCjIu
NDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
