Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFD1D2626
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 06:58:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68B05C32EB6;
	Thu, 14 May 2020 04:58:58 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2228DC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 04:58:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 23so782408pfy.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 21:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XB9iR1Wtni03RNsjVOMYUq9aoFsWINR5LTN8xhVnTBE=;
 b=wjDd6XVS335MCJz9fDAbV1AJWTNo6NfWf4m+5LBZrK5OZvhYRFS7xdg7rvVKwsStr0
 0GZKzpEEeDPKMlo6yRynvB1Py/hJpE7BdKPYvhOHlY5iZPRmTLVKPxDGadQrq9288OTD
 bXmo47fVNu8lfa0j4e6PZ6phtHOTmgKaLvm7kUcLeS3nehSQ3dQXUoRyj+jvBcbrhnAN
 g7OSwaQxYwqJT54/+bQeyy/xEm0H8osNIoLSNDpPu5bGko684DCE+LjlRJNHZZ3Ydo5X
 fc4G9VljKI/7ZhlOFs+YM4Zf/bGUyIaMxZlmd0kHF0AdrH2gQKMoDs5ixQv/638Quu5V
 Eycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XB9iR1Wtni03RNsjVOMYUq9aoFsWINR5LTN8xhVnTBE=;
 b=SmJR4jRm+rRIDaP0BqKe+rmePRwzNHOIPeJEoSYudaDbvAppdDnbIQU7Aioafrtqe1
 z9YdyaJKl7I0HlBjO7gTAo69tSdVlaJD8L0geuIyjobdk69x5fbGOeM8V2k/DIWx00TX
 spRbyaIa10QJmAYAhQ39PpXgrhvE1y6+rF8bTuJOwOfv7mlx4VcZ84bUiC7TWyng9KEz
 YyCRztgQvafqvnUjhCmA0NcfxLWfITlR8gFKPDJCkoSewyfD/f9YbNm130ycGt+2Ms5+
 4icCxwZ+HUB39nqGtmmb3w5ovsErahe8JhTJcUts0yW+2VYyV6ZkwKyql5CIaPUtQpq9
 8Sng==
X-Gm-Message-State: AOAM533aD9PaAT/nibcfQxM5Xfi3RYLKf56wPXLT+yb4EI8RzF+mhGLd
 vn10J2VB94pi/nFoHRc6ZpzMoA==
X-Google-Smtp-Source: ABdhPJwtJMENg8lvG2CR/fcdWf8E4zka+8LBZfgW9TaUXTChBfsuSaci4EXXRp2CUpbC+jWVbtUTAg==
X-Received: by 2002:a63:1557:: with SMTP id 23mr2564283pgv.104.1589432335637; 
 Wed, 13 May 2020 21:58:55 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id d203sm1052337pfd.79.2020.05.13.21.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 21:58:55 -0700 (PDT)
Date: Wed, 13 May 2020 21:57:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200514045724.GH16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-3-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-3-mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/12] remoteproc: stm32: Request IRQ
 with platform device
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

On Fri 24 Apr 13:24 PDT 2020, Mathieu Poirier wrote:

> Request IRQ with platform device rather than remote proc in order to
> call stm32_rproc_parse_dt() before rproc_alloc().  That way we can
> know whether we need to synchronise with the MCU or not.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 91fd59af0ffe..1ac90adba9b1 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -261,7 +261,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
> -	struct rproc *rproc = data;
> +	struct platform_device *pdev = data;
> +	struct rproc *rproc = platform_get_drvdata(pdev);
>  
>  	rproc_report_crash(rproc, RPROC_WATCHDOG);
>  
> @@ -553,7 +554,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
>  
>  	if (irq > 0) {
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
> -				       dev_name(dev), rproc);
> +				       dev_name(dev), pdev);
>  		if (err) {
>  			dev_err(dev, "failed to request wdg irq\n");
>  			return err;
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
