Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA77F7A00
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 18:03:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54953C6B47A;
	Fri, 24 Nov 2023 17:03:49 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1904C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 17:03:47 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-507cd62472dso3291344e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 09:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700845427; x=1701450227;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EKb6+bJzwF1yVBhWWW80XyJQx4h4KUg59OSYpW9sau0=;
 b=N913Vmx3ipcB1u24mEfxiT3ijAhRRRzHh0rKpCdYHjOuv6rKxhBefj5a3HYx2fuzyi
 9CoaFOgrulUtLFl3fKF3SFiPqNA1g/LNHi9dbB55B/GQe48V6Bol8cfKkeEK4hwlpbuy
 EpK85GsyMDD9jUPgOpVEQWnL5z1PcDOFhJfWpFJqmx9k+YhIwQNSLNms4OujtG7ynyZJ
 /TuW3T1LZVOpi4EKTfz7Z4aDTkuZXKZxLafltKJEVZjVPFrpEtMMz1tJ+bfIFXBiUPU0
 TG/KbkQUWYCjVxRcsRhTJ2WjWWYFY/D30rCwIql8I2UChToaYli+FPidMYTHqPidQLRF
 kVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700845427; x=1701450227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKb6+bJzwF1yVBhWWW80XyJQx4h4KUg59OSYpW9sau0=;
 b=KJia6s61Fy/L3R7ul5JuK3Df1eA/fs/OIMReu7AgXC2juEh3MhoqzwljwYBPo3A8vx
 3GSxQa6Tg1uZRWSjj4UIERn9r0J9oT8xjZwsNN8VhZRVBg26tH8/jHKIoEjl0wnlb7QY
 XEwZ7y/AXajN1WSInjJK6zgCwxSGDhrSP2B9NdrAfHtqp6kDIDaBy5jf04PTw9P1fsIA
 oSlp6eU8xJ5SJvmVEYvgTne//2j9B+b8vc6hdHGYfsoiJ85ywSrMuXnj5bfu/o/722tC
 e+kp0pUxzwbE9AYL/b1j7qfOqY8GArqls4ZUyT0P0GeVSk5p7zhnX7yLGO936TlgYLgl
 EjvA==
X-Gm-Message-State: AOJu0YznJFtE1AMwzvWcwsYFyte/wSZv+GfYGcuBUy04A0N52cKA3KtL
 8IewVwcLgEtV/Vr3MGB6vSM=
X-Google-Smtp-Source: AGHT+IEtnKziwkAifA6Pi4ayVnqNFBNuXRhrHhPsgP/A1MkmG9je86T4pW16Mqx5OkVnvjGwh+QKVQ==
X-Received: by 2002:ac2:43a6:0:b0:50a:a8d4:25f9 with SMTP id
 t6-20020ac243a6000000b0050aa8d425f9mr2118002lfl.12.1700845426591; 
 Fri, 24 Nov 2023 09:03:46 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a056512250700b005094928cf75sm556137lfb.142.2023.11.24.09.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 09:03:46 -0800 (PST)
Date: Fri, 24 Nov 2023 20:03:43 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <b5f6l7oovk67efxeo4pyxg5kx3we4jcemmrakat5dypec4rav2@l3bvlos5rred>
References: <20231124015433.2223696-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124015433.2223696-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: xgmac: Disable
	FPE MMC interrupts
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

On Fri, Nov 24, 2023 at 09:54:33AM +0800, Furong Xu wrote:
> Commit aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts
> by default") tries to disable MMC interrupts to avoid a storm of
> unhandled interrupts, but leaves the FPE(Frame Preemption) MMC
> interrupts enabled.
> Now we mask FPE TX and RX interrupts to disable all MMC interrupts.
> 
> Fixes: aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts by default")
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> Changes in v2:
>   - Update commit message, thanks Wojciech and Andrew.
> ---
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> index ea4910ae0921..cdd7fbde2bfa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> @@ -177,8 +177,10 @@
>  #define MMC_XGMAC_RX_DISCARD_OCT_GB	0x1b4
>  #define MMC_XGMAC_RX_ALIGN_ERR_PKT	0x1bc
>  

> +#define MMC_XGMAC_FPE_TX_INTR_MASK	0x204
>  #define MMC_XGMAC_TX_FPE_FRAG		0x208
>  #define MMC_XGMAC_TX_HOLD_REQ		0x20c
> +#define MMC_XGMAC_FPE_RX_INTR_MASK	0x224

Could you please preserve the local implicit naming convention of
having the Tx_ and RX_ prefixes being placed before the rest of
CSR-specific name part:
#define MMC_XGMAC_TX_FPE_INTR_MASK
instead of
#define MMC_XGMAC_FPE_TX_INTR_MASK
and
#define MMC_XGMAC_RX_FPE_INTR_MASK
instead of
#define MMC_XGMAC_FPE_RX_INTR_MASK

Your macros will then look similar to MMC_XGMAC_TX_*, MMC_XGMAC_RX_*
and finally MMC_XGMAC_RX_IPC_INTR_MASK macros.

-Serge(y)

>  #define MMC_XGMAC_RX_PKT_ASSEMBLY_ERR	0x228
>  #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
>  #define MMC_XGMAC_RX_PKT_ASSEMBLY_OK	0x230
> @@ -352,6 +354,8 @@ static void dwxgmac_mmc_intr_all_mask(void __iomem *mmcaddr)
>  {
>  	writel(0x0, mmcaddr + MMC_RX_INTR_MASK);
>  	writel(0x0, mmcaddr + MMC_TX_INTR_MASK);
> +	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_TX_INTR_MASK);
> +	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_RX_INTR_MASK);
>  	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_IPC_INTR_MASK);
>  }
>  
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
