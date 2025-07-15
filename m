Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B192B05483
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 10:16:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43947C3F933;
	Tue, 15 Jul 2025 08:16:50 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 909DEC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 08:16:48 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6eaSF008220;
 Tue, 15 Jul 2025 10:16:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dHBf9KIGX9skQDUPGn9m/eAuRafYFNCwT7CcfK1pNpg=; b=GzTnNJo9R2dr9qiG
 dXXiL4QKZ5+6RSkjo1J8110/xGhbC42nGIM+nV0B/3cGYN7BAkzsojekd+W9uNTk
 +CH4862GDkMuP+CJbxswzyFD0F10lPWJ6C9Eyg5hO5TF/4Z3q/VaD0n76ysw5a5v
 2egIirYzKTaXMHZYd3nThIRuw6t/K09U6ghuPPDrW/u5VtfP5+deRJwnrRSR/3sc
 +arH37hRWeez5SfHYQmKmVStYraZaZZcgp8UexB3BJtHpeV6okWlDTywcebeukKi
 rPBmN46kal7qXgHKxnEuHYcT9em4aWlXZSJtU5WoXHBGq9zCzXe0Bo8D6DPdZhV+
 9nl/qQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2nnrvj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 10:16:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9CC8040054;
 Tue, 15 Jul 2025 10:15:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F185EB60F4A;
 Tue, 15 Jul 2025 10:13:54 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 10:13:54 +0200
Message-ID: <7f363c87-01d5-43f7-a15b-844fb5530c5d@foss.st.com>
Date: Tue, 15 Jul 2025 10:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
 <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com>
 <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
 <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 1/8] dt-bindings: pinctrl: stm32:
	Introduce HDP
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

SGkgTGludXMsCgpPbiA3LzExLzI1IDIwOjUxLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9uIEZy
aSwgSnVsIDExLCAyMDI1IGF0IDEwOjA04oCvQU0gQ2xlbWVudCBMRSBHT0ZGSUMKPiA8Y2xlbWVu
dC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gCj4+PiArbWFpbnRhaW5lcnM6Cj4+PiAr
ICAtIENsw6ltZW50IExFIEdPRkZJQyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4K
Pj4gT29wcywgbmVlZCB0byBjaGFuZ2UgdGhlIG1haWwgYWRkcmVzcyBoZXJlIHRvby4KPiAKPiBE
b24ndCB3b3JyeSBJIGZpeGVkIGl0IHdoaWxlIGFwcGx5aW5nIHRoZSBwYXRjaC4KCkNvb2wgdGhh
bmsgeW91IDotKSAhCgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
