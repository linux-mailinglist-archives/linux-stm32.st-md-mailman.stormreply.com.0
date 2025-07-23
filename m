Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1C2B0F331
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 15:09:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A7CBC36B3D;
	Wed, 23 Jul 2025 13:09:41 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B01CEC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 13:09:38 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NC1aD7018432;
 Wed, 23 Jul 2025 15:09:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 akqUQfJc807kCu0sYZi5OCGTzmARlWNMPI99bkotwi0=; b=CsfMsjK1MLOxAD2d
 jTEBa8nOPDPZiP1GC7baAvmn/zusAhHDdwclmLduwytaT+jT1N+uD4yEKvtmi91x
 aIbotWOdGLKjCeQ7XKUklr3BmKhpLLX+2HR1U/qRVQSx1hPgTv7ljqdM2tqvkJaF
 BGZ/R4s2eFs/9EPFedSqLDlgffE83Xf4lwEZVwo04zaCdHHfw/DSRkv8+ulYaFvu
 OXcKzc0kPh+eGS74zeTtbYZMg/6/RRUzBbHL0KcIYgSn5c/hpVyIj4ghJJ3d8Epy
 Vtc5E7I959FvuujuW3QEe3JUppE05LFTA20ctyRPxgg1g4RQshxKS2sqOxANm0u+
 X8mk6g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480pan0re3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 15:09:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5DCAF4004C;
 Wed, 23 Jul 2025 15:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39D07799893;
 Wed, 23 Jul 2025 15:06:08 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:06:07 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 23 Jul 2025 15:05:51 +0200
MIME-Version: 1.0
Message-ID: <20250723-ddrperfm-upstream-v4-7-1aa53ca319f4@foss.st.com>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
In-Reply-To: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>, Julius Werner <jwerner@chromium.org>
X-Mailer: b4 0.15-dev-8018a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 07/20] dt-bindings: memory: factorise LPDDR
 channel binding into SDRAM channel
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

