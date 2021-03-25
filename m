Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 650BD348BFB
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 09:59:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18822C58D5C;
	Thu, 25 Mar 2021 08:59:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1516EC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YSMq9K94SLMNFk6Q3E9dbxOo81Ihzvj6PbV9ppKeRHo=; b=mL5eEQ85y+GHxmHEaDsecPFYY
 m5ssBOR51oWbueT4dvzHRMp4WWe2Y30EgpGawMsc3VkUxA6MQUuNLdvroWpddKI9TCEgKEXVn4moz
 yWup6vpz185Wzn8rSeFuXsf6BabGxj7WjrttETRAwKvdvhwQr6RSfD29jp5Sj62JaFCCrBMDs4ckA
 RIVTzKtdIj7f5+lZrb1L2os+5sUScVkacrjqLvVJVBIGGWA+Nsq7hSm/Wy7E9ooTSIghJU1KnMoub
 0q3ZpOQC+DKE22yELVoUgBEZbiFeCksnutuNBhkp8yu+tX5+sKyDhxkQeq176RUGXQoJP3ewweLr/
 vU6XWMdqA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51708)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lPLpa-0001Sm-Nv; Thu, 25 Mar 2021 08:59:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lPLpX-0005t4-2i; Thu, 25 Mar 2021 08:59:03 +0000
Date: Thu, 25 Mar 2021 08:59:03 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <20210325085902.GK1463@shell.armlinux.org.uk>
References: <20210325083806.19382-1-michael.wei.hong.sit@intel.com>
 <20210325083806.19382-3-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325083806.19382-3-michael.wei.hong.sit@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: andrew@lunn.ch, kim.tatt.chuah@intel.com, fugang.duan@nxp.com,
 alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, qiangqing.zhang@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net: pcs: configure xpcs
	2.5G speed mode
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

On Thu, Mar 25, 2021 at 04:38:06PM +0800, Michael Sit Wei Hong wrote:
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 12a047d47dec..c95dfe4e5310 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -290,6 +290,8 @@ static int phylink_parse_mode(struct phylink *pl, struct fwnode_handle *fwnode)
>  
>  		switch (pl->link_config.interface) {
>  		case PHY_INTERFACE_MODE_SGMII:
> +			phylink_set(pl->supported, 2500baseT_Full);
> +			fallthrough;

This is wrong. "SGMII" here means 1G SGMII. See the documentation in
Documentation/networking/phy.rst.

If we want to have this at 2.5G speed, then we need a separate
enumeration for that mode, just like we make a distinction between
1000BASE-X and 2500BASE-X.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
