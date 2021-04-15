Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52689360E49
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:14:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B3FAC57B79;
	Thu, 15 Apr 2021 15:14:02 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 790B4C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:13:59 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id w8so12787562pfn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i0SWPsbZMrd0nebi+GVIlyiAWrh4CzfKyh+F53eCiJI=;
 b=g3thAUPNolya2yaKXB5KwLtyiplCBRPd1lMgSEU3Gl6ZxCnKYJBgaaqnI7wlZkPPe+
 yKzXoBMZOx6M3RHjZHKdlRMDZHQ4qTtR58jloRXCd3cVfZ/bE2v9KEBYHKOSMHUqBaTN
 859bdOg6morVtwz8+5qEion050CRwOLw11Zoe37RBBJMH+/DfxhiBYIF9OGctrZ07sP5
 8tPRnhWGhxo/DxsQzOUSCyEOFvJYs6Uvb3xP05KjeAuHfTyB0yKsKml22hZmDS3kv0Tt
 nYi14mLivu+Cy+i3mj/ZRE7PbC9q145kAdC5qhpTvM4Ndpzt52CULPUiAAMMSWo5oD2F
 M2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i0SWPsbZMrd0nebi+GVIlyiAWrh4CzfKyh+F53eCiJI=;
 b=amPcr3qkTwk4FM6PI5e4+Ee3/rTmc/kc4+9LfXVviX39k/XlEZcoPTd2Idm22w7XU0
 SF8S3oBdSd4NNC2N41HGAb1yqAbbiqSJhlOusPD/lEyHH9yjM68wk0RzheXjNVTKqGif
 cokGIXKqaMCZ9N519myXTX1SMHOrQr50bJlxxh3C0R00YNThX77IyEPDtVnzThUZtV2G
 xf7Gb08Di8umpFhAjeW+LiCkm0umc1hiGWZKIwKkZfhuZHAJrxCorAuZ1vBDd8M3c9eq
 7pHYkMr4aqux3SnLhHb4APGYH0gODfdRcE5Bi57rXVCT8OUWH7OulPpLE92uLpN6mxr8
 YT6Q==
X-Gm-Message-State: AOAM530faNfSeitehyI87X7EcwMTpAm6XMP4vUXH43Lk1lUjt8WWmO/f
 NIVmxGXgE0+JT3uAlUOFsjw=
X-Google-Smtp-Source: ABdhPJxYmcljVlbKmo68b2xJsy8My7DGt4PPefNRj1OC73eYNiNx+X83zT/1SrQUwzZfZcCRMywKUQ==
X-Received: by 2002:a63:df56:: with SMTP id h22mr3959816pgj.84.1618499638122; 
 Thu, 15 Apr 2021 08:13:58 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id 186sm2476361pfe.212.2021.04.15.08.13.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:13:57 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:43:35 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415151335.GA8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <e53df4416573f16069090f4c660afbd8d501f2a0.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e53df4416573f16069090f4c660afbd8d501f2a0.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 03/33] counter: 104-quad-8: Remove
	pointless comment
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

On Fri, Mar 19, 2021 at 08:00:22PM +0900, William Breathitt Gray wrote:
> It is obvious that devm_counter_register() is used to register a Counter
> device, so a comment stating such is pointless here.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 9691f8612be8..4bb9abffae48 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -1082,7 +1082,6 @@ static int quad8_probe(struct device *dev, unsigned int id)
>  	/* Enable all counters */
>  	outb(QUAD8_CHAN_OP_ENABLE_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
>  
> -	/* Register Counter device */
>  	return devm_counter_register(dev, &priv->counter);
>  }
>  
> -- 
> 2.30.2
>

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
