Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B91356E65
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 16:21:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4936C5719D;
	Wed,  7 Apr 2021 14:21:24 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2FE3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 14:21:23 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lU93N-00FJmV-5Z; Wed, 07 Apr 2021 16:21:09 +0200
Date: Wed, 7 Apr 2021 16:21:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <YG2/1fbNNIsbafZp@lunn.ch>
References: <20210407141537.2129-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407141537.2129-1-vee.khee.wong@linux.intel.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add support for
 external trigger timestamping
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

On Wed, Apr 07, 2021 at 10:15:37PM +0800, Wong Vee Khee wrote:
> From: Tan Tee Min <tee.min.tan@intel.com>
> 
> The Synopsis MAC controller supports auxiliary snapshot feature that
> allows user to store a snapshot of the system time based on an external
> event.
> 
> This patch add supports to the above mentioned feature. Users will be
> able to triggered capturing the time snapshot from user-space using
> application such as testptp or any other applications that uses the
> PTP_EXTTS_REQUEST ioctl request.

You forgot to Cc: the PTP maintainer.

> @@ -159,6 +163,37 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
>  					     priv->systime_flags);
>  		spin_unlock_irqrestore(&priv->ptp_lock, flags);
>  		break;
> +	case PTP_CLK_REQ_EXTTS:
> +		priv->plat->ext_snapshot_en = on;
> +		mutex_lock(&priv->aux_ts_lock);
> +		acr_value = readl(ptpaddr + PTP_ACR);
> +		acr_value &= ~PTP_ACR_MASK;
> +		if (on) {
> +			/* Enable External snapshot trigger */
> +			acr_value |= priv->plat->ext_snapshot_num;
> +			acr_value |= PTP_ACR_ATSFC;
> +			pr_info("Auxiliary Snapshot %d enabled.\n",
> +				priv->plat->ext_snapshot_num >>
> +				PTP_ACR_ATSEN_SHIFT);

dev_dbg()?

> +			/* Enable Timestamp Interrupt */
> +			intr_value = readl(ioaddr + GMAC_INT_EN);
> +			intr_value |= GMAC_INT_TSIE;
> +			writel(intr_value, ioaddr + GMAC_INT_EN);
> +
> +		} else {
> +			pr_info("Auxiliary Snapshot %d disabled.\n",
> +				priv->plat->ext_snapshot_num >>
> +				PTP_ACR_ATSEN_SHIFT);

dev_dbg()?

Do you really want to spam the kernel log with this?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
