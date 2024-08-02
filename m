Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A19459CA
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 10:22:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFA75C7129D;
	Fri,  2 Aug 2024 08:22:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D096C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cVA3KSjGKzz0infH/ajrMtNFEZmegRydGsvJox3T7UY=; b=a7YhIvz/hBRIRY22EVQeDn5Gsw
 wXaTKPqm/II4v6VQuG8sPopnBLFqEofucrqiXtYwz//X7XZs7KkOUA7yuZ+mWGLdHmkE7Tm5aVG4I
 f052rARoqoQCcDLgIhxCsEQ+mx801ewgCrN10FjJwbw7KeJqrgywOo0PErsxzpHkXgl/wxuKsIH6j
 yKcMAZHSzBqgsL39kbtHHTUE2jsS06fqkOMeHtHm8k7L7n2Ie6rWiqn2kgF/wMmKBXCV65SUd3OF7
 KfQjbpbWTK84mO3z5U/cLuHyF+CHYpYPTztqKFxCZfgTx972S8MxFIF2AfuED0e2QdvDsyR9Lmoj2
 aehXoxxw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38364)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sZnXe-0004yQ-2X;
 Fri, 02 Aug 2024 09:21:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sZnXf-0007tF-JT; Fri, 02 Aug 2024 09:21:39 +0100
Date: Fri, 2 Aug 2024 09:21:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jitendra.vegiraju@broadcom.com
Message-ID: <ZqyXE0XJkn+Of6rR@shell.armlinux.org.uk>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] net: stmmac: Add basic
 dwxgmac4 support to stmmac core
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

On Thu, Aug 01, 2024 at 08:18:20PM -0700, jitendra.vegiraju@broadcom.com wrote:
> +static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel)
> +{
> +	u32 reg_val = 0;
> +	u32 val = 0;

val is unnecessary.

> +
> +	reg_val |= mode << XGMAC4_MSEL_SHIFT & XGMAC4_MODE_SELECT;

Consider using:

	reg_val |= FIELD_PREP(XGMAC4_MODE_SELECT, mode);

and similarly everywhere else you use a shift and mask. With this, you
can remove _all_ _SHIFT definitions in your header file.

> +	reg_val |= channel << XGMAC4_AOFF_SHIFT & XGMAC4_ADDR_OFFSET;
> +	reg_val |= XGMAC4_CMD_TYPE | XGMAC4_OB;
> +	writel(reg_val, ioaddr + XGMAC4_DMA_CH_IND_CONTROL);
> +	val = readl(ioaddr + XGMAC4_DMA_CH_IND_DATA);
> +	return val;

	return readl(ioaddr + XGMAC4_DMA_CH_IND_DATA);

...

> +void dwxgmac4_dma_init(void __iomem *ioaddr,
> +		       struct stmmac_dma_cfg *dma_cfg, int atds)
> +{
> +	u32 value;
> +	u32 i;
> +
> +	value = readl(ioaddr + XGMAC_DMA_SYSBUS_MODE);
> +
> +	if (dma_cfg->aal)
> +		value |= XGMAC_AAL;
> +
> +	if (dma_cfg->eame)
> +		value |= XGMAC_EAME;

What if dma_cfg doesn't have these bits set? Is it possible they will be
set in the register?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
