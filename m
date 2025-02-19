Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E32A3B315
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 09:03:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7470C78F9B;
	Wed, 19 Feb 2025 08:03:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2693CC78F89
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 08:03:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J4sxfG027076;
 Wed, 19 Feb 2025 09:03:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KZ+/BGErvkGjXMrXE43CO+5oKVL7s9ZoG9/n9+xAIPk=; b=VRLkQ2QpjrN4pSAw
 uX7uOKNLAiBhHKQqd8vuqDYHdfxpamzSR9yIJNVe/U/lqnuiDIYfvqlGqi+/0C1p
 gwEx6T+nxNuQd1vRCF39EQnG3imk3VsvydyTNE9nkj49LMFdqgpnTtcyS8a57gNi
 zfVDMv/ZibZI0adusyQ6KBkm0ed1crDY4Z8RvNheJSdHEISz+jy67dqjavfg5K6D
 HWy+dJS+NzG4h8Xe4n7kX3ED7dkfLZe9l/ji5w42CTp5YJSRkxhza0peikGOVB+F
 ZWlh4wkr+Ta0JE1gnzqDK6Ab6pyWl2l6sHNhiAHm5jtHAw6uNx32JD7yRKKm5zr2
 pp+tIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44vyyna8rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 09:03:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AB85D4004A;
 Wed, 19 Feb 2025 09:02:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62FA743E474;
 Wed, 19 Feb 2025 09:01:13 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 09:01:13 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Wed, 19 Feb 2025 09:00:52 +0100
