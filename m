Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D583AB9C
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 15:25:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C20AC6B444;
	Wed, 24 Jan 2024 14:25:37 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD64CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 14:25:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-50f11e3ba3aso8122883e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 06:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706106335; x=1706711135;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ojxeaViB6pLAJ/Tfy0YrKqXrdt1fiDqjnZZPco7s5Fg=;
 b=ewueBtq9jb0/neFKPq1jJOZaoC36OPozi0aIUZNhq68vFm6AySubbCyg9N8HdZfe9J
 JHDegU8uBt2asQgkrOAy2ifJy31z9ysPl14cS1mnTZc/qUmrn3iovGULPGrQa3XRoMPl
 7ia0Nbs+XEV6ptjmAI9MYZ+wAc/QA7BRGak+9fbw3y1E5H4D5rh3+KYE6FDVbwuSTMMO
 SqGzA+qgOSonyJ0CvuvSnvG5KWAyofySGIVd7CYJA+2jBRqHBPVz4ymQ8XuzltOVB8t8
 15eW/cTGM67ZEidU3Nh3/5654Ca/JdSI072UepwPRBKH2ovBLoUXM9NYTSQSOeahRBRJ
 1cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706106335; x=1706711135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojxeaViB6pLAJ/Tfy0YrKqXrdt1fiDqjnZZPco7s5Fg=;
 b=fxEui91ZmGOY1u9rSQQa58j1QjPUj1lwD+BgV/bdok3AMpaAxY1se4R2H4o+B2ODPK
 ++LnhibBDzlN2kTLJalHekeGbggJD2sEpIqFUcDbV+N1wmOCEnuRpadwqzJQduv7AroT
 QqH+rgrWssm4VuFQQnSLp0nvd9791yULjg2T6CKWVULOISikVEv1T+qBn8Dc9OP+JrGc
 3S92S1LQWVHXpLSFwfK5PjVG6I4/KGqldsM5vADO77Io+Ve3/xpWo5Azg9MTtd+B36qk
 3nHkCMjOU7Ixhl9Zkf6SGO+ZsZExIOaneOmlErcpuIedCH+6J2w4yru30G2MO3Y68RDS
 y2ew==
X-Gm-Message-State: AOJu0YyJnF0WxAbdEDkFjdradOQj5Az2tyw8UbLSin9IZ01aHQnye0Tr
 qNV/UjcntxT8Ii+uKwGZjT1YkDtAVxj4LFb+j8eHNdCOMujJeUoN
X-Google-Smtp-Source: AGHT+IHZppZBPpxX7hjhZ7O8ug4KnGQsVC8AN7TdTefrgFlvP30wVj6eWIswTHqQKGcYw9kXPrw9eA==
X-Received: by 2002:a05:6512:32c2:b0:50e:7d27:f930 with SMTP id
 f2-20020a05651232c200b0050e7d27f930mr4450478lfg.29.1706106334687; 
 Wed, 24 Jan 2024 06:25:34 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a19ca08000000b005100cb8395esm308291lfg.15.2024.01.24.06.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 06:25:32 -0800 (PST)
Date: Wed, 24 Jan 2024 17:25:27 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <ii3muj3nmhuo6s5hm3g7wuiubtyzr632klrcesubtuaoyifogb@ohmunpxvdtsv>
References: <20240123085037.939471-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123085037.939471-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix safety error
	descriptions
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

On Tue, Jan 23, 2024 at 04:50:37PM +0800, Furong Xu wrote:
> Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> XGMAC core") prints safety error descriptions when safety error assert,
> but missed some special errors, and mixed correctable errors and
> uncorrectable errors together.
> This patch complete the error code list and print the type of errors.

The XGMAC ECC Safety code has likely been just copied from the DW GMAC
v5 (DW QoS Eth) part. So this change is partly relevant to that code too. I
can't confirm that the special errors support is relevant to the DW
QoS Eth too (it likely is though), so what about splitting this patch
up into two:
1. Elaborate the errors description for DW GMAC v5 and DW XGMAC.
2. Add new ECC safety errors support.
?

