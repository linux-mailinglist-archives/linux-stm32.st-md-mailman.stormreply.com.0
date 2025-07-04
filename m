Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D1AF8C32
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 10:42:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AD84C3F959;
	Fri,  4 Jul 2025 08:42:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9E9CC36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 08:42:03 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZrNT028655;
 Fri, 4 Jul 2025 10:41:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 eago0RZdyrerOdy6yEfqaUqyo2OFIpdQliz92NLH9S8=; b=I1qgQ10fN3ww2k8s
 Sdp3ZBe1GoA1iUJwC5Er7fn95fXqvWOrJdbXmVCQrFZ0Y10eIJKspdKrwmCBDjNn
 kQRqBqaiT40/OsieTsuLq7cS6NC7Wwvfeqxxx7lhBCP2PyxsTlw4HqHXzoTdgygw
 sUAAUssurpuVGl6/uKt/aRQw/nmhe3ODFIlw2x7/w4pjUv8NDoo4Nst4K14Ff2Gh
 2taGJBoigEwq70MispjCnDBHMgqIuWJDN0z5qU5sTI5QLSe3u3kst9wEpPDR5kvE
 FlDwv7A1iuBf8RSve3+WQsu+w/M1KRwwFgv6aDMlmyvnYzUHKumCJmSAzC/KcEf7
 w0ae6g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy59k3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jul 2025 10:41:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 99C2840051;
 Fri,  4 Jul 2025 10:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 022ED483149;
 Fri,  4 Jul 2025 10:39:38 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 10:39:37 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 4 Jul 2025 10:39:15 +0200
MIME-Version: 1.0
Message-ID: <20250704-i2c-upstream-v4-2-84a095a2c728@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v4 2/3] i2c: stm32f7: unmap DMA mapped buffer
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

