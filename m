Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB4A20C70
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 16:00:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E44BC78026;
	Tue, 28 Jan 2025 15:00:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BE52C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U0y1/5KjujPLLYN0/a/OAGfW6wEftE6jNU0MO4+5f08=; b=bQv7y2Vk//g3H/hdiNSHTo2fkb
 5rkNlvgrieDxx2+XrUXeykAh16ZYPuQonhyRvcDlXZsibeVKZvw2rQ3A5ChZeTW7Dr7a6HXQqgpq0
 M7mg8suoSySCT1qYG1uG5Io1T5I24Ouk19C7lxE/mlrQdHQnnBBMPFWVinUc3qbge6w/C5LkkGbQa
 VnIjA6fBz6nq28N+1C0LEe6Jq12INu+vt++UroH0nqdRrZwFJysb9SkDhcguTxTfn9PBzFSWY45zD
 MTt3IGISTU3pufnRvMhep54CEt8+V4mqWdyWEhat0v3dlLWKeW/jLeI0C8zjY+GetUnXM5jLl/PYc
 zcOGnM0g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58350)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tcn4Q-0007Nk-0L;
 Tue, 28 Jan 2025 15:00:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tcn4I-0002jM-0z;
 Tue, 28 Jan 2025 14:59:58 +0000
Date: Tue, 28 Jan 2025 14:59:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <Z5jw7pUXEoGjLtgP@shell.armlinux.org.uk>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102732epcas5p4618e808063ffa992b476f03f7098d991@epcas5p4.samsung.com>
 <20250128102558.22459-3-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128102558.22459-3-swathi.ks@samsung.com>
Cc: andrew@lunn.ch, jayati.sahu@samsung.com, edumazet@google.com,
 linux-fsd@tesla.com, alim.akhtar@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com, pankaj.dubey@samsung.com,
 krzk@kernel.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ravi.patel@samsung.com,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, rcsekar@samsung.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 2/4] net: stmmac: dwc-qos: Add FSD EQoS
	support
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

On Tue, Jan 28, 2025 at 03:55:56PM +0530, Swathi K S wrote:
> +struct fsd_eqos_plat_data {
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct device *dev;

You only write to this, so it serves no purpose in this patch. Please
remove.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
