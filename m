Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 906635EDF46
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 16:56:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43986C63327;
	Wed, 28 Sep 2022 14:56:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FC57C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 14:56:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 662F4153B;
 Wed, 28 Sep 2022 07:56:28 -0700 (PDT)
Received: from [10.57.0.129] (unknown [10.57.0.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA6593F73D;
 Wed, 28 Sep 2022 07:56:19 -0700 (PDT)
Message-ID: <b8ad73ea-a20e-0e74-766e-eeb4cdeb1890@arm.com>
Date: Wed, 28 Sep 2022 15:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: zhangsongyi.cgel@gmail.com
References: <20220927115136.259926-1-zhang.songyi@zte.com.cn>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20220927115136.259926-1-zhang.songyi@zte.com.cn>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, leo.yan@linaro.org,
 zhang songyi <zhang.songyi@zte.com.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH linux-next] coresight: use sysfs_emit() to
 instead of scnprintf()
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



On 27/09/2022 12:51, zhangsongyi.cgel@gmail.com wrote:
> From: zhang songyi <zhang.songyi@zte.com.cn>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the value
> to be returned to user space.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
> ---
>  drivers/hwtracing/coresight/coresight-stm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: James Clark <james.clark@arm.com>

> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 463f449cfb79..3a1b07217932 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -466,7 +466,7 @@ static ssize_t hwevent_enable_show(struct device *dev,
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	unsigned long val = drvdata->stmheer;
>  
> -	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +	return sysfs_emit(buf, "%#lx\n", val);
>  }
>  
>  static ssize_t hwevent_enable_store(struct device *dev,
> @@ -495,7 +495,7 @@ static ssize_t hwevent_select_show(struct device *dev,
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	unsigned long val = drvdata->stmhebsr;
>  
> -	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +	return sysfs_emit(buf, "%#lx\n", val);
>  }
>  
>  static ssize_t hwevent_select_store(struct device *dev,
> @@ -530,7 +530,7 @@ static ssize_t port_select_show(struct device *dev,
>  		spin_unlock(&drvdata->spinlock);
>  	}
>  
> -	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +	return sysfs_emit(buf, "%#lx\n", val);
>  }
>  
>  static ssize_t port_select_store(struct device *dev,
> @@ -577,7 +577,7 @@ static ssize_t port_enable_show(struct device *dev,
>  		spin_unlock(&drvdata->spinlock);
>  	}
>  
> -	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +	return sysfs_emit(buf, "%#lx\n", val);
>  }
>  
>  static ssize_t port_enable_store(struct device *dev,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
