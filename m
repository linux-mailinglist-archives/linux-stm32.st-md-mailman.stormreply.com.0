Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 579DEB01F84
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 16:51:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B6E5C3F939;
	Fri, 11 Jul 2025 14:51:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E67B8C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 14:51:34 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BCHMEO027003;
 Fri, 11 Jul 2025 16:51:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 EUpYSzydPpFuztaOxz5jpPB1qeEDE88vI+GDfXR2JDs=; b=RDp44xPOWxJZY40z
 xycNsFnCPzbrvds0kW9WNedRnbvjMu9DdMo7HZCA/Oe/2ZUB0ifhTB6KiNEKtu5y
 QgMOGjUzgKsMiaiMrOj9wHTiGH261jFmYznzez73rHJZj4kVSvaBuIe9laRuyact
 6C6ODWSg+Nvq4qXwhs+sn8iRp6MyAXT06QfQK6op+dEXqRGrI0nuetmuNQSd3m31
 UY4sZpJ6siIErRzz8xE0r1xQpJPKVDYQ/iPfGEBl3A7lW+GiHhuVWJbKhdo2GYPZ
 p7r0q53Vk4dhRqvNPXhgLG1bQGkpYGhlM6yXcfU+hyH/stzsfp10TSDISScdJ1+O
 PXQqhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfmyt2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 16:51:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22BCD40058;
 Fri, 11 Jul 2025 16:49:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2E19B4BEA4;
 Fri, 11 Jul 2025 16:49:16 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:16 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:48:57 +0200
MIME-Version: 1.0
Message-ID: <20250711-ddrperfm-upstream-v2-5-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
In-Reply-To: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 05/16] dt-bindings: memory: add jedec,
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

SW50cm9kdWNlIGFzIHBlciBqZWRlYyxscGRkclgtY2hhbm5lbCBiaW5kaW5nLCBqZGVjLGRkclsz
LTRdLWNoYW5uZWwKYmluZGluZy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8
Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJz
L2Rkci9qZWRlYyxkZHItY2hhbm5lbC55YW1sICB8IDUzICsrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRy
LWNoYW5uZWwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvZGRyL2plZGVjLGRkci1jaGFubmVsLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4zMWRhYTIyYmNkNGEKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9q
ZWRlYyxkZHItY2hhbm5lbC55YW1sCkBAIC0wLDAgKzEsNTMgQEAKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0K
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVtb3J5LWNvbnRyb2xsZXJzL2Rk
ci9qZWRlYyxkZHItY2hhbm5lbC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBERFIgY2hhbm5lbCB3aXRoIGNoaXAv
cmFuayB0b3BvbG9neSBkZXNjcmlwdGlvbgorCitkZXNjcmlwdGlvbjoKKyAgQSBERFIgY2hhbm5l
bCBpcyBhIGxvZ2ljYWwgZ3JvdXBpbmcgb2YgbWVtb3J5IGNoaXBzIHRoYXQgYXJlIGNvbm5lY3Rl
ZAorICB0byBhIGhvc3Qgc3lzdGVtLiBUaGUgbWFpbiBwdXJwb3NlIG9mIHRoaXMgbm9kZSBpcyB0
byBkZXNjcmliZSB0aGUKKyAgb3ZlcmFsbCBERFIgdG9wb2xvZ3kgb2YgdGhlIHN5c3RlbSwgaW5j
bHVkaW5nIHRoZSBhbW91bnQgb2YgaW5kaXZpZHVhbAorICBERFIgY2hpcHMuCisKK21haW50YWlu
ZXJzOgorICAtIENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gamVkZWMs
ZGRyMy1jaGFubmVsCisgICAgICAtIGplZGVjLGRkcjQtY2hhbm5lbAorCisgIGlvLXdpZHRoOgor
ICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhlIG51bWJlciBvZiBEUSBwaW5zIGluIHRoZSBjaGFu
bmVsLiBJZiB0aGlzIG51bWJlciBpcyBkaWZmZXJlbnQKKyAgICAgIGZyb20gKGEgbXVsdGlwbGUg
b2YpIHRoZSBpby13aWR0aCBvZiB0aGUgRERSIGNoaXAsIHRoYXQgbWVhbnMgdGhhdAorICAgICAg
bXVsdGlwbGUgaW5zdGFuY2VzIG9mIHRoYXQgdHlwZSBvZiBjaGlwIGFyZSB3aXJlZCBpbiBwYXJh
bGxlbCBvbiB0aGlzCisgICAgICBjaGFubmVsICh3aXRoIHRoZSBjaGFubmVsJ3MgRFEgcGlucyBz
cGxpdCB1cCBiZXR3ZWVuIHRoZSBkaWZmZXJlbnQKKyAgICAgIGNoaXBzLCBhbmQgdGhlIENBLCBD
UywgZXRjLiBwaW5zIG9mIHRoZSBkaWZmZXJlbnQgY2hpcHMgYWxsIHNob3J0ZWQKKyAgICAgIHRv
Z2V0aGVyKS4gIFRoaXMgbWVhbnMgdGhhdCB0aGUgdG90YWwgcGh5c2ljYWwgbWVtb3J5IGNvbnRy
b2xsZWQgYnkgYQorICAgICAgY2hhbm5lbCBpcyBlcXVhbCB0byB0aGUgc3VtIG9mIHRoZSBkZW5z
aXRpZXMgb2YgZWFjaCByYW5rIG9uIHRoZQorICAgICAgY29ubmVjdGVkIEREUiBjaGlwLCB0aW1l
cyB0aGUgaW8td2lkdGggb2YgdGhlIGNoYW5uZWwgZGl2aWRlZCBieQorICAgICAgdGhlIGlvLXdp
ZHRoIG9mIHRoZSBERFIgY2hpcC4KKyAgICBlbnVtOgorICAgICAgLSA4CisgICAgICAtIDE2Cisg
ICAgICAtIDMyCisgICAgICAtIDY0CisgICAgICAtIDEyOAorCityZXF1aXJlZDoKKyAgLSBjb21w
YXRpYmxlCisgIC0gaW8td2lkdGgKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4
YW1wbGVzOgorICAtIHwKKyAgICBkZHJfY2hhbm5lbDogZGRyMy1jaGFubmVsIHsKKyAgICAgICAg
Y29tcGF0aWJsZSA9ICJqZWRlYyxkZHIzLWNoYW5uZWwiOworICAgICAgICBpby13aWR0aCA9IDwx
Nj47CisgICAgfTsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
