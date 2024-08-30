Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 246649663C2
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 16:09:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD3D4C6B45B;
	Fri, 30 Aug 2024 14:09:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 747B2CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 14:09:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UCXIK2000780;
 Fri, 30 Aug 2024 16:08:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 q89NqSKTjel4CPwEWPxv9YmdnbhHoK/5N0GdARaXWxY=; b=trdoE/6LmGgmf0vl
 nmxd+beSSPda8eGoveHUU6tkUC3x3yi91yf/QfbudxQdeIg7pMNMCY7J5iyUtfJY
 yAQpbeZN5GBh4cAmMbgj7lqm5oA5+cWAS84ROmbUf+9wedKm97skTUBjj7M0Jv0v
 vEl5QSNZgmDcJT57H8JC6TLFz3GkAZJ5vtoDB3AMtpi0oY9TsxY66bW/rh6GjGpR
 vf3Kp9nt7WudAjjcP7mwEp8LTF6eR6nQMRxvM1ji3mFRxxX1w6+e2eSZkdIy+ffV
 IiUHSrAw75mQJCMlasZ9uigHhH7Z2ybtE1YeAQXdJqBcijdVfrHLdB5A44nWgKyl
 ZwW5ZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41b14uk949-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 16:08:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1F45440044;
 Fri, 30 Aug 2024 16:08:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EDE5426E530;
 Fri, 30 Aug 2024 16:07:45 +0200 (CEST)
Received: from [10.252.12.18] (10.252.12.18) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 16:07:45 +0200
Message-ID: <8c56f13a-35a1-4dc5-8b3a-18251879c776@foss.st.com>
Date: Fri, 30 Aug 2024 16:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20240705215402.257070-1-marex@denx.de>
 <e38b8da5-349d-4ee2-97d4-9c46c116120c@foss.st.com>
 <b2bb5061-01e0-4f47-877b-edccedcf1aef@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <b2bb5061-01e0-4f47-877b-edccedcf1aef@denx.de>
X-Originating-IP: [10.252.12.18]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_08,2024-08-30_01,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Describe PHY LEDs in DH
 STM32MP13xx DHCOR DHSBC board DT
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

CgpPbiA4LzMwLzI0IDE0OjU3LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA4LzMwLzI0IDI6NDcg
UE0sIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+IEhpIE1hcmVrCj4gCj4gSGksCj4gCj4+IEkg
aGF2ZSBhIHlhbWwgdmFsaWRhdGlvbiBpc3N1ZSBhcHBseWluZyB0aGlzIHBhdGNoLgo+Pgo+PiDC
oMKgIERUQ19DSEsgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMu
ZHRiCj4+IC9sb2NhbC9ob21lL2ZycTA4Njc4L1NUTElOVVgva2VybmVsL215LWtlcm5lbC9zdG0z
Mi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kaGNvci1kaHNiYy5kdGI6IGV0aGVy
bmV0LXBoeUAxOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ2ludGVy
cnVwdC1wYXJlbnQnLCAnaW50ZXJydXB0cycsICdyZWcnLCAncmVzZXQtYXNzZXJ0LXVzJywgJ3Jl
c2V0LWRlYXNzZXJ0LXVzJywgJ3Jlc2V0LWdwaW9zJyB3ZXJlIHVuZXhwZWN0ZWQpCj4+IMKgwqDC
oMKgwqBmcm9tIHNjaGVtYSAkaWQ6IAo+PiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9u
ZXQvcmVhbHRlayxydGw4Mnh4LnlhbWwjCj4+IC9sb2NhbC9ob21lL2ZycTA4Njc4L1NUTElOVVgv
a2VybmVsL215LWtlcm5lbC9zdG0zMi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1k
aGNvci1kaHNiYy5kdGI6IGV0aGVybmV0LXBoeUAxOiBsZWRzOmxlZEAwOmxpbnV4LGRlZmF1bHQt
dHJpZ2dlcjogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgo+
PiDCoMKgwqDCoMKgJ25ldGRldicgaXMgbm90IG9uZSBvZiBbJ2JhY2tsaWdodCcsICdkZWZhdWx0
LW9uJywgJ2hlYXJ0YmVhdCcsIAo+PiAnZGlzay1hY3Rpdml0eScsICdkaXNrLXJlYWQnLCAnZGlz
ay13cml0ZScsICd0aW1lcicsICdwYXR0ZXJuJywgCj4+ICdhdWRpby1taWNtdXRlJywgJ2F1ZGlv
LW11dGUnLCAnYmx1ZXRvb3RoLXBvd2VyJywgJ2ZsYXNoJywgCj4+ICdrYmQtY2Fwc2xvY2snLCAn
bXRkJywgJ25hbmQtZGlzaycsICdub25lJywgJ3RvcmNoJywgJ3VzYi1nYWRnZXQnLCAKPj4gJ3Vz
Yi1ob3N0JywgJ3VzYnBvcnQnXQo+PiDCoMKgwqDCoMKgJ25ldGRldicgZG9lcyBub3QgbWF0Y2gg
J15jcHVbMC05XSokJwo+PiDCoMKgwqDCoMKgJ25ldGRldicgZG9lcyBub3QgbWF0Y2ggJ15oY2lb
MC05XSstcAo+Pgo+PiBDYW4geW91IGhhdmUgYSBsb29rIHBsZWFzZSA/Cj4gCj4gU2VlIHRoaXMg
Y29tbWl0IGluIGxpbnV4LW5leHQsIHdpdGggdGhhdCB0aGUgdmFsaWRhdGlvbiBzaG91bGQgcGFz
czoKPiAKPiA2MTZkYmVkNjU0ODUgKCJkdC1iaW5kaW5nczogbGVkczogRG9jdW1lbnQgIm5ldGRl
diIgdHJpZ2dlciIpCgpUaGFua3MgTWFyZWsgISEKCkFwcGxpZWQgb24gc3RtMzItbmV4dC4KCkNo
ZWVycwpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
