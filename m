Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842984211C
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 11:21:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8769C6B476;
	Tue, 30 Jan 2024 10:21:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0BE8C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7X7nyoTob837kWWS4ii2spbXx6qHIsfIrrozaG7eBhw=; b=PQtfvQ4HPrhtLZf/ky6DE1d/mi
 6rP+Gbp9/1EAYGUkkbwtIZhlLo3uejAakSHk6CQ5XHEKMmMyxahazloEQ20EE9kr9pgS1kIexNHZi
 m9iC2HgVg9isgFgr/9myEHDJaLrZk40tsCi4Rj9RRQiNfeLqkRno8n5yAXQD8XWCkUuAnfo+v8QEK
 k6kxpsbXuoYnCAUZf7kkwCD9JUMZ+V6vD9ONzN32HmSYdOnQ4qLmzwn/gQGlh+WajsWlWnOXO6bnK
 gV5Biuqx40A9fITUM64AFjqn4F2CRpCgtR/KsRTT88VIcXwmXeMcaBMdH17IFtp6lg2MRlDscceiD
 8ccWrW5w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50698)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rUlF6-0001dH-2d;
 Tue, 30 Jan 2024 10:21:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rUlF1-0005Ql-Cp; Tue, 30 Jan 2024 10:21:19 +0000
Date: Tue, 30 Jan 2024 10:21:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZbjNn+C/VHegH2t7@shell.armlinux.org.uk>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-7-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129130253.1400707-7-yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 06/11] net: stmmac: resetup
 XPCS according to the new interface mode
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

On Mon, Jan 29, 2024 at 09:02:48PM +0800, Choong Yong Liang wrote:
> XPCS creation will map the configuration for the provided interface mode.
> Then XPCS will operate according to the interface mode.
> 
> When the interface mode changes, XPCS is required to map the configuration
> to the new interface mode and destroy the old interface mode where it
> is not in use.
> 
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  7 +++----
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index f155e4841c62..886efd26991e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -357,7 +357,7 @@ enum stmmac_state {
>  int stmmac_mdio_unregister(struct net_device *ndev);
>  int stmmac_mdio_register(struct net_device *ndev);
>  int stmmac_mdio_reset(struct mii_bus *mii);
> -int stmmac_xpcs_setup(struct mii_bus *mii);
> +int stmmac_xpcs_setup(struct mii_bus *mii, phy_interface_t interface);
>  void stmmac_set_ethtool_ops(struct net_device *netdev);
>  
>  int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 00af5a4195fd..50429c985441 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -941,8 +941,17 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
>  {
>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>  
> -	if (priv->hw->xpcs)
> +	if (priv->hw->xpcs) {
> +		if (interface != PHY_INTERFACE_MODE_NA &&
> +		    interface != priv->plat->phy_interface) {
> +			/* When there are major changes, we reconfigure
> +			 * the setup for xpcs according to the interface.
> +			 */
> +			xpcs_destroy(priv->hw->xpcs);
> +			stmmac_xpcs_setup(priv->mii, interface);

NAK. Absolutely not. You haven't read the phylink documentation, nor
understood how phylink works.

Since you haven't read the phylink documentation, I'm not going to
waste any more time reviewing this series since you haven't done your
side of the bargin here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
