Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BF6B0DCD9
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 16:06:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC715C3F944;
	Tue, 22 Jul 2025 14:06:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 185D1C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 14:06:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDbY0C026464;
 Tue, 22 Jul 2025 16:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 D6NA/yo32+KJdgbOqI/4qK3ib3wbHYMpUOBfolC25YY=; b=pTmhKY2iLbLB4KON
 IuA8jn88h+Rsr114+Da4dLmzEPnW3buSJmn1S2TsPmklf/KrATVYboO5TAkXfYK1
 5qJrSv3XC7Ob+cyTOGvc786iEEa64N0StvOCDF0oi3M7+1Q4h/G/KUrjGiRUDg+Z
 brX1QeU1TDiw0E/HMuRnoaK1iTRJBBMR6KyUBH8osH54+MvSMU+MIt+CfvGOqPNa
 PhYM+gQLJxqphj/Wv5JXBJsnZ87GqjDOd3R8nHgc7UB6dzzcJ4VSgdSLUOapy9df
 wF9UhjJ2zSFOzXzg6pe/WdQzLpORsdXfCJVqS6CM+aAiVjtMu1Hs55n6a5gpoKNo
 rzUSsQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8pc4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jul 2025 16:06:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A10FA40052;
 Tue, 22 Jul 2025 16:04:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B10D7A31E4;
 Tue, 22 Jul 2025 16:03:54 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 16:03:54 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 22 Jul 2025 16:03:24 +0200
MIME-Version: 1.0
Message-ID: <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>, Julius Werner <jwerner@chromium.org>
X-Mailer: b4 0.15-dev-8018a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR
 channel binding into memory channel
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

