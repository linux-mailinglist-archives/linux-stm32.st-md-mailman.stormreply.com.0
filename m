Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E84FF746
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Apr 2022 14:59:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB0C8C6049B;
	Wed, 13 Apr 2022 12:59:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1495FC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 12:59:20 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q8so802239wmc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 05:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tLvIKnCsgwq0Fk81VHoLGLNWgDzppdl1EGVsnwIiwWk=;
 b=J+TeCd/41OhdiO9FUGEfBABaBHyh/+x7sT23BLdtYO5M/x78pQgF4HUNKv9pzckLvE
 MxPd2HtNgkI6X7aRD/PgoHW6pVhDxI8euAS9xxP6mmaE1kusyaJ0y+ZjzUz6BMYa5ozG
 9uinPwymgXMcz+Gg+OuQDeTD5Y8mH6LmuNMUDP/r/iZ6ncTL2KniEyeWwa8admD2JJxh
 55468CiYjZUtegpegbpzGpHqZ2PuQ9QJf08kGj4VNjg0PuJiBgKjEWPP6vJNz5uLeKJS
 pPiToZDXWjoFGkMUuKIofSm8bW4zIWYbuSBz6fEuW6Ccl8EM9Nmw4ioblOFhaO1IvD9d
 ZBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tLvIKnCsgwq0Fk81VHoLGLNWgDzppdl1EGVsnwIiwWk=;
 b=F8bxFy/h9Iaqy670pnJAlGHCmiLrphlJot/wCfK7zsi9vqvcvm4d+SM6XA+GwFC58H
 pu3UvaeQAPTFmlBQ4td//NnrdBH7uuK9994nsdk3w7ZvngNWL8T+ASsVAjyR/zA7tqUS
 X0zwV8osQiJX/Hf7peTG20x5dOaRbIAzFhnvflFwf083oQBc0F142kzidSegZtuB1w3n
 PP8t48V4d0M/1OfaVjNEnW4mPPxUPqkLVBIcMuK8c+54Mh92TMLRLrHONIUya3xnSCKj
 r/9G8fVi6MBMDkRAE9Xnaip26xIf2Cc55/rU6H6TcA+IGPQN5bqjKA+Hb8ElsPoXiftk
 n3lA==
X-Gm-Message-State: AOAM532lUWdC4fBcwE5S6cfUGiclCad+tt7jlvjEVwLZE1RAfqlB2j6U
 22j6ob6+k0VU+wGNg/u3p8Q=
X-Google-Smtp-Source: ABdhPJzHDsOyWeJ1XYw5H42kbzi5IU99y9X4kNsBdhZkSZSUb/AfGgMpOXsUKWaFNT0R/LhnDJ9bFw==
X-Received: by 2002:a05:600c:5128:b0:38e:bcdd:53bf with SMTP id
 o40-20020a05600c512800b0038ebcdd53bfmr8352243wms.109.1649854759438; 
 Wed, 13 Apr 2022 05:59:19 -0700 (PDT)
Received: from hoboy.vegasvil.org (195-70-108-137.stat.salzburg-online.at.
 [195.70.108.137]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c4e8900b0038cc29bb0e1sm2873992wmq.4.2022.04.13.05.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 05:59:18 -0700 (PDT)
Date: Wed, 13 Apr 2022 05:59:15 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Tan Tee Min <tee.min.tan@intel.com>
Message-ID: <20220413125915.GA667752@hoboy.vegasvil.org>
References: <20220413040115.2351987-1-tee.min.tan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220413040115.2351987-1-tee.min.tan@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add fsleep() in HW
 Rx timestamp checking loop
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

On Wed, Apr 13, 2022 at 12:01:15PM +0800, Tan Tee Min wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index d3b4765c1a5b..289bf26a6105 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -279,10 +279,11 @@ static int dwmac4_wrback_get_rx_timestamp_status(void *desc, void *next_desc,
>  			/* Check if timestamp is OK from context descriptor */
>  			do {
>  				ret = dwmac4_rx_check_timestamp(next_desc);
> -				if (ret < 0)
> +				if (ret <= 0)
>  					goto exit;
>  				i++;
>  
> +				fsleep(1);

This is nutty.  Why isn't this code using proper deferral mechanisms
like work or kthread?

>  			} while ((ret == 1) && (i < 10));
>  
>  			if (i == 10)
> -- 
> 2.25.1
> 

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
