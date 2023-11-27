Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 800377F9D8F
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 11:32:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32254C6B457;
	Mon, 27 Nov 2023 10:32:16 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C6ABC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 10:32:14 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-50aab0ca90aso5771195e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 02:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701081133; x=1701685933;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6EkO/+jvJxUqXrykI1sSA6OiaE4jGEfZVrMxpcuLqiw=;
 b=NvgTIkzCQ47Z21gEl9CLuy6oysAPOz6aHWuyWQ0Ek5T+xltrLLYN6AIQDVOZ4JVLUF
 9TTOihC4akiC7SDaBCsikEwTmyrIspZPUBib0PanXOEPJn/ryz8nguHMrUaUpc9DyH22
 BUCht6BrTO2LOCIozNdIq3dGkvV11YUcEcdxz66xaWof0l3SFB8zS19YYd0XS3vHbX6i
 STIgY+H8DUq2HY9D/HGU02ouI//uLRY+XpMWROOqDQ+Ka2oVnp274M6x49PRlEDFRXsw
 z2ul45okjfWFLb9v4RPXN5SYNIJhpqCeUJ2RkYy4S77wXElBpBzheQqCMZILY2FUTSkn
 CuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701081133; x=1701685933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6EkO/+jvJxUqXrykI1sSA6OiaE4jGEfZVrMxpcuLqiw=;
 b=GYjPWcoks2NumcBkWl0aepryDSb12XG89SbwmMon88IV7npFUSMyR1gI6M1fYLUdh8
 n3RPoL5+Ln82BcO8TiTm1LP/PdiA+b/QoGUej/TlUScZySK0pFGj0skB6zQK5wAiJiQ+
 GmajIzXGw2nitbDMZLSQNKxVrtWOMGfPgNKD5O0vLn3cPUzq4EgEcSo9Is0vKWvV8EHn
 CzJHCKjm+smf8pkfTsUlxO94QDrZR+6G4WGWt3fSUkTJkRB7FHVX7bxWOVeQn/GjATzW
 VG9vGYbjwWMbWtShb4++azY8PnKPZ7qDA3B33aA/9V4Pmun14s0Tobw9NY06ZR4PfkZd
 YuMQ==
X-Gm-Message-State: AOJu0YznLsUp6ps9nZ2WwSkX/HFh1Pk3i8CjIDaffsNQGn5yZBJ48wmo
 nUcZasY6iuHNhwqnU8RCyYg=
X-Google-Smtp-Source: AGHT+IE3b9c6E7V+MSu9Q2L64S7DO8nOwRZHa34LOV/mGICVyRrnTHJnOY2V9EscGgi3JRfPWtGEdw==
X-Received: by 2002:a05:6512:2343:b0:509:455c:9e3d with SMTP id
 p3-20020a056512234300b00509455c9e3dmr5108404lfu.18.1701081133118; 
 Mon, 27 Nov 2023 02:32:13 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a056512309400b0050aa9cfc238sm1438739lfd.89.2023.11.27.02.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 02:32:12 -0800 (PST)
Date: Mon, 27 Nov 2023 13:32:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <4zucnqqunr6rb6k2g4737ksma4r6q5eizopvmvnmeyrhd4pio2@cism5prdsxmq>
References: <20231125060126.2328690-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231125060126.2328690-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Larysa Zaremba <larysa.zaremba@intel.com>, Joao Pinto <jpinto@synopsys.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: Disable FPE
	MMC interrupts
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

On Sat, Nov 25, 2023 at 02:01:26PM +0800, Furong Xu wrote:
> Commit aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts
> by default") tries to disable MMC interrupts to avoid a storm of
> unhandled interrupts, but leaves the FPE(Frame Preemption) MMC
> interrupts enabled, FPE MMC interrupts can cause the same problem.
> Now we mask FPE TX and RX interrupts to disable all MMC interrupts.
> 
> Fixes: aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts by default")
> Reviewed-by: Larysa Zaremba <larysa.zaremba@intel.com>
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> Changes in v3:
>   - Update commit message, thanks Larysa.
>   - Rename register defines, thanks Serge.

The fix looking good now. Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Changes in v2:
>   - Update commit message, thanks Wojciech and Andrew.
> ---
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> index ea4910ae0921..6a7c1d325c46 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> @@ -177,8 +177,10 @@
>  #define MMC_XGMAC_RX_DISCARD_OCT_GB	0x1b4
>  #define MMC_XGMAC_RX_ALIGN_ERR_PKT	0x1bc
>  
> +#define MMC_XGMAC_TX_FPE_INTR_MASK	0x204
>  #define MMC_XGMAC_TX_FPE_FRAG		0x208
>  #define MMC_XGMAC_TX_HOLD_REQ		0x20c
> +#define MMC_XGMAC_RX_FPE_INTR_MASK	0x224
>  #define MMC_XGMAC_RX_PKT_ASSEMBLY_ERR	0x228
>  #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
>  #define MMC_XGMAC_RX_PKT_ASSEMBLY_OK	0x230
> @@ -352,6 +354,8 @@ static void dwxgmac_mmc_intr_all_mask(void __iomem *mmcaddr)
>  {
>  	writel(0x0, mmcaddr + MMC_RX_INTR_MASK);
>  	writel(0x0, mmcaddr + MMC_TX_INTR_MASK);
> +	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_TX_FPE_INTR_MASK);
> +	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_FPE_INTR_MASK);
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
