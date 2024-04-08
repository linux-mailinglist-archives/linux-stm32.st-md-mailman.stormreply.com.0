Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2EC89BAAA
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 10:47:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3C30C6C859;
	Mon,  8 Apr 2024 08:47:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D45CC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 08:47:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4387ZL2J018496; Mon, 8 Apr 2024 10:47:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=TYkH34uMprj1yxX3lrhsXG/hLH2prLf+ZcjW3uXuFz0=; b=lB
 PR9JC2p7c01IdWmLJnsJT9OHGXY5r9aM5KTIA10Am6I2Ihi7Oklace7Gmceesroo
 KSS43gD+w+LyTSUrYnO0tnymt5zelli6Y2kwN216V7GIaT3BLgerkECsFWTRLfeh
 QMMCw7+SXrAydTyls/eFQN4ZHj2lSI43ZujZDp/tau0IC2mHzKnh34T+JQhHOVCy
 M1G5cYRfSFrzn5f3mPMWMFohCrowb0z/mS3SBIXUbNJvmP84d0L1O819jp0gWvUG
 7TO1RE6ZwiKPVWDKqNCMZWIFzTsc5PCAe/6egTlnSgRRBsdIlN9QUg0I9nq7VnND
 9Ab8yhS49ruVTI6bSdKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xawqxnpx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 10:47:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4FE4C40046;
 Mon,  8 Apr 2024 10:46:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E65C02105B8;
 Mon,  8 Apr 2024 10:46:18 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:46:18 +0200
Message-ID: <8b25daf7-2518-42eb-b1a1-857d02d8c3a2@foss.st.com>
Date: Mon, 8 Apr 2024 10:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20240325075635.1382911-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240325075635.1382911-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: move can3 node from
 stm32f746 to stm32f769
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

SGkgRGFyaW8KCk9uIDMvMjUvMjQgMDg6NTYsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEFjY29y
ZGluZyB0byBkb2N1bWVudHMgWzFdLCBbMl0gYW5kIFszXSwgd2UgaGF2ZSAyIENBTiBkZXZpY2Vz
IG9uIHRoZQo+IHN0bTMyZjc0NiBwbGF0Zm9ybSBhbmQgMyBvbiB0aGUgc3RtMzJmNzY5IHBsYXRm
b3JtLiBTbyBsZXQncyBtb3ZlIHRoZQo+IGNhbjMgbm9kZSBmcm9tIHN0bTMyZjc0Ni5kdHNpIHRv
IHN0bTMyZjc2OS5kdHNpLgo+IAo+IFsxXSBodHRwczovL3d3dy5zdC5jb20vZW4vbWljcm9jb250
cm9sbGVycy1taWNyb3Byb2Nlc3NvcnMvc3RtMzJmNy1zZXJpZXMuaHRtbAo+IFsyXSBSTTAzODU6
IFNUTTMyRjc1eHh4IGFuZCBTVE0zMkY3NHh4eCBhZHZhbmNlZCBBcm3Cri1iYXNlZCAzMi1iaXQg
TUNVcwo+IFszXSBSTTA0MTA6IFNUTTMyRjc2eHh4IGFuZCBTVE0zMkY3N3h4eCBhZHZhbmNlZCBB
cm3Cri1iYXNlZCAzMi1iaXQgTUNVcwo+IEZpeGVzOiBkZjM2MjkxNGVlYWQgKCJBUk06IGR0czog
c3RtMzI6IHJlLWFkZCBDQU4gc3VwcG9ydCBvbiBzdG0zMmY3NDYiKQo+IFNpZ25lZC1vZmYtYnk6
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAK
PiAtLS0KPiAKPiAgCgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpDaGVlcnMKQWxleApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
