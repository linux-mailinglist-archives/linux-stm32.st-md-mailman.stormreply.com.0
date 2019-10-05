Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B4CCBAC
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Oct 2019 19:30:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CBF0C36B0B;
	Sat,  5 Oct 2019 17:30:28 +0000 (UTC)
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52F53C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2019 17:30:27 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id f4so3235893ybm.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Oct 2019 10:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SFxd5AapzSICM/6Xgqhe/u9Vw5QC679Bx+c0QdN9hnI=;
 b=C4StFwvN+lCG1jC5GtRTymuZCkTXZueajmp5oKh8q2nS/QR4Y2Oo9mBbom6a6lMX/v
 f60G7QcnH8JR/KGokgFN2ry3x3ceJqyt0nyeTAkLqQ7SsSWqzosmkiLWW2dB85RQWaUZ
 84ubNkcrNehQ4E0ryRIKFRdhvYl+I1a/sJrA/gvfYI/XHD28QUBdpd3oOhyXrN43bQK5
 q5eNY46ePlOob7dDWUIctgZzkEKPabn+3FopVzptgyXTYfM8jYbTjnBHttfjXTT6iDQk
 zucn3Ajq0P4wByuR6wWzOPHXuIzhE1ag6cVKPVQBA1dLhD2+UnXqTF4K7mG2A79O+zOM
 ziPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SFxd5AapzSICM/6Xgqhe/u9Vw5QC679Bx+c0QdN9hnI=;
 b=mZ4VtGTXP3gPtgiPP5oL+gxLk1R+cCErG2sOAbUc1F1iaPywCGmatk0SiuArChH5RQ
 rFNOGTw/a9pXihboK+Bbi/QE8Yo+iM+uJbbmd6sRld2xy9Ymjz43JtxDrlY4cRMJym+4
 WRucesvpxFSoh1xYlOZQSXrlT5GEs7k7J8vl+DBJ08T68czc6svcJEiIT0vdRVZvpsZ8
 /GGoNEDY5aPdGPUul8oAL8/lvouoluflxqng1GB6aNiVVkU+LPLBPbq1j47+tVSHKsA9
 nNctRxgaWxHEtXZQx2uzumwVMEdSkmCGUiJRjvA995lk4Ikf3RGs2cHNhYMuTsAflLGR
 TJMA==
X-Gm-Message-State: APjAAAUf1zQPYDFUYYNTqBUSD5/ZMnxkLduXBjxDcg9OeBoT/NN7gf3Y
 cMArEWhxnd173Qg3OiDbH/s=
X-Google-Smtp-Source: APXvYqzmQLtqtYywZioGiUcaIwSMLMNOrMMcyq48VNb2gTooHR+RghLWiW32nmaFQGBN3NvDc+DJ6Q==
X-Received: by 2002:a25:7701:: with SMTP id s1mr6210156ybc.286.1570296625972; 
 Sat, 05 Oct 2019 10:30:25 -0700 (PDT)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id 12sm2546780ywu.59.2019.10.05.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 10:30:25 -0700 (PDT)
Date: Sat, 5 Oct 2019 13:30:04 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Colin King <colin.king@canonical.com>, Jonathan Cameron <jic23@kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191005173004.GA7431@icarus>
References: <20190925095126.20219-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925095126.20219-1-colin.king@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32: clean up indentation issue
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

On Wed, Sep 25, 2019 at 10:51:26AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an if statement that is indented one level too deeply,
> remove the extraneous tabs.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/counter/stm32-timer-cnt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> index 644ba18a72ad..613dcccf79e1 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -219,8 +219,8 @@ static ssize_t stm32_count_enable_write(struct counter_device *counter,
>  
>  	if (enable) {
>  		regmap_read(priv->regmap, TIM_CR1, &cr1);
> -			if (!(cr1 & TIM_CR1_CEN))
> -				clk_enable(priv->clk);
> +		if (!(cr1 & TIM_CR1_CEN))
> +			clk_enable(priv->clk);
>  
>  		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
>  				   TIM_CR1_CEN);
> -- 
> 2.20.1

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Fabrice,

I noticed the TIM_CR1_CEN check is happening before the
regmap_update_bits call for the enable path, while the disable path does
the check after. Is this logic is correct.

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
