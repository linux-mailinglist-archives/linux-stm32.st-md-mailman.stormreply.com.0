Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C5A39CB1
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 14:02:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04523C78F96;
	Tue, 18 Feb 2025 13:02:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09D57C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 13:02:33 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ICTPPZ005901;
 Tue, 18 Feb 2025 14:02:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zi9sWfS4AcvcvOsYJDRFzll/+wt+aEfG/kF8n5iSU4w=; b=Z2P8946Z84ttpeId
 dDg8F7SaSx2BZFL7AYXb6FEwIRITKxLspZTEH+W8sS1sL+lHQK8EP/T/pHuTVG+4
 TzzFNbnxa3t4U5rzVgT0+esxnhev8xgBPryBIZRfEa2nhqQmdjjJbVv5AFYcUYPS
 llCrcbR1lf3786G5iW4ychDWYgj0ZZ0Fio6PCnsOvWD9knnYoTgoDnWOlToefbAC
 tp9YKyjlqoKefPPBZeOdQgqVnYOZJwD578Jj7Lcc9F2F+6HDfaMqfcXcTQnhXXv6
 a5Y7m5x4i8xOCDd7hDvhW/nZ2icAphVPuz2cb3BPmwgH6DTsUlptCs1Bz4SIEJVu
 3kxxcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44u5c3t959-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 14:02:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11E4D40046;
 Tue, 18 Feb 2025 14:01:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC532327694;
 Tue, 18 Feb 2025 14:00:03 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 14:00:03 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Tue, 18 Feb 2025 13:59:53 +0100
Message-ID: <20250218130000.87889-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218130000.87889-1-patrice.chotard@foss.st.com>
References: <20250218130000.87889-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_05,2025-02-18_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/8] dt-bindings: spi: Add STM32 OSPI
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
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KLS0tCiAuLi4vYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1v
c3BpLnlhbWwgICAgICAgfCAxMDUgKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTA1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlhbWwKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1v
c3BpLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi41ZjI3NmYy
N2RjNGMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlhbWwKQEAgLTAsMCArMSwxMDUgQEAKKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwg
MS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL3N0LHN0bTMy
bXAyNS1vc3BpLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBPY3RhbCBT
ZXJpYWwgUGVyaXBoZXJhbCBJbnRlcmZhY2UgKE9TUEkpCisKK21haW50YWluZXJzOgorICAtIFBh
dHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgorCithbGxPZjoKKyAg
LSAkcmVmOiBzcGktY29udHJvbGxlci55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxl
OgorICAgIGNvbnN0OiBzdCxzdG0zMm1wMjUtb3NwaQorCisgIHJlZzoKKyAgICBtYXhJdGVtczog
MQorCisgIG1lbW9yeS1yZWdpb246CisgICAgZGVzY3JpcHRpb246CisgICAgICBNZW1vcnkgcmVn
aW9uIHRvIGJlIHVzZWQgZm9yIG1lbW9yeS1tYXAgcmVhZCBhY2Nlc3MuCisgICAgICBJbiBtZW1v
cnktbWFwcGVkIG1vZGUsIHJlYWQgYWNjZXNzIGFyZSBwZXJmb3JtZWQgZnJvbSB0aGUgbWVtb3J5
CisgICAgICBkZXZpY2UgdXNpbmcgdGhlIGRpcmVjdCBtYXBwaW5nLgorICAgIG1heEl0ZW1zOiAx
CisKKyAgY2xvY2tzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0czoKKyAgICBtYXhJ
dGVtczogMQorCisgIHJlc2V0czoKKyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IHBo
YW5kbGUgdG8gT1NQSSBibG9jayByZXNldAorICAgICAgLSBkZXNjcmlwdGlvbjogcGhhbmRsZSB0
byBkZWxheSBibG9jayByZXNldAorCisgIGRtYXM6CisgICAgbWF4SXRlbXM6IDIKKworICBkbWEt
bmFtZXM6CisgICAgaXRlbXM6CisgICAgICAtIGNvbnN0OiB0eAorICAgICAgLSBjb25zdDogcngK
KworICBzdCxzeXNjZmctZGx5YjoKKyAgICBkZXNjcmlwdGlvbjogY29uZmlndXJlIE9DVE9TUEkg
ZGVsYXkgYmxvY2suCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
cGhhbmRsZS1hcnJheQorICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlwdGlvbjogcGhhbmRsZSB0
byBzeXNjZmcKKyAgICAgIC0gZGVzY3JpcHRpb246IHJlZ2lzdGVyIG9mZnNldCB3aXRoaW4gc3lz
Y2ZnCisKKyAgYWNjZXNzLWNvbnRyb2xsZXJzOgorICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRv
IHRoZSByaWZzYyBkZXZpY2UgdG8gY2hlY2sgYWNjZXNzIHJpZ2h0CisgICAgICBhbmQgaW4gc29t
ZSBjYXNlcywgYW4gYWRkaXRpb25hbCBwaGFuZGxlIHRvIHRoZSByY2MgZGV2aWNlIGZvcgorICAg
ICAgc2VjdXJlIGNsb2NrIGNvbnRyb2wuCisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9u
OiBwaGFuZGxlIHRvIGJ1cyBjb250cm9sbGVyCisgICAgICAtIGRlc2NyaXB0aW9uOiBwaGFuZGxl
IHRvIGNsb2NrIGNvbnRyb2xsZXIKKyAgICBtaW5JdGVtczogMQorCisgIHBvd2VyLWRvbWFpbnM6
CisgICAgbWF4SXRlbXM6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZwor
ICAtIGNsb2NrcworICAtIGludGVycnVwdHMKKyAgLSBzdCxzeXNjZmctZGx5YgorCit1bmV2YWx1
YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy5oPgorICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+CisgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL3Jlc2V0L3N0LHN0bTMybXAyNS1yY2MuaD4KKworICAgIHNwaUA0MDQzMDAwMCB7
CisgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1vc3BpIjsKKyAgICAgIHJlZyA9IDww
eDQwNDMwMDAwIDB4NDAwPjsKKyAgICAgIG1lbW9yeS1yZWdpb24gPSA8Jm1tX29zcGkxPjsKKyAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNjMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisgICAg
ICBkbWFzID0gPCZocGRtYSAyIDB4NjIgMHgwMDAwMzEyMSAweDA+LAorICAgICAgICAgICAgIDwm
aHBkbWEgMiAweDQyIDB4MDAwMDMxMTIgMHgwPjsKKyAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJy
eCI7CisgICAgICBjbG9ja3MgPSA8JnNjbWlfY2xrIENLX1NDTUlfT1NQSTE+OworICAgICAgcmVz
ZXRzID0gPCZzY21pX3Jlc2V0IFJTVF9TQ01JX09TUEkxPiwgPCZzY21pX3Jlc2V0IFJTVF9TQ01J
X09TUEkxRExMPjsKKyAgICAgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwmcmlmc2MgNzQ+OworICAg
ICAgcG93ZXItZG9tYWlucyA9IDwmQ0xVU1RFUl9QRD47CisgICAgICBzdCxzeXNjZmctZGx5YiA9
IDwmc3lzY2ZnIDB4MTAwMD47CisKKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAg
I3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgIGZsYXNoQDAgeworICAgICAgICBjb21wYXRpYmxl
ID0gImplZGVjLHNwaS1ub3IiOworICAgICAgICByZWcgPSA8MD47CisgICAgICAgIHNwaS1yeC1i
dXMtd2lkdGggPSA8ND47CisgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDEwODAwMDAwMD47
CisgICAgICB9OworICAgIH07Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
