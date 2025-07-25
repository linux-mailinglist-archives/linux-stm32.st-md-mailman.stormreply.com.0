Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EEFB11B8F
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 12:07:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB68EC3F92D;
	Fri, 25 Jul 2025 10:07:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCFFBC3089E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 10:07:06 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9Zt5N004176;
 Fri, 25 Jul 2025 12:06:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=PYnqcVVV69CVw0ZAGi9Wfq
 5n5crV4yuPfvvOZOobyKI=; b=bHFTrC2ofFRvQnGbH8UfdLQ94SD8icVrC7ugpI
 47kevTHihohx3j+98VG3SD1hg0EmEKydoYi/96oszfXLzY9qsLpoWEash1rL+AL+
 4GAiFDSPD5QbQ4WEz4rQVZ0iIOkl9nKhtyK64OC5HQJ3l/uhqrIU+asIDoHjaUbw
 nvQohT+lb6vf1DBNst3ma7fhWxbiZ9r08zC2Xiw0HMRE6/6ci3CHfOPKa9B2KKgy
 psZnHQWWLLpBjXD6BNnLCWJwQhSFt42PV6Of510NuK9NuFiDLuExY5YK0UZQoAWn
 tTJqXQHjsYrAegnsaY2rYJUVg73FGkahjtaOX40KK7fLD9Mw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3m2hbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 12:06:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CF1DF40047;
 Fri, 25 Jul 2025 12:05:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC8067A1770;
 Fri, 25 Jul 2025 12:04:25 +0200 (CEST)
Received: from localhost (10.252.19.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:04:25 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 25 Jul 2025 12:03:52 +0200
Message-ID: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIhWg2gC/x3MQQqAIBBA0avErBvQMIOuEi3ExpqFFmOEEN49a
 fkW/7+QSZgyzN0LQg9nPlOD7jvwh0s7IW/NMKhhVFZPuEnEyNljonKjccEo67U3Y4DWXEKBy/9
 b1lo/9H1yOl8AAAA=
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
X-Originating-IP: [10.252.19.90]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 00/12] Enable display support for STM32MP25
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
UmFwaGFlbCBHYWxsYWlzLVBvdSAoMTApOgogICAgICBkdC1iaW5kaW5nczogZGlzcGxheTogc3Q6
IGFkZCBuZXcgY29tcGF0aWJsZSB0byBMVERDIGRldmljZQogICAgICBkdC1iaW5kaW5nczogZGlz
cGxheTogc3Qsc3RtMzItbHRkYzogYWRkIGFjY2Vzcy1jb250cm9sbGVycyBwcm9wZXJ0eQogICAg
ICBkdC1iaW5kaW5nczogZGlzcGxheTogc3Qsc3RtMzJtcDI1LWx2ZHM6IGFkZCBhY2Nlc3MtY29u
dHJvbGxlcnMgcHJvcGVydHkKICAgICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN0LHN0bTMybXAy
NS1sdmRzOiBhZGQgcG93ZXItZG9tYWlucyBwcm9wZXJ0eQogICAgICBkdC1iaW5kaW5nczogYXJt
OiBzdG0zMjogYWRkIHJlcXVpcmVkICNjbG9jay1jZWxscyBwcm9wZXJ0eQogICAgICBhcm02NDog
ZHRzOiBzdDogYWRkIGx0ZGMgc3VwcG9ydCBvbiBzdG0zMm1wMjUxCiAgICAgIGFybTY0OiBkdHM6
IHN0OiBhZGQgbHZkcyBzdXBwb3J0IG9uIHN0bTMybXAyNTUKICAgICAgYXJtNjQ6IGR0czogc3Q6
IGFkZCBjbG9jay1jZWxscyB0byBzeXNjZmcgbm9kZSBvbiBzdG0zMm1wMjUxCiAgICAgIGFybTY0
OiBkdHM6IHN0OiBlbmFibGUgZGlzcGxheSBzdXBwb3J0IG9uIHN0bTMybXAyNTdmLWV2MSBib2Fy
ZAogICAgICBhcm02NDogZHRzOiBzdDogYWRkIGxvb3BiYWNrIGNsb2NrcyBvbiBMVERDIG5vZGUK
Cllhbm5pY2sgRmVydHJlICgyKToKICAgICAgZHJtL3N0bTogbHRkYzogc3VwcG9ydCBuZXcgaGFy
ZHdhcmUgdmVyc2lvbiBmb3IgU1RNMzJNUDI1IFNvQwogICAgICBkcm0vc3RtOiBsdGRjOiBoYW5k
bGUgbHZkcyBwaXhlbCBjbG9jawoKIC4uLi9iaW5kaW5ncy9hcm0vc3RtMzIvc3Qsc3RtMzItc3lz
Y29uLnlhbWwgICAgICAgIHwgMzEgKysrKysrLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbCB8IDQwICsrKysrKysrKy0tCiAuLi4vYmluZGluZ3Mv
ZGlzcGxheS9zdCxzdG0zMm1wMjUtbHZkcy55YW1sICAgICAgICB8ICA2ICsrCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAgICAgICAgICAgICB8IDE5ICsrKysrKwogYXJj
aC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kgICAgICAgICAgICAgfCAxOSArKysr
Ky0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyAgICAgICAgIHwg
NzkgKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxMSArKy0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgNTcgKysrKysrKysrKysrKysrLQogZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKwogOSBmaWxl
cyBjaGFuZ2VkLCAyNDkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNv
bW1pdDogZTQ4MTIzYzYwN2EwZGI4YjlhZDAyZjgzYzhjM2QzOTkxOGRiZGEwNgpjaGFuZ2UtaWQ6
IDIwMjUwNjE3LWRybS1taXNjLW5leHQtNGFmNDA2YzFjNDVmCgpCZXN0IHJlZ2FyZHMsCi0tIApS
YXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
