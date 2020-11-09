Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AACF2AB471
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 11:08:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AF04C3FAE3;
	Mon,  9 Nov 2020 10:08:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A73CEC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 10:08:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9A2V9d010554; Mon, 9 Nov 2020 11:07:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=FPLSmiDPRdoUr1m+ss77hjLUotPubH/KZ4b2fNX41no=;
 b=s7Njn+pOnZ+fmI7U3NXuMOGV3C/YzAFpMhD64WLkRLXR/ZlsyngO816SBJm/IkCpJCQ+
 zd+QEnS1YJk8WFVWjaUbmH9+7AeBS2kbYqqLdJ7CMsHWz+KKNsAh0qyDIF3humKc70u+
 0bQmz8pS9K5JjXasTJgoZQaPUZBhxPj57QpEMGszigIFkD68DJL/Xbz55dFGZsqIZYHJ
 I8EjTG/WlbedmsdDWI2OoZAvtxnkUWL8d3QDp3ufIF30bI0TiydTM4RaFQq9dj5vvBOD
 nm1vZuIlNflEFfG4m0RQ5ZBHDDP1U+OB/ZKVP3LzqFuQtp09b0GflyS+A1YAKPg2RGJ5 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nj80h98e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 11:07:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7091710002A;
 Mon,  9 Nov 2020 11:07:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53B3B233C35;
 Mon,  9 Nov 2020 11:07:59 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 11:07:58 +0100
To: Fabrice Gasnier <fabrice.gasnier@st.com>
References: <1602835229-10903-1-git-send-email-fabrice.gasnier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <fdc3f436-3d06-4e3d-fc51-f484fc58f0e5@st.com>
Date: Mon, 9 Nov 2020 11:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602835229-10903-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_02:2020-11-05,
 2020-11-09 signatures=0
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, vilhelm.gray@gmail.com,
 linux@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: multi_v7_defconfig: enable counter
 subsystem and stm32 counter drivers
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

Hi fabrice

On 10/16/20 10:00 AM, Fabrice Gasnier wrote:
> This enables the counter subsystem and drivers for the stm32 timer and LP
> timer.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>   arch/arm/configs/multi_v7_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index e9e76e3..f052db3 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -1092,6 +1092,9 @@ CONFIG_FSI_MASTER_ASPEED=m
>   CONFIG_FSI_SCOM=m
>   CONFIG_FSI_SBEFIFO=m
>   CONFIG_FSI_OCC=m
> +CONFIG_COUNTER=m
> +CONFIG_STM32_TIMER_CNT=m
> +CONFIG_STM32_LPTIMER_CNT=m
>   CONFIG_EXT4_FS=y
>   CONFIG_AUTOFS4_FS=y
>   CONFIG_MSDOS_FS=y
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
