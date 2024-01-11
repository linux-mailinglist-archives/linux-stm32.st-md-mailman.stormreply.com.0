Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039582B108
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 15:54:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C2DCC6DD74;
	Thu, 11 Jan 2024 14:54:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 589B7C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 14:54:35 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40B9T6ox025702; Thu, 11 Jan 2024 15:54:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=H7nacMDmYTQFWcEFfOVo7GeHgZ5bNpycP6h4lcPT5CA=; b=bZ
 j1tbTVX8q6WE9bFSdKyl9FMmOqENIbFcTlRo+aLUlQKTqNXIe0d5NIh+xZioZcsF
 6LGHsux10lwwDTn8X/kfThmXp/MdOI2OCYSzngx577Dtls9ZbSQimLLQL14dF6od
 myYPVRDPLBASpweYKYFNpjh7nyRPL5IBiazO8+kqqqO2rUdgXbW5AyjLkyX4mXJf
 8aUi2MlrtJSMS1AL9wp7fHrhm3O6ungt+COQlmNn4744uqQOuZi5QBHieAsYjtMe
 G9Ae4rlT510F5Wp/v33HhIUK7KinCHUBsMZ05EzNYcaTOUFSgmmusetnNKL0xeXo
 zvYkzqFRvi7l5Tv1PwoA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vfha4uw06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 15:54:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 657FB10002A;
 Thu, 11 Jan 2024 15:54:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BFF12841E6;
 Thu, 11 Jan 2024 15:54:22 +0100 (CET)
Received: from [10.252.29.122] (10.252.29.122) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Jan
 2024 15:54:19 +0100
Message-ID: <f2933f17-bc28-4c9e-b1d9-b64fdce52a15@foss.st.com>
Date: Thu, 11 Jan 2024 15:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20240111113146.16011-1-dario.binacchi@amarulasolutions.com>
 <20240111113146.16011-4-dario.binacchi@amarulasolutions.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240111113146.16011-4-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.29.122]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 3/5] ARM: dts: stm32: rename mmc_vcard
 to vcc-3v3 on stm32f769-disco
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

Ck9uIDEvMTEvMjQgMTI6MzEsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEluIHRoZSBzY2hlbWF0
aWNzIG9mIGRvY3VtZW50IFVNMjAzMywgdGhlIHBvd2VyIHN1cHBseSBmb3IgdGhlIG1pY3JvIFNE
Cj4gY2FyZCBpcyB0aGUgc2FtZSAzdjMgdm9sdGFnZSB0aGF0IGlzIHVzZWQgdG8gcG93ZXIgb3Ro
ZXIgZGV2aWNlcyBvbiB0aGUKPiBib2FyZC4gQnkgZ2VuZXJhbGl6aW5nIHRoZSBuYW1lIG9mIHRo
ZSB2b2x0YWdlIHJlZ3VsYXRvciwgaXQgY2FuIGJlCj4gcmVmZXJlbmNlZCBieSBvdGhlciBub2Rl
cyBpbiB0aGUgZGV2aWNlIHRyZWUgd2l0aG91dCBjcmVhdGluZwo+IG1pc3VuZGVyc3RhbmRpbmdz
Lgo+Cj4gVGhpcyBwYXRjaCBpcyBwcmVwYXJhdG9yeSBmb3IgZnV0dXJlIGRldmVsb3BtZW50cy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KCkhpIERhcmlvLAoKClJldmlld2VkLWJ5OiBSYXBoYWVsIEdhbGxhaXMt
UG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKClJlZ2FyZHMsCgpSYXBoYcOr
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
