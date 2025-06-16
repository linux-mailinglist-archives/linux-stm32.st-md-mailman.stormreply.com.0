Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A8FADAB40
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 10:57:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EFCEC36B3E;
	Mon, 16 Jun 2025 08:57:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C643C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 08:57:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8NuR8020887;
 Mon, 16 Jun 2025 10:57:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WquxTis/znwfTHWWzXSC1Y3Hxb2pPZAd4b+1AgQhyFg=; b=hBM20cEqlhrTlxG0
 L6S6rqEhEZHrrLAjaPefqAoFWLvm3p8G56eapnyb6j14poXUkSMi+AUXKe3tQLzJ
 nzgECmwiebWkeL18MqoktVNsUg8b/vSD6J9yHR1FjegmiViYnzpZQYVvGt35TV9/
 zb+FdASVsOTA9V/G01JykyECrEU+9LOyaZVvoTrNH35UpwRDSgKg5DtGKrGxnHc4
 jMm86FA9aeqZU4jDkms3XEEaLF8p7Di5KhzGN6ZybgGtEwFQFPzXpwFfdroVeX2l
 w60dr+MnF3XRwW4Bh+P6/uL+BLU70P+ZnvujnQdVONBnqQJBIToyuSbR/QKbs8mo
 rKypDA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478x79qk3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 10:57:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5C19540075;
 Mon, 16 Jun 2025 10:56:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F16FD6CB27A;
 Mon, 16 Jun 2025 10:54:44 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:54:44 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 10:53:56 +0200
