Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D78C18490EB
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Feb 2024 22:57:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8488CC6B476;
	Sun,  4 Feb 2024 21:57:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A3C0C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Feb 2024 21:57:44 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5113a97a565so2783105e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Feb 2024 13:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707083864; x=1707688664;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g5AR9vZ9MNs+fUVCcwKiCmTaAON91kqW+QM/Uqs1wyI=;
 b=hv83NlA+w5QMVQzcZLAo+qji/7KAiEkWzZ3Eug9Gqz4AwLEcsNwYy4W9rq8HxX8iHg
 ZGT5cfuInwxvYUNMSgKSdklhYGf3YlY5ID654OtrL8oexzk5Slq8Bzi4KQjIkj0AeNVv
 aFIY0+Q9qt0dwFYko/hR58w0Ll4RRI4ltoM0aW08W4zxg99GU92r+++at1V3U6zTNBKC
 rDms5wG07JSaRVjHoJRU9huTbMX83LlWXnQ+KY0rQSbJrATB9Raty/sxNmuUN9QzU64i
 v9mCYi+Eq9LKhanHIcpl8lQVPTWw6dPiMPXZEsYb7U7sZG2HdCIc9dg/AsNksi/fi74F
 S7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707083864; x=1707688664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5AR9vZ9MNs+fUVCcwKiCmTaAON91kqW+QM/Uqs1wyI=;
 b=CnltuGfzM7nidLyaZYE1f00W88izC3+sSNVmI+S56XFyQosZ5EbyiS+myUOowUGd3W
 4MHgZaSzRf38r7L/j/IeSMHi5tmbw7w4wUtMyXEzqyEqE1EWKcYF1MN9jThKbBcd2Rnt
 jRzFLkWn7Cfr38VCvy7cVOlWOY2bu3bubYh7D4E0VzZ5aUsY2rRL2/X6QZQ2S88X/qOW
 FXaydaLxDbN4OhGJG5gICe8G7EWp2wVAyWoOb8mxbhoWz1DyMCOjHc6nhpUXj8wr1lvs
 jQsaHkmGl48aYY5CsDstyVPHH/qvu/PlF4K4JSq6B7d42/0ePFft3q3wwk8V3YZFTVRs
 WaiQ==
X-Gm-Message-State: AOJu0YzmrqcqWgKQOETkmlnjKxjnrbO9dSbGTbDw4yUhcDEjX18YUTNN
 59jPJ1fmORkHbZC/JXzRXBgdVB6V7tVxeuDIoqFwK/Klocsp7rdo
X-Google-Smtp-Source: AGHT+IETZ7jN127ObYbIgf7nygTHNXYqmVviqVN77J5FewbxLp37fo7umIa/AsR6j+qONg2QDFmXGw==
X-Received: by 2002:a05:6512:3494:b0:511:530b:6026 with SMTP id
 v20-20020a056512349400b00511530b6026mr21364lfr.27.1707083863667; 
 Sun, 04 Feb 2024 13:57:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXBRAtN9GSeiBDQckUnGphVGWvCn2l9Y9cKU+i4cnBbRcfs8HCncIbZSWOmYnImQ7pSB29f2oA48BH8GVntfdsyCRYR8SEJ8GlQIkv5pLqST3yKGe/qK/76ABvwi5Gq2W0I47N77fE5uWPpfown4t1uWOFTUV+GjXbyzX4W8/9TFYiBdbLUDnpUUWsfMTbQZc8reC4eqamuJ9YdMcFS81CxFHJkX/ABnNWaXFPuLzZTlmfBmgUQFDhz9dt7HLElAc7Pl9CWUO/MOWS+SlNdN1IouxfBvv8swQcKJ0ltOIzfeE2I5zNt2PXjLX+nRn6WKFnnMCLtDG6x45VVMcCgEoxpFdiFplUasQhf/3FErMdYWsbVQJ/fZP+xocijIF2TRJk8k5dDqZGV5ZCHKU/H2lY9tm7sJV/fdpkijmHIMwnmpOnJ8Gae2JdlLrVZtVdg1H5SpCQUB6NSGi6srFR0e8yDWlv6+Ayb6oUXAi741i8byTtMXTynhjnpBRB7t+rs3hi6qV8tng==
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a19c509000000b0051134d5e187sm973863lfe.249.2024.02.04.13.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 13:57:43 -0800 (PST)
Date: Mon, 5 Feb 2024 00:57:41 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <pn2xm3hecdo3vts7zfrpnd6xh4st6acobwlk6mzj4vvqeivcsl@5q6mrvgrmtti>
References: <20240203053133.1129236-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203053133.1129236-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix a typo of
 register name in DPP safety handling
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

On Sat, Feb 03, 2024 at 01:31:33PM +0800, Furong Xu wrote:
> DDPP is copied from Synopsys Data book:
> 
> DDPP: Disable Data path Parity Protection.
>     When it is 0x0, Data path Parity Protection is enabled.
>     When it is 0x1, Data path Parity Protection is disabled.
> 
> The macro name should be XGMAC_DPP_DISABLE.

Thanks!

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Fixes: 46eba193d04f ("net: stmmac: xgmac: fix handling of DPP safety error for DMA channels")
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 5c67a3f89f08..6a2c7d22df1e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -304,7 +304,7 @@
>  #define XGMAC_TXCEIE			BIT(0)
>  #define XGMAC_MTL_ECC_INT_STATUS	0x000010cc
>  #define XGMAC_MTL_DPP_CONTROL		0x000010e0
> -#define XGMAC_DDPP_DISABLE		BIT(0)
> +#define XGMAC_DPP_DISABLE		BIT(0)
>  #define XGMAC_MTL_TXQ_OPMODE(x)		(0x00001100 + (0x80 * (x)))
>  #define XGMAC_TQS			GENMASK(25, 16)
>  #define XGMAC_TQS_SHIFT			16
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 04d7c4dc2e35..323c57f03c93 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -928,7 +928,7 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  	/* 5. Enable Data Path Parity Protection */
>  	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
>  	/* already enabled by default, explicit enable it again */
> -	value &= ~XGMAC_DDPP_DISABLE;
> +	value &= ~XGMAC_DPP_DISABLE;
>  	writel(value, ioaddr + XGMAC_MTL_DPP_CONTROL);
>  
>  	return 0;
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