TFBERFIgYW5kIEREUiBjaGFubmVscyBleGlzdCBhbmQgc2hhcmUgdGhlIHNhbWUgcHJvcGVydGll
cywgdGhleSBoYXZlIGEKY29tcGF0aWJsZSwgcmFua3MsIGFuZCBhbiBpby13aWR0aC4KClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNv
bT4KLS0tCiAuLi5wZGRyLWNoYW5uZWwueWFtbCA9PiBqZWRlYyxtZW1vcnktY2hhbm5lbC55YW1s
fSB8IDI2ICsrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxscGRkci1jaGFubmVs
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xs
ZXJzL2Rkci9qZWRlYyxtZW1vcnktY2hhbm5lbC55YW1sCnNpbWlsYXJpdHkgaW5kZXggODIlCnJl
bmFtZSBmcm9tIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJv
bGxlcnMvZGRyL2plZGVjLGxwZGRyLWNoYW5uZWwueWFtbApyZW5hbWUgdG8gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsbWVtb3J5
LWNoYW5uZWwueWFtbAppbmRleCAzNGI1YmQxNTNmNjMuLjNiZjNhNjM0NjZlYiAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9k
ZHIvamVkZWMsbHBkZHItY2hhbm5lbC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLG1lbW9yeS1jaGFubmVsLnlh
bWwKQEAgLTEsMTYgKzEsMTYgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQogJVlBTUwgMS4yCiAtLS0KLSRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxscGRkci1jaGFu
bmVsLnlhbWwjCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lbW9yeS1jb250
cm9sbGVycy9kZHIvamVkZWMsbWVtb3J5LWNoYW5uZWwueWFtbCMKICRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwogCi10aXRsZTogTFBERFIgY2hh
bm5lbCB3aXRoIGNoaXAvcmFuayB0b3BvbG9neSBkZXNjcmlwdGlvbgordGl0bGU6IE1lbW9yeSBj
aGFubmVsIHdpdGggY2hpcC9yYW5rIHRvcG9sb2d5IGRlc2NyaXB0aW9uCiAKIGRlc2NyaXB0aW9u
OgotICBBbiBMUEREUiBjaGFubmVsIGlzIGEgY29tcGxldGVseSBpbmRlcGVuZGVudCBzZXQgb2Yg
TFBERFIgcGlucyAoRFEsIENBLCBDUywKLSAgQ0ssIGV0Yy4pIHRoYXQgY29ubmVjdCBvbmUgb3Ig
bW9yZSBMUEREUiBjaGlwcyB0byBhIGhvc3Qgc3lzdGVtLiBUaGUgbWFpbgotICBwdXJwb3NlIG9m
IHRoaXMgbm9kZSBpcyB0byBvdmVyYWxsIExQRERSIHRvcG9sb2d5IG9mIHRoZSBzeXN0ZW0sIGlu
Y2x1ZGluZyB0aGUKLSAgYW1vdW50IG9mIGluZGl2aWR1YWwgTFBERFIgY2hpcHMgYW5kIHRoZSBy
YW5rcyBwZXIgY2hpcC4KKyAgQSBtZW1vcnkgY2hhbm5lbCBpcyBhIGNvbXBsZXRlbHkgaW5kZXBl
bmRlbnQgc2V0IG9mIHBpbnMgKERRLCBDQSwgQ1MsCisgIENLLCBldGMuKSB0aGF0IGNvbm5lY3Qg
b25lIG9yIG1vcmUgbWVtb3J5IGNoaXBzIHRvIGEgaG9zdCBzeXN0ZW0uIFRoZSBtYWluCisgIHB1
cnBvc2Ugb2YgdGhpcyBub2RlIGlzIHRvIG92ZXJhbGwgbWVtb3J5IHRvcG9sb2d5IG9mIHRoZSBz
eXN0ZW0sIGluY2x1ZGluZyB0aGUKKyAgYW1vdW50IG9mIGluZGl2aWR1YWwgbWVtb3J5IGNoaXBz
IGFuZCB0aGUgcmFua3MgcGVyIGNoaXAuCiAKIG1haW50YWluZXJzOgogICAtIEp1bGl1cyBXZXJu
ZXIgPGp3ZXJuZXJAY2hyb21pdW0ub3JnPgpAQCAtMjYsMTQgKzI2LDE0IEBAIHByb3BlcnRpZXM6
CiAgIGlvLXdpZHRoOgogICAgIGRlc2NyaXB0aW9uOgogICAgICAgVGhlIG51bWJlciBvZiBEUSBw
aW5zIGluIHRoZSBjaGFubmVsLiBJZiB0aGlzIG51bWJlciBpcyBkaWZmZXJlbnQKLSAgICAgIGZy
b20gKGEgbXVsdGlwbGUgb2YpIHRoZSBpby13aWR0aCBvZiB0aGUgTFBERFIgY2hpcCwgdGhhdCBt
ZWFucyB0aGF0CisgICAgICBmcm9tIChhIG11bHRpcGxlIG9mKSB0aGUgaW8td2lkdGggb2YgdGhl
IG1lbW9yeSBjaGlwLCB0aGF0IG1lYW5zIHRoYXQKICAgICAgIG11bHRpcGxlIGluc3RhbmNlcyBv
ZiB0aGF0IHR5cGUgb2YgY2hpcCBhcmUgd2lyZWQgaW4gcGFyYWxsZWwgb24gdGhpcwogICAgICAg
Y2hhbm5lbCAod2l0aCB0aGUgY2hhbm5lbCdzIERRIHBpbnMgc3BsaXQgdXAgYmV0d2VlbiB0aGUg
ZGlmZmVyZW50CiAgICAgICBjaGlwcywgYW5kIHRoZSBDQSwgQ1MsIGV0Yy4gcGlucyBvZiB0aGUg
ZGlmZmVyZW50IGNoaXBzIGFsbCBzaG9ydGVkCiAgICAgICB0b2dldGhlcikuICBUaGlzIG1lYW5z
IHRoYXQgdGhlIHRvdGFsIHBoeXNpY2FsIG1lbW9yeSBjb250cm9sbGVkIGJ5IGEKICAgICAgIGNo
YW5uZWwgaXMgZXF1YWwgdG8gdGhlIHN1bSBvZiB0aGUgZGVuc2l0aWVzIG9mIGVhY2ggcmFuayBv
biB0aGUKLSAgICAgIGNvbm5lY3RlZCBMUEREUiBjaGlwLCB0aW1lcyB0aGUgaW8td2lkdGggb2Yg
dGhlIGNoYW5uZWwgZGl2aWRlZCBieQotICAgICAgdGhlIGlvLXdpZHRoIG9mIHRoZSBMUEREUiBj
aGlwLgorICAgICAgY29ubmVjdGVkIG1lbW9yeSBjaGlwLCB0aW1lcyB0aGUgaW8td2lkdGggb2Yg
dGhlIGNoYW5uZWwgZGl2aWRlZCBieQorICAgICAgdGhlIGlvLXdpZHRoIG9mIHRoZSBtZW1vcnkg
Y2hpcC4KICAgICBlbnVtOgogICAgICAgLSA4CiAgICAgICAtIDE2CkBAIC01MSw4ICs1MSw4IEBA
IHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiXnJhbmtAWzAtOV0rJCI6CiAgICAgdHlwZTogb2JqZWN0
CiAgICAgZGVzY3JpcHRpb246Ci0gICAgICBFYWNoIHBoeXNpY2FsIExQRERSIGNoaXAgbWF5IGhh
dmUgb25lIG9yIG1vcmUgcmFua3MuIFJhbmtzIGFyZQotICAgICAgaW50ZXJuYWwgYnV0IGZ1bGx5
IGluZGVwZW5kZW50IHN1Yi11bml0cyBvZiB0aGUgY2hpcC4gRWFjaCBMUEREUiBidXMKKyAgICAg
IEVhY2ggcGh5c2ljYWwgbWVtb3J5IGNoaXAgbWF5IGhhdmUgb25lIG9yIG1vcmUgcmFua3MuIFJh
bmtzIGFyZQorICAgICAgaW50ZXJuYWwgYnV0IGZ1bGx5IGluZGVwZW5kZW50IHN1Yi11bml0cyBv
ZiB0aGUgY2hpcC4gRWFjaCBtZW1vcnkgYnVzCiAgICAgICB0cmFuc2FjdGlvbiBvbiB0aGUgY2hh
bm5lbCB0YXJnZXRzIGV4YWN0bHkgb25lIHJhbmssIGJhc2VkIG9uIHRoZQogICAgICAgc3RhdGUg
b2YgdGhlIENTIHBpbnMuIERpZmZlcmVudCByYW5rcyBtYXkgaGF2ZSBkaWZmZXJlbnQgZGVuc2l0
aWVzIGFuZAogICAgICAgdGltaW5nIHJlcXVpcmVtZW50cy4KQEAgLTEwNyw3ICsxMDcsNyBAQCBh
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6CiAgIC0gfAotICAgIGxwZGRy
LWNoYW5uZWwwIHsKKyAgICBtZW1vcnktY2hhbm5lbDAgewogICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47CiAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKICAgICAgIGNvbXBhdGlibGUgPSAiamVk
ZWMsbHBkZHIzLWNoYW5uZWwiOwpAQCAtMTIyLDcgKzEyMiw3IEBAIGV4YW1wbGVzOgogICAgICAg
fTsKICAgICB9OwogCi0gICAgbHBkZHItY2hhbm5lbDEgeworICAgIG1lbW9yeS1jaGFubmVsMSB7
CiAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICNzaXplLWNlbGxzID0gPDA+Owog
ICAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxscGRkcjQtY2hhbm5lbCI7CgotLSAKMi40My4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
