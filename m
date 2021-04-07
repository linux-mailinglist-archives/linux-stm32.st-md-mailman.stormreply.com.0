Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBDE35726D
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 18:54:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24A4EC5719D;
	Wed,  7 Apr 2021 16:54:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE8B1CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 16:54:15 +0000 (UTC)
IronPort-SDR: Kljc1LemzYletb8rSXNqYKMNMmk+prBYff/bfrb+WBO3vB14HTRjUAi+oy0SPZf/+5BI1u9tNL
 /WgXFY2UQ+wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="191190969"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="191190969"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 09:54:13 -0700
IronPort-SDR: 2a8Kf6WaNd/0kxyeCZqP4ukkq0OmJunrLAZ3NAgBJ+INoMBdilDMdz2NV0XM/GzRMyIYk3jRsG
 wXeqclFq4xGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="530272883"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 07 Apr 2021 09:54:13 -0700
Received: from linux.intel.com (unknown [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7BE2E5805A1;
 Wed,  7 Apr 2021 09:54:10 -0700 (PDT)
Date: Thu, 8 Apr 2021 00:54:07 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210407165407.GA27820@linux.intel.com>
References: <20210407141537.2129-1-vee.khee.wong@linux.intel.com>
 <YG2/1fbNNIsbafZp@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG2/1fbNNIsbafZp@lunn.ch>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Wed, Apr 07, 2021 at 04:21:09PM +0200, Andrew Lunn wrote:
> On Wed, Apr 07, 2021 at 10:15:37PM +0800, Wong Vee Khee wrote:
> > From: Tan Tee Min <tee.min.tan@intel.com>
> > 
> > The Synopsis MAC controller supports auxiliary snapshot feature that
> > allows user to store a snapshot of the system time based on an external
> > event.
> > 
> > This patch add supports to the above mentioned feature. Users will be
> > able to triggered capturing the time snapshot from user-space using
> > application such as testptp or any other applications that uses the
> > PTP_EXTTS_REQUEST ioctl request.
> 
> You forgot to Cc: the PTP maintainer.
>

Will Cc Richard Cochran on v2.
 
> > @@ -159,6 +163,37 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
> >  					     priv->systime_flags);
> >  		spin_unlock_irqrestore(&priv->ptp_lock, flags);
> >  		break;
> > +	case PTP_CLK_REQ_EXTTS:
> > +		priv->plat->ext_snapshot_en = on;
> > +		mutex_lock(&priv->aux_ts_lock);
> > +		acr_value = readl(ptpaddr + PTP_ACR);
> > +		acr_value &= ~PTP_ACR_MASK;
> > +		if (on) {
> > +			/* Enable External snapshot trigger */
> > +			acr_value |= priv->plat->ext_snapshot_num;
> > +			acr_value |= PTP_ACR_ATSFC;
> > +			pr_info("Auxiliary Snapshot %d enabled.\n",
> > +				priv->plat->ext_snapshot_num >>
> > +				PTP_ACR_ATSEN_SHIFT);
> 
> dev_dbg()?
> 
> > +			/* Enable Timestamp Interrupt */
> > +			intr_value = readl(ioaddr + GMAC_INT_EN);
> > +			intr_value |= GMAC_INT_TSIE;
> > +			writel(intr_value, ioaddr + GMAC_INT_EN);
> > +
> > +		} else {
> > +			pr_info("Auxiliary Snapshot %d disabled.\n",
> > +				priv->plat->ext_snapshot_num >>
> > +				PTP_ACR_ATSEN_SHIFT);
> 
> dev_dbg()?
> 
> Do you really want to spam the kernel log with this?
>

Thanks for the review.
I will switch this to netdev_dbg().
 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
