Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F90B22930
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 15:51:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DAF9C3F93E;
	Tue, 12 Aug 2025 13:51:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7640AC3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 13:51:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDPppH020872;
 Tue, 12 Aug 2025 15:50:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=BzZrYKJ719TbfYyFhu6sPQ
 e5KNJvUX1XlD0RKATByZ4=; b=PmKbGT2TzkhAh88PnD4Anecg5M6xIqDTmv8LQL
 SrWNvir8a1v67es6iyr0qfdyrJlWgbF2zHdRWrjveb4Px4X5xGaVaWEs8pJlpu8t
 GQTPpuZz8lArUDB+AfacacPIoPLiQ1Oz85zdmtJJXSKrMwG6PDeQn9vcuOyjYIQY
 HL8UGlMr8kFwN/+tgOUPPr1ZdxxQ0ptz/1Y5DAKQnnF7YsTxDLz1Zb2qSN92q81j
 svAPuKUi5m0ONvfqTFD9TN+NuZ+8Vg27wMx2RIT8jENHK/ciEYHcVHLqPQTrFa61
 mMsAvX34JMpDtuSL3wyjr0Zi0y/oHwg3p7rZmo7SGtPW5HqQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dwp1tvsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Aug 2025 15:50:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6C6BD40048;
 Tue, 12 Aug 2025 15:49:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C98E37835C8;
 Tue, 12 Aug 2025 15:48:59 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 15:48:59 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 12 Aug 2025 15:48:57 +0200
Message-ID: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAElGm2gC/13MywqDMBCF4VeRWXckCYmXrnyP4kLipM5CUzIiF
 vHdm9pdl/+B8x0glJgE7sUBiTYWjksOcyvAT8PyJOQxNxhlnKp0jWOacWbxuNC+oh2CVZXX3ro
 A+fNKFHi/vEefe2JZY3pf/Ka/60+qjfuTNo0KB9c2tqHK+NB2IYqUspY+ztCf5/kBvG0dVKwAA
 AA=
X-Change-ID: 20250617-drm-misc-next-4af406c1c45f
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 00/13] Enable display support for STM32MP25
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

