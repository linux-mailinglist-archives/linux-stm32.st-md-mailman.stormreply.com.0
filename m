Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85F9E0902
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2024 17:48:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38FDAC78002;
	Mon,  2 Dec 2024 16:48:58 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E374CC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 16:48:50 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7ea9739647bso3118631a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Dec 2024 08:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733158129; x=1733762929;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Klyt3BeokDN44ugCW3DvcncSUZPVR3R8tgu53HoR6yc=;
 b=eeje1ENNnsnPCNN/DJraFHqZZSnBgDk1iZ1CA6ZaGrPn2abPAtZS8xiT3hoKLW/aoU
 pFmgxmKWVv5IBbwfg0gcwmM0byXmbyL6iyeVP6jMi/VVD5Y7fCJOHRSJ937ZxcnEPh0J
 Zro4ywdaI8ZGUSco5aROo6gPmBF6v2nuYzc/AhoBd3rJOCIZ89qHB5SN0rXaNs2LY9CA
 xWyYFOrTjxzCgKyRLhnFWp8oAknDOMdd4VcEnTnFON40Ek2/yOaaqJj9iJttNGAhHrV+
 3dmOkcGD9qPPkFNDHk4+WMFGAt+eQdLVgCqO0yVZZGvzcllNQMqaDWQTDtCs/h1TAymo
 2Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733158129; x=1733762929;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Klyt3BeokDN44ugCW3DvcncSUZPVR3R8tgu53HoR6yc=;
 b=Mci46OFZoxxSjAk5g8v9DF2mizv/ydvQ7Gg4Alpw80Lup6/xijJOL1xagnSq8InLrL
 qbeS4tHJk5l4AZCm8FS1PZqQ4x59glrb2RTR2VzhpvB9Dq6qm3U4VXTfHHqoaeQIsG7v
 cAjJNkhRInjuZe/s9RTmmW4ZUYWfunb2MGmUgVGm3WDVDzLRrXfrsKR6x+21QDqO/4rf
 Kqj6QOtOyqR1jxP/f1N2bBuHAQaLce2mw9E69amH/BQO8sJSSVMJNS+0BitR7sNNwhUV
 A7NykIf+3mATNZNNmLSD1YHRKTeVtkBIBw4YI2lLnUCWRzBDXUjn9qHjpHWTbCRO8ZGX
 lmjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFRvEBD/QP86/pJ18I8PBxibxXj4N0ghp+h7SN2+pAH38vl4x2yx3OoSDqgmceahl5+4lCpZGgb2jBFg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6V0ZDrA6/iSwdtuObwpz695V0AFW7bYKqKdYLB2zhOwuqkfck
 loseLZZJwPC98fI7k8Z3mqq2rQ5AFCXQoyqZ1HaTdrGGvJDOv0PLLgt/Jii983c=
X-Gm-Gg: ASbGnct8tV7haC2eDICXeQY2gWGfJDD5ulYNiMck6XIkVjNHe9mb56mf5C9ilDVpeBF
 +OXX6BlsEA9pxx/w6UlcstdNiaVammhPL0zgVr2iisXa9TIOD3DYnfvYu5QM6mT7Om0sXcBUq+c
 sbeSC47fd3PuS/JPWfkNOnIpLGGK0JjKCzYi4Js4L/bkuKVeUuf3vlCAzajJcImHKQMv6l8sAaj
 gj4VT67HUARjpRsR/UwUOddVPExgaJM7QsmyCRWhTfLTP2FOBkzhA==
X-Google-Smtp-Source: AGHT+IH0BcQMvBTUCDM/IzMifwY/P/r9GOVp7WKhH22kmbfItDPKR+9O2x4fGXRN0aWb5E49FibgUA==
X-Received: by 2002:a05:6a20:158a:b0:1cf:27bf:8e03 with SMTP id
 adf61e73a8af0-1e0e0b10997mr34022178637.26.1733158129360; 
 Mon, 02 Dec 2024 08:48:49 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:813b:da83:de65:fc6a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72541849509sm8706120b3a.197.2024.12.02.08.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:48:48 -0800 (PST)
