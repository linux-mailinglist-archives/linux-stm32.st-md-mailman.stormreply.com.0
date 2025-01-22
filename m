Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C90A19370
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2025 15:13:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65CBEC78F87;
	Wed, 22 Jan 2025 14:13:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD03DC78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 14:13:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MDrE8j022425;
 Wed, 22 Jan 2025 15:12:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 fbURmtj1w4Bl6POcF1jfZygaVNDn8sfKJtaT7jz7se4=; b=n8DGwPvUTzmgxj+x
 bjxG/lzi5nOm8HC8V/AoMXME5KsstR9V31ZAna/1x7vMaDmcnUewaGTFCTkiVLV2
 tW09RCTmFn60Ec6WotdaueWnMuV7oo6y/IwFwLRBgJiI4UmS6qCcP5a4lYAMHUgk
 EiGl2MfPc+vHYvkkPJ7ynJamTDdSDdJqJVQCAvfZtB+tuh5rBbloUiYyT9RTO8V0
 TM+W49iJkDv/NmllseoWbzSETfNjmcklcOdfggmnz/S/BcJfFQtyvMdg218Bdpyi
 979HvKZwQvzENaYX7PDgxqLJLixni55OUSdKCsY+XwR4XhxPgA4PUN8a0RgkRJFE
 qHlDrA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44awjc17cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2025 15:12:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 81EC540045;
 Wed, 22 Jan 2025 15:11:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DD2B2945B0;
 Wed, 22 Jan 2025 15:10:40 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 22 Jan
 2025 15:10:39 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Wed, 22 Jan 2025 15:10:29 +0100
Message-ID: <20250122141037.953934-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122141037.953934-1-patrice.chotard@foss.st.com>
References: <20250122141037.953934-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/9] dt-bindings: spi: Add STM32 OSPI
	controller
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

RnJvbTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+CgpBZGQg
ZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBTVE0zMiBPU1BJIGNvbnRyb2xsZXIuCgpNYWlu
IGZlYXR1cmVzIG9mIHRoZSBPY3RvLVNQSSBjb250cm9sbGVyIDoKICAtIHN1cHBvcnQgc05PUiAv
IHNOQU5EIC8gSHlwZXJSQU3ihKIgYW5kIEh5cGVyRmxhc2jihKIgZGV2aWNlcy4KICAtIFRocmVl
IGZ1bmN0aW9uYWwgbW9kZXM6IGluZGlyZWN0LCBhdXRvbWF0aWMtc3RhdHVzIHBvbGxpbmcsCiAg
ICBtZW1vcnktbWFwcGVkLgogIC0gVXAgdG8gNCBHYnl0ZXMgb2YgZXh0ZXJuYWwgbWVtb3J5IGNh
biBiZSBhZGRyZXNzZWQgaW4gaW5kaXJlY3QKICAgIG1vZGUgKHBlciBwaHlzaWNhbCBwb3J0IGFu
ZCBwZXIgQ1MpLCBhbmQgdXAgdG8gMjU2IE1ieXRlcyBpbgogICAgbWVtb3J5LW1hcHBlZCBtb2Rl
IChjb21iaW5lZCBmb3IgYm90aCBwaHlzaWNhbCBwb3J0cyBhbmQgcGVyIENTKS4KICAtIFNpbmds
ZS0sIGR1YWwtLCBxdWFkLSwgYW5kIG9jdGFsLVNQSSBjb21tdW5pY2F0aW9uLgogIC0gRHVhbC1x
dWFkIGNvbW11bmljYXRpb24uCiAgLSBTaW5nbGUgZGF0YSByYXRlIChTRFIpIGFuZCBkb3VibGUg
dHJhbnNmZXIgcmF0ZSAoRFRSKS4KICAtIE1heGltdW0gdGFyZ2V0IGZyZXF1ZW5jeSBpcyAxMzMg
TUh6IGZvciBTRFIgYW5kIDEzMyBNSHogZm9yIERUUi4KICAtIERhdGEgc3Ryb2JlIHN1cHBvcnQu
CiAgLSBETUEgY2hhbm5lbCBmb3IgaW5kaXJlY3QgbW9kZS4KICAtIERvdWJsZSBDUyBtYXBwaW5n
IHRoYXQgYWxsb3dzIHR3byBleHRlcm5hbCBmbGFzaCBkZXZpY2VzIHRvIGJlCiAgICBhZGRyZXNz
ZWQgd2l0aCBhIHNpbmdsZSBPQ1RPU1BJIGNvbnRyb2xsZXIgbWFwcGVkIG9uIGEgc2luZ2xlCiAg
ICBPQ1RPU1BJIHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2Uu
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KLS0tCiAuLi4vYmluZGluZ3Mvc3BpL3N0LHN0bTMyLW9zcGku
eWFtbCAgICAgICAgICAgfCAxMDkgKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTA5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMyLW9zcGkueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3Qsc3RtMzItb3NwaS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zdCxzdG0zMi1vc3BpLnlhbWwKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iZjE2MjUyZjg1ZmEKLS0tIC9k
ZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0
bTMyLW9zcGkueWFtbApAQCAtMCwwICsxLDEwOSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zcGkvc3Qsc3RtMzItb3NwaS55YW1sIworJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3Rp
dGxlOiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgT2N0YWwgU2VyaWFsIFBlcmlwaGVyYWwgSW50
ZXJmYWNlIChPU1BJKQorCittYWludGFpbmVyczoKKyAgLSBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KKworYWxsT2Y6CisgIC0gJHJlZjogc3BpLWNvbnRyb2xs
ZXIueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogc3Qsc3Rt
MzJtcDI1LW9zcGkKKworICByZWc6CisgICAgZGVzY3JpcHRpb246IHJlZ2lzdGVycworCisgICIj
YWRkcmVzcy1jZWxscyI6CisgICAgY29uc3Q6IDEKKworICAiI3NpemUtY2VsbHMiOgorICAgIGNv
bnN0OiAwCisKKyAgbWVtb3J5LXJlZ2lvbjoKKyAgICBtYXhJdGVtczogMQorICAgIGRlc2NyaXB0
aW9uOiBQaGFuZGxlIHRvIGEgbm9kZSBkZXNjcmliaW5nIG1lbW9yeS1tYXAgcmVnaW9uIHRvIGJl
IHVzZWQKKworICBjbG9ja3M6CisgICAgbWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAg
IG1heEl0ZW1zOiAxCisKKyAgcmVzZXRzOgorICAgIG1heEl0ZW1zOiAyCisKKyAgZG1hczoKKyAg
ICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IHR4IERNQSBjaGFubmVsCisgICAgICAtIGRl
c2NyaXB0aW9uOiByeCBETUEgY2hhbm5lbAorCisgIGRtYS1uYW1lczoKKyAgICBpdGVtczoKKyAg
ICAgIC0gY29uc3Q6IHR4CisgICAgICAtIGNvbnN0OiByeAorCisgIHN0LHN5c2NmZy1kbHliOgor
ICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBVc2UgdG8gc2V0IHRoZSBPU1BJIGRlbGF5IGJsb2Nr
IHdpdGhpbiBTWVNDRkcgdG86CisgICAgICAgIFR1bmUgdGhlIHBoYXNlIG9mIHRoZSBSWCBzYW1w
bGluZyBjbG9jayAob3IgRFFTKSBpbiBvcmRlcgorICAgICAgICB0byBzYW1wbGUgdGhlIGRhdGEg
aW4gdGhlaXIgdmFsaWQgd2luZG93LgorICAgICAgICBUdW5lIHRoZSBwaGFzZSBvZiB0aGUgVFgg
bGF1bmNoIGNsb2NrIGluIG9yZGVyIHRvIG1lZXQgc2V0dXAKKyAgICAgICAgYW5kIGhvbGQgY29u
c3RyYWludHMgb2YgVFggc2lnbmFscyB2ZXJzdXMgdGhlIG1lbW9yeSBjbG9jay4KKyAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5CisgICAgaXRl
bXM6CisgICAgICBtaW5JdGVtczogMgorICAgICAgbWF4SXRlbXM6IDIKKworICBhY2Nlc3MtY29u
dHJvbGxlcnM6CisgICAgbWluSXRlbXM6IDEKKyAgICBtYXhJdGVtczogMgorCisgIHBvd2VyLWRv
bWFpbnM6CisgICAgbWF4SXRlbXM6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAt
IHJlZworICAtICIjYWRkcmVzcy1jZWxscyIKKyAgLSAiI3NpemUtY2VsbHMiCisgIC0gY2xvY2tz
CisgIC0gaW50ZXJydXB0cworICAtIHN0LHN5c2NmZy1kbHliCisKK3VuZXZhbHVhdGVkUHJvcGVy
dGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLmg+CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
cmVzZXQvc3Qsc3RtMzJtcDI1LXJjYy5oPgorICAgIHNwaUA0MDQzMDAwMCB7CisgICAgICBjb21w
YXRpYmxlID0gInN0LHN0bTMybXAyNS1vc3BpIjsKKyAgICAgIHJlZyA9IDwweDQwNDMwMDAwIDB4
NDAwPjsKKyAgICAgIG1lbW9yeS1yZWdpb24gPSA8Jm1tX29zcGkxPjsKKyAgICAgIGludGVycnVw
dHMgPSA8R0lDX1NQSSAxNjMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisgICAgICBkbWFzID0gPCZo
cGRtYSAyIDB4NjIgMHgwMDAwMzEyMSAweDA+LAorICAgICAgICAgICAgIDwmaHBkbWEgMiAweDQy
IDB4MDAwMDMxMTIgMHgwPjsKKyAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7CisgICAgICBj
bG9ja3MgPSA8JnNjbWlfY2xrIENLX1NDTUlfT1NQSTE+OworICAgICAgcmVzZXRzID0gPCZzY21p
X3Jlc2V0IFJTVF9TQ01JX09TUEkxPiwgPCZzY21pX3Jlc2V0IFJTVF9TQ01JX09TUEkxRExMPjsK
KyAgICAgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwmcmlmc2MgNzQ+OworICAgICAgcG93ZXItZG9t
YWlucyA9IDwmQ0xVU1RFUl9QRD47CisgICAgICBzdCxzeXNjZmctZGx5YiA9IDwmc3lzY2ZnIDB4
MTAwMD47CisKKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgI3NpemUtY2VsbHMg
PSA8MD47CisKKyAgICAgIGZsYXNoQDAgeworICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNw
aS1ub3IiOworICAgICAgICByZWcgPSA8MD47CisgICAgICAgIHNwaS1yeC1idXMtd2lkdGggPSA8
ND47CisgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDEwODAwMDAwMD47CisgICAgICB9Owor
ICAgIH07Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
