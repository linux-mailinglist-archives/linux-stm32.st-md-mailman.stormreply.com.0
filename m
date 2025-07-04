Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B533AF8C30
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 10:42:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B9B0C36B2F;
	Fri,  4 Jul 2025 08:42:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D937C3F958
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 08:42:02 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647Zr9v012099;
 Fri, 4 Jul 2025 10:41:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 T+nHIjk3CgnMjH/o8M23MKc/+/PyZ7sJdxyhMJ6Ka/4=; b=CX/LaQsNge428SQj
 SuztwM9Qwozyfyw8KguWd1ub3aZz2cbTXYSNNNXO9/W03fLBqUuZ74B+L0LULcWh
 BhTPeD8q6DJFC+5q+if76n4b8CMbvgxlXb5/Pfc5iWxLz7BAbdZVKmGQ9YOZbeG/
 SvtrJcpO5mcxgi9/EELSdQzT3tqXYWCUQAjB66/QxlKdVwfmKG/pjz0lVJgY2nzB
 HObByf9fx46mgcPv4BhILZhggZ/WfQF9etpJPN5Llb67kT3OjmpZa7qBcxgpQtRG
 5j50phFMt0qHuI067V/HAWLh+RjzWkiJzrYabWsNPIkfeNMWfHaliv4G3fghn4H0
 Si/xcg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubp8w0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jul 2025 10:41:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 995604004F;
 Fri,  4 Jul 2025 10:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4336847F9B2;
 Fri,  4 Jul 2025 10:39:37 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 10:39:36 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 4 Jul 2025 10:39:14 +0200
MIME-Version: 1.0
Message-ID: <20250704-i2c-upstream-v4-1-84a095a2c728@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v4 1/3] i2c: stm32: fix the device used for
	the DMA map
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

SWYgdGhlIERNQSBtYXBwaW5nIGZhaWxlZCwgaXQgcHJvZHVjZWQgYW4gZXJyb3IgbG9nIHdpdGgg
dGhlIHdyb25nCmRldmljZSBuYW1lOgoic3RtMzItZG1hMyA0MDQwMDAwMC5kbWEtY29udHJvbGxl
cjogcmVqZWN0aW5nIERNQSBtYXAgb2Ygdm1hbGxvYyBtZW1vcnkiCkZpeCB0aGlzIGlzc3VlIGJ5
IHJlcGxhY2luZyB0aGUgZGV2IHdpdGggdGhlIEkyQyBkZXYuCgpGaXhlczogYmI4ODIyY2JiYzUz
ICgiaTJjOiBpMmMtc3RtMzI6IEFkZCBnZW5lcmljIERNQSBBUEkiKQpBY2tlZC1ieTogQWxhaW4g
Vm9sbWF0IDxhbGFpbi52b2xtYXRAZm9zcy5zdC5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiBkcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXN0bTMyLmMgICB8IDggKysrLS0tLS0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtc3RtMzJmNy5jIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMy
LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyLmMKaW5kZXggMTU3YzY0ZTI3ZDBiLi5m
ODRlYzA1NmUzNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzIuYwor
KysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyLmMKQEAgLTEwMiw3ICsxMDIsNiBAQCBp
bnQgc3RtMzJfaTJjX3ByZXBfZG1hX3hmZXIoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc3Rt
MzJfaTJjX2RtYSAqZG1hLAogCQkJICAgIHZvaWQgKmRtYV9hc3luY19wYXJhbSkKIHsKIAlzdHJ1
Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IgKnR4ZGVzYzsKLQlzdHJ1Y3QgZGV2aWNlICpjaGFu
X2RldjsKIAlpbnQgcmV0OwogCiAJaWYgKHJkX3dyKSB7CkBAIC0xMTYsMTEgKzExNSwxMCBAQCBp
bnQgc3RtMzJfaTJjX3ByZXBfZG1hX3hmZXIoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc3Rt
MzJfaTJjX2RtYSAqZG1hLAogCX0KIAogCWRtYS0+ZG1hX2xlbiA9IGxlbjsKLQljaGFuX2RldiA9
IGRtYS0+Y2hhbl91c2luZy0+ZGV2aWNlLT5kZXY7CiAKLQlkbWEtPmRtYV9idWYgPSBkbWFfbWFw
X3NpbmdsZShjaGFuX2RldiwgYnVmLCBkbWEtPmRtYV9sZW4sCisJZG1hLT5kbWFfYnVmID0gZG1h
X21hcF9zaW5nbGUoZGV2LCBidWYsIGRtYS0+ZG1hX2xlbiwKIAkJCQkgICAgICBkbWEtPmRtYV9k
YXRhX2Rpcik7Ci0JaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGNoYW5fZGV2LCBkbWEtPmRtYV9idWYp
KSB7CisJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRldiwgZG1hLT5kbWFfYnVmKSkgewogCQlkZXZf
ZXJyKGRldiwgIkRNQSBtYXBwaW5nIGZhaWxlZFxuIik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0K
QEAgLTE1MCw3ICsxNDgsNyBAQCBpbnQgc3RtMzJfaTJjX3ByZXBfZG1hX3hmZXIoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3Qgc3RtMzJfaTJjX2RtYSAqZG1hLAogCXJldHVybiAwOwogCiBlcnI6
Ci0JZG1hX3VubWFwX3NpbmdsZShjaGFuX2RldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4s
CisJZG1hX3VubWFwX3NpbmdsZShkZXYsIGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAogCQkJ
IGRtYS0+ZG1hX2RhdGFfZGlyKTsKIAlyZXR1cm4gcmV0OwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMy
ZjcuYwppbmRleCBlNGFhZWIyMjYyZDAuLjgxN2QwODE0NjBjMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1z
dG0zMmY3LmMKQEAgLTc0MSwxMCArNzQxLDEwIEBAIHN0YXRpYyB2b2lkIHN0bTMyZjdfaTJjX2Rt
YV9jYWxsYmFjayh2b2lkICphcmcpCiB7CiAJc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2Rl
diA9IChzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICopYXJnOwogCXN0cnVjdCBzdG0zMl9pMmNfZG1h
ICpkbWEgPSBpMmNfZGV2LT5kbWE7Ci0Jc3RydWN0IGRldmljZSAqZGV2ID0gZG1hLT5jaGFuX3Vz
aW5nLT5kZXZpY2UtPmRldjsKIAogCXN0bTMyZjdfaTJjX2Rpc2FibGVfZG1hX3JlcShpMmNfZGV2
KTsKLQlkbWFfdW5tYXBfc2luZ2xlKGRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sIGRt
YS0+ZG1hX2RhdGFfZGlyKTsKKwlkbWFfdW5tYXBfc2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5k
bWFfYnVmLCBkbWEtPmRtYV9sZW4sCisJCQkgZG1hLT5kbWFfZGF0YV9kaXIpOwogCWNvbXBsZXRl
KCZkbWEtPmRtYV9jb21wbGV0ZSk7CiB9CiAKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
