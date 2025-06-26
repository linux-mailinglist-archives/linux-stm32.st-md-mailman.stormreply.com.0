Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158DAEA753
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jun 2025 21:50:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D18DFC30883;
	Thu, 26 Jun 2025 19:50:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACF21C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 19:50:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QFvBVk009049;
 Thu, 26 Jun 2025 21:50:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=0rlrS+BB1a4km1rs1/r4Dw
 n4U0O9ETz8kgdC8TDIbZQ=; b=vwbBIqqEhkvE27+fHaTNvB/Iz87u32du8q760f
 PLT5XZro5KM4JHJ0APaB2G7nR76CDXTW5zBdeAOwD4Rh41X8MaQR1ytK6a9iOM+p
 73eBWGv8UlOWZJEcxtC/QLmtbLBEpFXdCuqaC+GaLZsa0WQP/IFTqnaLQQC5Jecz
 HqvgUP0gxrqxuGaesLQHfR2cEoPrVyjy4ARKDsuwyKpgNXu6PkQ1edV9zfm2M8ZW
 qBjYQrhwjGE/6aGd76vLMO199DlmqyO4K1wDg9fnNGtNVc0tNlbHqhMXsKmWm//n
 6EOC7lsgouKMJaYMjbPoPoUlQk4TOeA3gRl7Yn7hbMocAkZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33ruyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 21:50:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3D7040044;
 Thu, 26 Jun 2025 21:49:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0CE8BD23A2;
 Thu, 26 Jun 2025 21:48:41 +0200 (CEST)
Received: from localhost (10.252.1.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 21:48:40 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Thu, 26 Jun 2025 21:48:33 +0200
Message-ID: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABGkXWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMz3ZSUIt2kzLyUzLz0Yt2UpFQj46TktFQjS0sloJaCotS0zAqwcdF
 KQW7OSrG1tQDB4daQYwAAAA==
X-Change-ID: 20250626-ddr-bindings-dbe23bcfe299
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
Subject: [Linux-stm32] [PATCH RFC 0/2] Introduce ddr[3-4]-channel binding
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

VGhpcyBzZXJpZXMgYWltcyB0byByZXF1ZXN0IGNvbW1lbnRzIGZvciB0aGUgZGRyLWNoYW5uZWwg
YmluZGluZyBhcyBJJ2xsCm5lZWQgdGhlbSBmb3IgdGhlIHN0bTMyLWRkci1wbXUgZHJpdmVyLgpU
aGUgVjEgb2YgdGhlIGRyaXZlciBhbmQgYSBzdGFydCBvZiBkaXNjdXNzaW9uIGNhbiBiZSBmb3Vu
ZCBoZXJlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNjIzLWRkcnBlcmZtLXVwc3Ry
ZWFtLXYxLTAtN2RmZmZmMTY4MDkwQGZvc3Muc3QuY29tCgpUaGUgZmlyc3QgcGF0Y2ggY29udGFp
bnMgYSBiYXNlIG9mIGJpbmRpbmcsIHdoaWNoIEkgZmluZCBzdWZmaWNpZW50IGZvcgpteSBuZWVk
cyBidXQgcGVyaGFwcyB5b3UnbGwgaGF2ZSBzdWdnZXN0aW9uIGZvciBhZGRpdGlvbiBvciByZXdv
cmsgYXMgdGhpcyBpcwptYWlubHkgaW5zcGlyYXRlIGZyb20gbHBkZHJYLWNoYW5uZWwgYmluZGlu
Zy4KQXMgd2UgY2FuIGZpbmQgdGhlIHNhbWUgcHJvcGVydHkgaW4gdGhlIHR3byBjaGFubmVsIGJp
bmRpbmcgbWF5YmUgdGhpcyBjYW4gYmUKc2hhcmVkIHByb3BlcnRpZXMuCgpUaGUgc2Vjb25kIHBh
dGNoLCB0aGF0IGNvbnRhaW5zIHN0bTMyLWRkci1wbXUgYmluZGluZywgYWltcyB0byBwcm92aWRl
IGFuCmV4YW1wbGUgb2YgdXNhZ2Ugb2YgdGhpcyBkZHItY2hhbm5lbCBiaW5kaW5ncy4KTm90ZSB0
aGUgIm1lbW9yeS1jaGFubmVsIiBwcm9wZXJ0eSB3aGljaCBJIG1haW5seSB3YW50IHRvIGRpc2N1
c3MgYWJvdXQKYW5kIGdhdGhlciBzb21lIGZlZWRiYWNrcy4KCkZvciB5b3VyIGtub3dsZWRnZSwg
dGhlIHN0bTMyLWRkci1wbXUgZHJpdmVyIChERFJQRVJGTSBwZXJpcGhlcmFsKSBuZWVkcwp0aGUg
ZHJhbSB0eXBlIGluZm9ybWF0aW9uIGZvciBpdHMgaW50ZXJuYWwgd29ya2luZyB3aXRoIGRkciBl
dmVudHMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2Zm
aWNAZm9zcy5zdC5jb20+Ci0tLQpDbMOpbWVudCBMZSBHb2ZmaWMgKDIpOgogICAgICBkdC1iaW5k
aW5nczogbWVtb3J5OiBhZGQgamVkZWMsZGRyWzMtNF0tY2hhbm5lbCBiaW5kaW5nCiAgICAgIGR0
LWJpbmRpbmdzOiBwZXJmOiBzdG0zMjogaW50cm9kdWNlIEREUlBFUkZNIGR0LWJpbmRpbmdzCgog
Li4uL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyLWNoYW5uZWwueWFtbCAgfCA1MyAr
KysrKysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wZXJmL3N0LHN0bTMyLWRkci1w
bXUueWFtbCB8IDkwICsrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTQz
IGluc2VydGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiBlMzRhNzliOTZhYjlkNDllZDhiNjA1ZmVl
MTEwOTljZjNlZmJiNDI4CmNoYW5nZS1pZDogMjAyNTA2MjYtZGRyLWJpbmRpbmdzLWRiZTIzYmNm
ZTI5OQoKQmVzdCByZWdhcmRzLAotLSAKQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29m
ZmljQGZvc3Muc3QuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
