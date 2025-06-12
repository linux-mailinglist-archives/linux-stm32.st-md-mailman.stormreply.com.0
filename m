Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AA8AD7102
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 15:02:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B568BC32E8E;
	Thu, 12 Jun 2025 13:02:27 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F06AFC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 10:58:12 +0000 (UTC)
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8nOrH008416;
 Thu, 12 Jun 2025 03:57:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pfpt0220; bh=RzrmsF3U8d58TCrCiaBdRk3nm
 +8EgVOFqwwqcZbva7c=; b=V1uWe0PrCfmDa/X6zFt+9GUnFC2/hqwnnNlmpX0IJ
 mXM/uDEQrVjekqfTZD5d1yngRZONqPnfFQXygcP39FM1emvq7sWS03IVNQeco5eB
 jB43PDno4RGxw2/iNOfUrt/Tu/9dMmtlDswNO72RBQUq/kpeSppyvWMbd/Lalzib
 EmlZ1jo3epgUEz4HMUDGEton8+9lzUEy6q9OTyWlQtKAoAtTQ3XUIOIOZrdoX9oF
 YGDP7FujsJdqi7cRLJU14qfowMvKLGxZe8eqm7kcexKFZfcdn3/5JmV5lN9EzRQ+
 jH0C45yLcVk7+TZbN2LQRsnJ8aXy9HmjL3efAUscpiBvQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 477ttj8d8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 03:57:56 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 12 Jun 2025 03:57:55 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 12 Jun 2025 03:57:55 -0700
Received: from a5393a930297 (HY-LT91368.marvell.com [10.29.24.116])
 by maili.marvell.com (Postfix) with SMTP id 75A1A3F7044;
 Thu, 12 Jun 2025 03:57:51 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:57:49 +0000
From: Subbaraya Sundeep <sbhatta@marvell.com>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <aEqyrWDPykceDM2x@a5393a930297>
References: <20250612062032.293275-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612062032.293275-1-jonathanh@nvidia.com>
X-Authority-Analysis: v=2.4 cv=FssF/3rq c=1 sm=1 tr=0 ts=684ab2b4 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=Ikd4Dj_1AAAA:8 a=j1aDQpsCGRxs8slw8KsA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: uMA3pJ9d0Kjiajs8b8PSsUwxBvIcSg4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4MyBTYWx0ZWRfXxq1/obkGJyr/
 1Bc/1xofZuyUO/2muYyZEqJYKDzcOmeUBvHiyniZ8Xex2cXo31moCqxdTqIcYXYNhpfBujIm0KU
 UEpbn8hrhwHeq+7o+im+sBLJiKNRpuUomo3/UyL7a8+9jA5NkLp5OWNf+NH0rJtTORPL96szvF3
 40jqF/i7AHRCF/5PC5MHqw24U8GvQjZ4RdsnsgQLIrDCqzEa/5Ywr995vJHfVEAivjhmxngojME
 TFAkVszAYcdJDsNvOywWna4m0gAR8oJOTY0W1mrZfPkrY+POZqVbuOsxWDWJly21AoWxH5XGDvT
 M5NWrwYoncz2tDU3QLp4yTBIBTNPP75vKMuTInlnZZZ885bniUjWtyQwaqPlYEIjWg1Iuh8D4Fz
 paU12PE+2ZblYF+BQbvJuUK8EVUGr6IOqFQcfE7dUPgAeTP97Zf6K/Efz7b6z9N+GHvETVbd
X-Proofpoint-GUID: uMA3pJ9d0Kjiajs8b8PSsUwxBvIcSg4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Mailman-Approved-At: Thu, 12 Jun 2025 13:02:26 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Alexis Lothorrr <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix PTP ref clock for
	Tegra234
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

On 2025-06-12 at 06:20:32, Jon Hunter (jonathanh@nvidia.com) wrote:
> Since commit 030ce919e114 ("net: stmmac: make sure that ptp_rate is not
> 0 before configuring timestamping") was added the following error is
> observed on Tegra234:
> 
>  ERR KERN tegra-mgbe 6800000.ethernet eth0: Invalid PTP clock rate
>  WARNING KERN tegra-mgbe 6800000.ethernet eth0: PTP init failed
> 
> It turns out that the Tegra234 device-tree binding defines the PTP ref
> clock name as 'ptp-ref' and not 'ptp_ref' and the above commit now
> exposes this and that the PTP clock is not configured correctly.
> 
> Ideally, we would rename the PTP ref clock for Tegra234 to fix this but
> this will break backward compatibility with existing device-tree blobs.
> Therefore, fix this by using the name 'ptp-ref' for devices that are
> compatible with 'nvidia,tegra234-mgbe'.
AFAIU for Tegra234 device from the beginning, entry in dts is ptp-ref.
Since driver is looking for ptp_ref it is getting 0 hence the crash
and after the commit 030ce919e114 result is Invalid error instead of crash.
For me PTP is not working for Tegra234 from day 1 so why to bother about
backward compatibility and instead fix dts.
Please help me understand it has been years I worked on dts.

Thanks,
Sundeep
> 
> Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index b80c1efdb323..f82a7d55ea0a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -635,8 +635,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	}
>  	clk_prepare_enable(plat->pclk);
>  
> +	if (of_device_is_compatible(np, "nvidia,tegra234-mgbe"))
> +		plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp-ref");
> +	else
> +		plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
> +
>  	/* Fall-back to main clock in case of no PTP ref is passed */
> -	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
>  	if (IS_ERR(plat->clk_ptp_ref)) {
>  		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
>  		plat->clk_ptp_ref = NULL;
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
