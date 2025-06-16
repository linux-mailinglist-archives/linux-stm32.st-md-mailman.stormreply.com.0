Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92957ADAB3F
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 10:57:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55116C36B2C;
	Mon, 16 Jun 2025 08:57:56 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1D30C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 08:57:54 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8j90R007215;
 Mon, 16 Jun 2025 10:57:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3WfFafoOzhwEP01k+lNZuQ235Lfi7VkaaDEXOrgCKhQ=; b=JqGXJXDpKHkbljGY
 WbS3vBo6YHZ9tEh7LnWT8B3i0RNkZsbPjq0iB55CgkclAE/qR4TJ+wfJmPw5Sfs0
 Ui3xcREFWJJEhR/pp91VcAwDRgW71z2ryKyLiEFigTk+vYX/zhiZzVxeXL9Z1laI
 emJtfQ8BwIg3jmFqnJnV0RjHN6c1eRs0cN7iw4AySvXwYG9tSQtjvEF+OQpNWE/8
 01HrOn5XxVijBaGV9xG3iD2nUR4GzDNRrUykORQQ2NjQJmu1R3oudcDgGYKDZ7z4
 T+Tl8h679DFn5PEFS+hRCxw80OUQUok71tMmnkqTyO+khcUjeOUuVEvDJKOfaYPm
 XjfiBA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 479m1nv5fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 10:57:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AA21840058;
 Mon, 16 Jun 2025 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CD8E5D40BD;
 Mon, 16 Jun 2025 10:54:43 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:54:42 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 10:53:54 +0200
MIME-Version: 1.0
Message-ID: <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 1/3] i2c: stm32: fix the device used for the
	DMA map
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
ICgiaTJjOiBpMmMtc3RtMzI6IEFkZCBnZW5lcmljIERNQSBBUEkiKQpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQogZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1zdG0zMi5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5jCmluZGV4IDE1N2M2
NGUyN2QwYi4uNWUwYjMxYWVkNzc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXN0bTMyLmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5jCkBAIC0xMTgsNyAr
MTE4LDcgQEAgaW50IHN0bTMyX2kyY19wcmVwX2RtYV94ZmVyKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHN0bTMyX2kyY19kbWEgKmRtYSwKIAlkbWEtPmRtYV9sZW4gPSBsZW47CiAJY2hhbl9k
ZXYgPSBkbWEtPmNoYW5fdXNpbmctPmRldmljZS0+ZGV2OwogCi0JZG1hLT5kbWFfYnVmID0gZG1h
X21hcF9zaW5nbGUoY2hhbl9kZXYsIGJ1ZiwgZG1hLT5kbWFfbGVuLAorCWRtYS0+ZG1hX2J1ZiA9
IGRtYV9tYXBfc2luZ2xlKGRldiwgYnVmLCBkbWEtPmRtYV9sZW4sCiAJCQkJICAgICAgZG1hLT5k
bWFfZGF0YV9kaXIpOwogCWlmIChkbWFfbWFwcGluZ19lcnJvcihjaGFuX2RldiwgZG1hLT5kbWFf
YnVmKSkgewogCQlkZXZfZXJyKGRldiwgIkRNQSBtYXBwaW5nIGZhaWxlZFxuIik7CgotLSAKMi40
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
