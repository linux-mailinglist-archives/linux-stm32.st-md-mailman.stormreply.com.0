Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A733E08C
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 22:32:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96F1DC57B79;
	Tue, 16 Mar 2021 21:32:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CC51C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 21:32:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F8B264F90;
 Tue, 16 Mar 2021 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615930344;
 bh=A8tS3BLwnxw3/M8kJr1pEOw/ZrskCZFgDoMyFEzKfUM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uIBaYEjHXoV2WZv0Cjk+kpgy2es1yrAwt2Ja7iQO0R0eH8npYVHk1+SLA2VsU/qDn
 n/TqTSMBAdefLX4s58L8SdQhJ/YBy6BERA7zScIb/FFaE54RdW7B3EaALBdi+OSCf2
 5FUbGaw07DRwiL9y6pAViUNpxriH8+1NTfuUBjnr616sh5o2yCobKEs8laSTFr1YLy
 FsaGGDepmh28SB/fnrCGbsE+IUBtIqwOvkz8MhTC6qoURPSa7Ma9clGb4GUgn26aX1
 kM1y1NcKh7FuX0kGqhBluWiKyte/W5M5V8WYIVD5422DtI2x2BDJkhmIBBbQyaF9BP
 csNkFnKDYnS1g==
Date: Tue, 16 Mar 2021 14:32:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Voon Weifeng <weifeng.voon@intel.com>
Message-ID: <20210316143222.74480318@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210316121823.18659-5-weifeng.voon@intel.com>
References: <20210316121823.18659-1-weifeng.voon@intel.com>
 <20210316121823.18659-5-weifeng.voon@intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@st.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND v1 net-next 4/5] stmmac: intel: add
 support for multi-vector msi and msi-x
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

On Tue, 16 Mar 2021 20:18:22 +0800 Voon Weifeng wrote:
> From: Ong Boon Leong <boon.leong.ong@intel.com>
> 
> Intel mgbe controller supports multi-vector interrupts:
> msi_rx_vec	0,2,4,6,8,10,12,14
> msi_tx_vec	1,3,5,7,9,11,13,15
> msi_sfty_ue_vec	26
> msi_sfty_ce_vec	27
> msi_lpi_vec	28
> msi_mac_vec	29
> 
> During probe(), the driver will starts with request allocation for
> multi-vector interrupts. If it fails, then it will automatically fallback
> to request allocation for single interrupts.
> 
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> Co-developed-by: Voon Weifeng <weifeng.voon@intel.com>
> Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>

> +
> +static int stmmac_config_multi_msi(struct pci_dev *pdev,
> +				   struct plat_stmmacenet_data *plat,
> +				   struct stmmac_resources *res)
> +{
> +	int ret;
> +	int i;
> +
> +	ret = pci_alloc_irq_vectors(pdev, 2, STMMAC_MSI_VEC_MAX,
> +				    PCI_IRQ_MSI | PCI_IRQ_MSIX);
> +	if (ret < 0) {
> +		dev_info(&pdev->dev, "%s: multi MSI enablement failed\n",
> +			 __func__);
> +		return ret;
> +	}
> +
> +	if (plat->msi_rx_base_vec >= STMMAC_MSI_VEC_MAX ||
> +	    plat->msi_tx_base_vec >= STMMAC_MSI_VEC_MAX) {
> +		dev_info(&pdev->dev, "%s: Invalid RX & TX vector defined\n",
> +			 __func__);
> +		return -1;

free_irq_vectors?  Or move the check before alloc if possible.

> +	}


> @@ -699,6 +786,19 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
>  		writel(tx_lpi_usec, res.addr + GMAC_1US_TIC_COUNTER);
>  	}
>  
> +	ret = stmmac_config_multi_msi(pdev, plat, &res);
> +	if (!ret)
> +		goto msi_done;

Please don't use gotos where an if statement would do perfectly well.

> +	ret = stmmac_config_single_msi(pdev, plat, &res);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: ERROR: failed to enable IRQ\n",
> +			__func__);
> +		return ret;

return? isn't there some cleanup that needs to happen before exiting?

> +	}
> +
> +msi_done:
> +
>  	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
>  	if (ret) {
>  		pci_free_irq_vectors(pdev);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