On the other hand if we were sure that both DW QoS Eth and XGMAC
safety features implementation match the ideal solution would be to
refactor out the common code into a dedicated module.

-Serge(y)

> 
> Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 36 +++++++++----------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index eb48211d9b0e..ad812484059e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -748,29 +748,29 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
>  }
>  
>  static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {
> -	{ true, "TXCES", "MTL TX Memory Error" },
> +	{ true, "TXCES", "MTL TX Memory Correctable Error" },
>  	{ true, "TXAMS", "MTL TX Memory Address Mismatch Error" },
> -	{ true, "TXUES", "MTL TX Memory Error" },
> +	{ true, "TXUES", "MTL TX Memory Uncorrectable Error" },
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */
> -	{ true, "RXCES", "MTL RX Memory Error" },
> +	{ true, "RXCES", "MTL RX Memory Correctable Error" },
>  	{ true, "RXAMS", "MTL RX Memory Address Mismatch Error" },
> -	{ true, "RXUES", "MTL RX Memory Error" },
> +	{ true, "RXUES", "MTL RX Memory Uncorrectable Error" },
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */
> -	{ true, "ECES", "MTL EST Memory Error" },
> +	{ true, "ECES", "MTL EST Memory Correctable Error" },
>  	{ true, "EAMS", "MTL EST Memory Address Mismatch Error" },
> -	{ true, "EUES", "MTL EST Memory Error" },
> +	{ true, "EUES", "MTL EST Memory Uncorrectable Error" },
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 11 */
> -	{ true, "RPCES", "MTL RX Parser Memory Error" },
> +	{ true, "RPCES", "MTL RX Parser Memory Correctable Error" },
>  	{ true, "RPAMS", "MTL RX Parser Memory Address Mismatch Error" },
> -	{ true, "RPUES", "MTL RX Parser Memory Error" },
> +	{ true, "RPUES", "MTL RX Parser Memory Uncorrectable Error" },
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 15 */
> -	{ false, "UNKNOWN", "Unknown Error" }, /* 16 */
> -	{ false, "UNKNOWN", "Unknown Error" }, /* 17 */
> -	{ false, "UNKNOWN", "Unknown Error" }, /* 18 */
> +	{ true, "SCES", "MTL SGF GCL Memory Correctable Error" },
> +	{ true, "SAMS", "MTL SGF GCL Memory Address Mismatch Error" },
> +	{ true, "SUES", "MTL SGF GCL Memory Uncorrectable Error" },
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 19 */
> -	{ false, "UNKNOWN", "Unknown Error" }, /* 20 */
> -	{ false, "UNKNOWN", "Unknown Error" }, /* 21 */
> -	{ false, "UNKNOWN", "Unknown Error" }, /* 22 */
> +	{ true, "RXFCES", "MTL RXF Memory Correctable Error" },
> +	{ true, "RXFAMS", "MTL RXF Memory Address Mismatch Error" },
> +	{ true, "RXFUES", "MTL RXF Memory Uncorrectable Error" },
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 23 */
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 24 */
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 25 */
> @@ -796,13 +796,13 @@ static void dwxgmac3_handle_mtl_err(struct net_device *ndev,
>  }
>  
>  static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
> -	{ true, "TCES", "DMA TSO Memory Error" },
> +	{ true, "TCES", "DMA TSO Memory Correctable Error" },
>  	{ true, "TAMS", "DMA TSO Memory Address Mismatch Error" },
> -	{ true, "TUES", "DMA TSO Memory Error" },
> +	{ true, "TUES", "DMA TSO Memory Uncorrectable Error" },
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */
> -	{ true, "DCES", "DMA DCACHE Memory Error" },
> +	{ true, "DCES", "DMA DCACHE Memory Correctable Error" },
>  	{ true, "DAMS", "DMA DCACHE Address Mismatch Error" },
> -	{ true, "DUES", "DMA DCACHE Memory Error" },
> +	{ true, "DUES", "DMA DCACHE Memory Uncorrectable Error" },
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 8 */
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 9 */
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
