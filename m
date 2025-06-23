Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62AAE36E7
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 09:32:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79459C32EBF;
	Mon, 23 Jun 2025 07:32:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79386C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 07:32:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N5XHLY031861;
 Mon, 23 Jun 2025 09:32:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=9H1lc3RXGVHF2geyU88kye
 jPbwZf42Tzp+LcwADoOnQ=; b=sNHI+JocG7GuQFGF/zcLKISfCOzxtPok4o7Ltc
 931IDUk1ilDObUqR5IbtIR0/tXDMW8AF0HdXqOquq4jeOS09roGhFhW+eA2v7cy1
 Hm/1cE2hBKmJxFzPVXjPviZyiiuGXhxV7vMhHPhzs4xBz5JyAfQ9Nq1wRIwy13Yb
 ARom9b1U0SCHNmr3hST3a3uwNH5Ta/Jrtz/vDDD1AC9loxQ/3fZD0L9AfH82RoOB
 9L4yZ9LGDSNvK866fPlXqQ5Gkdu268tc5nCBUX0fhgsD3/StyoCw08eNVJxvVTbm
 dd55uHekR1zlZCSCVLGACVv+UObZS8EO3QTPOExW+vTFG2vQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5ner7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jun 2025 09:32:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 08BD340050;
 Mon, 23 Jun 2025 09:31:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF75EB52731;
 Mon, 23 Jun 2025 09:29:40 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 09:29:40 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 09:29:10 +0200
