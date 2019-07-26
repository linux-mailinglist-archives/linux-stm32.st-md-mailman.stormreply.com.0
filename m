Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B723376EE8
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2019 18:22:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C93EC16363;
	Fri, 26 Jul 2019 16:22:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4CC0C1635F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2019 16:22:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6QG7fWM014148; Fri, 26 Jul 2019 18:22:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=8uknQWRYc0ctwojlhiO1IFxUbdNNf9KGmiNaqsxedGA=;
 b=hK/jrgE+HR7IWIPUmAZBr74PpQh9KHWaD3+owSOCBUwcODXMOIvjvCjoufdDHeeT85/6
 OihgaQ8odbwYk2ppO6W/SdZNGlcb9CzOOSMN4o7WffzWivV75G6OdFNdO6IvuZl3uHeR
 Rr41uYaC8zctr1fH5ju7K/R7xFrj0S/66Gaahi6frYu8ifvZUEGlroSbovaUpUsDkE57
 f0oPhrkBXfcQn8Yznf/EkKtPFAwosc3J/SwW8QZdjuISmSo/Pjsq6ltMJH/pTBfsXd5x
 lRxyopZIM7SA9l6PFTgFhkyAPj8zpF/UpMb1xHlvGTJZSO1ydKdIkn/fDZgvFXoma2d6 sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tx60abrvn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 26 Jul 2019 18:22:27 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49A0D31;
 Fri, 26 Jul 2019 16:22:26 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B2514FB8;
 Fri, 26 Jul 2019 16:22:26 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 26 Jul
 2019 18:22:25 +0200
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <robh+dt@kernel.org>
References: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <d8bc0f0d-adc6-abd6-f248-94c72b360b00@st.com>
Date: Fri, 26 Jul 2019 18:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_12:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] regulator: add support for the
	STM32 ADC booster
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

Hi Fabrice

On 7/1/19 10:14 AM, Fabrice Gasnier wrote:
> Add support for the 3.3V booster regulator embedded in stm32h7 and stm32mp1
> devices, that can be used to supply ADC analog input switches.
> It's useful to reach full ADC performance when their supply is below 2.7V
> (vdda by default).
> 
> Changes in v2:
> - rebase on top of for-next branch
> 
> Fabrice Gasnier (4):
>    dt-bindings: regulator: add support for the stm32-booster
>    regulator: add support for the stm32-booster
>    ARM: multi_v7_defconfig: enable STM32 booster regulator
>    ARM: dts: stm32: add booster for ADC analog switches on stm32mp157c
> 
>   .../bindings/regulator/st,stm32-booster.txt        |  18 +++
>   arch/arm/boot/dts/stm32mp157c.dtsi                 |   6 +
>   arch/arm/configs/multi_v7_defconfig                |   1 +
>   drivers/regulator/Kconfig                          |  11 ++
>   drivers/regulator/Makefile                         |   1 +
>   drivers/regulator/stm32-booster.c                  | 132 +++++++++++++++++++++
>   6 files changed, 169 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
>   create mode 100644 drivers/regulator/stm32-booster.c
> 

DT patch + config applied in stm32-next.

regards
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
