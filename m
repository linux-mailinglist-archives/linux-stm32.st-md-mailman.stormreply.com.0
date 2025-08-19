Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC0B2BCF5
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 11:18:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E7D8C3F94F;
	Tue, 19 Aug 2025 09:18:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44B5AC3F94F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 09:18:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J8qDub025285;
 Tue, 19 Aug 2025 11:18:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=TSMCk1yDFH3lPaFFkKmXCF
 I60Ou0xHXNT4kfzim/wJM=; b=V2ICSkH2l5jDtZ4y4OUfAboZUXMJUZoE/eOd/m
 KKMe5TapKW7Aee5xHXyDp/7itS8TjmCSD+QhDl71EsMKIYcfsYGIsnli7kJwGrmy
 flpj9nqdWtRb5YdfSTtH6vko4wV0FkMaz3OJZ99ffz0qFltBm7+2EAIah5EAjlbG
 wTeH3Dkgq/3fJMYr/6IrSbxy3/KoHJFHUMJTveikexIUnLoy/2l6Jni/4vHtFx9E
 MjiE2KDbmSra8Vea/m8b8tJipc4aOd7xUQ2GJkETJHYZ1qeCUF34wF5aj07NwCY/
 3wOkLNGathz8vsJOQzL39P7sPey2lIUTIetaccsDIvCWJWHw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jgvf1ug6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Aug 2025 11:18:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C141B40058;
 Tue, 19 Aug 2025 11:16:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C034D717652;
 Tue, 19 Aug 2025 11:15:56 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 11:15:56 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 19 Aug 2025 11:15:53 +0200
Message-ID: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMlApGgC/13MSw6DIBSF4a0YxsXAFRA76j6aDgyPykBpuIbYG
 PdetIOmDs9J/m8l6FJwSK7VSpLLAUOcymguFTFDPz0dDbZsAgwkU7ylNo10DGjo5JaZit4Lpgw
 3QnpSmldyPiyHd3+UPQScY3offOb7+5VakCcpc8poLzsttFNgfHfzEbHGuTZxJLuV4ddrDuceS
 s8b8FYLoRrb/vfbtn0ATYBlVewAAAA=