MIME-Version: 1.0
Message-ID: <20250616-i2c-upstream-v1-3-42d3d5374e65@foss.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
In-Reply-To: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/3] i2c: stm32f7: support
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
bGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3
LmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3Rt
MzJmNy5jCmluZGV4IGEwNWNhYzVlZTlkYi4uNWJlMTRjOGEyYWY0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYworKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXN0bTMyZjcuYwpAQCAtNzQyLDkgKzc0MiwxMiBAQCBzdGF0aWMgdm9pZCBzdG0zMmY3X2kyY19k
bWFfY2FsbGJhY2sodm9pZCAqYXJnKQogCXN0cnVjdCBzdG0zMmY3X2kyY19kZXYgKmkyY19kZXYg
PSAoc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqKWFyZzsKIAlzdHJ1Y3Qgc3RtMzJfaTJjX2RtYSAq
ZG1hID0gaTJjX2Rldi0+ZG1hOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9IGRtYS0+Y2hhbl91c2lu
Zy0+ZGV2aWNlLT5kZXY7CisJc3RydWN0IHN0bTMyZjdfaTJjX21zZyAqZjdfbXNnID0gJmkyY19k
ZXYtPmY3X21zZzsKIAogCXN0bTMyZjdfaTJjX2Rpc2FibGVfZG1hX3JlcShpMmNfZGV2KTsKIAlk
bWFfdW5tYXBfc2luZ2xlKGRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sIGRtYS0+ZG1h
X2RhdGFfZGlyKTsKKwlpZiAoIWY3X21zZy0+c21idXMpCisJCWkyY19wdXRfZG1hX3NhZmVfbXNn
X2J1ZihmN19tc2ctPmJ1ZiwgaTJjX2Rldi0+bXNnLCB0cnVlKTsKIAljb21wbGV0ZSgmZG1hLT5k
bWFfY29tcGxldGUpOwogfQogCkBAIC04ODAsNiArODgzLDcgQEAgc3RhdGljIHZvaWQgc3RtMzJm
N19pMmNfeGZlcl9tc2coc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldiwKIHsKIAlzdHJ1
Y3Qgc3RtMzJmN19pMmNfbXNnICpmN19tc2cgPSAmaTJjX2Rldi0+ZjdfbXNnOwogCXZvaWQgX19p
b21lbSAqYmFzZSA9IGkyY19kZXYtPmJhc2U7CisJdTggKmRtYV9idWY7CiAJdTMyIGNyMSwgY3Iy
OwogCWludCByZXQ7CiAKQEAgLTkyOSwxNyArOTMzLDIzIEBAIHN0YXRpYyB2b2lkIHN0bTMyZjdf
aTJjX3hmZXJfbXNnKHN0cnVjdCBzdG0zMmY3X2kyY19kZXYgKmkyY19kZXYsCiAKIAkvKiBDb25m
aWd1cmUgRE1BIG9yIGVuYWJsZSBSWC9UWCBpbnRlcnJ1cHQgKi8KIAlpMmNfZGV2LT51c2VfZG1h
ID0gZmFsc2U7Ci0JaWYgKGkyY19kZXYtPmRtYSAmJiBmN19tc2ctPmNvdW50ID49IFNUTTMyRjdf
STJDX0RNQV9MRU5fTUlOCi0JICAgICYmICFpMmNfZGV2LT5hdG9taWMpIHsKLQkJcmV0ID0gc3Rt
MzJfaTJjX3ByZXBfZG1hX3hmZXIoaTJjX2Rldi0+ZGV2LCBpMmNfZGV2LT5kbWEsCi0JCQkJCSAg
ICAgIG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCwKLQkJCQkJICAgICAgZjdfbXNnLT5jb3VudCwgZjdf
bXNnLT5idWYsCi0JCQkJCSAgICAgIHN0bTMyZjdfaTJjX2RtYV9jYWxsYmFjaywKLQkJCQkJICAg
ICAgaTJjX2Rldik7Ci0JCWlmICghcmV0KQotCQkJaTJjX2Rldi0+dXNlX2RtYSA9IHRydWU7Ci0J
CWVsc2UKLQkJCWRldl93YXJuKGkyY19kZXYtPmRldiwgImNhbid0IHVzZSBETUFcbiIpOworCWlm
IChpMmNfZGV2LT5kbWEgJiYgIWkyY19kZXYtPmF0b21pYykgeworCQlkbWFfYnVmID0gaTJjX2dl
dF9kbWFfc2FmZV9tc2dfYnVmKG1zZywgU1RNMzJGN19JMkNfRE1BX0xFTl9NSU4pOworCQlpZiAo
ZG1hX2J1ZikgeworCQkJZjdfbXNnLT5idWYgPSBkbWFfYnVmOworCQkJcmV0ID0gc3RtMzJfaTJj
X3ByZXBfZG1hX3hmZXIoaTJjX2Rldi0+ZGV2LCBpMmNfZGV2LT5kbWEsCisJCQkJCQkgICAgICBt
c2ctPmZsYWdzICYgSTJDX01fUkQsCisJCQkJCQkgICAgICBmN19tc2ctPmNvdW50LCBmN19tc2ct
PmJ1ZiwKKwkJCQkJCSAgICAgIHN0bTMyZjdfaTJjX2RtYV9jYWxsYmFjaywKKwkJCQkJCSAgICAg
IGkyY19kZXYpOworCQkJaWYgKHJldCkgeworCQkJCWRldl93YXJuKGkyY19kZXYtPmRldiwgImNh
bid0IHVzZSBETUFcbiIpOworCQkJCWkyY19wdXRfZG1hX3NhZmVfbXNnX2J1ZihmN19tc2ctPmJ1
ZiwgbXNnLCBmYWxzZSk7CisJCQkJZjdfbXNnLT5idWYgPSBtc2ctPmJ1ZjsKKwkJCX0gZWxzZSB7
CisJCQkJaTJjX2Rldi0+dXNlX2RtYSA9IHRydWU7CisJCQl9CisJCX0KIAl9CiAKIAlpZiAoIWky
Y19kZXYtPnVzZV9kbWEpIHsKQEAgLTE2MjQsNiArMTYzNCw4IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBzdG0zMmY3X2kyY19pc3JfZXZlbnRfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJCQlk
bWFlbmdpbmVfdGVybWluYXRlX2FzeW5jKGRtYS0+Y2hhbl91c2luZyk7CiAJCQlkbWFfdW5tYXBf
c2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sCiAJCQkJCSBk
bWEtPmRtYV9kYXRhX2Rpcik7CisJCQlpZiAoIWY3X21zZy0+c21idXMpCisJCQkJaTJjX3B1dF9k
bWFfc2FmZV9tc2dfYnVmKGY3X21zZy0+YnVmLCBpMmNfZGV2LT5tc2csIGZhbHNlKTsKIAkJfQog
CQlmN19tc2ctPnJlc3VsdCA9IC1FTlhJTzsKIAl9CkBAIC0xNjQ2LDYgKzE2NTgsOCBAQCBzdGF0
aWMgaXJxcmV0dXJuX3Qgc3RtMzJmN19pMmNfaXNyX2V2ZW50X3RocmVhZChpbnQgaXJxLCB2b2lk
ICpkYXRhKQogCQkJCWRtYWVuZ2luZV90ZXJtaW5hdGVfYXN5bmMoZG1hLT5jaGFuX3VzaW5nKTsK
IAkJCQlkbWFfdW5tYXBfc2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRt
YV9sZW4sCiAJCQkJCQkgZG1hLT5kbWFfZGF0YV9kaXIpOworCQkJCWlmICghZjdfbXNnLT5zbWJ1
cykKKwkJCQkJaTJjX3B1dF9kbWFfc2FmZV9tc2dfYnVmKGY3X21zZy0+YnVmLCBpMmNfZGV2LT5t
c2csIGZhbHNlKTsKIAkJCQlmN19tc2ctPnJlc3VsdCA9IC1FVElNRURPVVQ7CiAJCQl9CiAJCX0K
Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
