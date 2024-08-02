Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E599459CF
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 10:23:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC86DC7129D;
	Fri,  2 Aug 2024 08:23:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C103EC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ocBM1K9/X1NEjC6z+jnrLicjhSmeXGMLZSZ4AGPCtSE=; b=Kn7Ndqi2p+R9/chxP+VspXbcKz
 kNYNF6hLTV+l9ivKcO/BUvd4J3xsc71S+I593gOisUtBjpX3Ic6Amc/uKzcBtPhVo1h5Mh03pmWyQ
 e92SkQTpbg6rfzt5IxpSUlMSdEjlDhdWv7iq95u9viAPNOp5P564naSw0ZdUYm7uJVDke1yspqmH1
 mPSO84IFk3JMj+/X0691VjU7yj5bLzN0ACcqculKR1ai+XWDDI0usFRw32w2dGt8yBAlKl4dwa2S1
 /q3bJnTOsGQnmf1/rYUq+udpwYrm3URd/mkpYBNzVSSP0gE1eUhL6Jt8O9gP6yliG2yZPNvfDH0L+
 yeIOSTfg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42218)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sZnZK-0004zr-2x;
 Fri, 02 Aug 2024 09:23:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sZnZO-0007tN-9D; Fri, 02 Aug 2024 09:23:26 +0100
Date: Fri, 2 Aug 2024 09:23:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jitendra.vegiraju@broadcom.com
Message-ID: <ZqyXfonFv1GNlbvK@shell.armlinux.org.uk>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Integrate
 dwxgmac4 into stmmac hwif handling
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

On Thu, Aug 01, 2024 at 08:18:21PM -0700, jitendra.vegiraju@broadcom.com wrote:
> +static u32 stmmac_get_user_version(struct stmmac_priv *priv, u32 id_reg)
> +{
> +	u32 reg = readl(priv->ioaddr + id_reg);
> +
> +	if (!reg) {
> +		dev_info(priv->device, "User Version not available\n");
> +		return 0x0;
> +	}
> +
> +	return (reg & GENMASK(23, 16)) >> 16;

	return FIELD_GET(GENMASK(23, 16), reg);

For even more bonus points, use a #define for the field mask.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
