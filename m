Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D115D037
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2020 03:55:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC72C36B0B;
	Fri, 14 Feb 2020 02:55:20 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB254C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 02:55:17 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j9so4116704pfa.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 18:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IfOGOUALQlq+vrdueHXqJ3n19JBEMpajwqi9a2b9mu8=;
 b=WALN77/LOtsK64f+I801o8pXTnwnrq+YUTeeV2575oMUx66quf3mYISHEsp68Kh4km
 Ep6MmcnPJswlcg74lZpLH7dWG2eoHRWjWEMXHzMGJjGuP76jSYrqkpi2S1NKSnS6aIvB
 57vcttNJP4g7NFVB5Mr1AeqnSbC5d5GKxugzqY9L0LCEHOWaBTK6dBUJ6HC8yM92Z8xt
 TYcQSsjG/qoHeDuLZOvKeFsq6YeQhxml2Do1cK9IylL1bfJyLt46yXk2oVaxC9hRRWUk
 2iumz+gctY6uxPr6AW/dZlH67PAPr1p+AR3+3hwbcaGMAJMuMvNl5kreGHk5LGnlhv+x
 ED6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IfOGOUALQlq+vrdueHXqJ3n19JBEMpajwqi9a2b9mu8=;
 b=RSRftfWW1EXq92fW5vZl4YKsZ1FI6B7wO0aNiCj9PNz+lg04CYqRwzapql0X3X/chg
 Iv/msH+9BdyrS99Mkh/tRMwdMF73nSapolhvU0IDyOg8HOo5iAmtw7rkXD9bzMKGFp6m
 G67vVgKqz2OvUWW+Bw5Opv1JsWEM2zbMSkIxHAwc3X42+Ld5h1T050Zh0u3MWD7icO2e
 PSuJfei2RWXSWR+Oiu8QR/NVsbthrQgy5i+28ZZD2Qp+iC3/RZhV1rYQdPhBYUfp6d4X
 9VDY034i/fCa7lTSaZNs5zOoAnrc8Jo1Ef57dBJGwGB6dPYO6wg6pREuuOq6dMGOnau4
 MZfA==
X-Gm-Message-State: APjAAAW4/OqLyo8jFmZoiWguY3OBSTwx7VMhRbmT5rd9gIZq9A15YbLP
 Ll/t6K6ewLwmKBlm+Zjwv3olZQ==
X-Google-Smtp-Source: APXvYqzc7z7F2mutLbtYnNSrcHgDyzR6Kndh5uzcQOw/4lYqQQOoCwTXLIuti9aWh6t0kRET2849ow==
X-Received: by 2002:a63:5903:: with SMTP id n3mr1140280pgb.25.1581648915905;
 Thu, 13 Feb 2020 18:55:15 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f8sm4686023pfn.2.2020.02.13.18.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 18:55:15 -0800 (PST)
Date: Thu, 13 Feb 2020 18:55:12 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200214025512.GQ1443@yoga>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
 <20200211174205.22247-2-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211174205.22247-2-arnaud.pouliquen@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>, Rob Herring <robh+dt@kernel.org>,
 Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 1/3] remoteproc: add support for
 co-processor loaded and booted before kernel
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

On Tue 11 Feb 09:42 PST 2020, Arnaud Pouliquen wrote:

> From: Loic Pallardy <loic.pallardy@st.com>
> 
> Remote processor could boot independently or be loaded/started before
> Linux kernel by bootloader or any firmware.
> This patch introduces a new property in rproc core, named skip_fw_load,
> to be able to allocate resources and sub-devices like vdev and to
> synchronize with current state without loading firmware from file system.

This sentence describes the provided patch.

As I expressed in the earlier version, in order to support remoteprocs
that doesn't need firmware loading, e.g. running from some ROM or
dedicated flash storage etc, this patch looks really good.

> It is platform driver responsibility to implement the right firmware
> load ops according to HW specificities.

But this last sentence describes a remoteproc that indeed needs
firmware and that the purpose of this patch is to work around the core's
handling of the firmware.

> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++------
>  include/linux/remoteproc.h           |  2 +
>  2 files changed, 55 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
[..]
> @@ -1758,11 +1779,20 @@ int rproc_boot(struct rproc *rproc)
>  
>  	dev_info(dev, "powering up %s\n", rproc->name);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto downref_rproc;
> +	if (!rproc->skip_fw_load) {
> +		/* load firmware */
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto downref_rproc;
> +		}
> +	} else {
> +		/*
> +		 * Set firmware name pointer to null as remoteproc core is not
> +		 * in charge of firmware loading
> +		 */
> +		kfree(rproc->firmware);
> +		rproc->firmware = NULL;

As stated before, I think it would be more appropriate to allow a
remoteproc driver for hardware that shouldn't have firmware loaded to
never set rproc->firmware.

And I'm still curious how you're dealing with a crash or a restart on
this remoteproc. Don't you need to reload your firmware in these
circumstances? Do you perhaps have a remoteproc that's both
"already_booted" and "skip_fw_load"?

>  	}
>  
>  	ret = rproc_fw_boot(rproc, firmware_p);
> @@ -1916,8 +1946,17 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> -	/* if rproc is marked always-on, request it to boot */
> -	if (rproc->auto_boot) {
> +	if (rproc->skip_fw_load) {
> +		/*
> +		 * If rproc is marked already booted, no need to wait
> +		 * for firmware.
> +		 * Just handle associated resources and start sub devices
> +		 */

Again, this describes a system where the remoteproc is already booted,
not a remoteproc that doesn't need firmware loading.

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