X-Change-ID: 20250617-drm-misc-next-4af406c1c45f
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 00/13] Enable display support for STM32MP25
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
Q2hhbmdlcyBpbiB2MzoKLSBSZWJhc2VkIG9uIGxhdGVzdCBkcm0tbWlzYy1uZXh0Ci0gRG9jdW1l
bnRhdGlvbjoKICAtIExUREM6IENsYW1wIGNvcnJlY3RseSBtaW4vbWF4SXRlbXMgdmFsdWUKICAt
IExWRFM6IFJlbW92ZSBzZWNvbmQgJ2l0ZW1zJyBrZXl3b3JkCi0gQWRkIEtyenlzenRvZidzIHRy
YWlsZXIgd2hlcmUgcmVsZXZhbnQKLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjUwODEyLWRybS1taXNjLW5leHQtdjItMC0xMzJmZDg0NDYzZDdAZm9zcy5zdC5jb20K
CkNoYW5nZXMgaW4gdjI6Ci0gRG9jdW1lbnRhdGlvbjoKICAtIEFkZCBzdXBwb3J0IGZvciBuZXcg
Y29tcGF0aWJsZSAic3Qsc3RtMzJtcDI1NS1sdmRzIgogIC0gQ2hhbmdlIExUREMgY29tcGF0aWJs
ZSBmb3IgU29DIGNvbXBsaWFudCBvbmUKICAtIE1ha2UgY2xlYXJlciBMVERDIGNsb2NrLW5hbWVz
IHByb3BlcnR5Ci0gRGV2aWNldHJlZToKICAtIENoYW5nZSBjb21wYXRpYmxlIGFjY29yZGluZyB0
byB0aGUgZG9jdW1lbnRhdGlvbgogIC0gQ2hhbmdlIGNsb2NrIGFuZCBjbG9jay1uYW1lcyBvcmRl
ciB0byBtYXRjaCBkb2N1bWVudGF0aW9uIChhbmQgYXZvaWQKICAgIHdhcm5pbmdzKQotIERyaXZl
cnM6CiAgLSBDaGFuZ2UgTFREQyBjb21wYXRpYmxlCi0gQWRkIFJvYidzIHRyYWlsZXIgd2hlcmUg
cmVsZXZhbnQKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNzI1
LWRybS1taXNjLW5leHQtdjEtMC1hNTk4NDhlNjJjZjlAZm9zcy5zdC5jb20KCi0tLQpSYXBoYWVs
IEdhbGxhaXMtUG91ICgxMSk6CiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzdDogYWRkIG5l
dyBjb21wYXRpYmxlIHRvIExUREMgZGV2aWNlCiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBz
dCxzdG0zMi1sdGRjOiBhZGQgYWNjZXNzLWNvbnRyb2xsZXJzIHByb3BlcnR5CiAgICAgIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBzdDogYWRkIG5ldyBjb21wYXRpYmxlIHRvIExWRFMgZGV2aWNlCiAg
ICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzdCxzdG0zMm1wMjUtbHZkczogYWRkIGFjY2Vzcy1j
b250cm9sbGVycyBwcm9wZXJ0eQogICAgICBkdC1iaW5kaW5nczogZGlzcGxheTogc3Qsc3RtMzJt
cDI1LWx2ZHM6IGFkZCBwb3dlci1kb21haW5zIHByb3BlcnR5CiAgICAgIGR0LWJpbmRpbmdzOiBh
cm06IHN0bTMyOiBhZGQgcmVxdWlyZWQgI2Nsb2NrLWNlbGxzIHByb3BlcnR5CiAgICAgIGFybTY0
OiBkdHM6IHN0OiBhZGQgbHRkYyBzdXBwb3J0IG9uIHN0bTMybXAyNTEKICAgICAgYXJtNjQ6IGR0
czogc3Q6IGFkZCBsdmRzIHN1cHBvcnQgb24gc3RtMzJtcDI1NQogICAgICBhcm02NDogZHRzOiBz
dDogYWRkIGNsb2NrLWNlbGxzIHRvIHN5c2NmZyBub2RlIG9uIHN0bTMybXAyNTEKICAgICAgYXJt
NjQ6IGR0czogc3Q6IGVuYWJsZSBkaXNwbGF5IHN1cHBvcnQgb24gc3RtMzJtcDI1N2YtZXYxIGJv
YXJkCiAgICAgIGFybTY0OiBkdHM6IHN0OiBhZGQgbG9vcGJhY2sgY2xvY2tzIG9uIExUREMgbm9k
ZQoKWWFubmljayBGZXJ0cmUgKDIpOgogICAgICBkcm0vc3RtOiBsdGRjOiBzdXBwb3J0IG5ldyBo
YXJkd2FyZSB2ZXJzaW9uIGZvciBTVE0zMk1QMjUgU29DCiAgICAgIGRybS9zdG06IGx0ZGM6IGhh
bmRsZSBsdmRzIHBpeGVsIGNsb2NrCgogLi4uL2JpbmRpbmdzL2FybS9zdG0zMi9zdCxzdG0zMi1z
eXNjb24ueWFtbCAgICAgICAgfCAzMSArKysrKystLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy55YW1sIHwgMzMgKysrKysrKystCiAuLi4vYmluZGluZ3Mv
ZGlzcGxheS9zdCxzdG0zMm1wMjUtbHZkcy55YW1sICAgICAgICB8IDEzICsrKy0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpICAgICAgICAgICAgIHwgMTkgKysrKysrCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTUuZHRzaSAgICAgICAgICAgICB8IDE5ICsr
KysrLQogYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1ldjEuZHRzICAgICAgICAg
fCA3OSArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDExICsrLQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRj
LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA1NyArKysrKysrKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vc3RtL2x0ZGMuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrCiA5IGZp
bGVzIGNoYW5nZWQsIDI1MCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKLS0tCmJhc2Ut
Y29tbWl0OiBjOGNlYTQzNzFlNWVjYTMwY2RhODY2MGFhYmIzMzc3NDdkYWJjNTFkCmNoYW5nZS1p
ZDogMjAyNTA2MTctZHJtLW1pc2MtbmV4dC00YWY0MDZjMWM0NWYKCkJlc3QgcmVnYXJkcywKLS0g
ClJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
