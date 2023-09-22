Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E08787AAF6A
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 12:24:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EC7BC6C82F;
	Fri, 22 Sep 2023 10:24:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA967C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 10:24:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38M9fWeK016188; Fri, 22 Sep 2023 12:24:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=UqJ/0RkESiD0yw/aIeUdNcmWDGkVrcs8qhdQomFo5pA=; b=Hm
 lomkGVRBsBjuF1k6+O3g+kLvlTIYUOA4C3C6Hp2RvB+VMlMyWj6FP/Csb/a3Fg++
 qKX0uEmNrjeuMU37zWp6mFBHDe/e+OuOW0++F0oaPXdwu7HNQvM/wHJQRiOv9T+a
 VJjeS/iGJvOu3ibGhltCqJDpEXM8UIuJLHoxRrHbAieJe7tsBdzbk/z75LO2TvG2
 rUv2q+rNgYXA11SRUJU6CLpAfsg17M0d5BSx2A2fscE+AHS9b8hvQDBrHyWaaEmz
 kOzfORETarXX+5vH5XGFpVJdO1p1nxPYixuWMhmiis3dgmtFxtn2ZnjK1/KtmVKN
 zFOkOuF29BrL5z0ql45g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t8tt02y9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 12:24:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AF92100051;
 Fri, 22 Sep 2023 12:24:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B7FB2194F3;
 Fri, 22 Sep 2023 12:24:27 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:24:26 +0200
Message-ID: <10a5fd12-1edd-96d3-caab-a1b3da969ec5@foss.st.com>
Date: Fri, 22 Sep 2023 12:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230919163009.203752-1-olivier.moysan@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230919163009.203752-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_08,2023-09-21_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: add dfsdm & sai pin
 muxings on stm32mp13
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Olivier

On 9/19/23 18:30, Olivier Moysan wrote:
> Add pin muxings for STM32 DFSDM and SAI audio peripherals on STM32MP13
> Disco boards expansion connector.
> 
> Olivier Moysan (2):
>    ARM: dts: stm32: add pins muxing for sai1 on stm32mp13
>    ARM: dts: stm32: add pins muxing for dfsdm on stm32mp13
> 
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 60 +++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 

Why do you push only pins muxing ? I prefer to merge pins when I'm sure 
that they'll be used on a board. In your case, if those pins rely on a 
connector then declare this descriptor (as we did for mp15).

regards
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
