Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ACCAEDDAC
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 14:58:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 274DEC32E92;
	Mon, 30 Jun 2025 12:58:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D85A4C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 12:58:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UC3k8G032278;
 Mon, 30 Jun 2025 14:57:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AUY/W3uZYvpU9kGJPaiqG3BU1z09PZZD5SKs655sSYg=; b=6rP0z/AFo2Uy98Hb
 ct5F0DM7shcvTIRL0tF56qwheeEOs9jA6azlP9BvKg7k/2jKplRnYnd/qITfQTjD
 AiScKPOACgl/ldlLBz6QlGEXbECIu0KOh4vo5QVcBCoZGB1jtA0w46HED5mW11k1
 jNvgN7Kzp6nl29e9Twh+V5J0/QEIiWh+xL4NPALTRM9buC4E0axSw7AHnVSuZo/U
 Ud8MlidfxQVkdkhHSYkAgjPBkus5qGogCrIISCgHeiSCDRmQb9iUTM9GL6HL/zv6
 VkSmyzuDxXyidFbp+51mQa2Uf/ZRiaCSZPppNRStWsVHbsvi5FJ1W7F0YxhSdHJK
 PzIwHQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j79h7b9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 14:57:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9481440050;
 Mon, 30 Jun 2025 14:56:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 700E3B4290D;
 Mon, 30 Jun 2025 14:55:24 +0200 (CEST)
Received: from localhost (10.252.20.7) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 14:55:24 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 30 Jun 2025 14:55:13 +0200
MIME-Version: 1.0
Message-ID: <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 1/3] i2c: stm32: fix the device used for
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
Yy9idXNzZXMvaTJjLXN0bTMyLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1zdG0zMi5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5jCmluZGV4IDE1N2M2NGUy
N2QwYi4uMjcyYTVkZmZiMDhmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0
bTMyLmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5jCkBAIC0xMTgsNyArMTE4
LDcgQEAgaW50IHN0bTMyX2kyY19wcmVwX2RtYV94ZmVyKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IHN0bTMyX2kyY19kbWEgKmRtYSwKIAlkbWEtPmRtYV9sZW4gPSBsZW47CiAJY2hhbl9kZXYg
PSBkbWEtPmNoYW5fdXNpbmctPmRldmljZS0+ZGV2OwogCi0JZG1hLT5kbWFfYnVmID0gZG1hX21h
cF9zaW5nbGUoY2hhbl9kZXYsIGJ1ZiwgZG1hLT5kbWFfbGVuLAorCWRtYS0+ZG1hX2J1ZiA9IGRt
YV9tYXBfc2luZ2xlKGRldiwgYnVmLCBkbWEtPmRtYV9sZW4sCiAJCQkJICAgICAgZG1hLT5kbWFf
ZGF0YV9kaXIpOwogCWlmIChkbWFfbWFwcGluZ19lcnJvcihjaGFuX2RldiwgZG1hLT5kbWFfYnVm
KSkgewogCQlkZXZfZXJyKGRldiwgIkRNQSBtYXBwaW5nIGZhaWxlZFxuIik7CkBAIC0xNTAsNyAr
MTUwLDcgQEAgaW50IHN0bTMyX2kyY19wcmVwX2RtYV94ZmVyKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHN0bTMyX2kyY19kbWEgKmRtYSwKIAlyZXR1cm4gMDsKIAogZXJyOgotCWRtYV91bm1h
cF9zaW5nbGUoY2hhbl9kZXYsIGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAorCWRtYV91bm1h
cF9zaW5nbGUoZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xlbiwKIAkJCSBkbWEtPmRtYV9k
YXRhX2Rpcik7CiAJcmV0dXJuIHJldDsKIH0KCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
