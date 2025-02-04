Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F6A27982
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2025 19:13:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07CB6C78F83;
	Tue,  4 Feb 2025 18:13:57 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF334C78F7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2025 18:13:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C4A70A42B86;
 Tue,  4 Feb 2025 18:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9007BC4CEDF;
 Tue,  4 Feb 2025 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738692827;
 bh=Dj4jkBKmFAE3YgshnrDJ3jVrrrueVT1kGYUMcy1Yj58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fPf68PZsXMszTHlDPMN4gJh22izWzBAeDTVr+R75uw5SpOCE7nyP7DSBMSD8VBoug
 xyGPevgIj6fO7uivU6QaxLaepHYCFRk1Ch9w6yIwioDcspIQO7q5BjCe3EVylSpmcQ
 sr+MfO9gZl2/My2GFjNVU5js/P2aKsmgQxTaKkfRJO4BoeDkDEjgm0vVfUuepplqRg
 SjR2l9LABZOGAKgfquPBx80QqoSWYfqgWb6oFkD5Dia0KL9HiQqKt0LhVro3k2/B3c
 b1tDqHuxFaBByQxrJKFuw7o2oIUmYFCigfn6mrJO+YYuIeXBfkGUwhqugC9G4h/bxi
 4AqqyVo3Yjb/g==
Date: Tue, 4 Feb 2025 18:13:39 +0000
From: Simon Horman <horms@kernel.org>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <20250204181339.GM234677@kernel.org>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v6 4/7] stmmac: intel: configure
 SerDes according to the interface mode
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

On Tue, Feb 04, 2025 at 02:10:17PM +0800, Choong Yong Liang wrote:
> Intel platform will configure the SerDes through PMC api based on the
> provided interface mode.
> 
> This patch adds several new functions below:-
> - intel_tsn_lane_is_available(): This new function reads FIA lane
>   ownership registers and common lane registers through IPC commands
>   to know which lane the mGbE port is assigned to.
> - intel_config_serdes(): To configure the SerDes based on the assigned
>   lane and latest interface mode, it sends IPC command to the PMC through
>   PMC driver/API. The PMC acts as a proxy for R/W on behalf of the driver.
> - intel_set_reg_access(): Set the register access to the available TSN
>   interface.
> 
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

...

> +static int intel_config_serdes(struct net_device *ndev,
> +			       void *intel_data,
> +			       phy_interface_t interface)
> +{
> +	struct intel_priv_data *intel_priv = intel_data;
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	int ret = 0;
> +
> +	if (!intel_tsn_lane_is_available(ndev, intel_priv)) {
> +		netdev_info(priv->dev,
> +			    "No TSN lane available to set the registers.\n");
> +		goto pmc_read_error;
> +	}
> +
> +	if (intel_priv->pid_modphy == PID_MODPHY1) {
> +		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
> +			ret = intel_set_reg_access(pid_modphy1_2p5g_regs,
> +						   ARRAY_SIZE(pid_modphy1_2p5g_regs));
> +		} else {
> +			ret = intel_set_reg_access(pid_modphy1_1g_regs,
> +						   ARRAY_SIZE(pid_modphy1_1g_regs));
> +		}
> +	} else {
> +		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
> +			ret = intel_set_reg_access(pid_modphy3_2p5g_regs,
> +						   ARRAY_SIZE(pid_modphy3_2p5g_regs));
> +		} else {
> +			ret = intel_set_reg_access(pid_modphy3_1g_regs,
> +						   ARRAY_SIZE(pid_modphy3_1g_regs));
> +		}
> +	}
> +
> +	priv->plat->phy_interface = interface;
> +
> +	if (ret < 0)
> +		goto pmc_read_error;

Perhaps this is an artifact of earlier refactoring,
but the condition above seems to be without meaning
as in either case the code goes directly to pmc_read_error.

> +
> +pmc_read_error:
> +	intel_serdes_powerdown(ndev, intel_priv);
> +	intel_serdes_powerup(ndev, intel_priv);
> +
> +	return ret;
> +}
> +
>  static void common_default_data(struct plat_stmmacenet_data *plat)
>  {
>  	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
