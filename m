Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93685370010
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Apr 2021 19:59:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3422BC58D7A;
	Fri, 30 Apr 2021 17:59:55 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A5A4CFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 17:59:53 +0000 (UTC)
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FX0Ny6hwZz6wkr8;
 Sat,  1 May 2021 01:54:10 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 19:59:52 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 18:59:51 +0100
Date: Fri, 30 Apr 2021 18:58:16 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20210430185816.00000ef5@Huawei.com>
In-Reply-To: <cd918677e36e89196670cacd7027569e741f7d98.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <cd918677e36e89196670cacd7027569e741f7d98.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.125.96]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: Alexandre Torgue <alexandre.torgue@st.com>, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 mauro.chehab@huawei.com, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 73/79] media: stm32: use
	pm_runtime_resume_and_get()
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

On Wed, 28 Apr 2021 16:52:34 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index bbcc2254fa2e..5f4e1db8cfcd 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -723,11 +723,11 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	u32 val = 0;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(dcmi->dev);
> +	ret = pm_runtime_resume_and_get(dcmi->dev);
>  	if (ret < 0) {
>  		dev_err(dcmi->dev, "%s: Failed to start streaming, cannot get sync (%d)\n",
>  			__func__, ret);
> -		goto err_pm_put;
> +		goto err_unlock;

maybe err_unlocked; to indicate the lock isn't held.  This briefly confused me.

>  	}
>  
>  	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
> @@ -848,6 +848,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  err_pm_put:
>  	pm_runtime_put(dcmi->dev);
> +err_unlock:
>  	spin_lock_irq(&dcmi->irqlock);
>  	/*
>  	 * Return all buffers to vb2 in QUEUED state.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
