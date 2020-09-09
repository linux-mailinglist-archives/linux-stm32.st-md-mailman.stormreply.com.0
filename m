Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C947D263D70
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 08:31:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C74DC3FAE2;
	Thu, 10 Sep 2020 06:31:11 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61980C36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 16:35:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c18so3654553wrm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Sep 2020 09:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jl9MdazYbMEWqQTTd81RjRbyt2goVkCILtjWlQep6lI=;
 b=P1g4tv/aZx1p5lq5m7/VNtwAhX7o2KyOJ4wyvqVfJoA1wLHpYlQ5bvOVj8DlQI848i
 S/D5SkfiM2CYKJhbYhVqm9CG9tLp7v/MbrQUU3MeL3w113tsnGy4nNKF+2Y0hOVSTTuL
 AdYOqTAjSfbRdTsD/NzWtNhvtHTwP7awfaDcqWzRQ9tvrKEE4rMa8m4hcPcKpOGw6Crd
 SngBf654kOWp0S6hGdxvU2EYDLElXMXBSKz6XLPMHzLTWVvcTxq8Lwv9h7HV0Oq70Zof
 47POt990a1Qq8PH/HRuKp5zICdfrvpA2cJyTqZk2UzFzgyS2f+mRvIsCyI2mfPgtJus9
 59xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jl9MdazYbMEWqQTTd81RjRbyt2goVkCILtjWlQep6lI=;
 b=oDh9T8JygAPb0fxlvuPEp9mIIk/cmH6yr2Gif/9AtdzocoKVMEoLTE36/sIxbJcLTJ
 zQYU5sJKsAiZbrXS8hbF+NPIczsNGBuwK8RUguP5QTNXwRFHpktaeC2jFOtjEXcNhvKa
 03oFgciQg8+807YHHENjcBQSSR/GuWSQbUfeKcb2hUpQsi9MbgCsrF5D3SiBjRwxP5yJ
 14XMye6li7Nf5E3C+8JjY4SWYrtrd/9kPSOXuGFycQ3daU1FoFQxIsCpRTkKF4iEjPEx
 feErNb0i0A//A6CwGUD/8dZpDRDomnCkJjaeCzKjjPXhIEZk9ryz5/2SbvgDvugSh9uc
 Z4QA==
X-Gm-Message-State: AOAM532XRjAxI6FQx7KW7ozX0OeEWvefzwJowjfixHAgKswvXfsuH4jg
 HQ6zm0xA85ft5pMQyCqEOgZBUA==
X-Google-Smtp-Source: ABdhPJzAULheBBlNK80MB6HC04/qDw7O/ArPTdSVlw9oJqtOKg3QPeeAGr45u2Eqsc1lJL3Oz4pa7w==
X-Received: by 2002:adf:c58c:: with SMTP id m12mr4673332wrg.88.1599669325941; 
 Wed, 09 Sep 2020 09:35:25 -0700 (PDT)
Received: from netronome.com ([2001:982:7ed1:403:9eeb:e8ff:fe0d:5b6a])
 by smtp.gmail.com with ESMTPSA id l126sm4627871wmf.39.2020.09.09.09.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:35:25 -0700 (PDT)
Date: Wed, 9 Sep 2020 18:35:24 +0200
From: Simon Horman <simon.horman@netronome.com>
To: Wang Qing <wangqing@vivo.com>
Message-ID: <20200909163523.GC28336@netronome.com>
References: <1599653964-29741-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599653964-29741-1-git-send-email-wangqing@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 10 Sep 2020 06:31:10 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drivers/net/ethernet: fix a typo for
	stmmac_pltfr_suspend
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

Hi Wang,

On Wed, Sep 09, 2020 at 08:19:21PM +0800, Wang Qing wrote:
> Change the comment typo: "direcly" -> "directly".
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

git log  tells me that the correct prefix for this patch
is probably "net: stmmac:"  rather than "drivers/net/ethernet:'

Probably this patch is targeted at net-next and should include net-next
in the subject like this: [PATCH net-next] ...

> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index f32317f..b666bb9
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -711,7 +711,7 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
>  /**
>   * stmmac_pltfr_suspend
>   * @dev: device pointer
> - * Description: this function is invoked when suspend the driver and it direcly
> + * Description: this function is invoked when suspend the driver and it directly
>   * call the main suspend function and then, if required, on some platform, it
>   * can call an exit helper.
>   */
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
