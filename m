Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A933B2F9BA7
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Jan 2021 10:02:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EBA9C3FADA;
	Mon, 18 Jan 2021 09:02:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1767C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 09:02:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10I90acw018127; Mon, 18 Jan 2021 10:02:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XVqcBJ1/aC3pTbN7m9Y9/ws7Y5V/4/XE7uZRGJIjjpw=;
 b=sYTKo/FfZBbc2CJ97C5klIeVMgUZ0Z0GPkYwlBshKmDEtxsASTIYdr10Y/fAbOIfSOKp
 aThlb/VcoWF7dMqQJIccCnbgr+BBuCzj4DSHPl/EBi90GdKKhNkfU9ZmuvCEhcC/RM5c
 wwn6c0hYMdoE6r9rWbHvI/+oH93dEhfCk33pzBc/wNIE89PDPno64oTRTzArtq6x6wNM
 3mv1GwSfGdqB3ufS7lAep/K9nAMWe/FI4vmQ9KFJ4EdzLl/16/KDCfSRdRcn2C8nSt8J
 sMokebeCBa0ZvqoplXLxhJRn6ZAj+5ySxZPmUPftja/AB2vFtXeNcYVp6Rdl4D/B2Gq9 kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 363rc507pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 10:02:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAD20100034;
 Mon, 18 Jan 2021 10:02:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C72CD221796;
 Mon, 18 Jan 2021 10:02:08 +0100 (CET)
Received: from [10.211.13.252] (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 Jan
 2021 10:02:07 +0100
To: Jonathan Cameron <jic23@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20210117153816.696693-1-jic23@kernel.org>
 <20210117153816.696693-3-jic23@kernel.org>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <59ecf96d-6a20-fec7-95ba-fe2561338f1e@foss.st.com>
Date: Mon, 18 Jan 2021 10:02:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210117153816.696693-3-jic23@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_07:2021-01-15,
 2021-01-18 signatures=0
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [Linux-stm32] [RFC PATCH 2/7] iio:ABI docs: Avoid repitition of
 triggerX/sampling_frequency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On 1/17/21 4:38 PM, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> The timer-stm32 provided a little more specific information than the main
> docs about the value of 0 corresponding to stopping sampling.  Given that
> this makes sense in general, move that statement over to the main docs
> and drop the version in sysfs-bus-iio-timer-stm32
>
> Fixes
> $ scripts/get_abi.pl validate
> /sys/bus/iio/devices/triggerX/sampling_frequency is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:92  ./Documentation/ABI/testing/sysfs-bus-iio:45
>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Reported-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio             | 2 ++
>  Documentation/ABI/testing/sysfs-bus-iio-timer-stm32 | 8 --------
>  2 files changed, 2 insertions(+), 8 deletions(-)

Hi Jonathan,

Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,

Fabrice

>
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index d2dd9cc280f9..9b5ceb22363d 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -55,6 +55,8 @@ Description:
>  		direct access interfaces, it may be found in any of the
>  		relevant directories.  If it affects all of the above
>  		then it is to be found in the base device directory.
> +		Note a value 0 where supported, will correspond to sampling
> +		stopping.
>  
>  What:		/sys/bus/iio/devices/iio:deviceX/sampling_frequency_available
>  What:		/sys/bus/iio/devices/iio:deviceX/in_intensity_sampling_frequency_available
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> index c4a4497c249a..05074c4a65e2 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> @@ -90,14 +90,6 @@ Description:
>  		Reading returns the current master modes.
>  		Writing set the master mode
>  
> -What:		/sys/bus/iio/devices/triggerX/sampling_frequency
> -KernelVersion:	4.11
> -Contact:	benjamin.gaignard@st.com
> -Description:
> -		Reading returns the current sampling frequency.
> -		Writing an value different of 0 set and start sampling.
> -		Writing 0 stop sampling.
> -
>  What:		/sys/bus/iio/devices/iio:deviceX/in_count0_preset
>  KernelVersion:	4.12
>  Contact:	benjamin.gaignard@st.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
