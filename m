Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5BFADABC1
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 11:23:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FAE7C35E00;
	Mon, 16 Jun 2025 09:23:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38E4BC36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 09:23:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8nbVZ018924;
 Mon, 16 Jun 2025 11:23:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 G7pJzEtEF4BRq9Di9PYTDYHEZrJi/VT4Til+/18ednY=; b=RWetQUwEFnW9+VTM
 4BapsuOFsAERvwf4o1Msei3ff6HGnEO5FSz96zfWaUDBMsuqgl8AJ4Zk7MoLmzGP
 qIZfjpl1WXHiKIqgzU6xeOxkluxYxLH+4YmwFt+xyW63ycRL9/kLBJ81ViR+wosB
 YDRxR9cj9v31gMsZexgPpNKNbSZxfZeBy6dmEy2kvORtPP7Hz6POtsL1rJ5WYnZA
 dl16SnQbXR+pQENMhLXLIuKxibPzi5QxkqnMY7yz8Kgp2f/dQhQomsa+4Jf63wyd
 OCZdYyL8MHcP8mAE7KymgLQ+S7CyT1NIEwu+X1tKpLBvPSxzs0tptRlVJBMPsngS
 8GM7EA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1ywfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:23:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0745740046;
 Mon, 16 Jun 2025 11:22:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71758AA6EC7;
 Mon, 16 Jun 2025 11:21:08 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:08 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:03 +0200
MIME-Version: 1.0
Message-ID: <20250616-spi-upstream-v1-2-7e8593f3f75d@foss.st.com>
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/6] spi: stm32: Check for cfg availability in
 stm32_spi_probe
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

VGhlIHN0bTMyX3NwaV9wcm9iZSBmdW5jdGlvbiBub3cgaW5jbHVkZXMgYSBjaGVjayB0byBlbnN1
cmUgdGhhdCB0aGUKcG9pbnRlciByZXR1cm5lZCBieSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEg
aXMgbm90IE5VTEwgYmVmb3JlCmFjY2Vzc2luZyBpdHMgbWVtYmVycy4gVGhpcyByZXNvbHZlcyBh
IHdhcm5pbmcgd2hlcmUgYSBwb3RlbnRpYWwgTlVMTApwb2ludGVyIGRlcmVmZXJlbmNlIGNvdWxk
IG9jY3VyIHdoZW4gYWNjZXNzaW5nIGNmZy0+aGFzX2RldmljZV9tb2RlLgoKQmVmb3JlIGFjY2Vz
c2luZyB0aGUgJ2hhc19kZXZpY2VfbW9kZScgbWVtYmVyLCB3ZSB2ZXJpZnkgdGhhdCAnY2ZnJyBp
cwpub3QgTlVMTC4gSWYgJ2NmZycgaXMgTlVMTCwgYW4gZXJyb3IgbWVzc2FnZSBpcyBsb2dnZWQu
CgpUaGlzIGNoYW5nZSBlbnN1cmVzIHRoYXQgdGhlIGRyaXZlciBkb2VzIG5vdCBhdHRlbXB0IHRv
IGFjY2Vzcwpjb25maWd1cmF0aW9uIGRhdGEgaWYgaXQgaXMgbm90IGF2YWlsYWJsZSwgdGh1cyBw
cmV2ZW50aW5nIGEgcG90ZW50aWFsCnN5c3RlbSBjcmFzaCBkdWUgdG8gYSBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQu
bGVnb2ZmaWNAZm9zcy5zdC5jb20+ClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxs
LzIwMjMxMDE5MTgzMS5NTHd4MWM2eC1sa3BAaW50ZWwuY29tLwpGaXhlczogZmVlNjgxNjQ2ZmM4
ICgic3BpOiBzdG0zMjogZGlzYWJsZSBkZXZpY2UgbW9kZSB3aXRoIHN0LHN0bTMyZjQtc3BpIGNv
bXBhdGlibGUiKQotLS0KIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi5jIHwgOCArKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKaW5kZXgg
MmJjZDRhNDM2NzZkLi44YjYxY2FmNzcwYTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1z
dG0zMi5jCisrKyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCkBAIC0yMDg5LDkgKzIwODksMTUg
QEAgc3RhdGljIGludCBzdG0zMl9zcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0Owog
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsKKwljb25zdCBzdHJ1
Y3Qgc3RtMzJfc3BpX2NmZyAqY2ZnOwogCWJvb2wgZGV2aWNlX21vZGU7CiAJaW50IHJldDsKLQlj
b25zdCBzdHJ1Y3Qgc3RtMzJfc3BpX2NmZyAqY2ZnID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
KCZwZGV2LT5kZXYpOworCisJY2ZnID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5k
ZXYpOworCWlmICghY2ZnKSB7CisJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBnZXQg
bWF0Y2ggZGF0YSBmb3IgcGxhdGZvcm1cbiIpOworCQlyZXR1cm4gLUVOT0RFVjsKKwl9CiAKIAlk
ZXZpY2VfbW9kZSA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgInNwaS1zbGF2ZSIpOwogCWlm
ICghY2ZnLT5oYXNfZGV2aWNlX21vZGUgJiYgZGV2aWNlX21vZGUpIHsKCi0tIAoyLjQzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
