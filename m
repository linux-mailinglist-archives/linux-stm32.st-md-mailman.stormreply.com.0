Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55288ADABC4
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 11:23:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 624D5C36B2C;
	Mon, 16 Jun 2025 09:23:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AC1EC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 09:23:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8ZTHg015551;
 Mon, 16 Jun 2025 11:23:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 D7+OvSwoVVqlTBMuJc+wtSrz4tCpMidCNQSt7hN5EuU=; b=5ZCpChomjD8v6Dpd
 BSAnGf7q4nAfcJfY0pqThRSytnvP2fFHENUwg0vr3dxsvaVgbeNxpOAaUuImM9BY
 qSWd3CqntARsHX30eJ3Ane5ZfwcUVL3HYKX1NIaVEZNpka9fWSEDjKT78jN0LTTp
 uQI+B3+uej8gnHaAEeNuUs9S4E6VnZSbHPOB21jt7VlaTvJy5xlIVBWl77UobqCv
 s+R+jwlJrszondh2KF7jTv4/6Dym+dtjvWtuNGqXyp41HhCPgbvtFV8gSe+eDixl
 7Cmft5m2p4g2E3RAemd847tDRuVFcJu4nVLHtC0W5PQQJ2Ixav6ImSrj/Yj8lwjb
 +RbWaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47afw1g9hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:23:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5BAD04004F;
 Mon, 16 Jun 2025 11:22:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2068AA7D8DB;
 Mon, 16 Jun 2025 11:21:12 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:11 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:07 +0200
MIME-Version: 1.0
Message-ID: <20250616-spi-upstream-v1-6-7e8593f3f75d@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 6/6] dt-bindings: spi: stm32: deprecate `st,
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

VGhlIHZlbmRvciBgc3Qsc3BpLW1pZGktbnNgIHByb3BlcnR5IGlzIG5vIGxvbmdlciBuZWVkZWQg
YW5kCmhhcyBiZWVuIGRlcHJlY2F0ZWQgaW4gZmF2b3Igb2YgYSBnZW5lcmljIHNvbHV0aW9uLgoK
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Mu
c3QuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLXBl
cmlwaGVyYWwtcHJvcHMueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGkt
cGVyaXBoZXJhbC1wcm9wcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sCmluZGV4IDhmYzE3ZTE2ZWZiMi4uOGI2ZThm
YzAwOWRiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3Bp
L3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sCkBAIC0xMTUsNiArMTE1LDcg
QEAgcHJvcGVydGllczoKICAgICBtYXhJdGVtczogNAogCiAgIHN0LHNwaS1taWRpLW5zOgorICAg
IGRlcHJlY2F0ZWQ6IHRydWUKICAgICBkZXNjcmlwdGlvbjogfAogICAgICAgT25seSBmb3IgU1RN
MzJINywgKE1hc3RlciBJbnRlci1EYXRhIElkbGVuZXNzKSBtaW5pbXVtIHRpbWUKICAgICAgIGRl
bGF5IGluIG5hbm9zZWNvbmRzIGluc2VydGVkIGJldHdlZW4gdHdvIGNvbnNlY3V0aXZlIGRhdGEg
ZnJhbWVzLgoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
