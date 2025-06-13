Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911AAD8921
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 12:16:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61505C36B3C;
	Fri, 13 Jun 2025 10:16:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB6A6C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 10:16:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6TVYs004645;
 Fri, 13 Jun 2025 12:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=D6+Z27WjMKMnjNKepyIzix
 r0wCa33K4TQT/u8u13GqU=; b=rAsTWTmr7pLh7CIqwhfI6jjXqO/MgHq0VvP9oM
 g9HCW88TkQ8GOmL+a6w8Qp4mWpWzEwHsNlTuvAehlb2AA2Vf2zE11zs3wWGFsKGl
 dvurqJ7iSGwF9RCRDPjlO5bKOdumZsXFcHObvDyoDalEDpullg/gd1TPiqapvh2o
 Pgp/jzpCzz3ydT7DGFQpd0RDfLtlkApVlzXpUdeTAQLYZHe7ZwnZfxJyC7M+/Qoh
 lYbf8K2esKiBY7s7ZOpSdZiS+/5QW4PsY/81gMT3Npb6/dc4vnNs9ONjcuRW6bz3
 wrwsH/DcQk/Gt+IaJLRPAnfnEPNG4c8gekjqzlQuQZQJ3gyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs356a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jun 2025 12:16:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C602040052;
 Fri, 13 Jun 2025 12:15:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FA932F6D5F;
 Fri, 13 Jun 2025 12:14:17 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:17 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 13 Jun 2025 12:14:11 +0200