Message-ID: <20250219080059.367045-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250219080059.367045-1-patrice.chotard@foss.st.com>
References: <20250219080059.367045-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/8] dt-bindings: spi: Add STM32 OSPI
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
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiAuLi4vYmluZGluZ3Mvc3BpL3N0LHN0
bTMybXAyNS1vc3BpLnlhbWwgICAgICAgfCAxMDUgKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlhbWwKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAy
NS1vc3BpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0
bTMybXAyNS1vc3BpLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAw
Li41ZjI3NmYyN2RjNGMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlhbWwKQEAgLTAsMCArMSwxMDUgQEAK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
KQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3Bp
L3N0LHN0bTMybXAyNS1vc3BpLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0z
MiBPY3RhbCBTZXJpYWwgUGVyaXBoZXJhbCBJbnRlcmZhY2UgKE9TUEkpCisKK21haW50YWluZXJz
OgorICAtIFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgorCith
bGxPZjoKKyAgLSAkcmVmOiBzcGktY29udHJvbGxlci55YW1sIworCitwcm9wZXJ0aWVzOgorICBj
b21wYXRpYmxlOgorICAgIGNvbnN0OiBzdCxzdG0zMm1wMjUtb3NwaQorCisgIHJlZzoKKyAgICBt
YXhJdGVtczogMQorCisgIG1lbW9yeS1yZWdpb246CisgICAgZGVzY3JpcHRpb246CisgICAgICBN
ZW1vcnkgcmVnaW9uIHRvIGJlIHVzZWQgZm9yIG1lbW9yeS1tYXAgcmVhZCBhY2Nlc3MuCisgICAg
ICBJbiBtZW1vcnktbWFwcGVkIG1vZGUsIHJlYWQgYWNjZXNzIGFyZSBwZXJmb3JtZWQgZnJvbSB0
aGUgbWVtb3J5CisgICAgICBkZXZpY2UgdXNpbmcgdGhlIGRpcmVjdCBtYXBwaW5nLgorICAgIG1h
eEl0ZW1zOiAxCisKKyAgY2xvY2tzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0czoK
KyAgICBtYXhJdGVtczogMQorCisgIHJlc2V0czoKKyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3Jp
cHRpb246IHBoYW5kbGUgdG8gT1NQSSBibG9jayByZXNldAorICAgICAgLSBkZXNjcmlwdGlvbjog
cGhhbmRsZSB0byBkZWxheSBibG9jayByZXNldAorCisgIGRtYXM6CisgICAgbWF4SXRlbXM6IDIK
KworICBkbWEtbmFtZXM6CisgICAgaXRlbXM6CisgICAgICAtIGNvbnN0OiB0eAorICAgICAgLSBj
b25zdDogcngKKworICBzdCxzeXNjZmctZGx5YjoKKyAgICBkZXNjcmlwdGlvbjogY29uZmlndXJl
IE9DVE9TUEkgZGVsYXkgYmxvY2suCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvcGhhbmRsZS1hcnJheQorICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlwdGlvbjog
cGhhbmRsZSB0byBzeXNjZmcKKyAgICAgIC0gZGVzY3JpcHRpb246IHJlZ2lzdGVyIG9mZnNldCB3
aXRoaW4gc3lzY2ZnCisKKyAgYWNjZXNzLWNvbnRyb2xsZXJzOgorICAgIGRlc2NyaXB0aW9uOiBw
aGFuZGxlIHRvIHRoZSByaWZzYyBkZXZpY2UgdG8gY2hlY2sgYWNjZXNzIHJpZ2h0CisgICAgICBh
bmQgaW4gc29tZSBjYXNlcywgYW4gYWRkaXRpb25hbCBwaGFuZGxlIHRvIHRoZSByY2MgZGV2aWNl
IGZvcgorICAgICAgc2VjdXJlIGNsb2NrIGNvbnRyb2wuCisgICAgaXRlbXM6CisgICAgICAtIGRl
c2NyaXB0aW9uOiBwaGFuZGxlIHRvIGJ1cyBjb250cm9sbGVyCisgICAgICAtIGRlc2NyaXB0aW9u
OiBwaGFuZGxlIHRvIGNsb2NrIGNvbnRyb2xsZXIKKyAgICBtaW5JdGVtczogMQorCisgIHBvd2Vy
LWRvbWFpbnM6CisgICAgbWF4SXRlbXM6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQor
ICAtIHJlZworICAtIGNsb2NrcworICAtIGludGVycnVwdHMKKyAgLSBzdCxzeXNjZmctZGx5Ygor
Cit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy5oPgorICAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+CisgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3N0LHN0bTMybXAyNS1yY2MuaD4KKworICAgIHNwaUA0
MDQzMDAwMCB7CisgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1vc3BpIjsKKyAgICAg
IHJlZyA9IDwweDQwNDMwMDAwIDB4NDAwPjsKKyAgICAgIG1lbW9yeS1yZWdpb24gPSA8Jm1tX29z
cGkxPjsKKyAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNjMgSVJRX1RZUEVfTEVWRUxfSElH
SD47CisgICAgICBkbWFzID0gPCZocGRtYSAyIDB4NjIgMHgwMDAwMzEyMSAweDA+LAorICAgICAg
ICAgICAgIDwmaHBkbWEgMiAweDQyIDB4MDAwMDMxMTIgMHgwPjsKKyAgICAgIGRtYS1uYW1lcyA9
ICJ0eCIsICJyeCI7CisgICAgICBjbG9ja3MgPSA8JnNjbWlfY2xrIENLX1NDTUlfT1NQSTE+Owor
ICAgICAgcmVzZXRzID0gPCZzY21pX3Jlc2V0IFJTVF9TQ01JX09TUEkxPiwgPCZzY21pX3Jlc2V0
IFJTVF9TQ01JX09TUEkxRExMPjsKKyAgICAgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwmcmlmc2Mg
NzQ+OworICAgICAgcG93ZXItZG9tYWlucyA9IDwmQ0xVU1RFUl9QRD47CisgICAgICBzdCxzeXNj
ZmctZGx5YiA9IDwmc3lzY2ZnIDB4MTAwMD47CisKKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
OworICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgIGZsYXNoQDAgeworICAgICAgICBj
b21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworICAgICAgICByZWcgPSA8MD47CisgICAgICAg
IHNwaS1yeC1idXMtd2lkdGggPSA8ND47CisgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDEw
ODAwMDAwMD47CisgICAgICB9OworICAgIH07Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
