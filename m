Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0E35B5D5
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Apr 2021 17:11:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5ACAC57B6F;
	Sun, 11 Apr 2021 15:11:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37CA9C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Apr 2021 15:10:59 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id h20so5015778plr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Apr 2021 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0zyJmgYFpxkhTs/vyxtcrJtWhM0pW8558w941/ZF9cA=;
 b=dNM/qJPcIvjk2GYrFX+iD68pia86U0nkEur8Znqf0zzxhPwx/6/yF3WVQJV+akOxXa
 6nhsJtBR0s1/Zu2MPgihMZm2c9Jy1dDFL62QlsF3+vZxlna0kSEHlNg9uxgKMfDhnGTV
 vabdloE7g/PGvZ7aTGfFD2mqP8RA2hcvUdYDHX8eMNp9yLYcrWlIz1mzFQ2+K1qS0VTk
 FZbcFFqrQF7x4iplkPjXGIyrdaR8alrZIxBPiMdYMWzwGs19tkscKha3htk5Tx6sDT+C
 3lhi5XRgSbZHcWwX2Q+dU9fW0q5t58naYiSYzle8a4eC0gNwEXarUSPgwqMvwpLeo3qq
 nzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0zyJmgYFpxkhTs/vyxtcrJtWhM0pW8558w941/ZF9cA=;
 b=fi1v2zJY/HSyfIl9dpu79bYPLhYtWG8SuV4iI1TKWtRaxC2ZBcaKrm6nAYOtBds1kP
 ZrqhSfzedqfu4muM/EQfjVZtH30HBmphR7qxvALaJR8pIkYQtuMlHHQicT9z0CNxIXRO
 ZxPT2J3kMIDnXabY3Pfsh4kP8+uemBzpZ1q7ujd2dBOwCBdMCG2r99AcvCY6jvV0Kuz4
 xmVmf2h9JTgyu28eeats26htzPqmDonST62Gt5qInRs8UBdOrcd90IHF4Xce4uAmsgv4
 7H36UjqCX/1RfigPqe2BiqTyy9DM9AOZM5TixlxuP6HtoBVqk3Y6LE8X9tFXjckVC+92
 GwiQ==
X-Gm-Message-State: AOAM532e72Ze5zXRS4lkFc7HwBmFSesuSPcs1mShzrvdLVZBuOvhZVQ1
 /6c9jY3Ck4i96iPjLFTtZzs=
X-Google-Smtp-Source: ABdhPJyxe5QsUTOLJbnqYvFYhhw4EICeQSg4a6tfupQqHJpLeyqg+yKz2Nyebvxe/3ewOWsJ/I0lHg==
X-Received: by 2002:a17:90b:88c:: with SMTP id
 bj12mr22694484pjb.177.1618153857985; 
 Sun, 11 Apr 2021 08:10:57 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:645:c000:35:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id r6sm8355586pgp.64.2021.04.11.08.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 08:10:57 -0700 (PDT)
Date: Sun, 11 Apr 2021 08:10:55 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <20210411151055.GA5719@hoboy.vegasvil.org>
References: <20210411024028.14586-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210411024028.14586-1-vee.khee.wong@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/1] net: stmmac: Add support
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

On Sun, Apr 11, 2021 at 10:40:28AM +0800, Wong Vee Khee wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index 60566598d644..60e17fd24aba 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -296,6 +296,13 @@ static int intel_crosststamp(ktime_t *device,
>  
>  	intel_priv = priv->plat->bsp_priv;
>  
> +	/* Both internal crosstimestamping and external triggered event
> +	 * timestamping cannot be run concurrently.
> +	 */
> +	if (priv->plat->ext_snapshot_en)
> +		return -EBUSY;
> +
> +	mutex_lock(&priv->aux_ts_lock);

Lock, then ...

>  	/* Enable Internal snapshot trigger */
>  	acr_value = readl(ptpaddr + PTP_ACR);
>  	acr_value &= ~PTP_ACR_MASK;
> @@ -321,6 +328,7 @@ static int intel_crosststamp(ktime_t *device,
>  	acr_value = readl(ptpaddr + PTP_ACR);
>  	acr_value |= PTP_ACR_ATSFC;
>  	writel(acr_value, ptpaddr + PTP_ACR);
> +	mutex_unlock(&priv->aux_ts_lock);

unlock, then ...
  
>  	/* Trigger Internal snapshot signal
>  	 * Create a rising edge by just toggle the GPO1 to low
> @@ -355,6 +363,8 @@ static int intel_crosststamp(ktime_t *device,
>  		*system = convert_art_to_tsc(art_time);
>  	}
>  
> +	/* Release the mutex */
> +	mutex_unlock(&priv->aux_ts_lock);

unlock again?  Huh?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index c49debb62b05..abadcd8cdc41 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -239,6 +239,9 @@ struct stmmac_priv {
>  	int use_riwt;
>  	int irq_wake;
>  	spinlock_t ptp_lock;
> +	/* Mutex lock for Auxiliary Snapshots */
> +	struct mutex aux_ts_lock;

In the comment, please be specific about which data are protected.
For example:

	/* Protects auxiliary snapshot registers from concurrent access. */

> @@ -163,6 +166,43 @@ static void get_ptptime(void __iomem *ptpaddr, u64 *ptp_time)
>  	*ptp_time = ns;
>  }
>  
> +static void timestamp_interrupt(struct stmmac_priv *priv)
> +{
> +	struct ptp_clock_event event;
> +	unsigned long flags;
> +	u32 num_snapshot;
> +	u32 ts_status;
> +	u32 tsync_int;

Please group same types together (u32) in a one-line list.

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

Reading this register has a side effect of clearing status?  If so,
doesn't it need protection against concurrent access?

The function, intel_crosststamp() also reads this bit.

> +	if (!priv->plat->ext_snapshot_en)
> +		return;

Doesn't this test come too late?  Setting ts_status just cleared the
bit used by the other code path.

> +	num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
> +		       GMAC_TIMESTAMP_ATSNS_SHIFT;
> +
> +	for (i = 0; i < num_snapshot; i++) {
> +		spin_lock_irqsave(&priv->ptp_lock, flags);
> +		get_ptptime(priv->ptpaddr, &ptp_time);
> +		spin_unlock_irqrestore(&priv->ptp_lock, flags);
> +		event.type = PTP_CLOCK_EXTTS;
> +		event.index = 0;
> +		event.timestamp = ptp_time;
> +		ptp_clock_event(priv->ptp_clock, &event);
> +	}
> +}
> +

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index b164ae22e35f..d668c33a0746 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -135,9 +135,13 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
>  {
>  	struct stmmac_priv *priv =
>  	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
> +	void __iomem *ptpaddr = priv->ptpaddr;
> +	void __iomem *ioaddr = priv->hw->pcsr;
>  	struct stmmac_pps_cfg *cfg;
>  	int ret = -EOPNOTSUPP;
>  	unsigned long flags;
> +	u32 intr_value;
> +	u32 acr_value;

Please group same types together.

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