Message-ID: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPT5S2gC/23NSw6CMBSF4a2Qji0ptw+pI/dhHJQ+pAOEtEg0h
 L1bSIyADs9Nvv+OKNrgbUSnbETBDj769p4GP2RI1+p+s9ibtBEQ4ASA4dp0+NHFPljVYAFguVE
 FU9KhRLpgnX8uucs17drHvg2vpT4U8/UT4tvQUGCCpSFMasEpJers2hjz2Oe6bdCcGuDLOZAdh
 8Q5daIqK+6cLn85XXO64zTxygitCimZEH++szUvd5wlfrSyosoAocJs+TRNbxUXAFhnAQAA
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-0537a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 0/9] Introduce HDP support for STM32MP
	platforms
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

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyB0aGUgSGFyZHdhcmUgRGVidWcgUG9ydCAoSERQ
KSBzdXBwb3J0IGZvcgpTVE0zMk1QIHBsYXRmb3Jtcy4KCkl0IGluY2x1ZGVzIHVwZGF0ZXMgdG8g
dGhlIG1taW8gZ3BpbyBkcml2ZXIsIHRoZSBhZGRpdGlvbiBvZiBkZXZpY2UgdHJlZQpiaW5kaW5n
cywgdGhlIEhEUCBkcml2ZXIsIGFuZCB1cGRhdGVzIHRvIHRoZSBkZXZpY2UgdHJlZSBmaWxlcyBm
b3IKU1RNMzJNUDEzLCBTVE0zMk1QMTUsCmFuZCBTVE0zMk1QMjUgU29Dcy4KVGhlIHNlcmllcyBh
bHNvIHVwZGF0ZXMgdGhlIE1BSU5UQUlORVJTIGZpbGUgdG8gaW5jbHVkZSBteXNlbGYgYXMgdGhl
Cm1haW50YWluZXIgZm9yIHRoZSBTVE0zMiBIRFAgZHJpdmVyIGFuZCBhZGRzIHRoZSBuZWNlc3Nh
cnkKcGlubXV4IGNvbmZpZ3VyYXRpb25zIGZvciBIRFAgcGlucyBvbiBTVE0zMk1QMTU3Qy1ESzIg
YXMgZXhhbXBsZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5s
ZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjU6Ci0gKEJldHRlcikgQ2hhbmdl
IHRoZSBiaW5kaW5ncyBmaWxlIG5hbWU6CiAgJ3Mvc3Qsc3RtMzItcGluY3RybC1oZHAueWFtbC9z
dCxzdG0zMi1oZHAueWFtbC9nJwotIFJlbW92ZSBLcnp5c3p0b2YgS296bG93c2tpJ3MgJ1Jldmll
d2VkLWJ5JyB0cmFpbGVyIG9uIGJpbmRpbmdzLgotIEFkZCBMaW51cyBXYWxsZWlqJ3MgJ1Jldmll
d2VkLWJ5JyB0cmFpbGVycy4KLSBSZWZpbmUgU29DIGR0c2kgcGF0Y2gncyBjb21taXQgbWVzc2Fn
ZSB0byBleHBsYWluIHRoZSBuZWVkIG9mIGtlZXBpbmcKICB0aGUgSERQIG5vZGUgZGlzYWJsZWQu
Ci0gTGluayB0byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUyOC1oZHAtdXBz
dHJlYW0tdjQtMC03ZTliM2FkMjAzNmRAZm9zcy5zdC5jb20KCkNoYW5nZXMgaW4gdjQ6Ci0gJ3Mv
QWRkL2FkZC9nJyBpbiBNQUlOVEFJTkVSUyBjb21taXQgbWVzc2FnZS4KLSBGaXggdGhlICh3cm9u
Zykgc3RhdHVzIHVwZGF0ZSBmb3IgdGhlIHRoZXJtYWwgbm9kZSBpbiBzdG0zMm1wMTMxLmR0c2kK
ICBmaWxlLgotIERvIG5vdCBlbmFibGUgSERQIGJ5IGRlZmF1bHQgZHVyaW5nIGNvbXBpbGUgdGVz
dGluZy4KLSBDaGFuZ2UgdGhlIGJpbmRpbmdzIGZpbGUgbmFtZToKICAncy9zdCxzdG0zMi1waW5j
dHJsLWhkcC55YW1sL3N0LHN0bTMyLWhkcC55YW1sL2cnCi0gQWRkIEtyenlzenRvZiBLb3psb3dz
a2kncyAnUmV2aWV3ZC1ieScgdHJhaWxlciBvbiBiaW5kaW5ncy4KLSBMaW5rIHRvIHYzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNTIzLWhkcC11cHN0cmVhbS12My0wLWJkNmNhMTk5
NDY2YUBmb3NzLnN0LmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBVc2UgYGJncGlvX2luaXQoKWAgZnVu
Y3Rpb246CiAgICAtIEFkZCBhZGQgcGF0Y2ggdG8gY3JlYXRlIHRoZSBgQkdQSU9GX05PX0lOUFVU
YCBmbGFnIG5lZWRlZCBmb3IgdGhlCiAgICAgYGJncGlvX3NldHVwX2RpcmVjdGlvbigpYCB1c2Vk
IGluIGBiZ3Bpb19pbml0KClgCiAgICAtIFJlbW92ZSBgc3RtMzJfaGRwX2dwaW9fZ2V0YCBhbmQg
YHN0bTMyX2hkcF9ncGlvX3NldGAKLSBVc2UgYHN0YXRpY2AgcG0gb3BzCi0gVXBkYXRlIGJpbmRp
bmdzOgogICAgLSBhZGQgcGF0dGVybiBpbnN0cnVjdGlvbiBmb3IgcGluIHZhbHVlcwogICAgLSBy
ZW1vdmUgZnVuY3Rpb24ncyBtYXhJdGVtcyB0byB1c2UgYGZ1bmN0aW9uOiB0cnVlYAogICAgLSBm
aXggdGhlIGNvbXBhdGlibGUgaW4gdGhlIGV4ZW1wbGVzCi0gTGluayB0byB2MjogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDI1MDUyMC1oZHAtdXBzdHJlYW0tdjItMC01M2Y2YjhiNWZmYzhA
Zm9zcy5zdC5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gUmVtb3ZlIGJpbmRpbmdzIGhlYWRlciBmaWxl
cyB3aXRoIGZ1bmN0aW9uIG5hbWUgYXMgI2RlZmluZQotIEFkZCBtYXRjaF9kYXRhIHdpdGggZnVu
Y3Rpb24gbmFtZSBmb3IgdGhyZWUgY29tcGF0aWJsZToKICAic3Qsc3RtMzJtcDEzMS1oZHAiLCAi
c3Qsc3RtMzJtcDE1MS1oZHAiIGFuZCAic3Qsc3RtMzJtcDI1MS1oZHAiLgotIFJld29yayBhIGJp
dCB0aGUgZHJpdmVyIHRvIHVzZSBtYXRjaF9kYXRhLgotIFJlbW92ZSB0aGUgdXNlIG9mIGBkZXZf
ZXJyX3Byb2JlKGAgaW4gdGhlIHJlc3VtZSBvcHMuCi0gUmVtb3ZlIGBNT0RVTEVfQUxJQVMoYC4K
LSBSZW1vdmUgdGhlIHZlcnRpY2FsIGJhciBpbiBiaW5kaW5ncyBkZXNjcmlwdGlvbiBwYXJhZ3Jh
cGguCi0gRml4IGFuIGVycm9yIGluIHRoZSBgcGluY3RybC0wYCBwYXJhbWV0ZXIgb2YgdGhlIGJp
bmRpbmcgZXhhbXBsZSwgaXQKICB3YXMgcmVmZXJpbmcgYSBub2RlIHRoYXQgd2Fzbid0IGV4aXN0
aW5nLgotIFVzZSB1cHBlcmNhc2UgcGluIG5hbWVzLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNTAyMjUtaGRwLXVwc3RyZWFtLXYxLTAtOWQwNDljNjUzMzBhQGZv
c3Muc3QuY29tCgotLS0KQ2zDqW1lbnQgTGUgR29mZmljICg5KToKICAgICAgZ3BpbzogbW1pbzog
YWRkIEJHUElPRl9OT19JTlBVVCBmbGFnIGZvciBHUE8gZ3Bpb2NoaXAKICAgICAgZHQtYmluZGlu
Z3M6IHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2UgSERQCiAgICAgIHBpbmN0cmw6IHN0bTMyOiBJ
bnRyb2R1Y2UgSERQIGRyaXZlcgogICAgICBNQUlOVEFJTkVSUzogYWRkIENsw6ltZW50IExlIEdv
ZmZpYyBhcyBTVE0zMiBIRFAgbWFpbnRhaW5lcgogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBI
YXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxMwogICAgICBBUk06IGR0czogc3Rt
MzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxNQogICAgICBBUk06
IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAyNQog
ICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBIRFAgcGluIGFu
ZCBhZGQgSERQIHBpbmN0cmwgbm9kZQogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2Fy
ZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxNTdjLWRrMiBib2FyZAoKIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItaGRwLnlhbWwgIHwgMTg3ICsrKysrKwogTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwog
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzMS5kdHNpICAgICAgICAgICAgICAgfCAgIDcg
KwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaSAgICAgICAgfCAg
MjUgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MS5kdHNpICAgICAgICAgICAgICAg
fCAgIDcgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtZGsyLmR0cyAgICAgICAg
ICAgfCAgIDYgKwogYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kgICAgICAg
ICAgICAgfCAgIDcgKwogZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMTEgKy0KIGRyaXZlcnMvcGluY3RybC9zdG0zMi9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgIHwgIDE0ICsKIGRyaXZlcnMvcGluY3RybC9zdG0zMi9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0
bTMyLWhkcC5jICAgICAgICAgIHwgNzIwICsrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9s
aW51eC9ncGlvL2RyaXZlci5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogMTIgZmls
ZXMgY2hhbmdlZCwgOTkxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLS0tCmJhc2UtY29t
bWl0OiAyNGIwMjc3YzFjNTM5Y2Q0MTUzOWQ5Mjk3YmFhZmM2MmRmMDQ0NjRhCmNoYW5nZS1pZDog
MjAyNTAyMjQtaGRwLXVwc3RyZWFtLTYyMmU1ZGExNGE5ZgoKQmVzdCByZWdhcmRzLAotLSAgCkNs
w6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