VGhpcyBzZXJpZXMgYWltcyB0byBhZGQgYW5kIGVuYWJsZSBzdWZmaWNpZW50IExWRFMgZGlzcGxh
eSBzdXBwb3J0IGZvcgpTVE0zMk1QMjU3Ri1FVjEgYm9hcmQuCgpMVkRTIGlzIHRoZSBkZWZhdWx0
IHVzZSBjYXNlIHRvIGRyaXZlIGEgZGlzcGxheSBwYW5lbCBvbiBTVE0zMk1QMjU3Ri1FViwKZXZl
biB0aG91Z2ggRFNJIHBhbmVscyB3aWxsIGJlIHN1cHBvcnRlZCBpbiB0aGUgbmVhciBmdXR1cmUu
CgpUaGUgTFREQyBuZWVkcyBhIHBpeGVsIHJhdGUgaW4gc3luYyB3aXRoIHRoZSBicmlkZ2UgY3Vy
cmVudGx5IGluIHVzZS4KRm9yIHRoYXQgYm90aCBEU0kgYW5kIExWRFMgYnJpZGdlcyBuZWVkIHRv
IGRlY2xhcmUgYW4gaW50ZXJuYWwgY2xvY2sgYW5kCmJlY29tZSBjbG9jayBwcm92aWRlciB0byB0
aGUgbXV4LiBUaGUgbXV4IHRoZW4gc2VsZWN0cyB0aGUgcmVmZXJlbmNlCmNsb2NrIGZvciB0aGUg
TFREQyBwaXhlbCByYXRlIGdlbmVyYXRpb24uCgpGb3Igbm93IHRoaXMgbXV4IGlzIGhhbmRsZWQg
aW50ZXJuYWxseSBpbiB0aGUgTFREQywgd2hpbGUgd2FpdGluZyBmb3IKdGhlIFNUTTMyIGNsb2Nr
IGZyYW1ld29yayB0byBtZXJnZSBhICdjbGstbXV4JyBiYXNlZCBvbiB0aGUgU1lTQ0ZHLgpUaGlz
IGV4cGxhaW5zIHRoZSBsaW5rIGRvbmUgaW4gdGhlIHBhdGNoIFs3LzhdIGJldHdlZW4gdGhlIExW
RFMsCnByb3ZpZGluZyB0aGUgcmVmZXJlbmNlIGNsb2NrIGZvciB0aGUgTFREQyBpbnRlcm5hbHMu
CgogICstLS0tLS0tLS0tKyAgICAgICAgICAgICAgfFwKICB8ICBEU0kgUEhZIHwtLS0tLS0tLS0t
LS0tPnwgXCAgICAgICAgICAgKy0tLS0tLS0tLS0tLSsKICB8ICAgICAgICAgIHxja19kc2lfcGh5
ICAgIHwgIHwgICAgICAgICAgfCAgICAgICAgICAgIHwKICArLS0tLS0tLS0tLSsgICAgICAgICAg
ICAgIHwgIHwtLS0tLS0tLS0+fCAgICBMVERDICAgIHwKICArLS0tLS0tLS0tLSsgICAgICAgICAg
ICAgIHwgIHxwaXhlbF9jbGsgfCAgICAgICAgICAgIHwKICB8IExWRFMgUEhZIHwtLS0tLS0tLS0t
LS0tPnwgIHwgICAgICAgICAgKy0tLS0tLS0tLS0tLSsKICB8ICAgICAgICAgIHxjbGtfcGl4X2x2
ZHMgIHwgIHwKICArLS0tLS0tLS0tLSsgICAgICAgICAgICAgIHwgIHwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIHwKICAgY2tfa2VyX2x0ZGMgLS0tLS0tLS0tLS0tPnwgLwogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfC98CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKU
lC0gU1lTQ0ZHCgpDbG9jayBzZWxlY3Rpb24gYXBwbGllcyBhcyBmb2xsb3c6Ci0gMGIwMDogU2Vs
ZWN0cyBja19kc2lfcGh5Ci0gMGIwMTogU2VsZWN0cyBjbGtfcGl4X2x2ZHMKLSAwYjEwOiBTZWxl
Y3RzIGNrX2tlcl9sdGRjIChmb3IgcGFyYWxsZWwgb3IgRFNJIGRpc3BsYXkpLgotIDBiMTE6IFJl
c2VydmVkCgpUaGUgcmVzZXQgdmFsdWUgb2YgdGhlIHJlZ2lzdGVyIGNvbnRyb2xsaW5nIHRoZSBt
dXggaXMgMGIwMSwgbWVhbmluZwp0aGF0IHRoZSBkZWZhdWx0IGNsb2NrIGFzc2lnbmVkIGlzIHRo
ZSBjbGtfcGl4X2x2ZHMuICBUaGlzIGNhdXNlcyB0d28KdGhpbmdzOgoKLSBJbiBvcmRlciB0byBn
ZXQgYmFzaWMgZGlzcGxheSBvbiB0aGUgTFZEUyBlbmNvZGVyLCBsaWtlIGludGVuZGVkLApub3Ro
aW5nIGhhcyB0byBiZSBkb25lIG9uIHRoaXMgbXV4IHdpdGhpbiB0aGUgTFREQyBkcml2ZXIgKHdo
aWNoIGZvciBub3cKZXhwbGFpbnMgdGhlIHVudXNlZCBzeXNjZmcgcGhhbmRsZSBvbiB0aGUgTFRE
QyBub2RlIGluIHRoZSBkZXZpY2UtdHJlZSkuCgotICdwaXhlbF9jbGsnIGlzIGRlcGVuZGVudCBm
cm9tICdjbGtfcGl4X2x2ZHMnIGJlY2F1c2Ugb2YgdGhlIExUREMgY2xvY2sKZG9tYWlucy4gIFRo
ZXkgYWxzbyBuZWVkIHRvIGJlIHN5bmMgdG8gZ2V0IGEgY29oZXJlbnQgcGl4ZWwgcmF0ZSB0aG91
Z2gKdGhlIGRpc3BsYXkgY2xvY2sgdHJlZSAod2hpY2ggZXhwbGFpbnMgdGhlIExWRFMgcGhhbmRs
ZSBvbiB0aGUgTFREQyBub2RlCmluIHRoZSBkZXZpY2UtdHJlZSkuCgpTaWduZWQtb2ZmLWJ5OiBS
YXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgotLS0K
Q2hhbmdlcyBpbiB2MjoKLSBEb2N1bWVudGF0aW9uOgogIC0gQWRkIHN1cHBvcnQgZm9yIG5ldyBj
b21wYXRpYmxlICJzdCxzdG0zMm1wMjU1LWx2ZHMiCiAgLSBDaGFuZ2UgTFREQyBjb21wYXRpYmxl
IGZvciBTb0MgY29tcGxpYW50IG9uZQogIC0gTWFrZSBjbGVhcmVyIExUREMgY2xvY2stbmFtZXMg
cHJvcGVydHkKLSBEZXZpY2V0cmVlOgogIC0gQ2hhbmdlIGNvbXBhdGlibGUgYWNjb3JkaW5nIHRv
IHRoZSBkb2N1bWVudGF0aW9uCiAgLSBDaGFuZ2UgY2xvY2sgYW5kIGNsb2NrLW5hbWVzIG9yZGVy
IHRvIG1hdGNoIGRvY3VtZW50YXRpb24gKGFuZCBhdm9pZAogICAgd2FybmluZ3MpCi0gRHJpdmVy
czoKICAtIENoYW5nZSBMVERDIGNvbXBhdGlibGUKLSBBZGQgUm9iJ3MgdHJhaWxlciB3aGVyZSBy
ZWxldmFudAotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA3MjUt
ZHJtLW1pc2MtbmV4dC12MS0wLWE1OTg0OGU2MmNmOUBmb3NzLnN0LmNvbQoKLS0tClJhcGhhZWwg
R2FsbGFpcy1Qb3UgKDExKToKICAgICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN0OiBhZGQgbmV3
IGNvbXBhdGlibGUgdG8gTFREQyBkZXZpY2UKICAgICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN0
LHN0bTMyLWx0ZGM6IGFkZCBhY2Nlc3MtY29udHJvbGxlcnMgcHJvcGVydHkKICAgICAgZHQtYmlu
ZGluZ3M6IGRpc3BsYXk6IHN0OiBhZGQgbmV3IGNvbXBhdGlibGUgdG8gTFZEUyBkZXZpY2UKICAg
ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN0LHN0bTMybXAyNS1sdmRzOiBhZGQgYWNjZXNzLWNv
bnRyb2xsZXJzIHByb3BlcnR5CiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzdCxzdG0zMm1w
MjUtbHZkczogYWRkIHBvd2VyLWRvbWFpbnMgcHJvcGVydHkKICAgICAgZHQtYmluZGluZ3M6IGFy
bTogc3RtMzI6IGFkZCByZXF1aXJlZCAjY2xvY2stY2VsbHMgcHJvcGVydHkKICAgICAgYXJtNjQ6
IGR0czogc3Q6IGFkZCBsdGRjIHN1cHBvcnQgb24gc3RtMzJtcDI1MQogICAgICBhcm02NDogZHRz
OiBzdDogYWRkIGx2ZHMgc3VwcG9ydCBvbiBzdG0zMm1wMjU1CiAgICAgIGFybTY0OiBkdHM6IHN0
OiBhZGQgY2xvY2stY2VsbHMgdG8gc3lzY2ZnIG5vZGUgb24gc3RtMzJtcDI1MQogICAgICBhcm02
NDogZHRzOiBzdDogZW5hYmxlIGRpc3BsYXkgc3VwcG9ydCBvbiBzdG0zMm1wMjU3Zi1ldjEgYm9h
cmQKICAgICAgYXJtNjQ6IGR0czogc3Q6IGFkZCBsb29wYmFjayBjbG9ja3Mgb24gTFREQyBub2Rl
CgpZYW5uaWNrIEZlcnRyZSAoMik6CiAgICAgIGRybS9zdG06IGx0ZGM6IHN1cHBvcnQgbmV3IGhh
cmR3YXJlIHZlcnNpb24gZm9yIFNUTTMyTVAyNSBTb0MKICAgICAgZHJtL3N0bTogbHRkYzogaGFu
ZGxlIGx2ZHMgcGl4ZWwgY2xvY2sKCiAuLi4vYmluZGluZ3MvYXJtL3N0bTMyL3N0LHN0bTMyLXN5
c2Nvbi55YW1sICAgICAgICB8IDMxICsrKysrKy0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9zdCxzdG0zMi1sdGRjLnlhbWwgfCAzMyArKysrKysrKy0KIC4uLi9iaW5kaW5ncy9k
aXNwbGF5L3N0LHN0bTMybXAyNS1sdmRzLnlhbWwgICAgICAgIHwgMTQgKysrLQogYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kgICAgICAgICAgICAgfCAxOSArKysrKysKIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1NS5kdHNpICAgICAgICAgICAgIHwgMTkgKysr
KystCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2MS5kdHMgICAgICAgICB8
IDc5ICsrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKystCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8IDU3ICsrKysrKysrKysrKysrKy0KIGRyaXZlcnMv
Z3B1L2RybS9zdG0vbHRkYy5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysKIDkgZmls
ZXMgY2hhbmdlZCwgMjUxIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQotLS0KYmFzZS1j
b21taXQ6IGU0ODEyM2M2MDdhMGRiOGI5YWQwMmY4M2M4YzNkMzk5MThkYmRhMDYKY2hhbmdlLWlk
OiAyMDI1MDYxNy1kcm0tbWlzYy1uZXh0LTRhZjQwNmMxYzQ1ZgoKQmVzdCByZWdhcmRzLAotLSAK
UmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
