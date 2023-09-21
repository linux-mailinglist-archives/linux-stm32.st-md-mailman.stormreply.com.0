Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC5F7A9509
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 16:05:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0259EC6A60C;
	Thu, 21 Sep 2023 14:05:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA345C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y80U+ROzdWFAGesuJv0fAWCJugjaoZUvkVKbCL8UtRM=; b=J1yh53DeBNARTsqqU8MHBzo9Oa
 t0+dRp/RaWdqEqR/zlkiuTCdTMvV7LfZBpgaPOo9mz3Ar25SG5iPMKXPJ1Pakv7POYEio6eyu3imp
 Jue1paSBhwzjv0GVy6aou42CWQp6vSIlPYV8hlPJ5VHamcRnA8qcdTN4cPrFGpVz1BTCn704A78vE
 WKxVrydWMewhT15+u9bny+bRHgeZaaqgcYNfslcWse8SCYpLZxpj04q12Qq2mZevEQIJk5Ji3lybk
 draQ9SuAvOjf/F8wS4j1zOR8oS4A/59eybSt0kjrpVaKBQ211JZ5hMg5lAiocOJweLC8GJ5sJOtgz
 HfWLrfPQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54404)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qjKIb-0004k2-1O;
 Thu, 21 Sep 2023 15:04:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qjKIX-0003an-Lu; Thu, 21 Sep 2023 15:04:53 +0100
Date: Thu, 21 Sep 2023 15:04:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZQxNhYcusHfrJvxM@shell.armlinux.org.uk>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <20230921121946.3025771-4-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921121946.3025771-4-yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, platform-driver-x86@vger.kernel.org,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Jean Delvare <jdelvare@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/5] net: phy: update in-band
 AN mode when changing interface by PHY driver
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

On Thu, Sep 21, 2023 at 08:19:44PM +0800, Choong Yong Liang wrote:
> As there is a mechanism in PHY drivers to switch the PHY interface
> between SGMII and 2500BaseX according to link speed. In this case,
> the in-band AN mode should be switching based on the PHY interface
> as well, if the PHY interface has been changed/updated by PHY driver.
> 
> For e.g., disable in-band AN in 2500BaseX mode, or enable in-band AN
> back for SGMII mode (10/100/1000Mbps).
> 
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

This approach is *going* to break existing setups, sorry.

> +/**
> + * phylink_interface_change() - update both cfg_link_an_mode and
> + * cur_link_an_mode when there is a change in the interface.
> + * @phydev: pointer to &struct phy_device
> + *
> + * When the PHY interface switches between SGMII and 2500BaseX in
> + * accordance with the link speed, the in-band AN mode should also switch
> + * based on the PHY interface
> + */
> +static void phylink_interface_change(struct phy_device *phydev)
> +{
> +	struct phylink *pl = phydev->phylink;
> +
> +	if (pl->phy_state.interface != phydev->interface) {
> +		/* Fallback to the correct AN mode. */
> +		if (phy_interface_mode_is_8023z(phydev->interface) &&
> +		    pl->cfg_link_an_mode == MLO_AN_INBAND) {
> +			pl->cfg_link_an_mode = MLO_AN_PHY;
> +			pl->cur_link_an_mode = MLO_AN_PHY;

1. Why are you changing both cfg_link_an_mode (configured link AN mode)
and cur_link_an_mode (current link AN mode) ?

The "configured" link AN mode is supposed to be whatever was configured
at phylink creation time, and it's never supposed to change. The
"current" link AN mode can change, but changing that must be followed
by a major reconfiguration to ensure everything is correctly setup.
That will happen only because the change to the current link AN mode
can only happen when pl->phy_state.interface has changed, and the
change of pl->phy_state.interface triggers the reconfiguration.

2. You force this behaviour on everyone, so now everyone with a SFP
module that operates in 802.3z mode will be switched out of inband mode
whether they want that or not. This is likely to cause some breakage.

> +		} else if (pl->config->ovr_an_inband) {
> +			pl->cfg_link_an_mode = MLO_AN_INBAND;
> +			pl->cur_link_an_mode = MLO_AN_INBAND;

Here you force inband when not 802.3z mode and ovr_an_inband is set.
There are SFP modules that do *not* support in-band at all, and this
will break these modules when combined with a driver that sets
ovr_an_inband. So more breakage.

Please enumerate the PHY interface modes that you are trying to support
with this patch set, and indicate whether you want in-band for that
mode or not, and where the restriction for whether in-band can be used
comes from (PHY, PCS or MAC) so that it's possible to better understand
what you're trying to achieve.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
