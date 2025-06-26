Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C4AEA755
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jun 2025 21:50:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBE77C3F92D;
	Thu, 26 Jun 2025 19:50:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14B4FC3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 19:50:51 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QGfQPr018806;
 Thu, 26 Jun 2025 21:50:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NMik+GHj52uoVxxBe7t1QLzP2UFZJzC3gMfHq5L927E=; b=boAc6D7sDxuZgQo2
 kqHvwl2FEnBRRtz8JuPWC0AgNCXs3zC0y/wI2WgkfZcG01K/h6PxX6PuyEu8CwT4
 7E67jltvksEdz2EANewZAZMfXoCN0rYMRfoM5codEvzd9l70QnyIkJpn3URJGvjq
 o12ZPUunLE4AkE4L7B3aOCai5KV2qLLPIke9/v03XdDERJ3YvQKXO0WHKunsV/yu
 PSP2ZGeO/qe6QB+uM+PjTfg3ZoGRIqO4dSWH7jqX1/34PBJN2D0M7MhwsUjrLcMN
 A17UERgLzQTQTJnfr2J3GZiFSvjVEXrLEzFCztps9/2a1IsjUGgAjHjEg8Zvzz4R
 /fBSSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5p16jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 21:50:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8A66840046;
 Thu, 26 Jun 2025 21:49:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7119BD23A3;
 Thu, 26 Jun 2025 21:48:44 +0200 (CEST)
Received: from localhost (10.252.1.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 21:48:43 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Thu, 26 Jun 2025 21:48:34 +0200
MIME-Version: 1.0
Message-ID: <20250626-ddr-bindings-v1-1-cae30933c54c@foss.st.com>
References: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
In-Reply-To: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.1.90]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 1/2] dt-bindings: memory: add jedec,
 ddr[3-4]-channel binding
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

SW50cm9kdWNlIGFzIHBlciBqZGVjLGxwZGRyWC1jaGFubmVsIGJpbmRpbmcsIGpkZWMsZGRyWzMt
NF0tY2hhbm5lbApiaW5kaW5nLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxj
bGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIC4uLi9tZW1vcnktY29udHJvbGxlcnMv
ZGRyL2plZGVjLGRkci1jaGFubmVsLnlhbWwgIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHIt
Y2hhbm5lbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9kZHIvamVkZWMsZGRyLWNoYW5uZWwueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwMDAuLjUyNzFiNDEyNzllMgotLS0gL2Rldi9udWxsCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2pl
ZGVjLGRkci1jaGFubmVsLnlhbWwKQEAgLTAsMCArMSw1MyBAQAorIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQor
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvZGRy
L2plZGVjLGRkci1jaGFubmVsLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEREUiBjaGFubmVsIHdpdGggY2hpcC9y
YW5rIHRvcG9sb2d5IGRlc2NyaXB0aW9uCisKK2Rlc2NyaXB0aW9uOgorICBBIEREUiBjaGFubmVs
IGlzIGEgbG9naWNhbCBncm91cGluZyBvZiBtZW1vcnkgY2hpcHMgdGhhdCBhcmUgY29ubmVjdGVk
CisgIHRvIGEgaG9zdCBzeXN0ZW0uIFRoZSBtYWluIHB1cnBvc2Ugb2YgdGhpcyBub2RlIGlzIHRv
IGRlc2NyaWJlIHRoZQorICBvdmVyYWxsIEREUiB0b3BvbG9neSBvZiB0aGUgc3lzdGVtLCBpbmNs
dWRpbmcgdGhlIGFtb3VudCBvZiBpbmRpdmlkdWFsCisgIEREUiBjaGlwcy4KKworbWFpbnRhaW5l
cnM6CisgIC0gQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29t
PgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGVudW06CisgICAgICAtIGplZGVj
LGRkcjMtY2hhbm5lbAorICAgICAgLSBqZWRlYyxkZHI0LWNoYW5uZWwKKworICBpby13aWR0aDoK
KyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoZSBudW1iZXIgb2YgRFEgcGlucyBpbiB0aGUgY2hh
bm5lbC4gSWYgdGhpcyBudW1iZXIgaXMgZGlmZmVyZW50CisgICAgICBmcm9tIChhIG11bHRpcGxl
IG9mKSB0aGUgaW8td2lkdGggb2YgdGhlIEREUiBjaGlwLCB0aGF0IG1lYW5zIHRoYXQKKyAgICAg
IG11bHRpcGxlIGluc3RhbmNlcyBvZiB0aGF0IHR5cGUgb2YgY2hpcCBhcmUgd2lyZWQgaW4gcGFy
YWxsZWwgb24gdGhpcworICAgICAgY2hhbm5lbCAod2l0aCB0aGUgY2hhbm5lbCdzIERRIHBpbnMg
c3BsaXQgdXAgYmV0d2VlbiB0aGUgZGlmZmVyZW50CisgICAgICBjaGlwcywgYW5kIHRoZSBDQSwg
Q1MsIGV0Yy4gcGlucyBvZiB0aGUgZGlmZmVyZW50IGNoaXBzIGFsbCBzaG9ydGVkCisgICAgICB0
b2dldGhlcikuICBUaGlzIG1lYW5zIHRoYXQgdGhlIHRvdGFsIHBoeXNpY2FsIG1lbW9yeSBjb250
cm9sbGVkIGJ5IGEKKyAgICAgIGNoYW5uZWwgaXMgZXF1YWwgdG8gdGhlIHN1bSBvZiB0aGUgZGVu
c2l0aWVzIG9mIGVhY2ggcmFuayBvbiB0aGUKKyAgICAgIGNvbm5lY3RlZCBERFIgY2hpcCwgdGlt
ZXMgdGhlIGlvLXdpZHRoIG9mIHRoZSBjaGFubmVsIGRpdmlkZWQgYnkKKyAgICAgIHRoZSBpby13
aWR0aCBvZiB0aGUgRERSIGNoaXAuCisgICAgZW51bToKKyAgICAgIC0gOAorICAgICAgLSAxNgor
ICAgICAgLSAzMgorICAgICAgLSA2NAorICAgICAgLSAxMjgKKworcmVxdWlyZWQ6CisgICAgICAt
IGNvbXBhdGlibGUKKyAgICAgIC0gaW8td2lkdGgKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBkZHJfY2hhbm5lbDogZGRyMy1jaGFubmVsQDAg
eworICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLGRkcjMtY2hhbm5lbCI7CisgICAgICAgIGlv
LXdpZHRoID0gPDE2PjsKKyAgICB9OwoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
