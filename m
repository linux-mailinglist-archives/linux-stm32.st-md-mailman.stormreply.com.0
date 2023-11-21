Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB857F329A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 16:45:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CD5DC6B44B;
	Tue, 21 Nov 2023 15:45:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AEB5C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t92OZKOw/jrPAQGH9Id5OLcQ57oFZcBBd4j/l0YdMEI=; b=zQcVP1tj2x+6QgwU5DhcqEIUQY
 buB/Vaulv/SCpMKjnIBt8ycB21gewTRNGaJirCKmo8W5ZByxhufVBsmGFcptOxIMiosfPQc9fzMVY
 u/btbit81Q8tJPUj1IFDpT1pt7YvkyELqTVNGQRt0lSGBoA42juDjYsO+mx4J6ExZrevfjoZbD4Li
 DTooEckGVI2tSQaSJATq6Z6LXxs4ELmvwPX3id6aKyZIXTLbg/DsHp5zp1hJ5/NSP8aFvrZY/ip/X
 Q2y/T1+duxQsEClo+Sz/zjTseQ1sMP/RsF3P+clz05QsscjBfFhFymXfje9SaWdu4vZYZbsAScJdL
 7juCgNPw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59934)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1r5Sw6-0007Qc-0N;
 Tue, 21 Nov 2023 15:45:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1r5Sw3-0004In-UY; Tue, 21 Nov 2023 15:45:11 +0000
Date: Tue, 21 Nov 2023 15:45:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Tomer Maimon <tmaimon77@gmail.com>
Message-ID: <ZVzQh9ykusyknGgP@shell.armlinux.org.uk>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121151733.2015384-3-tmaimon77@gmail.com>
Cc: tali.perry1@gmail.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, yuenn@google.com,
 joabreu@synopsys.com, joel@jms.id.au, andrew@codeconstruct.com.au,
 devicetree@vger.kernel.org, j.neuschaefer@gmx.net, robh+dt@kernel.org,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
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

On Tue, Nov 21, 2023 at 05:17:33PM +0200, Tomer Maimon wrote:
> Add Nuvoton NPCM BMC SoCs support to STMMAC dwmac driver.
> 
> And modify MAINTAINERS to add a new F: entry for this driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

A few comments on this...

> +#define IND_AC_BA_REG		0x1FE
> +#define SR_MII_CTRL		0x3E0000
> +
> +#define PCS_SR_MII_CTRL_REG	0x0
> +#define PCS_SPEED_SELECT6	BIT(6)
> +#define PCS_AN_ENABLE		BIT(12)
> +#define PCS_SPEED_SELECT13	BIT(13)
> +#define PCS_RST			BIT(15)

include/uapi/linux/mii.h:

#define BMCR_SPEED1000          0x0040  /* MSB of Speed (1000)         */
#define BMCR_ANENABLE           0x1000  /* Enable auto negotiation     */
#define BMCR_SPEED100           0x2000  /* Select 100Mbps              */
#define BMCR_RESET              0x8000  /* Reset to default state      */

Look familiar? Maybe use the standard definitions for a standardised
register?

> +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> +			 struct plat_stmmacenet_data *plat_dat)
> +{
> +	u16 val;
> +
> +	iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> +	val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> +	val |= PCS_RST;
> +	iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> +
> +	while (val & PCS_RST)
> +		val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);

What if the PCS never clears its reset bit? Maybe use
read_poll_timeout() ?

> +
> +	val &= ~(PCS_AN_ENABLE);
> +	iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> +}

Also, maybe it's time to require new stmmac platform support to start
making use of the phylink PCS support rather than continuing to code its
own?

I notice, however, that you always disable inband signalling - please
explain why. Also, what protocol does the PCS use when communicating
with the PHY?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
