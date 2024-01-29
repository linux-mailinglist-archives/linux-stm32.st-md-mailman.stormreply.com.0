Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FD840742
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:41:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99B46C6A613;
	Mon, 29 Jan 2024 13:41:59 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11723C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=p8iz8UHzQ67utsCq6pzEtf5vnFHnxs2dHAkgKZcozJE=; b=4toPmIrwbTb6LGQNgb70Hp7k57
 EU2YoN7SuDLwqLn8YJyiQ1wp9fpelF/3tZ0Wau7QZWYxLYRPkGawKvnlXdq4gNl/8Rb1E9EERToex
 bnzINlpiQJx9x3gIeUFCChZ2AwLd/BoKGWH/19mW5T2PK6hTROpBhH4O3QNckmNF0ZLM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rURt7-006Nmb-Tt; Mon, 29 Jan 2024 14:41:25 +0100
Date: Mon, 29 Jan 2024 14:41:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <07a4aa8e-800c-4564-81c8-7cfcdddf1379@lunn.ch>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <20230921121946.3025771-5-yong.liang.choong@linux.intel.com>
 <jmq54bskx4zd75ay4kf5pcdo6wnz72pxzfo5ivevleef4scucr@uw4fkfs64f3c>
 <26568944-563d-4911-8f6f-14c0162db6e9@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26568944-563d-4911-8f6f-14c0162db6e9@linux.intel.com>
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Jean Delvare <jdelvare@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On Mon, Jan 29, 2024 at 09:19:58PM +0800, Choong Yong Liang wrote:
> > >   static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
> > >   	.mac_select_pcs = stmmac_mac_select_pcs,
> > >   	.mac_config = stmmac_mac_config,
> > >   	.mac_link_down = stmmac_mac_link_down,
> > >   	.mac_link_up = stmmac_mac_link_up,
> > > +#if IS_ENABLED(CONFIG_INTEL_PMC_IPC)
> > > +	.mac_prepare = stmmac_mac_prepare,
> > > +#endif
> > 
> > Please no for the platform-specific ifdef's in the generic code.
> > STMMAC driver is already overwhelmed with clumsy solutions. Let's not
> > add another one.
> > 
> > -Serge(y)
> > 
> > >   };
> > >   /**
> > > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > > index c0079a7574ae..aa7d4d96391c 100644
> > > --- a/include/linux/stmmac.h
> > > +++ b/include/linux/stmmac.h
> > > @@ -275,6 +275,7 @@ struct plat_stmmacenet_data {
> > >   	int (*serdes_powerup)(struct net_device *ndev, void *priv);
> > >   	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
> > >   	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
> > > +	int (*config_serdes)(struct net_device *ndev, void *priv);
> > >   	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
> > >   	int (*init)(struct platform_device *pdev, void *priv);
> > >   	void (*exit)(struct platform_device *pdev, void *priv);
> > > -- 
> > > 2.25.1
> > > 
> > > 
> Hi Russell and Serge,
> 
> Thank you for pointing that out.
> The ifdef was removed and the config serdes will be implemented in
> mac_link_up in the new patch series.

Hi Choong

Please trim the text when replying. It can be hard to find actually
replies when having to do lots and lots of page downs. Just give the
context needed to understand your reply.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