Date: Mon, 2 Dec 2024 09:48:46 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <Z03k7v6JuA2bCj9x@p14s>
References: <20241122175127.2188037-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241122175127.2188037-1-arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: core: Fix ida_free call while
	not allocated
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

On Fri, Nov 22, 2024 at 06:51:27PM +0100, Arnaud Pouliquen wrote:
> In the rproc_alloc() function, on error, put_device(&rproc->dev) is
> called, leading to the call of the rproc_type_release() function.
> An error can occurs before ida_alloc is called.
> 
> In such case in rproc_type_release(), the condition (rproc->index >= 0) is
> true as rproc->index has been  initialized to 0.
> ida_free() is called reporting a warning:
> [    4.181906] WARNING: CPU: 1 PID: 24 at lib/idr.c:525 ida_free+0x100/0x164
> [    4.186378] stm32-display-dsi 5a000000.dsi: Fixed dependency cycle(s) with /soc/dsi@5a000000/panel@0
> [    4.188854] ida_free called for id=0 which is not allocated.
> [    4.198256] mipi-dsi 5a000000.dsi.0: Fixed dependency cycle(s) with /soc/dsi@5a000000
> [    4.203556] Modules linked in: panel_orisetech_otm8009a dw_mipi_dsi_stm(+) gpu_sched dw_mipi_dsi stm32_rproc stm32_crc32 stm32_ipcc(+) optee(+)
> [    4.224307] CPU: 1 UID: 0 PID: 24 Comm: kworker/u10:0 Not tainted 6.12.0 #442
> [    4.231481] Hardware name: STM32 (Device Tree Support)
> [    4.236627] Workqueue: events_unbound deferred_probe_work_func
> [    4.242504] Call trace:
> [    4.242522]  unwind_backtrace from show_stack+0x10/0x14
> [    4.250218]  show_stack from dump_stack_lvl+0x50/0x64
> [    4.255274]  dump_stack_lvl from __warn+0x80/0x12c
> [    4.260134]  __warn from warn_slowpath_fmt+0x114/0x188
> [    4.265199]  warn_slowpath_fmt from ida_free+0x100/0x164
> [    4.270565]  ida_free from rproc_type_release+0x38/0x60
> [    4.275832]  rproc_type_release from device_release+0x30/0xa0
> [    4.281601]  device_release from kobject_put+0xc4/0x294
> [    4.286762]  kobject_put from rproc_alloc.part.0+0x208/0x28c
> [    4.292430]  rproc_alloc.part.0 from devm_rproc_alloc+0x80/0xc4
> [    4.298393]  devm_rproc_alloc from stm32_rproc_probe+0xd0/0x844 [stm32_rproc]
> [    4.305575]  stm32_rproc_probe [stm32_rproc] from platform_probe+0x5c/0xbc
> 
> 
> Calling ida_alloc earlier in rproc_alloc ensures that the rproc->index is
> properly set.
> 
> Fixes: 08333b911f01 ("remoteproc: Directly use ida_alloc()/free()")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Note for backporting to previous kernel versions: The SHA 08333b911f01
> seems to correspond to the last commit that updated IDA allocation.
> The issue existed before, but the fix could not be applied without some
> rework.
> ---
>  drivers/remoteproc/remoteproc_core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..ef6febe35633 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2486,6 +2486,13 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->dev.driver_data = rproc;
>  	idr_init(&rproc->notifyids);
>  
> +	/* Assign a unique device index and name */
> +	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
> +	if (rproc->index < 0) {
> +		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
> +		goto put_device;
> +	}
> +
>  	rproc->name = kstrdup_const(name, GFP_KERNEL);
>  	if (!rproc->name)
>  		goto put_device;
> @@ -2496,13 +2503,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (rproc_alloc_ops(rproc, ops))
>  		goto put_device;
>  
> -	/* Assign a unique device index and name */
> -	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
> -	if (rproc->index < 0) {
> -		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
> -		goto put_device;
> -	}
> -

I have applied this patch.

Thanks,
Mathieu

>  	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
>  
>  	atomic_set(&rproc->power, 0);
> 
> base-commit: adc218676eef25575469234709c2d87185ca223a
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
