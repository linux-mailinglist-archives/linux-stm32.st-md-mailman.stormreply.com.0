Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A864FA205EA
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 09:22:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15F50C78F77;
	Tue, 28 Jan 2025 08:22:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50A92C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 08:21:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S21B39013991;
 Tue, 28 Jan 2025 09:21:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 feDQEg72QVpJ9CVOEroQqgaGzK4obTSQ+cagaGstWic=; b=bBOzCgX+59XUOJkr
 4PiUgzbvENEkx5kTCigQs5XE/i74/RoqikYnqDaa0clSxWgSo8V+AjFYnZfZEK+F
 oFAyx0J/AU8dz+8SS4XlAw7jTzIc2JEOrSfuZTg8CvnTTmKGs6o9JkaLQ1b06of7
 rkj/zjeuBMjNouLBRZdj/k9iEd3ELeFyVtU033ZtjHmJRrEE1SFaNb1AAKpR7fpf
 FeO4lLG0xnFBwS7gLEaAeqIhPNQDW2J4T2l40U60awiFgSb0bHun5fm58A0FtbSu
 TrRr3lFCI7BRwyH1Rr5J5Z+H1lad0/ILC12GWj1OppGb6LCk2p7rI2PHERsY6Z8a
 4NWfqQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44embfs6pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2025 09:21:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2227240053;
 Tue, 28 Jan 2025 09:20:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F10129C5E2;
 Tue, 28 Jan 2025 09:17:43 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 28 Jan
 2025 09:17:42 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Tue, 28 Jan 2025 09:17:23 +0100
Message-ID: <20250128081731.2284457-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI
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
c3BpLnlhbWwgICAgICAgfCAxMDIgKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTAyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlhbWwKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1v
c3BpLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5mMWQ1Mzk0
NDQ2NzMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlhbWwKQEAgLTAsMCArMSwxMDIgQEAKKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwg
MS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL3N0LHN0bTMy
bXAyNS1vc3BpLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBPY3RhbCBT
ZXJpYWwgUGVyaXBoZXJhbCBJbnRlcmZhY2UgKE9TUEkpCisKK21haW50YWluZXJzOgorICAtIFBh
dHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgorCithbGxPZjoKKyAg
LSAkcmVmOiBzcGktY29udHJvbGxlci55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxl
OgorICAgIGNvbnN0OiBzdCxzdG0zMm1wMjUtb3NwaQorCisgIHJlZzoKKyAgICBtYXhJdGVtczog
MQorCisgIG1lbW9yeS1yZWdpb246CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9ja3M6CisgICAg
bWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgcmVzZXRz
OgorICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBPU1BJIGJsb2Nr
IHJlc2V0CisgICAgICAtIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIGRlbGF5IGJsb2NrIHJlc2V0
CisKKyAgZG1hczoKKyAgICBtYXhJdGVtczogMgorCisgIGRtYS1uYW1lczoKKyAgICBpdGVtczoK
KyAgICAgIC0gY29uc3Q6IHR4CisgICAgICAtIGNvbnN0OiByeAorCisgIHN0LHN5c2NmZy1kbHli
OgorICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIHN5c2NvbiBibG9jaworICAgICAgVXNlIHRv
IHNldCB0aGUgT1NQSSBkZWxheSBibG9jayB3aXRoaW4gc3lzY29uIHRvCisgICAgICB0dW5lIHRo
ZSBwaGFzZSBvZiB0aGUgUlggc2FtcGxpbmcgY2xvY2sgKG9yIERRUykgaW4gb3JkZXIKKyAgICAg
IHRvIHNhbXBsZSB0aGUgZGF0YSBpbiB0aGVpciB2YWxpZCB3aW5kb3cgYW5kIHRvCisgICAgICB0
dW5lIHRoZSBwaGFzZSBvZiB0aGUgVFggbGF1bmNoIGNsb2NrIGluIG9yZGVyIHRvIG1lZXQgc2V0
dXAKKyAgICAgIGFuZCBob2xkIGNvbnN0cmFpbnRzIG9mIFRYIHNpZ25hbHMgdmVyc3VzIHRoZSBt
ZW1vcnkgY2xvY2suCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
cGhhbmRsZS1hcnJheQorICAgIGl0ZW1zOgorICAgICAgbWF4SXRlbXM6IDEKKworICBhY2Nlc3Mt
Y29udHJvbGxlcnM6CisgICAgZGVzY3JpcHRpb246IHBoYW5kbGUgdG8gdGhlIHJpZnNjIGRldmlj
ZSB0byBjaGVjayBhY2Nlc3MgcmlnaHQKKyAgICAgIGFuZCBpbiBzb21lIGNhc2VzLCBhbiBhZGRp
dGlvbmFsIHBoYW5kbGUgdG8gdGhlIHJjYyBkZXZpY2UgZm9yCisgICAgICBzZWN1cmUgY2xvY2sg
Y29udHJvbAorICAgIG1pbkl0ZW1zOiAxCisgICAgbWF4SXRlbXM6IDIKKworICBwb3dlci1kb21h
aW5zOgorICAgIG1heEl0ZW1zOiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBy
ZWcKKyAgLSBjbG9ja3MKKyAgLSBpbnRlcnJ1cHRzCisgIC0gc3Qsc3lzY2ZnLWRseWIKKwordW5l
dmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MuaD4KKyAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgorICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9yZXNldC9zdCxzdG0zMm1wMjUtcmNjLmg+CisgICAgc3BpQDQwNDMwMDAw
IHsKKyAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1LW9zcGkiOworICAgICAgcmVnID0g
PDB4NDA0MzAwMDAgMHg0MDA+OworICAgICAgbWVtb3J5LXJlZ2lvbiA9IDwmbW1fb3NwaTE+Owor
ICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKyAg
ICAgIGRtYXMgPSA8JmhwZG1hIDIgMHg2MiAweDAwMDAzMTIxIDB4MD4sCisgICAgICAgICAgICAg
PCZocGRtYSAyIDB4NDIgMHgwMDAwMzExMiAweDA+OworICAgICAgZG1hLW5hbWVzID0gInR4Iiwg
InJ4IjsKKyAgICAgIGNsb2NrcyA9IDwmc2NtaV9jbGsgQ0tfU0NNSV9PU1BJMT47CisgICAgICBy
ZXNldHMgPSA8JnNjbWlfcmVzZXQgUlNUX1NDTUlfT1NQSTE+LCA8JnNjbWlfcmVzZXQgUlNUX1ND
TUlfT1NQSTFETEw+OworICAgICAgYWNjZXNzLWNvbnRyb2xsZXJzID0gPCZyaWZzYyA3ND47Cisg
ICAgICBwb3dlci1kb21haW5zID0gPCZDTFVTVEVSX1BEPjsKKyAgICAgIHN0LHN5c2NmZy1kbHli
ID0gPCZzeXNjZmcgMHgxMDAwPjsKKworICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgZmxhc2hAMCB7CisgICAgICAgIGNvbXBhdGli
bGUgPSAiamVkZWMsc3BpLW5vciI7CisgICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAgc3BpLXJ4
LWJ1cy13aWR0aCA9IDw0PjsKKyAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8MTA4MDAwMDAw
PjsKKyAgICAgIH07CisgICAgfTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
