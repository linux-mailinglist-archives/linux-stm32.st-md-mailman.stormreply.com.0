Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F535A9B2
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Apr 2021 02:50:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5A40C5718B;
	Sat, 10 Apr 2021 00:50:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67AACC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Apr 2021 00:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50E4E610CB;
 Sat, 10 Apr 2021 00:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618015805;
 bh=hEcu5UgpDUaV8nxve49onnz1+/sBjbrN8vvQuZFAQQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VwxM0DtA3/QOrvAmrWtoFBChFFBgW5WOtg6u8lYj3oVmSxXwfFqg5cyBj1utXuM3o
 620Jim1FGRHFWkDb5NyQs8fQ3iVskLax5Hp7nnkDJLyekfk/GPxyOHf8RFjIy9ySf8
 aDTq/PiKZz7ghvlW9EoJoAqsILG0sEkXIJjNssJsRC3bIREV5nYF/gMdmXJKx35RcQ
 W/UbREFfBcM9JIRbC5cFvfODtpjMygtdMNhf3rmEzUh/MXfYevvyD/S7o/RBhjoegL
 /UbLOVpK3dMui5FAFwTjWKsAgxoxPiG6vNPGtxrUPTRhW3sR86Ikdp+kn5yl+TcU94
 jMAsmq6N+JUjw==
Date: Fri, 9 Apr 2021 17:50:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <20210409175004.2fceacdd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210407170442.1641-1-vee.khee.wong@linux.intel.com>
References: <20210407170442.1641-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

Other than the minor nit below LGTM. Let's give Richard one more day.

On Thu,  8 Apr 2021 01:04:42 +0800 Wong Vee Khee wrote:
> +static void timestamp_interrupt(struct stmmac_priv *priv)
> +{
> +	struct ptp_clock_event event;
> +	unsigned long flags;
> +	u32 num_snapshot;
> +	u32 ts_status;
> +	u32 tsync_int;
> +	u64 ptp_time;
> +	int i;
> +
> +	tsync_int = readl(priv->ioaddr + GMAC_INT_STATUS) & GMAC_INT_TSIE;
> +
> +	if (!tsync_int)
> +		return;
> +
> +	/* Read timestamp status to clear interrupt from either external
> +	 * timestamp or start/end of PPS.
> +	 */
> +	ts_status = readl(priv->ioaddr + GMAC_TIMESTAMP_STATUS);
> +
> +	if (priv->plat->ext_snapshot_en) {

Are you intending to add more code after this if? Otherwise you could
flip the condition and return early instead of having the extra level
of indentation.

> +		num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
> +			       GMAC_TIMESTAMP_ATSNS_SHIFT;
> +
> +		for (i = 0; i < num_snapshot; i++) {
> +			spin_lock_irqsave(&priv->ptp_lock, flags);
> +			get_ptptime(priv->ptpaddr, &ptp_time);
> +			spin_unlock_irqrestore(&priv->ptp_lock, flags);
> +			event.type = PTP_CLOCK_EXTTS;
> +			event.index = 0;
> +			event.timestamp = ptp_time;
> +			ptp_clock_event(priv->ptp_clock, &event);
> +		}
> +	}
> +}

Not really related to this patch but how does stmmac set IRQF_SHARED
and yet not track if it indeed generated the interrupt? Isn't that
against the rules?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
