Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50D262D16
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 12:28:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43579C424BB;
	Wed,  9 Sep 2020 10:28:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34987C424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 10:28:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089AMfb0022200; Wed, 9 Sep 2020 12:28:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=7+u5MJHGtRz80QlQk4XUwbjXmNSnlv7lzP6cXbKVPeA=;
 b=qThCJXV4DkwmTpeWE1v+FO15TJ+/rCB4hN2Rwl8qYMnUMbV51Zsh3UIB7EbotFczcGFj
 AmLG8dKlfEzjd/cfWtBrOS7jg1DxOSDX8TXXbynyAAQZdeyYkG6/Eurk25hL2kVPScbY
 kqD+0PAP2+eco2cHcMCMXDA8dATcfnWF0DlAe2065Z4N7cuDjEMHEgD1pr4raDuQaUn1
 qpkzevgX44VqHh0eMFE1JAOXfLO0j/OtJWpejO+zVcve/e/q7kMcdvEXPDmMet5X4soK
 +AHIM7Q7ynH27vIfJjFFnJas8mq8XoYdZTQDYqWcSpwKtImY3XlNFFupSNEsqpCSO/hi cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0euve7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 12:28:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CC03100034;
 Wed,  9 Sep 2020 12:28:25 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0848C221FF5;
 Wed,  9 Sep 2020 12:28:25 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 12:28:24 +0200
Date: Wed, 9 Sep 2020 12:28:23 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200909102823.GB322@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Mark Brown <broonie@kernel.org>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel-janitors@vger.kernel.org
References: <20200909094304.GA420136@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909094304.GA420136@mwanda>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_06:2020-09-08,
 2020-09-09 signatures=0
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix pm_runtime_get_sync()
	error checking
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

Hi Dan,

Thanks for the patch.

On Wed, Sep 09, 2020 at 12:43:04PM +0300, Dan Carpenter wrote:
> The pm_runtime_get_sync() can return either 0 or 1 on success but this
> code treats 1 as a failure.
> 
> Fixes: db96bf976a4f ("spi: stm32: fixes suspend/resume management")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Alain Volmat <alain.volmat@st.com>

> ---
>  drivers/spi/spi-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index d4b33b358a31..19064df42d25 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -2060,7 +2060,7 @@ static int stm32_spi_resume(struct device *dev)
>  	}
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret) {
> +	if (ret < 0) {
>  		dev_err(dev, "Unable to power device:%d\n", ret);
>  		return ret;
>  	}
> -- 
> 2.28.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
