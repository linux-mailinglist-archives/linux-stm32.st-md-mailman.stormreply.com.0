Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 191BB70E632
	for <lists+linux-stm32@lfdr.de>; Tue, 23 May 2023 22:05:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADA6BC6A61D;
	Tue, 23 May 2023 20:05:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 013C3C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 May 2023 20:05:29 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-64d604cc0aaso171570b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 May 2023 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684872328; x=1687464328;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xxXVUOaFN1Qv+6eAQzosOhjOl+94anVe0xXKbzcrKW0=;
 b=Z1UfLh8zwQ4gGkVeoNzdf7gNB+vkVFBoxp+/Y2vwDp7ns/GM5u9C4vSDIBCs/fw/ii
 92XGpa8kQFDw88Bqx0REdQVhQafzDeGATQcQ0YHuOKOLO2CMYCZXEq54VBggA+mOUuX5
 lH5Yi8VSe62WZpgb57rw12rbw2hpSeuwCummsJiFzJlU7+d7wQD9iSPC4p0gbzcvLIDj
 FiOUA1ZN0NdQSh09ZL4AcUFBu5es2ubK87MmrFdarhGIe8sfph8Pi47Ry9BenJBVDDz2
 SMe+pwJBaqXAQbwk5+Nh5qNcr4kYcfczdiGNEEXco2r/tDa/tDbefbTvoQgStRxxTgZg
 EV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684872328; x=1687464328;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxXVUOaFN1Qv+6eAQzosOhjOl+94anVe0xXKbzcrKW0=;
 b=Ggj6Sw1oFPmQU0GHBaAxGZsx7IMP6QMFe2h396AaE5RXiND/K1QzsX9I5SMJZ4ZKF4
 PTeJ+Ruke/lSt38Rlwkfv8LRPlmds05nOkH+eerJj97Lxyj9lsZ+3DZ3L3NtDUzjwYYq
 Zs0Fl+YfTxWNwn7kkhZ8al4Ro/fXEKNd6gjjkdC2ebYOP0V19r75r+U/NT2K8pFX9uni
 WEwQ/GfFWiANtsA0W+VQw1aP9Rdb+tl/22neMuCwXmR2+Bs/uQ8P6LbS3BbShRigQlDR
 KR9KzIPXl8LqaFMGsRpjFu4QesfpvfmjyYH3oYjF0BgAold7SqD6AbxtL02uut0gLsfN
 CtfQ==
X-Gm-Message-State: AC+VfDx8ENhfJSmL+WDtHKusn8Cxmhi+t/Vg7OBrl6lYo/c/KL3BF9oM
 9BTOAQF3c/oOP5clZd5SeE5SsQ==
X-Google-Smtp-Source: ACHHUZ49fyumpSoubA/QSL2euXQxNkK8YT8+yIAjR9IgC5rGDCadGOaus7RUj9TiIgEIp6v5Xzd0HQ==
X-Received: by 2002:a05:6a00:23cc:b0:645:c730:f826 with SMTP id
 g12-20020a056a0023cc00b00645c730f826mr201405pfc.24.1684872328385; 
 Tue, 23 May 2023 13:05:28 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7a5b:c1e7:4298:b147])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a056a00270a00b00640e64aa9b7sm6370805pfv.10.2023.05.23.13.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 13:05:27 -0700 (PDT)
Date: Tue, 23 May 2023 14:05:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <ZG0chM7o2f7gTNyg@p14s>
References: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
Cc: kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: Fix error code in
 stm32_rproc_parse_dt()
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

On Mon, May 22, 2023 at 10:46:11AM +0300, Dan Carpenter wrote:
> There is a cut and paste bug so this code was returning the wrong
> variable.  It should have been "ddata->hold_boot_rst" instead of
> "ddata->rst".
> 
> Fixes: de598695a2ad ("remoteproc: stm32: Allow hold boot management by the SCMI reset controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 0e322697d210..a7457777aae4 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -755,7 +755,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
>  	if (IS_ERR(ddata->hold_boot_rst))
> -		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> +		return dev_err_probe(dev, PTR_ERR(ddata->hold_boot_rst),
>  				     "failed to get hold_boot reset\n");

I have applied this patch.

Thanks,
Mathieu

>  
>  	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
> -- 
> 2.39.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
