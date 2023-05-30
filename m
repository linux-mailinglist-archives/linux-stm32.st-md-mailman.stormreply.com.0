Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DA715839
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 10:19:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5A17C6A616;
	Tue, 30 May 2023 08:19:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93846C6A608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 08:19:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U3tvJT017961; Tue, 30 May 2023 10:19:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Dt2qDgO0BJH5VS1WqR/hx20Xk2xMe+9JCiqnd8yB2c4=;
 b=kxmmwhPEmr1VkU9dGGWbG9iC3d1CcqZQsU9WeVrR0KwyhiMR+VXiXs7JlA7XZpxpZVDL
 xT3fgf7uQZD9lN6QL52rK9uFm1r59B1WMzeKlt6n3ZAbNsIHJmc2uIF5Ni63Php42Wgn
 NddmHnMuIRvDOhxQ6ZS9EvUWMFozEjp3K9qQyC7pe8wH5LkQlwdxHdtUPMHsYK9hGtBv
 sakopbXPpvOHaZ+Zj4M1zoIYWRClEPCLzLLbUxk/9Wn4D6QZ7r56TUWSGVVZkrL9Xfdz
 Tjq0j3rLyk/uT67ENQ4ov1ANcUcgKl49a3xYi5tzaDoZ/sL1doPDxxWxG7RCiIXshQ03 EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy689t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 10:19:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2C8610002A;
 Tue, 30 May 2023 10:19:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C683B21513C;
 Tue, 30 May 2023 10:19:20 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 10:19:20 +0200
Message-ID: <df9061ee-dda1-5c46-13b9-0043c3173113@foss.st.com>
Date: Tue, 30 May 2023 10:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marek Vasut <marex@denx.de>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_05,2023-05-29_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/4] STM32 warning cleanup
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

Hi Raphael

On 5/29/23 11:13, Raphael Gallais-Pou wrote:
> This serie aims to reduce the number of device-tree warnings of
> following boards :
> 
>    - STM32F469-DISCO
>    - STM32MP15*
> 
> Those warnings were appearing either during build or when checking
> dt-bindings and concern mostly LTDC and DSI IPs. They were due to the
> following cases:
> 
>    - 'panel-dsi@0' instead of 'panel@0' according to the YAML
>    - unnecessary #address-cells and #size-cells properties
>    - residual 'reg' field on single endpoints
> 
> First patch fixes stm32f469-disco device-tree.
> Second patch fixes st,stm32-dsi.yaml dt-bindings.
> Third patch fixes DSI warnings on stm32mp15* device-trees.
> Last patch fixes LTDC warnings on stm32mp15* device-trees.
> 
> Changes since v3:
> 	* Added Conor's acked-by
> 	* Added Marek's reviewed-by
> 	* Split last patch into two separate for clearer review
> 
> Changes since v2:
> 	* Added changelog
> 	* Enhanced commit descriptions
> 
> Changes since v1:
> 	* Added DSI subnode name change
> 	* Included stm32f469-disco DT in the cleanup
> 	* Included YAML fix to prevent regression
> 
> Raphael Gallais-Pou (4):
>    ARM: dts: stm32: fix warnings on stm32f469-disco board
>    dt-bindings: display: st,stm32-dsi: Remove unnecessary fields
>    ARM: dts: stm32: fix dsi warnings on stm32mp15 boards
>    ARM: dts: stm32: fix ltdc warnings in stm32mp15 boards
> 
>   .../bindings/display/st,stm32-dsi.yaml        |  2 --
>   arch/arm/boot/dts/stm32f469-disco.dts         |  4 ++--
>   arch/arm/boot/dts/stm32mp151.dtsi             |  5 -----
>   arch/arm/boot/dts/stm32mp157.dtsi             |  7 -------
>   arch/arm/boot/dts/stm32mp157a-dk1.dts         | 20 +++++++++++++++++++
>   ...tm32mp157a-icore-stm32mp1-ctouch2-of10.dts |  6 ++++--
>   .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  6 ++++--
>   ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  3 +--
>   arch/arm/boot/dts/stm32mp157c-dk2.dts         |  8 ++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts         | 10 +++++++---
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts     |  3 +--
>   .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  6 +-----
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        | 18 +----------------
>   13 files changed, 49 insertions(+), 49 deletions(-)
> 

Thanks for this series! No more W=1 Warnings and no more YAML issue 
regarding DSI/LTDC stuff. Thanks Marek for reviews and feedback.

Series applied on stm32-next.

Cheers
Alx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
