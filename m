Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF36A76E69
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2019 18:00:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 908EEC32E9F;
	Fri, 26 Jul 2019 16:00:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D5A7C35E19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2019 16:00:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6QFuGIF006272; Fri, 26 Jul 2019 18:00:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Y75BNG+ZG7vXH0PyAhO98l9SHQ/zPoys4fP5bNxiSws=;
 b=xElqh+q7EgccAjNQffkCsqWxvs1nv14CqX4moJ8gnskKJjhmcurLrp+L6KGCmIbqUU+8
 idG0GWPq5KfFQxUHs/pA/fE6LLVPbe7a//MWkqB3C3kuTz85tjREBD/c7kMCXbmU+VDB
 ZC6tyHrW+L6KDVBw1ohv2H7vYRBm05IizZ0hIoVNFb6M+jS+aiJjfX0TQTpcih7j9TTW
 qgnLb3PZdzbMD0Y+9EHvhA/SBUIzrbd4I2DDFeb7ifE2VD2+/+uonT2CbxWm710JcTWu
 +AeFXe3AmdqjLHxLmPQtNZeRXVbkrVWIvDieTT/1KAwarNxxemk09vbJe5BS4jHwJvG7 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tx60abn3e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 26 Jul 2019 18:00:08 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A40D634;
 Fri, 26 Jul 2019 16:00:07 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4EF254F17;
 Fri, 26 Jul 2019 16:00:07 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 26 Jul
 2019 18:00:06 +0200
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <jic23@kernel.org>,
 <robh+dt@kernel.org>
References: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <b91163f5-ad6f-0a22-eb8a-ceb0b0c056c6@st.com>
Date: Fri, 26 Jul 2019 18:00:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_12:, , signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] Add missing vdda-supply to STM32 ADC
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

On 6/19/19 2:29 PM, Fabrice Gasnier wrote:
> Add missing vdda-supply, analog power supply, to STM32 ADC. When vdda is
> an independent supply, it needs to be properly turned on or off to supply
> the ADC.
> This series proposes fixes for the dt-bindings, IIO driver and relevant
> device tree files.
> 
> Fabrice Gasnier (5):
>    dt-bindings: iio: adc: stm32: add missing vdda supply
>    iio: adc: stm32-adc: add missing vdda-supply
>    ARM: dts: stm32: remove fixed regulator unit address on stm32429i-eval
>    ARM: dts: stm32: add missing vdda-supply to adc on stm32429i-eval
>    ARM: dts: stm32: add missing vdda-supply to adc on stm32h743i-eval
> 
>   .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  1 +
>   arch/arm/boot/dts/stm32429i-eval.dts               | 25 +++++++++++-----------
>   arch/arm/boot/dts/stm32h743i-eval.dts              |  1 +
>   drivers/iio/adc/stm32-adc-core.c                   | 21 +++++++++++++++++-
>   4 files changed, 35 insertions(+), 13 deletions(-)
> 

DT patches applied on stm32-next. I plan to add them in my PR for v5.4.
However those patches are marked as "fixes", do you see an issue to only 
send it for v5.4 ?

Regards
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
