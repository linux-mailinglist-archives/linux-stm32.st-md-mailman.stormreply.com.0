Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5075A22D2
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 10:20:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5829FC640F6;
	Fri, 26 Aug 2022 08:20:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7757C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 08:20:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q0bUuq002123;
 Fri, 26 Aug 2022 10:20:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iwdNRJes/FHUbLpSzkbIp+P/N5DO2F/eXU20QGD2NMg=;
 b=0KqZ22H/Nhw4+lcjNxGq8zl8VFEYKLeU82wVeZHdysHWCdqk5d8SQpfbwSd+gmo7QeK0
 ZfjLtyzWmtT4jd2uPJNgP0+3T+Lcwrnl5iRqUUR76cecFKKOAGW5PCNFkzJiqT/onLYZ
 laCZclHC9sdco5rMuqS4pVo0w7VC8xiY+h+2LB4K2/3LxrxvhAtfH5Uyih00FRbsxzQz
 ikowau0Yj63JLpAfUFBi3nrO8leWZmz4b8VYF0uYF0AMBCuC8WPBZZ1WXMusd17M6jZL
 K1wP/JT/IgEYLxsPTFKjg88gp5tCJlMAaZE9XUiM6b/5rSvVmBmZu7ZONWVy1nwt0Mvu Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j5h4wmvag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 10:20:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E551F100038;
 Fri, 26 Aug 2022 10:20:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99E59216838;
 Fri, 26 Aug 2022 10:20:18 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 26 Aug
 2022 10:20:18 +0200
Message-ID: <983664cb-ca09-6283-9e5a-8517cb324505@foss.st.com>
Date: Fri, 26 Aug 2022 10:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20220823125517.1232448-1-jagan@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220823125517.1232448-1-jagan@amarulasolutions.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_03,2022-08-25_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Fix typo in license
 text for Engicam boards
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

Hi Jagan

On 8/23/22 14:55, Jagan Teki wrote:
> Fix the Amarula Solutions typo mistake in license text added in below
> commits.
> 
> commit <3ff0810ffc479> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
> C.TOUCH 2.0 10.1" OF")
> commit <6ca2898df59f7> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
> C.TOUCH 2.0")
> commit <adc0496104b64> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
> EDIMM2.2 Starter Kit")
> commit <30f9a9da4ee13> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
> SoM")
> commit <1d278204cbaa1> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
> MicroDev 2.0 7" OF")
> commit <f838dae7afd00> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
> MicroDev 2.0 board")
> commit <0be81dfaeaf89> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
> SoM")
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - s/lisense/license/
> 
>   arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts   | 2 +-
>   arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts        | 2 +-
>   arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts       | 2 +-
>   arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi               | 2 +-
>   .../boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts  | 2 +-
>   arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts | 2 +-
>   arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi            | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)
> 
Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
