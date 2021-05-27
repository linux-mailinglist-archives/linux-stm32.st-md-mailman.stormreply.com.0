Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3B393940
	for <lists+linux-stm32@lfdr.de>; Fri, 28 May 2021 01:27:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFDDFC5718D;
	Thu, 27 May 2021 23:27:03 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C603EC424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 23:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=V4zv3tSkdbMop+5uGd/UYZ83LvN67WaQLJjf/Sfs61c=; b=wfg5R/awrSnPY8Z3K82p/HpQWQ
 xBCMpn9ez3I0ku46o+cZcHLYuTdsqW5LRQxNw7axDWNcBaYkKH8kxFmyEo2QFJxmee576Yy3magKK
 gTmPjvjNh5S4dDSI/kEfoa4TwI5x3VZNSax1/jXMI83knJ1YlI86T/Rsw6OzyAy/3UUg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lmPOg-006eAY-7v; Fri, 28 May 2021 01:26:38 +0200
Date: Fri, 28 May 2021 01:26:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <YLAqrte9qwQ/64BI@lunn.ch>
References: <20210527092415.25205-1-michael.wei.hong.sit@intel.com>
 <20210527092415.25205-3-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527092415.25205-3-michael.wei.hong.sit@intel.com>
Cc: Jose.Abreu@synopsys.com, vee.khee.wong@linux.intel.com,
 linux-kernel@vger.kernel.org, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, tee.min.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, boon.leong.ong@intel.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: pcs: add 2500BASEX
 support for Intel mGbE controller
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

> +static int xpcs_config_2500basex(struct mdio_xpcs_args *xpcs)
> +{
> +	int ret;
> +
> +		ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1);
> +		if (ret < 0)
> +			return ret;
> +		ret |= DW_VR_MII_DIG_CTRL1_2G5_EN;
> +		ret &= ~DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW;
> +		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1, ret);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL);
> +		if (ret < 0)
> +			return ret;
> +		ret &= ~AN_CL37_EN;
> +		ret |= SGMII_SPEED_SS6;
> +		ret &= ~SGMII_SPEED_SS13;
> +		return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL, ret);
> +
> +	return 0;

Indentation is messed up here? Or a rebase gone wrong removing an if
statement?

	    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