TFBERFIsIEREUiBhbmQgc28gU0RSQU0gY2hhbm5lbHMgZXhpc3QgYW5kIHNoYXJlIHRoZSBzYW1l
IHByb3BlcnRpZXMsIHRoZXkKaGF2ZSBhIGNvbXBhdGlibGUsIHJhbmtzLCBhbmQgYW4gaW8td2lk
dGguCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNA
Zm9zcy5zdC5jb20+Ci0tLQogLi4ubHBkZHItY2hhbm5lbC55YW1sID0+IGplZGVjLHNkcmFtLWNo
YW5uZWwueWFtbH0gfCAyMyArKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsbHBk
ZHItY2hhbm5lbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9y
eS1jb250cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tY2hhbm5lbC55YW1sCnNpbWlsYXJpdHkgaW5k
ZXggODMlCnJlbmFtZSBmcm9tIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktY29udHJvbGxlcnMvZGRyL2plZGVjLGxwZGRyLWNoYW5uZWwueWFtbApyZW5hbWUgdG8gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVk
ZWMsc2RyYW0tY2hhbm5lbC55YW1sCmluZGV4IDM0YjViZDE1M2Y2My4uOTg5MmRhNTIwZmU0IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRy
b2xsZXJzL2Rkci9qZWRlYyxscGRkci1jaGFubmVsLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tY2hh
bm5lbC55YW1sCkBAIC0xLDE2ICsxLDE3IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKICVZQU1MIDEuMgogLS0tCi0kaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsbHBk
ZHItY2hhbm5lbC55YW1sIworJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1v
cnktY29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5uZWwueWFtbCMKICRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwogCi10aXRsZTogTFBE
RFIgY2hhbm5lbCB3aXRoIGNoaXAvcmFuayB0b3BvbG9neSBkZXNjcmlwdGlvbgordGl0bGU6IFNE
UkFNIGNoYW5uZWwgd2l0aCBjaGlwL3JhbmsgdG9wb2xvZ3kgZGVzY3JpcHRpb24KIAogZGVzY3Jp
cHRpb246Ci0gIEFuIExQRERSIGNoYW5uZWwgaXMgYSBjb21wbGV0ZWx5IGluZGVwZW5kZW50IHNl
dCBvZiBMUEREUiBwaW5zIChEUSwgQ0EsIENTLAotICBDSywgZXRjLikgdGhhdCBjb25uZWN0IG9u
ZSBvciBtb3JlIExQRERSIGNoaXBzIHRvIGEgaG9zdCBzeXN0ZW0uIFRoZSBtYWluCi0gIHB1cnBv
c2Ugb2YgdGhpcyBub2RlIGlzIHRvIG92ZXJhbGwgTFBERFIgdG9wb2xvZ3kgb2YgdGhlIHN5c3Rl
bSwgaW5jbHVkaW5nIHRoZQotICBhbW91bnQgb2YgaW5kaXZpZHVhbCBMUEREUiBjaGlwcyBhbmQg
dGhlIHJhbmtzIHBlciBjaGlwLgorICBBIG1lbW9yeSBjaGFubmVsIG9mIFNEUkFNIG1lbW9yeSBs
aWtlIEREUiBTRFJBTSBvciBMUEREUiBTRFJBTSBpcyBhIGNvbXBsZXRlbHkKKyAgaW5kZXBlbmRl
bnQgc2V0IG9mIHBpbnMgKERRLCBDQSwgQ1MsIENLLCBldGMuKSB0aGF0IGNvbm5lY3Qgb25lIG9y
IG1vcmUgbWVtb3J5CisgIGNoaXBzIHRvIGEgaG9zdCBzeXN0ZW0uIFRoZSBtYWluIHB1cnBvc2Ug
b2YgdGhpcyBub2RlIGlzIHRvIG92ZXJhbGwgbWVtb3J5CisgIHRvcG9sb2d5IG9mIHRoZSBzeXN0
ZW0sIGluY2x1ZGluZyB0aGUgYW1vdW50IG9mIGluZGl2aWR1YWwgbWVtb3J5IGNoaXBzIGFuZAor
ICB0aGUgcmFua3MgcGVyIGNoaXAuCiAKIG1haW50YWluZXJzOgogICAtIEp1bGl1cyBXZXJuZXIg
PGp3ZXJuZXJAY2hyb21pdW0ub3JnPgpAQCAtMjYsMTQgKzI3LDE0IEBAIHByb3BlcnRpZXM6CiAg
IGlvLXdpZHRoOgogICAgIGRlc2NyaXB0aW9uOgogICAgICAgVGhlIG51bWJlciBvZiBEUSBwaW5z
IGluIHRoZSBjaGFubmVsLiBJZiB0aGlzIG51bWJlciBpcyBkaWZmZXJlbnQKLSAgICAgIGZyb20g
KGEgbXVsdGlwbGUgb2YpIHRoZSBpby13aWR0aCBvZiB0aGUgTFBERFIgY2hpcCwgdGhhdCBtZWFu
cyB0aGF0CisgICAgICBmcm9tIChhIG11bHRpcGxlIG9mKSB0aGUgaW8td2lkdGggb2YgdGhlIFNE
UkFNIGNoaXAsIHRoYXQgbWVhbnMgdGhhdAogICAgICAgbXVsdGlwbGUgaW5zdGFuY2VzIG9mIHRo
YXQgdHlwZSBvZiBjaGlwIGFyZSB3aXJlZCBpbiBwYXJhbGxlbCBvbiB0aGlzCiAgICAgICBjaGFu
bmVsICh3aXRoIHRoZSBjaGFubmVsJ3MgRFEgcGlucyBzcGxpdCB1cCBiZXR3ZWVuIHRoZSBkaWZm
ZXJlbnQKICAgICAgIGNoaXBzLCBhbmQgdGhlIENBLCBDUywgZXRjLiBwaW5zIG9mIHRoZSBkaWZm
ZXJlbnQgY2hpcHMgYWxsIHNob3J0ZWQKICAgICAgIHRvZ2V0aGVyKS4gIFRoaXMgbWVhbnMgdGhh
dCB0aGUgdG90YWwgcGh5c2ljYWwgbWVtb3J5IGNvbnRyb2xsZWQgYnkgYQogICAgICAgY2hhbm5l
bCBpcyBlcXVhbCB0byB0aGUgc3VtIG9mIHRoZSBkZW5zaXRpZXMgb2YgZWFjaCByYW5rIG9uIHRo
ZQotICAgICAgY29ubmVjdGVkIExQRERSIGNoaXAsIHRpbWVzIHRoZSBpby13aWR0aCBvZiB0aGUg
Y2hhbm5lbCBkaXZpZGVkIGJ5Ci0gICAgICB0aGUgaW8td2lkdGggb2YgdGhlIExQRERSIGNoaXAu
CisgICAgICBjb25uZWN0ZWQgU0RSQU0gY2hpcCwgdGltZXMgdGhlIGlvLXdpZHRoIG9mIHRoZSBj
aGFubmVsIGRpdmlkZWQgYnkKKyAgICAgIHRoZSBpby13aWR0aCBvZiB0aGUgU0RSQU0gY2hpcC4K
ICAgICBlbnVtOgogICAgICAgLSA4CiAgICAgICAtIDE2CkBAIC01MSw4ICs1Miw4IEBAIHBhdHRl
cm5Qcm9wZXJ0aWVzOgogICAiXnJhbmtAWzAtOV0rJCI6CiAgICAgdHlwZTogb2JqZWN0CiAgICAg
ZGVzY3JpcHRpb246Ci0gICAgICBFYWNoIHBoeXNpY2FsIExQRERSIGNoaXAgbWF5IGhhdmUgb25l
IG9yIG1vcmUgcmFua3MuIFJhbmtzIGFyZQotICAgICAgaW50ZXJuYWwgYnV0IGZ1bGx5IGluZGVw
ZW5kZW50IHN1Yi11bml0cyBvZiB0aGUgY2hpcC4gRWFjaCBMUEREUiBidXMKKyAgICAgIEVhY2gg
cGh5c2ljYWwgU0RSQU0gY2hpcCBtYXkgaGF2ZSBvbmUgb3IgbW9yZSByYW5rcy4gUmFua3MgYXJl
CisgICAgICBpbnRlcm5hbCBidXQgZnVsbHkgaW5kZXBlbmRlbnQgc3ViLXVuaXRzIG9mIHRoZSBj
aGlwLiBFYWNoIFNEUkFNIGJ1cwogICAgICAgdHJhbnNhY3Rpb24gb24gdGhlIGNoYW5uZWwgdGFy
Z2V0cyBleGFjdGx5IG9uZSByYW5rLCBiYXNlZCBvbiB0aGUKICAgICAgIHN0YXRlIG9mIHRoZSBD
UyBwaW5zLiBEaWZmZXJlbnQgcmFua3MgbWF5IGhhdmUgZGlmZmVyZW50IGRlbnNpdGllcyBhbmQK
ICAgICAgIHRpbWluZyByZXF1aXJlbWVudHMuCgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
