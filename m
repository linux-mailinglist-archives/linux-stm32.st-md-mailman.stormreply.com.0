Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0888E848E4F
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Feb 2024 15:15:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0F60C6B476;
	Sun,  4 Feb 2024 14:15:51 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAE18C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Feb 2024 14:15:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C17ACE0170;
 Sun,  4 Feb 2024 14:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59333C433C7;
 Sun,  4 Feb 2024 14:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707056146;
 bh=JmTkGp8i+vw27c+X20EOYx2e0BmRC9rlkGs/pm+GBV8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vBcdYC6oZ4MQ6fjYbAD2N4VpqR5hsL7ErqO3yCInP/aH16QftZKyMD+JtyzDVere7
 RDMY0koAcQpC1VRDCdbrOUbumH2fulXE6j2ICTgi7u9rLqvpmAZ4JIG5+Nc4JdhSlo
 PfMIZAe6kinODgWG7CxE2r4zI9qPaTxrHkpuuTuZfQ9U1tbKm/+yOk66Ulya5gnFgM
 IJ7gFkIDbgybjayLEhhpmX1wVgbaqcpvVJbKv8/X4BZJQGcCanN4dhWuYAZ5RezB+1
 9ElwnGuyPcxKdo0bLJORQeVZa4i442Bk8vkhDZsN/Sg/9Mcox0E4VgdoBcY08/h9xN
 NvrdpGSbGb6xA==
Date: Sun, 4 Feb 2024 14:15:41 +0000
From: Simon Horman <horms@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20240204141541.GA927333@kernel.org>
References: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
 <20240202-stmmac-axi-config-v2-2-64eab2bab17b@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202-stmmac-axi-config-v2-2-64eab2bab17b@nvidia.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac: Allow
 drivers to provide a default AXI configuration
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

On Fri, Feb 02, 2024 at 12:53:34PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In many cases the AXI configuration can be derived from the compatible
> string, so there's no need to add the configuration to DT. Allow drivers
> to pass in the default AXI configuration so they can be properly set up
> without extra data in DT.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 650ec8d2f5d7..0d5f2cebd6fc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -91,34 +91,49 @@ static int dwmac1000_validate_ucast_entries(struct device *dev,
>   * if required, from device-tree the AXI internal register can be tuned
>   * by using platform parameters.
>   */
> -static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
> +static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev,
> +					   struct stmmac_resources *res)

Hi Thierry,

Please consider adding @res to the kernel doc for stmmac_axi_setup,
just a few lines above this hunk.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
