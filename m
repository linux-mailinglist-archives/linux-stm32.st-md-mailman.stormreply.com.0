Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B97B540D
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0F46C6B476;
	Mon,  2 Oct 2023 13:37:13 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A0EBC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 15:45:22 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-41954a3e282so31351481cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1695915921; x=1696520721;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zjyiO2aerenB+L5bFFtdZmRzY+MpNJymXfUVpkxGKO4=;
 b=LbsbsIc+peRCPJ3AE59uTOL3dzuzf4UmBgYp5fq5/iX8zXzFhaGh3DUsYbnlE9Z22c
 yaOgU5TZVaqtQS0k7NVI5tb2BmkbOlRLtojAz+lF7WZ/twOkoGXbteiGuoklhMgcq+CI
 jhZRdaucSqyKjbattkEH77tcx5BltfGgZv7Hej+jAGfVLt/P9mFEXyaMBjOjspy8HlDB
 D+n5ohZflpTCDvPvdezNjCTJ58XcQvF0WXTSriafLzsguN0bNkiInZ3iIgO8UJPd1Qnw
 RJhUYV8dwBsiTiXTtG3jO27+6QJq2x4u9jkP5nq+NVpXJCTu1+0mImpDRTSdAu+N+y+E
 a/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695915921; x=1696520721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjyiO2aerenB+L5bFFtdZmRzY+MpNJymXfUVpkxGKO4=;
 b=GF5TjJ36wHVRD72cu/G3odHXH6ZtXytoTP+FoeDYfamBRLh4PDGgV6aybIe57/0xlf
 oRlHlm9008H5oA+2iSQeioz4aa7/vkqf8NO/s1Mxs3lGNGm4qAbc75YGCF0VPwLhgBvN
 /4B0o+pzejqFSDZU717uervTNqiv6V/20DrGTH8kbj03TUwlXjEgDaWh5aHGPbQ9rhK0
 rDQvBYJHqn2os5KWgcK2SbYkcUs/aYr36hzdoPCo+LfNo3pYalH9g0TYRcgvOmpSq80b
 SHKZLihFRjd7HIbJCSvIXKLqL/1eQ7B9pGaMdjrZKx9Lm9LgP5DvpJ9W2Wgn6VouFenF
 /ocQ==
X-Gm-Message-State: AOJu0YyiL4k/5lsbHyTvNN6RYSTnzfmVJWNCJQbNoW/i87ffRo5ZDW1s
 1PHK8/+vC5gvp+48wHHXWZumvw==
X-Google-Smtp-Source: AGHT+IFKFYsPa5h8pLMtcKIq+MzAXP0NgUcgCjLytQEnC2TxzCHGxJpa5mBsW/GglWjJvBke4oO7bg==
X-Received: by 2002:ac8:5885:0:b0:418:12c6:467f with SMTP id
 t5-20020ac85885000000b0041812c6467fmr1513741qta.3.1695915921011; 
 Thu, 28 Sep 2023 08:45:21 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac87eef000000b004181a3eeff4sm3076750qtc.5.2023.09.28.08.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 08:45:20 -0700 (PDT)
Date: Thu, 28 Sep 2023 11:45:10 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <ZRWfhk0aEDwytGv5@dell-precision-5540>
References: <20230928151512.322016-1-christophe.roullier@foss.st.com>
 <20230928151512.322016-9-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928151512.322016-9-christophe.roullier@foss.st.com>
X-Mailman-Approved-At: Mon, 02 Oct 2023 13:37:12 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 08/12] net: ethernet: stmmac: stm32:
 support the phy-supply regulator binding
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

Hello,

On Thu, Sep 28, 2023 at 05:15:08PM +0200, Christophe Roullier wrote:
> From: Christophe Roullier <christophe.roullier@st.com>
> 
> Configure the phy regulator if defined by the "phy-supply" DT phandle.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 51 ++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index 72dda71850d75..31e3abd2caeaa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
... snip ...
>  static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
> @@ -455,12 +496,20 @@ static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
>  	if (dwmac->enable_eth_ck)
>  		clk_disable_unprepare(dwmac->clk_eth_ck);
>  
> +	/* Keep the PHY up if we use Wake-on-Lan. */
> +	if (!device_may_wakeup(dwmac->dev))
> +		phy_power_on(dwmac, false);
> +
>  	return ret;
>  }
>  
>  static void stm32mp1_resume(struct stm32_dwmac *dwmac)
>  {
>  	clk_disable_unprepare(dwmac->clk_ethstp);
> +
> +	/* The PHY was up for Wake-on-Lan. */
> +	if (!device_may_wakeup(dwmac->dev))
> +		phy_power_on(dwmac, true);
>  }
>  
>  static int stm32mcu_suspend(struct stm32_dwmac *dwmac)

Why only turn off the regulator in suspend on the STM32MP1 and not STM32
MCUs? It seems like this could just go in stm32_dwmac_suspend/resume().

Selfishly, I have a use case for this on an STM32F746 platform, so I
would like to see support for it and would test an updated version.

> -- 
> 2.25.1
> 

Thanks, Ben
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
