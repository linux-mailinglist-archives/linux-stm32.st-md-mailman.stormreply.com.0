Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9D18473A
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2020 13:50:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2563CC36B0E;
	Fri, 13 Mar 2020 12:50:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD8F5C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 12:50:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DClBB5009053; Fri, 13 Mar 2020 13:50:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=j35mJ3ri135kHou00lXuY3AxjlbeJipjZQDtYU8870M=;
 b=0Co1yOfCyVApMI/AS97ntTQqFT1z0Pf8cuWFQiHfpY7DeLhfUMIVCK7EiLgT3ZA7mB9m
 AAW1APKTuMfozG32i5vhXB6vD5oNbAX9AvFvLQ9bWtbyrWU71LAPd92cAwPt8Rgxqh/S
 8FjDuSBvraZ8Cde7WlDOI3SYYdoR69ZFadrBpcIfxsJ9bErOKo+sZG+v+bHrMGNzlko1
 gROem7gFD6CpD6FwP47d/JMMAqHICn+dZwaOaoC2dGSAKX4Hs0hr3SKi3J0/TnPZre9W
 EKykdUNnZC4o+0PurlE4GVkQGN6ual/pH0YGgvzMuP307tqz4IP71rt31Frhhk6q/ppC ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yqt82gm30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 13:50:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B557100034;
 Fri, 13 Mar 2020 13:49:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47B572A7F68;
 Fri, 13 Mar 2020 13:49:56 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 13 Mar
 2020 13:49:55 +0100
To: Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
 <robh+dt@kernel.org>
References: <1581355041-13845-1-git-send-email-alain.volmat@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <9c127dfe-d171-8967-3227-3dafc358277f@st.com>
Date: Fri, 13 Mar 2020 13:49:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581355041-13845-1-git-send-email-alain.volmat@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_04:2020-03-12,
 2020-03-13 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: set i2c4 bus freq to
 400KHz on stm32mp157c-ed1
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

Hi Alain

On 2/10/20 6:17 PM, Alain Volmat wrote:
> On this board, the I2C4 bus has only a single slave (pmic) which
> supports I2C Fast Mode hence setting bus frequency to 400 KHz.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c-ed1.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> index 209dae010be4..ac4f7ee4ad55 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> @@ -135,6 +135,7 @@
>   	pinctrl-0 = <&i2c4_pins_sleep_a>;
>   	i2c-scl-rising-time-ns = <185>;
>   	i2c-scl-falling-time-ns = <20>;
> +	clock-frequency = <400000>;
>   	status = "okay";
>   	/* spare dmas for other usage */
>   	/delete-property/dmas;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
