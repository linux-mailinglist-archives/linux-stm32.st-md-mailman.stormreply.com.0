Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B95EAD1B716
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 22:38:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6674FC5A4EF;
	Tue, 13 Jan 2026 21:38:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF3A2C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 21:38:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A932960018;
 Tue, 13 Jan 2026 21:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3A9C16AAE;
 Tue, 13 Jan 2026 21:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768340285;
 bh=Ue0kX6WDxmwPMCZ/GKz/k0/R9KvOYfmHiZqM0wnXDGQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HUtJyVo6tFy6D2+6OTOd9Tv6Ujj2G4eqP8Sqsp6CvXxIi0m6pfEMUN9iQxl2niTkb
 MZaA2823gSY+QqfaKURHBIVDbZc6kHXd5Hsqd4GW/aUmuaqZ9Vea7JPQ94ATsXpG+Y
 RAtRBh5tNZx6yt9jD7gISK/kxvrTOs0VHn/zOsN8sEa7+raVMmkzjhQIMdXZS2txTA
 8s2gr8MCbCvgLXZdWwiugtv+zvnvfh45af0wunCFtZQ8R7v9V0Du6A+WQhnk1Yd8oS
 tc7eRpVIAqyjS6oMMCbu1n7emEUzmAUwM2WG51axjcZknTaW+UKkGNvjFyCD2sQYjb
 gaJE9bb5U6EGQ==
Message-ID: <a2dc72ae-0798-4baa-b4d2-fa66c334576a@kernel.org>
Date: Tue, 13 Jan 2026 15:37:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
 <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
 <aV_W2yLmnHrTvbTP@shell.armlinux.org.uk>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <aV_W2yLmnHrTvbTP@shell.armlinux.org.uk>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 bsp-development.geo@leica-geosystems.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/3] net: stmmac: socfpga: add call to
 assert/deassert ahb reset line
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 1/8/26 10:10, Russell King (Oracle) wrote:
> On Thu, Jan 08, 2026 at 07:08:09AM -0600, Dinh Nguyen wrote:
>> The "stmmaceth-ocp" reset line of stmmac controller on the SoCFPGA
>> platform is essentially the "ahb" reset on the standard stmmac
>> controller. But since stmmaceth-ocp has already been introduced into
>> the wild, we cannot just remove support for it. But what we can do is
>> to support both "stmmaceth-ocp" and "ahb" reset names. Going forward we
>> will be using "ahb", but in order to not break ABI, we will be call reset
>> assert/de-assert both ahb and stmmaceth-ocp.
>>
>> The ethernet hardware on SoCFPGA requires either the stmmaceth-ocp or
>> ahb reset to be asserted every time before changing the phy mode, then
>> de-asserted when the phy mode has been set.
> 
> This is not SoCFPGA specific. The dwmac core only samples its
> phy_intf_sel_i signals when coming out of reset, and then latches
> that as the operating mode.
> 
> Currently, the dwmac core driver does not support dynamically changing
> plat_dat->phy_interface at runtime. That may change in the future, but
> as it requires a hardware reset which will clear out the PTP state, it
> would need consideration of that effect.
> 
> The SoCFPGA driver only calls the set_phy_mode() methods from
> socfpga_dwmac_init(), which in turn is called from the plat_dat->init
> hook. This will be called from:
> 
> 1. When stmmac_dvr_probe() is called, prior to allocating any
>     resources, and prior to the core driver's first call to:
>     reset_control_deassert(priv->plat->stmmac_ahb_rst);
> 
> 2. As plat_dat->resume is not populated by the glue driver, the init
>     hook will also be called when resuming from stmmac_resume().
> 
> Lastly, nothing in the main driver corrently writes to ->phy_interface.
> 
> I would like to see the platform glue drivers using more of what is
> in the core driver, rather than re-inventing it, so I support the
> idea of getting rid of dwmac->stmmac_ocp_rst.
> 
> What I suggest is to get rid of dwmac->stmmac_ocp_rst now.
> devm_stmmac_probe_config_dt() will parse the device tree, looking for
> the "ahb" reset, and assigning that to plat->stmmac_ahb_rst. If it
> doesn't exist, then plat->stmmac-ahb_rst will be NULL.
> 
> So, in socfpga_dwmac_probe(), do something like this:
> 
> 	struct reset_control *ocp_rst;
> ...
> 	if (!plat_dat->stmmac_ahb_rst) {
> 		ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
> 		if (IS_ERR(ocp_rst))
> 			return dev_err_probe(dev, PTR_ERR(ocp_rst),
> 					     "failed to get ocp reset");
> 
> 		if (ocp_rst)
> 			dev_warn(dev, "ocp reset is deprecated, please update device tree.\n");
> 
> 		plat_dat->stmmac_ahb_rst = ocp_rst;
> 	}
> 
> Then, change all remaining instances of dwmac->stmmac_ocp_rst to
> dwmac->plat_dat->stmmac_ahb_rst... and job done. You have compatibility
> with device trees that use "ahb", and with device trees that use
> "stmmaceth-ocp".
> 
> Given that struct socfpga_dwmac contains the plat_dat pointer, rather
> than copying plat_dat->stmmac_rst to your private structure, please
> use the one in the plat_dat structure.
> 
> The next question I have is - do you need to assert both the AHB reset
> and stmmac_rst to set the PHY interface mode? I don't see a dependency
> between these two resets in the socfpga code - the driver doesn't treat
> them as nested. It asserts the AHB reset _then_ the stmmac reset, and
> then releases them in the same order rather than reverse order. This
> suggests there's no interdependence between them, and probably it's
> only necessary to assert the stmmac core's reset (stmmac_rst).
> 
> So, maybe the driver can leave the handling of plat_dat->stmmac_ahb_rst
> to the stmmac core code?
> 

Thanks for the suggestion. According to this commit[1], it seems that 
both reset lines need to get toggled. But I'm going to run some test on 
HW and make the appropriate changes.

Dinh

[1] 
https://lore.kernel.org/all/20250205134428.529625725@linuxfoundation.org/

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
