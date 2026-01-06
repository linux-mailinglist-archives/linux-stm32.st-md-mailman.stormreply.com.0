Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0776CF987D
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 18:05:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FD8FC8F277;
	Tue,  6 Jan 2026 17:05:28 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F440C8F26B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 17:05:26 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.224.83])
 by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlyGW6FwSzJ46YJ;
 Wed,  7 Jan 2026 01:05:23 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
 by mail.maildlp.com (Postfix) with ESMTPS id B96AC40086;
 Wed,  7 Jan 2026 01:05:25 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 17:05:25 +0000
Date: Tue, 6 Jan 2026 17:05:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20260106170521.00001668@huawei.com>
In-Reply-To: <20260106-spi_st_maybe_unused_removal-v1-1-8f5ca7136e96@foss.st.com>
References: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
 <20260106-spi_st_maybe_unused_removal-v1-1-8f5ca7136e96@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] drivers: spi: st: remove
 __maybe_unused for suspend/resume
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

On Tue, 6 Jan 2026 13:14:17 +0100
Alain Volmat <alain.volmat@foss.st.com> wrote:

> Remove useless __maybe_unused statements for suspend and resume
> functions since this is now used via pm_ptr.
Patch is fine, but reasoning not quite right. pm_ptr() allows
the dropping of the structure without needing a __maybe_unused
on that, but these are passed to the SYSTEM_SLEEP_PM_OPS()
macro and that is using pm_sleep_ptr().

So tiny description change needed to reflect that. Probably
mention the pm_sleep_ptr() is as part of the macro as that
bit is not totally obvious.

Jonathan


> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/spi/spi-st-ssc4.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-st-ssc4.c b/drivers/spi/spi-st-ssc4.c
> index c07c61dc4938..b173ef70d77e 100644
> --- a/drivers/spi/spi-st-ssc4.c
> +++ b/drivers/spi/spi-st-ssc4.c
> @@ -403,7 +403,7 @@ static int spi_st_runtime_resume(struct device *dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused spi_st_suspend(struct device *dev)
> +static int spi_st_suspend(struct device *dev)
>  {
>  	struct spi_controller *host = dev_get_drvdata(dev);
>  	int ret;
> @@ -415,7 +415,7 @@ static int __maybe_unused spi_st_suspend(struct device *dev)
>  	return pm_runtime_force_suspend(dev);
>  }
>  
> -static int __maybe_unused spi_st_resume(struct device *dev)
> +static int spi_st_resume(struct device *dev)
>  {
>  	struct spi_controller *host = dev_get_drvdata(dev);
>  	int ret;
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
