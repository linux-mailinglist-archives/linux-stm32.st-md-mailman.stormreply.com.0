Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF579222F
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Sep 2023 13:37:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12FAAC6B454;
	Tue,  5 Sep 2023 11:37:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25B6DC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Sep 2023 11:37:11 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3858B0Zo026337; Tue, 5 Sep 2023 13:36:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=xTreX0qrOQ8jivX3KmmeTeFgWDwnQFOPBeV+r8cQ//4=; b=zH
 aoKBjbidp/+Kg/QdJ2WI6CrCICt/P9Blwt6/UJ4kFnfyoz7JHFgJmnqHa34/nohK
 wiG7VaavvDoYXgqLgsvvt+V7k8c5eYNDTCTKP+gmdRZ9j9IgEcjl2Rc7VO93NMF+
 f3DcJdcNsZ5KwylR/DDBREF1Q8/k/jCOb1Skr9rRyLvD8NToSf+AMDjuTp+dOTvr
 xfKAH0BCGUcvmQpDNIgsEjzPxbTnf6H/iIzUiGZnl/k9YY8Ah8a6rsyXKvoi7mt+
 iU3OxHmk//hpUMYLVFVK8o9XzkCFq5icXX/QOkhmVI82PMW1xSMHYuXu0aNV3DHj
 p32daEkRh8yxREvNzQgg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3svem0hfxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Sep 2023 13:36:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95AD1100057;
 Tue,  5 Sep 2023 13:36:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84F6D23C685;
 Tue,  5 Sep 2023 13:36:51 +0200 (CEST)
Received: from [10.129.178.32] (10.129.178.32) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 5 Sep
 2023 13:36:50 +0200
Message-ID: <f5abe08e-4dec-1ff0-ccef-9224e3ab7b6b@foss.st.com>
Date: Tue, 5 Sep 2023 13:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230904180341.923038-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230904180341.923038-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.129.178.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: stm32f7-pinctrl: don't
 use multiple blank lines
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

SGkgRGFyaW8KCk9uIDkvNC8yMyAyMDowMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gVGhlIHBh
dGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPgo+IGFyY2gvYXJtL2R0cy9zdG0zMmY3
LXBpbmN0cmwuZHRzaTozODA6IGNoZWNrOiBQbGVhc2UgZG9uJ3QgdXNlIG11bHRpcGxlIGJsYW5r
IGxpbmVzCj4KPiBGaXhlczogYmEyODdkMWEwMTM3ICgiQVJNOiBkdHM6IHN0bTMyOiBhZGQgcGlu
IG1hcCBmb3IgTFREQyBvbiBzdG0zMmY3IikKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2No
aSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgoKUmV2aWV3ZWQtYnk6IFJh
cGhhw6tsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKClJl
Z2FyZHMsCgpSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
