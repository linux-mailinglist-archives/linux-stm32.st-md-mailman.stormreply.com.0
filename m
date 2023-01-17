Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2112F66DC2A
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jan 2023 12:20:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2DFAC65E45;
	Tue, 17 Jan 2023 11:20:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1172C65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 11:20:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30H9e8It032650; Tue, 17 Jan 2023 12:20:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Uhl/6ZnzLSC5uEBKCTotjT83reAKyaaW0IgeDaV1PQA=;
 b=bDmYpYBBtMhMF1oA0Pakp6oHR/Dj5n7knQTUJI0gTVvLRBQJP8ZFygyNsCeakq2482rE
 hziTdVg0BC1UvZVlTGe+8Rtw1GijcTwLfv/l2x3I8OCmJLAE7KtvFUWXdiCjxspxsfFx
 7HZlCoi0Nx7a7buLNS3RVrNn/2bH0P0leVcm1tHmVP8FT4NE5KrFLcHUemaJexwAmrgW
 hPgwoT5WK31P38uO1u8gbnv8Sr7rSEwzMv4HjbzPnzCzHOh4CNn7PF0zoU6GYobS86gU
 FfFQUwyh+2TVuFPBKSYmYXXvluSWuLqAxh/GHzYYn4MZsLk+HhnUgViGRr8CcQP1h77r mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n3m5q0dmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:20:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DD0A10002A;
 Tue, 17 Jan 2023 12:20:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A6DE20B222;
 Tue, 17 Jan 2023 12:20:24 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 17 Jan
 2023 12:20:23 +0100
Message-ID: <e27f3293-2d3e-af7d-187e-ec73fa15de02@foss.st.com>
Date: Tue, 17 Jan 2023 12:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20230116115727.1121169-1-amelie.delaunay@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230116115727.1121169-1-amelie.delaunay@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Fix User button on
	stm32mp135f-dk
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQW3DqWxpZQoKT24gMS8xNi8yMyAxMjo1NywgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+IFRo
aXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyBkdGJzX2NoZWNrIHdhcm5pbmcgb24gc3RtMzJt
cDEzNWYtZGs6Cj4gYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzNWYtZGsuZHRiOiBncGlvLWtl
eXM6ICd1c2VyLXBhMTMnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ14oYnV0
dG9ufGV2ZW50fGtleXxzd2l0Y2h8KGJ1dHRvbnxldmVudHxrZXl8c3dpdGNoKS1bYS16MC05LV0r
fFthLXowLTktXSstKGJ1dHRvbnxldmVudHxrZXl8c3dpdGNoKSkkJywgJ3BpbmN0cmwtWzAtOV0r
Jwo+ICBGcm9tIHNjaGVtYTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0
L2dwaW8ta2V5cy55YW1sCj4gCj4gSXQgcmVuYW1lcyB1c2VyLXBhMTMgbm9kZSBpbnRvIGJ1dHRv
bi11c2VyIHNvIHRoYXQgaXQgbWF0Y2hlcyBncGlvLWtleXMKPiBiaW5kaW5ncy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
PiAtLS0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxMzVmLWRrLmR0cyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMKPiBpbmRleCA5ZmY1YTNlYWY1NWIuLjkzMTg3N2Q2
ZGRiOSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMK
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMKPiBAQCAtNDAsNyAr
NDAsNyBAQCBvcHRlZUBkZDAwMDAwMCB7Cj4gICAJZ3Bpby1rZXlzIHsKPiAgIAkJY29tcGF0aWJs
ZSA9ICJncGlvLWtleXMiOwo+ICAgCj4gLQkJdXNlci1wYTEzIHsKPiArCQlidXR0b24tdXNlciB7
Cj4gICAJCQlsYWJlbCA9ICJVc2VyLVBBMTMiOwo+ICAgCQkJbGludXgsY29kZSA9IDxCVE5fMT47
Cj4gICAJCQlncGlvcyA9IDwmZ3Bpb2EgMTMgKEdQSU9fQUNUSVZFX0xPVyB8IEdQSU9fUFVMTF9V
UCk+OwoKClRoYW5rcyBmb3IgdGhlIGNsZWFuaW5nLiBBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpU
aGFua3MuCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