QmVmb3JlIGVhY2ggSTJDIHRyYW5zZmVyIHVzaW5nIERNQSwgdGhlIEkyQyBidWZmZXIgaXMgRE1B
J3BwZWQgdG8gbWFrZQpzdXJlIHRoZSBtZW1vcnkgYnVmZmVyIGlzIERNQSdhYmxlLiBUaGlzIGlz
IGhhbmRsZSBpbiB0aGUgZnVuY3Rpb24KYHN0bTMyX2kyY19wcmVwX2RtYV94ZmVyKClgLgpJZiB0
aGUgdHJhbnNmZXIgZmFpbHMgZm9yIGFueSByZWFzb24gdGhlIEkyQyBidWZmZXIgbXVzdCBiZSB1
bm1hcC4KVXNlIHRoZSBkbWFfY2FsbGJhY2sgdG8gZmFjdG9yaXplIHRoZSBjb2RlIGFuZCBmaXgg
dGhpcyBpc3N1ZS4KCk5vdGUgdGhhdCB0aGUgYHN0bTMyZjdfaTJjX2RtYV9jYWxsYmFjaygpYCBp
cyBub3cgY2FsbGVkIGluIGNhc2Ugb2YgRE1BCnRyYW5zZmVyIHN1Y2Nlc3MgYW5kIGVycm9yIGFu
ZCB0aGF0IHRoZSBgY29tcGxldGUoKWAgb24gdGhlIGRtYV9jb21wbGV0ZQpjb21wbGV0aW9uIHN0
cnVjdHVyZSBpcyBkb25lIGluY29uZGl0aW9ubmFsbHkgaW4gY2FzZSBvZiB0cmFuc2ZlcgpzdWNj
ZXNzIG9yIGVycm9yIGFzIHdlbGwgYXMgdGhlIGBkbWFlbmdpbmVfdGVybWluYXRlX2FzeW5jKClg
LgpUaGlzIGlzIGFsbG93ZWQgYXMgYSBgY29tcGxldGUoKWAgaW4gY2FzZSB0cmFuc2ZlciBlcnJv
ciBoYXMgbm8gZWZmZWN0CmFzIHdlbGwgYXMgYSBgZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYygp
YCBvbiBhIHRyYW5zZmVyIHN1Y2Nlc3MuCgpBbHNvIGZpeCB0aGUgdW5uZWVkZWQgY2FzdCBhbmQg
cmVtb3ZlIG5vdCBtb3JlIG5lZWRlZCB2YXJpYWJsZXMuCgpGaXhlczogN2VjYzhjZmRlNTUzICgi
aTJjOiBpMmMtc3RtMzJmNzogQWRkIERNQSBzdXBwb3J0IikKQWNrZWQtYnk6IEFsYWluIFZvbG1h
dCA8YWxhaW4udm9sbWF0QGZvc3Muc3QuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBH
b2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1zdG0zMmY3LmMgfCAyMCArKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMy
ZjcuYwppbmRleCA4MTdkMDgxNDYwYzIuLjczYTdiODg5NGMwZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1z
dG0zMmY3LmMKQEAgLTczOSwxMCArNzM5LDExIEBAIHN0YXRpYyB2b2lkIHN0bTMyZjdfaTJjX2Rp
c2FibGVfZG1hX3JlcShzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICppMmNfZGV2KQogCiBzdGF0aWMg
dm9pZCBzdG0zMmY3X2kyY19kbWFfY2FsbGJhY2sodm9pZCAqYXJnKQogewotCXN0cnVjdCBzdG0z
MmY3X2kyY19kZXYgKmkyY19kZXYgPSAoc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqKWFyZzsKKwlz
dHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICppMmNfZGV2ID0gYXJnOwogCXN0cnVjdCBzdG0zMl9pMmNf
ZG1hICpkbWEgPSBpMmNfZGV2LT5kbWE7CiAKIAlzdG0zMmY3X2kyY19kaXNhYmxlX2RtYV9yZXEo
aTJjX2Rldik7CisJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYyhkbWEtPmNoYW5fdXNpbmcpOwog
CWRtYV91bm1hcF9zaW5nbGUoaTJjX2Rldi0+ZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xl
biwKIAkJCSBkbWEtPmRtYV9kYXRhX2Rpcik7CiAJY29tcGxldGUoJmRtYS0+ZG1hX2NvbXBsZXRl
KTsKQEAgLTE1MTAsNyArMTUxMSw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmY3X2kyY19o
YW5kbGVfaXNyX2VycnMoc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldiwKIAl1MTYgYWRk
ciA9IGY3X21zZy0+YWRkcjsKIAl2b2lkIF9faW9tZW0gKmJhc2UgPSBpMmNfZGV2LT5iYXNlOwog
CXN0cnVjdCBkZXZpY2UgKmRldiA9IGkyY19kZXYtPmRldjsKLQlzdHJ1Y3Qgc3RtMzJfaTJjX2Rt
YSAqZG1hID0gaTJjX2Rldi0+ZG1hOwogCiAJLyogQnVzIGVycm9yICovCiAJaWYgKHN0YXR1cyAm
IFNUTTMyRjdfSTJDX0lTUl9CRVJSKSB7CkBAIC0xNTUxLDEwICsxNTUxLDggQEAgc3RhdGljIGly
cXJldHVybl90IHN0bTMyZjdfaTJjX2hhbmRsZV9pc3JfZXJycyhzdHJ1Y3Qgc3RtMzJmN19pMmNf
ZGV2ICppMmNfZGV2LAogCX0KIAogCS8qIERpc2FibGUgZG1hICovCi0JaWYgKGkyY19kZXYtPnVz
ZV9kbWEpIHsKLQkJc3RtMzJmN19pMmNfZGlzYWJsZV9kbWFfcmVxKGkyY19kZXYpOwotCQlkbWFl
bmdpbmVfdGVybWluYXRlX2FzeW5jKGRtYS0+Y2hhbl91c2luZyk7Ci0JfQorCWlmIChpMmNfZGV2
LT51c2VfZG1hKQorCQlzdG0zMmY3X2kyY19kbWFfY2FsbGJhY2soaTJjX2Rldik7CiAKIAlpMmNf
ZGV2LT5tYXN0ZXJfbW9kZSA9IGZhbHNlOwogCWNvbXBsZXRlKCZpMmNfZGV2LT5jb21wbGV0ZSk7
CkBAIC0xNjAwLDcgKzE1OTgsNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtMzJmN19pMmNfaXNy
X2V2ZW50X3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQogewogCXN0cnVjdCBzdG0zMmY3X2ky
Y19kZXYgKmkyY19kZXYgPSBkYXRhOwogCXN0cnVjdCBzdG0zMmY3X2kyY19tc2cgKmY3X21zZyA9
ICZpMmNfZGV2LT5mN19tc2c7Ci0Jc3RydWN0IHN0bTMyX2kyY19kbWEgKmRtYSA9IGkyY19kZXYt
PmRtYTsKIAl2b2lkIF9faW9tZW0gKmJhc2UgPSBpMmNfZGV2LT5iYXNlOwogCXUzMiBzdGF0dXMs
IG1hc2s7CiAJaW50IHJldDsKQEAgLTE2MTksMTAgKzE2MTYsOCBAQCBzdGF0aWMgaXJxcmV0dXJu
X3Qgc3RtMzJmN19pMmNfaXNyX2V2ZW50X3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQogCQlk
ZXZfZGJnKGkyY19kZXYtPmRldiwgIjwlcz46IFJlY2VpdmUgTkFDSyAoYWRkciAleClcbiIsCiAJ
CQlfX2Z1bmNfXywgZjdfbXNnLT5hZGRyKTsKIAkJd3JpdGVsX3JlbGF4ZWQoU1RNMzJGN19JMkNf
SUNSX05BQ0tDRiwgYmFzZSArIFNUTTMyRjdfSTJDX0lDUik7Ci0JCWlmIChpMmNfZGV2LT51c2Vf
ZG1hKSB7Ci0JCQlzdG0zMmY3X2kyY19kaXNhYmxlX2RtYV9yZXEoaTJjX2Rldik7Ci0JCQlkbWFl
bmdpbmVfdGVybWluYXRlX2FzeW5jKGRtYS0+Y2hhbl91c2luZyk7Ci0JCX0KKwkJaWYgKGkyY19k
ZXYtPnVzZV9kbWEpCisJCQlzdG0zMmY3X2kyY19kbWFfY2FsbGJhY2soaTJjX2Rldik7CiAJCWY3
X21zZy0+cmVzdWx0ID0gLUVOWElPOwogCX0KIApAQCAtMTY0MCw4ICsxNjM1LDcgQEAgc3RhdGlj
IGlycXJldHVybl90IHN0bTMyZjdfaTJjX2lzcl9ldmVudF90aHJlYWQoaW50IGlycSwgdm9pZCAq
ZGF0YSkKIAkJCXJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmaTJjX2Rldi0+ZG1h
LT5kbWFfY29tcGxldGUsIEhaKTsKIAkJCWlmICghcmV0KSB7CiAJCQkJZGV2X2RiZyhpMmNfZGV2
LT5kZXYsICI8JXM+OiBUaW1lZCBvdXRcbiIsIF9fZnVuY19fKTsKLQkJCQlzdG0zMmY3X2kyY19k
aXNhYmxlX2RtYV9yZXEoaTJjX2Rldik7Ci0JCQkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYyhk
bWEtPmNoYW5fdXNpbmcpOworCQkJCXN0bTMyZjdfaTJjX2RtYV9jYWxsYmFjayhpMmNfZGV2KTsK
IAkJCQlmN19tc2ctPnJlc3VsdCA9IC1FVElNRURPVVQ7CiAJCQl9CiAJCX0KCi0tIAoyLjQzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
