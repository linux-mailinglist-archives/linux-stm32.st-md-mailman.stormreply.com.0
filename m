Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D6367E85
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 12:22:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D729C58D5C;
	Thu, 22 Apr 2021 10:22:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5544FCFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 10:22:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13MAHWRH027557; Thu, 22 Apr 2021 12:22:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nOqyyzC8dY9Gh2eNf8o9zHgKWkLupM82KT2U6xpXmRE=;
 b=qBkdpqyHuQR1GBXHq4bUrlfobitQXTehA7cF0RviqnenbqXVOPa2j93Blr+nlKRGLpSn
 SBrUdqS4eS4oxbSoU5pPakcrMQ4FFOhl3Atb6stIJebOwF8nFyF1XsoHEUIANfLhlHjj
 LZY5ZVvNHWSv0W+3d0TFHrOSTANxknR/acHyyfIMZmT3H4a0OdPFssEV5dcGnyOgBn4m
 Sz1a9RpU8vILDhDuJA/zSiB3WFz8k24RDhOjbFoNGHu0kGbe/2Z7zxTzh5d+9g2cP1b9
 u8nUL0JrUgxtEWF1OJapN3hBYsbTgL1BnSkmkjT3jp1nbr0x0yIieDzJTAgAlm/MVrwr pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 382fftfs3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 12:22:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1EB510002A;
 Thu, 22 Apr 2021 12:22:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C60B52C41FB;
 Thu, 22 Apr 2021 12:22:24 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 12:22:23 +0200
To: Arnd Bergmann <arnd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, "Bjorn
 Andersson" <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@st.com>
References: <20210421140053.3727528-1-arnd@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <5c8724b8-ec88-de4d-26b9-b95620bff3d9@foss.st.com>
Date: Thu, 22 Apr 2021 12:22:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210421140053.3727528-1-arnd@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_04:2021-04-21,
 2021-04-22 signatures=0
Cc: linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: fix phys_addr_t format
	string
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

Hello Arnd,

On 4/21/21 4:00 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A phys_addr_t may be wider than an int or pointer:
> 
> drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_da_to_pa':
> drivers/remoteproc/stm32_rproc.c:583:30: error: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Werror=format=]
>   583 |                 dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
> 
> Print it by reference using the special %pap format string.
> 
> Fixes: 8a471396d21c ("remoteproc: stm32: Move resource table setup to rproc_ops")
> igned-off-by: Arnd Bergmann <arnd@arndb.de>

It seems that the 'S' has disappeared during the copy/past :)
It's strange that no bot has made a report...

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks for the fix!
Arnaud

> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7353f9e7e7af..32595c950569 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -580,7 +580,7 @@ static int stm32_rproc_da_to_pa(struct rproc *rproc,
>  			continue;
>  
>  		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
> -		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
> +		dev_dbg(dev, "da %llx to pa %pap\n", da, pa);
>  
>  		return 0;
>  	}
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