Message-ID: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEYCWWgC/23NQW7DIBCF4atErEsEAzMxXfUeVReYgZpFYgtcq
 1Xku5dEqpI4Xb6Rvn/OosaSYxWvu7Mocck1j6c26GUnwuBPn1FmbluAAlQAVg48ya+pziX6oyS
 AiOy19S6JRqYSU/6+5t4/2h5yncfyc60v+nL9C+FjaNFSScfKukBojPJvaax1X+d9GI/iklrgx
 hHUhkPjaBL1XY8phe6Zm3tuNtw03jMFr52zRP98t/e823Db+CG63ngGZYifOd446e13bJwSU1I
 cEA7hka/r+gvxdvc0pgEAAA==
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Antonio Borneo <antonio.borneo@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/8] Introduce HDP support for STM32MP
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
ZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjY6Ci0gQWRkIEtyenlzenRvZiBL
b3psb3dza2kncyAnUmV2aWV3ZC1ieScgdHJhaWxlciBvbiBiaW5kaW5ncy4KLSBSZW1vdmUgZ3Bp
byBtbWlvIHBhdGNoIGFzIHRha2VuIGJ5IEJhcnRvc3ogR29sYXN6ZXdza2k6CiAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzE3NTAzMTcwMDIzNS44MTU0LjExMDQyOTU2MDAyMTM3MDgyMjI0
LmI0LXR5QGxpbmFyby5vcmcvCi0gTGluayB0byB2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDI1MDYxMy1oZHAtdXBzdHJlYW0tdjUtMC02ZmQ2ZjBkYzUyN2NAZm9zcy5zdC5jb20KCkNo
YW5nZXMgaW4gdjU6Ci0gKEJldHRlcikgQ2hhbmdlIHRoZSBiaW5kaW5ncyBmaWxlIG5hbWU6CiAg
J3Mvc3Qsc3RtMzItcGluY3RybC1oZHAueWFtbC9zdCxzdG0zMi1oZHAueWFtbC9nJwotIFJlbW92
ZSBLcnp5c3p0b2YgS296bG93c2tpJ3MgJ1Jldmlld2VkLWJ5JyB0cmFpbGVyIG9uIGJpbmRpbmdz
LgotIEFkZCBMaW51cyBXYWxsZWlqJ3MgJ1Jldmlld2VkLWJ5JyB0cmFpbGVycy4KLSBSZWZpbmUg
U29DIGR0c2kgcGF0Y2gncyBjb21taXQgbWVzc2FnZSB0byBleHBsYWluIHRoZSBuZWVkIG9mIGtl
ZXBpbmcKICB0aGUgSERQIG5vZGUgZGlzYWJsZWQuCi0gTGluayB0byB2NDogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI1MDUyOC1oZHAtdXBzdHJlYW0tdjQtMC03ZTliM2FkMjAzNmRAZm9z
cy5zdC5jb20KCkNoYW5nZXMgaW4gdjQ6Ci0gJ3MvQWRkL2FkZC9nJyBpbiBNQUlOVEFJTkVSUyBj
b21taXQgbWVzc2FnZS4KLSBGaXggdGhlICh3cm9uZykgc3RhdHVzIHVwZGF0ZSBmb3IgdGhlIHRo
ZXJtYWwgbm9kZSBpbiBzdG0zMm1wMTMxLmR0c2kKICBmaWxlLgotIERvIG5vdCBlbmFibGUgSERQ
IGJ5IGRlZmF1bHQgZHVyaW5nIGNvbXBpbGUgdGVzdGluZy4KLSBDaGFuZ2UgdGhlIGJpbmRpbmdz
IGZpbGUgbmFtZToKICAncy9zdCxzdG0zMi1waW5jdHJsLWhkcC55YW1sL3N0LHN0bTMyLWhkcC55
YW1sL2cnCi0gQWRkIEtyenlzenRvZiBLb3psb3dza2kncyAnUmV2aWV3ZC1ieScgdHJhaWxlciBv
biBiaW5kaW5ncy4KLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUw
NTIzLWhkcC11cHN0cmVhbS12My0wLWJkNmNhMTk5NDY2YUBmb3NzLnN0LmNvbQoKQ2hhbmdlcyBp
biB2MzoKLSBVc2UgYGJncGlvX2luaXQoKWAgZnVuY3Rpb246CiAgICAtIEFkZCBhZGQgcGF0Y2gg
dG8gY3JlYXRlIHRoZSBgQkdQSU9GX05PX0lOUFVUYCBmbGFnIG5lZWRlZCBmb3IgdGhlCiAgICAg
YGJncGlvX3NldHVwX2RpcmVjdGlvbigpYCB1c2VkIGluIGBiZ3Bpb19pbml0KClgCiAgICAtIFJl
bW92ZSBgc3RtMzJfaGRwX2dwaW9fZ2V0YCBhbmQgYHN0bTMyX2hkcF9ncGlvX3NldGAKLSBVc2Ug
YHN0YXRpY2AgcG0gb3BzCi0gVXBkYXRlIGJpbmRpbmdzOgogICAgLSBhZGQgcGF0dGVybiBpbnN0
cnVjdGlvbiBmb3IgcGluIHZhbHVlcwogICAgLSByZW1vdmUgZnVuY3Rpb24ncyBtYXhJdGVtcyB0
byB1c2UgYGZ1bmN0aW9uOiB0cnVlYAogICAgLSBmaXggdGhlIGNvbXBhdGlibGUgaW4gdGhlIGV4
ZW1wbGVzCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUyMC1o
ZHAtdXBzdHJlYW0tdjItMC01M2Y2YjhiNWZmYzhAZm9zcy5zdC5jb20KCkNoYW5nZXMgaW4gdjI6
Ci0gUmVtb3ZlIGJpbmRpbmdzIGhlYWRlciBmaWxlcyB3aXRoIGZ1bmN0aW9uIG5hbWUgYXMgI2Rl
ZmluZQotIEFkZCBtYXRjaF9kYXRhIHdpdGggZnVuY3Rpb24gbmFtZSBmb3IgdGhyZWUgY29tcGF0
aWJsZToKICAic3Qsc3RtMzJtcDEzMS1oZHAiLCAic3Qsc3RtMzJtcDE1MS1oZHAiIGFuZCAic3Qs
c3RtMzJtcDI1MS1oZHAiLgotIFJld29yayBhIGJpdCB0aGUgZHJpdmVyIHRvIHVzZSBtYXRjaF9k
YXRhLgotIFJlbW92ZSB0aGUgdXNlIG9mIGBkZXZfZXJyX3Byb2JlKGAgaW4gdGhlIHJlc3VtZSBv
cHMuCi0gUmVtb3ZlIGBNT0RVTEVfQUxJQVMoYC4KLSBSZW1vdmUgdGhlIHZlcnRpY2FsIGJhciBp
biBiaW5kaW5ncyBkZXNjcmlwdGlvbiBwYXJhZ3JhcGguCi0gRml4IGFuIGVycm9yIGluIHRoZSBg
cGluY3RybC0wYCBwYXJhbWV0ZXIgb2YgdGhlIGJpbmRpbmcgZXhhbXBsZSwgaXQKICB3YXMgcmVm
ZXJpbmcgYSBub2RlIHRoYXQgd2Fzbid0IGV4aXN0aW5nLgotIFVzZSB1cHBlcmNhc2UgcGluIG5h
bWVzLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAyMjUtaGRw
LXVwc3RyZWFtLXYxLTAtOWQwNDljNjUzMzBhQGZvc3Muc3QuY29tCgotLS0KQ2zDqW1lbnQgTGUg
R29mZmljICg4KToKICAgICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2Ug
SERQCiAgICAgIHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2UgSERQIGRyaXZlcgogICAgICBNQUlO
VEFJTkVSUzogYWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0zMiBIRFAgbWFpbnRhaW5lcgog
ICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0
bTMybXAxMwogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChI
RFApIG9uIHN0bTMybXAxNQogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1
ZyBwb3J0IChIRFApIG9uIHN0bTMybXAyNQogICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBhbHRl
cm5hdGUgcGlubXV4IGZvciBIRFAgcGluIGFuZCBhZGQgSERQIHBpbmN0cmwgbm9kZQogICAgICBB
Uk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAx
NTdjLWRrMiBib2FyZAoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzIt
aGRwLnlhbWwgIHwgMTg3ICsrKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDYgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEz
MS5kdHNpICAgICAgICAgICAgICAgfCAgIDcgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJt
cDE1LXBpbmN0cmwuZHRzaSAgICAgICAgfCAgMjUgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJtcDE1MS5kdHNpICAgICAgICAgICAgICAgfCAgIDcgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1N2MtZGsyLmR0cyAgICAgICAgICAgfCAgIDYgKwogYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kgICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9waW5jdHJs
L3N0bTMyL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKwogZHJpdmVycy9waW5j
dHJsL3N0bTMyL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9w
aW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMgICAgICAgICAgfCA3MjAgKysrKysrKysr
KysrKysrKysrKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCA5ODAgaW5zZXJ0aW9ucygrKQotLS0KYmFz
ZS1jb21taXQ6IGNjNDI4NjBiODc4OWYzYWFjNGU0MmNjMjIzZjhlODMyNWEzY2ZhMzMKY2hhbmdl
LWlkOiAyMDI1MDIyNC1oZHAtdXBzdHJlYW0tNjIyZTVkYTE0YTlmCgpCZXN0IHJlZ2FyZHMsCi0t
IApDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
