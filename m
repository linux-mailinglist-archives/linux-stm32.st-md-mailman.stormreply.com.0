Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 367AF7A94CE
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 15:29:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4065C6B46C;
	Thu, 21 Sep 2023 13:29:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E065BC6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CC2gkTGhITx2Tkn4hzBnyxcQlVD3H0K9p7hCx7iKc0I=; b=RX/Dh/JlHN7+Dr2mKIx1OHw08j
 abawgMlrvxjDlsbIPFGzplofhq7VcEHhhGFZr5v8TUs2rmkpzNCwTdiU/ex1Izqw2rmGLteOf6T3b
 rafTyBkIl6Vl7p+9BVOfWbBV6ztXErezBRlJ0k1UNn9OTHkTcAr7tQi0CZZ2getl6yCEM4qAHxcUF
 0KrBEHNL0Z7sRA9uEwAO55WvgagpdOLapZsmOUsOq3ojQ/D5eDQ9JBA++gwR1mHYPfVN/hpVeI3CF
 AADotTfqbGiEqrhzLlKFo3aGvIzijqZ5x69wIwORuvfZRHh61rlcTaxBdznV8HpM6ZdVxWJ73Kr2f
 hqa/s60A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56250)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qjJk4-0004de-0F;
 Thu, 21 Sep 2023 14:29:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qjJjc-0003ZN-MP; Thu, 21 Sep 2023 14:28:48 +0100
Date: Thu, 21 Sep 2023 14:28:48 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZQxFEChbKJtsGm2w@shell.armlinux.org.uk>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <20230921121946.3025771-5-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921121946.3025771-5-yong.liang.choong@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/5] net: stmmac: enable Intel
 mGbE 1G/2.5G auto-negotiation support
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

On Thu, Sep 21, 2023 at 08:19:45PM +0800, Choong Yong Liang wrote:
> +#if IS_ENABLED(CONFIG_INTEL_PMC_IPC)

There shouldn't be any need to make this conditional.

> +static int stmmac_mac_prepare(struct phylink_config *config, unsigned int mode,
> +			      phy_interface_t interface)
> +{
> +	struct net_device *ndev = to_net_dev(config->dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	int ret = 0;
> +
> +	priv->plat->phy_interface = interface;
> +
> +	if (priv->plat->config_serdes)
> +		ret = priv->plat->config_serdes(ndev, priv->plat->bsp_priv);

Please call this "phylink_mac_prepare" and pass the parameters that
phylink passes you to this function, so we don't end up at a later
date with people needing to extend this function to do other stuff,
thus repeating mistakes from earlier.

This is what has led to some very yucky code in all those
"fix_mac_speed" implementations, with duplicated data in the BSPs
to get the PHY mode and store it separately, etc.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
