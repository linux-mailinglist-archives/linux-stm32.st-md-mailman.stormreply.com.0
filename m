Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF135AD7D
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Apr 2021 15:16:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35A3DC5718B;
	Sat, 10 Apr 2021 13:16:20 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E027C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Apr 2021 13:16:17 +0000 (UTC)
IronPort-SDR: 3zJY/zDNwiBduEkDb0xzjUGycCqbatumX2qBRqP0wa503LYbi0DbfMpguHHYQo96RRWGoDYdIc
 glrs2p2FhjWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9950"; a="191782285"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="191782285"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2021 06:16:16 -0700
IronPort-SDR: K9zar4f0vNOGus1eGQXEBDsrvlbQ2NnorowaLzI/5TOGNIA6PF243l/U4Mkiep86Z7go7fx+s8
 60kNxwsxmwgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="388085254"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 10 Apr 2021 06:16:15 -0700
Received: from linux.intel.com (unknown [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 862245808EA;
 Sat, 10 Apr 2021 06:16:12 -0700 (PDT)
Date: Sat, 10 Apr 2021 21:16:09 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20210410131609.GA12931@linux.intel.com>
References: <20210407170442.1641-1-vee.khee.wong@linux.intel.com>
 <20210409175004.2fceacdd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210409175004.2fceacdd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: Add support
 for external trigger timestamping
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

On Fri, Apr 09, 2021 at 05:50:04PM -0700, Jakub Kicinski wrote:
> Other than the minor nit below LGTM. Let's give Richard one more day.
> 
> On Thu,  8 Apr 2021 01:04:42 +0800 Wong Vee Khee wrote:
> > +static void timestamp_interrupt(struct stmmac_priv *priv)
> > +{
> > +	struct ptp_clock_event event;
> > +	unsigned long flags;
> > +	u32 num_snapshot;
> > +	u32 ts_status;
> > +	u32 tsync_int;
> > +	u64 ptp_time;
> > +	int i;
> > +
> > +	tsync_int = readl(priv->ioaddr + GMAC_INT_STATUS) & GMAC_INT_TSIE;
> > +
> > +	if (!tsync_int)
> > +		return;
> > +
> > +	/* Read timestamp status to clear interrupt from either external
> > +	 * timestamp or start/end of PPS.
> > +	 */
> > +	ts_status = readl(priv->ioaddr + GMAC_TIMESTAMP_STATUS);
> > +
> > +	if (priv->plat->ext_snapshot_en) {
> 
> Are you intending to add more code after this if? Otherwise you could
> flip the condition and return early instead of having the extra level
> of indentation.
>

Thanks fo the suggestion.
There's no plan to add more code after this as per STMMAC features that
required this interrupt. I will flip the condition.

> > +		num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
> > +			       GMAC_TIMESTAMP_ATSNS_SHIFT;
> > +
> > +		for (i = 0; i < num_snapshot; i++) {
> > +			spin_lock_irqsave(&priv->ptp_lock, flags);
> > +			get_ptptime(priv->ptpaddr, &ptp_time);
> > +			spin_unlock_irqrestore(&priv->ptp_lock, flags);
> > +			event.type = PTP_CLOCK_EXTTS;
> > +			event.index = 0;
> > +			event.timestamp = ptp_time;
> > +			ptp_clock_event(priv->ptp_clock, &event);
> > +		}
> > +	}
> > +}
> 
> Not really related to this patch but how does stmmac set IRQF_SHARED
> and yet not track if it indeed generated the interrupt? Isn't that
> against the rules?
>

Good point! Thanks for pointing that out. I looked at how STMMAC
interrupt handlers are coded, and indeed there are no tracking. Will
work on that and send as a seperate patch in near future.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
