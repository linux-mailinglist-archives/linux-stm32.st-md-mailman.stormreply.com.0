Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446950B282
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 10:01:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2E06C6049A;
	Fri, 22 Apr 2022 08:01:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91C76C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=USmguGtRv7OyG/vAnutBvtLlevB2Qy+jsc9UPAQ49fo=; b=l/0DHe7zGO6IzmY4XrVlBXV+ZP
 UIRAGL/FOGkgN8tHZPXIbHwhEaaWdqf6dCjWt1qzpkHq3dfoMaRdw6w1O5bdaeV6LDEtM13EVISPx
 p8cBXMZYzaJT8zdsF81GhzjsZI7O8g951uKy0hdzBUdtbG3wqqIweJpi8Z1Xm2ZjB2EMhkwtUbzHv
 8N5m+ICLj5c0XmmcOjjzEnFKADejHe1LagakFnLt54IS3s6u4wMeB9EM3KB7HcAuZFhw3Od/i+Gs2
 rG4tWNBYVMA7Lk1KQzntKBtsGtlobTTp0hyIv6NZdSxc1wcYe4hBM2SNblrZ3uoFzSk2gpkFHQAR/
 ZaYUDehA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58366)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nhoDg-0004KA-BE; Fri, 22 Apr 2022 09:00:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nhoDZ-0003VE-F0; Fri, 22 Apr 2022 09:00:41 +0100
Date: Fri, 22 Apr 2022 09:00:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <YmJgqSdF7LMxoSXv@shell.armlinux.org.uk>
References: <20220422073505.810084-1-boon.leong.ong@intel.com>
 <20220422073505.810084-2-boon.leong.ong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422073505.810084-2-boon.leong.ong@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] net: pcs: xpcs: add CL37
 1000BASE-X AN support
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

Hi,

On Fri, Apr 22, 2022 at 03:35:02PM +0800, Ong Boon Leong wrote:
> @@ -774,6 +788,58 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs, unsigned int mode)
>  	return ret;
>  }
>  
> +static int xpcs_config_aneg_c37_1000basex(struct dw_xpcs *xpcs, unsigned int mode,
> +					  const unsigned long *advertising)
> +{
> +	int ret, mdio_ctrl;
> +
> +	/* For AN for 1000BASE-X mode, the settings are :-
> +	 * 1) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 0b (Disable C37 AN in case
> +	 *    it is already enabled)
> +	 * 2) VR_MII_AN_CTRL Bit(2:1)[PCS_MODE] = 00b (1000BASE-X C37)
> +	 * 3) SR_MII_AN_ADV Bit(6)[FD] = 1b (Full Duplex)
> +	 *    Note: Half Duplex is rarely used, so don't advertise.
> +	 * 4) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable C37 AN)

So if this function gets called to update the advertisement - even if
there is no actual change - we go through a AN-disable..AN-enable
dance and cause the link to re-negotiate. That doesn't sound like nice
behaviour.

> +	 */
> +	mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL);
> +	if (mdio_ctrl < 0)
> +		return mdio_ctrl;
> +
> +	if (mdio_ctrl & AN_CL37_EN) {
> +		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL,
> +				 mdio_ctrl & ~AN_CL37_EN);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret &= ~DW_VR_MII_PCS_MODE_MASK;
> +	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL, ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_ADVERTISE);
> +	ret |= ADVERTISE_1000XFULL;
> +	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_ADVERTISE, ret);

What if other bits are already set in the MII_ADVERTISE register?
Maybe consider using phylink_mii_c22_pcs_encode_advertisement()?

The pcs_config() method is also supposed to return either a negative
error, 0 for no advertisement change, or positive for an advertisement
change, in which case phylink will trigger a call to pcs_an_restart().

> +static int xpcs_get_state_c37_1000basex(struct dw_xpcs *xpcs,
> +					struct phylink_link_state *state)
> +{
> +	int lpa, adv;
> +	int ret;
> +
> +	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret & AN_CL37_EN) {
> +		/* Reset link_state */
> +		state->link = false;
> +		state->speed = SPEED_UNKNOWN;
> +		state->duplex = DUPLEX_UNKNOWN;
> +		state->pause = 0;

Phylink guarantees that speed, duplex and pause are set to something
sensible - please remove these. The only one you probably need here
is state->link.

> +
> +		lpa = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_LPA);
> +		if (lpa < 0 || lpa & LPA_RFAULT)
> +			return false;

This function does not return a boolean. Returning "false" is the same
as returning 0, which means "no error" but an error has occurred.

> +
> +		adv = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_ADVERTISE);
> +		if (adv < 0)
> +			return false;

Ditto.

> +
> +		if (lpa & ADVERTISE_1000XFULL &&
> +		    adv & ADVERTISE_1000XFULL) {
> +			state->speed = SPEED_1000;
> +			state->duplex = DUPLEX_FULL;
> +			state->link = true;
> +		}
> +
> +		/* Clear CL37 AN complete status */
> +		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	} else {
> +		state->link = true;
> +		state->speed = SPEED_1000;
> +		state->duplex = DUPLEX_FULL;
> +		state->pause = 0;

If we're in AN-disabled mode, phylink will set state->speed and
state->duplex according to the user's parameters, so there should be no
need to do it here.

> @@ -994,9 +1143,21 @@ void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
>  		return xpcs_config_usxgmii(xpcs, speed);
>  	if (interface == PHY_INTERFACE_MODE_SGMII)
>  		return xpcs_link_up_sgmii(xpcs, mode, speed, duplex);
> +	if (interface == PHY_INTERFACE_MODE_1000BASEX)
> +		return xpcs_link_up_1000basex(xpcs, speed, duplex);
>  }
>  EXPORT_SYMBOL_GPL(xpcs_link_up);
>  
> +static void xpcs_an_restart(struct phylink_pcs *pcs)
> +{
> +	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
> +	int ret;
> +
> +	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MDIO_CTRL1);
> +	ret |= BMCR_ANRESTART;
> +	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MDIO_CTRL1, ret);

If xpcs_read() returns an error, we try to write the error back to
the control register? Is that a good idea/

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
