Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF2591A44D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 12:49:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5250CC71282;
	Thu, 27 Jun 2024 10:49:53 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65190C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 10:49:46 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RAkHeG009985;
 Thu, 27 Jun 2024 12:49:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 gbAOqMMd/GKKZwl4EkJm54U6+0PC0rBSSFJsic/lrUk=; b=xd3XmK4TKl7wyPkV
 N2Otz8I9a3JYdRjkCeSwp93B6xVmSh+52je5y//zNMhFTqSOUOogN88bfVILxn/f
 Qa/CIlL3XLaI3ZKo2LEIR6QrDqbvis7h1CYY9qPirpQZgEy3JBiumheHsxo3nPVj
 fotenzSFVj/rZT98Ii/WEctGcnStQWZgiRpe2emtUsRLelDMxx1EQGXdv2eFL737
 G4pPZyscaFJ6r36xy5axqikm6arjVH/wyuKoOz5rlOLTwIiCyGVdLBCHNJCVJd1z
 Uc1V6udbjoj0T17viLP1j7F9EDa/aiuKlNE2XHs3Y7yZzY80Dq5Fkw2depVBnLP8
 Mok49w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx9jjjk78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 12:49:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6988B4002D;
 Thu, 27 Jun 2024 12:49:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E3C7216EE6;
 Thu, 27 Jun 2024 12:48:24 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 12:48:23 +0200
Message-ID: <0ab8fe8a-2017-432f-80fc-5c2c381d1fd0@foss.st.com>
Date: Thu, 27 Jun 2024 12:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20240623194954.79988-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240623194954.79988-1-marex@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate rproc mboxes
	and IRQs
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

Hi Marek

On 6/23/24 21:49, Marek Vasut wrote:
> Pull mboxes, mbox-names, interrupt-parent, interrupts properties of the
> m4_rproc into stm32mp151.dtsi to deduplicate multiple copies of the same
> in multiple board files. Worse, those copies were starting to get out of
> sync, so this should prevent any such issues in the future.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp151.dtsi                        | 4 ++++
>   arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi        | 2 --
>   arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi     | 2 --
>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts                    | 4 ----
>   arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi         | 4 ----
>   arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi           | 4 ----
>   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi | 4 ----
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi             | 4 ----
>   arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi             | 4 ----
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi                   | 4 ----
>   arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi                 | 4 ----
>   11 files changed, 4 insertions(+), 36 deletions(-)
> 
...

It is an old story we already discussed in the past:

https://lore.kernel.org/linux-arm-kernel/81f4574d-38c2-21f2-b947-d13e5fc99c60@denx.de/T/#mef3a4050ab4ff181416fe5681f1d5cb9fb744573 


My position remains the same. Those interrupts depends on your 
system/firmware you plan to use. So we give one example in our ST board 
which relies on firmware we load in OpenSTLinux. But it is just an 
example. For example depending the firmware used, the detach could be 
used or not.

So I would prefer to not take it.

Regards
Alex


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
