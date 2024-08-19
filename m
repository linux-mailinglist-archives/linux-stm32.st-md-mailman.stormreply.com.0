Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C44C95694D
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 13:31:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDD1CC6DD94;
	Mon, 19 Aug 2024 11:31:15 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2BB7C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 11:31:08 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a83869373b6so413127766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 04:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724067068; x=1724671868;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ItBsaYaUYukKcs9mT8FxS4IiWnVvJXNxy3plA4auI4E=;
 b=kn+aaraTm146kNVPDpwK1i+8vdbuan0PeUKNT38Ihlw0EYXBlY+NbFmxGHKfOMK/Gf
 6qfITFrkRaBbz1tIaV6mjuQipZl+ym/Xh2UgXTNxYzs9f3E+kpimBaIockS2IIKGmKcF
 AnZu5ordb0Cj/ydDZjQLYay7Fw1WjB4LC1/h990t8FDNJP7sjCVugbngZqwqKNfdjkQj
 Ia9AcjrENoUQy5sAMDSU1Uec+MPaCXhCbUfX7jekC9wQXlZ858V2xNOHaH5D8KB69cAk
 jg8mOMAQscqbn3znudAK/Uu3AkQyvPAaQhMO70uMs8qPBk1H3lhanlXeyXIOhIr/B72a
 REkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724067068; x=1724671868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ItBsaYaUYukKcs9mT8FxS4IiWnVvJXNxy3plA4auI4E=;
 b=BL3p3zSpYpUkTzZaGGhKCOm8Kyo2fWkT8ZeR62zF2O3DFdoQ/I00jyAxdA9pV4L+Uz
 sr47c3yFGOQWaI8p1sKdjpn5ELqms8owyvTw0JOtCOF3BKXFxxUF1PbEsrtmvDXHIjAU
 VELr3I4Irl9GDPR41YW/aaESuEpTV511C1TCx8cf4iDQLDTEU9qoamSHCjks5kK0dPPh
 6VLEw2vlNXRw0c/wFeZRFu7VL1xIXU+cZMdBhYpM0G+ca/eApEkA8Yjovu/R9oqTiAXS
 AtS7bzOT7BBd3d8HqoO9DieSN+H0ClF2H2C4vbvwi4FsYU0Tc1UdUVZ6mIdlhlcACc1q
 MkLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfpaLEUGgoZPQOmnrQzIvbikUpbJsAWfF5xv5qr1UJp6g1a/27t4PvLffZv+CwHQ9Z9eaRV6cfbLZbSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxa+ZdGwifgJEBo6M5/A2eyPC4CltAIkvvCldwsvTpQ+45IPw83
 iu702TnaRHFOQnImsDRlpgK8LymG/c/R5CX8Wkmuj16p9jTCHmHG
X-Google-Smtp-Source: AGHT+IFw0X4PENWMjfNydLGal6c4vATRAbYzFtb8Tgkf8ezeSAUXVubLDH1teEvaB26Birvnfb9xyA==
X-Received: by 2002:a17:907:f794:b0:a72:aeff:dfed with SMTP id
 a640c23a62f3a-a83929f124bmr748465066b.53.1724067067348; 
 Mon, 19 Aug 2024 04:31:07 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383934564sm619890466b.126.2024.08.19.04.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:31:06 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:31:04 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240819113104.u2v5s4tdfac2kqbj@skbuf>
References: <cover.1724051326.git.0x1207@gmail.com>
 <c9da02a6376f1e85a11631a5ccf47dbdf24c7618.1724051326.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9da02a6376f1e85a11631a5ccf47dbdf24c7618.1724051326.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/7] net: stmmac: refactor FPE
 verification processe
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

Interesting spelling of "process" in the title.

On Mon, Aug 19, 2024 at 03:25:16PM +0800, Furong Xu wrote:
> Drop driver defined stmmac_fpe_state, and switch to common
> ethtool_mm_verify_status for local TX verification status.
> 
> Local side and remote side verification processes are completely
> independent. There is no reason at all to keep a local state and
> a remote state.
> 
> Add a spinlock to avoid races among ISR, workqueue, link update
> and register configuration.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  20 +--
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 169 +++++++++---------
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   6 -
>  3 files changed, 97 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 2c2181febb39..cb54f65753b2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -146,14 +146,6 @@ struct stmmac_channel {
>  	u32 index;
>  };
>  
> -/* FPE link state */
> -enum stmmac_fpe_state {
> -	FPE_STATE_OFF = 0,
> -	FPE_STATE_CAPABLE = 1,
> -	FPE_STATE_ENTERING_ON = 2,
> -	FPE_STATE_ON = 3,
> -};
> -
>  /* FPE link-partner hand-shaking mPacket type */
>  enum stmmac_mpacket_type {
>  	MPACKET_VERIFY = 0,
> @@ -166,10 +158,10 @@ enum stmmac_fpe_task_state_t {
>  };
>  
>  struct stmmac_fpe_cfg {
> -	bool enable;				/* FPE enable */
> -	bool hs_enable;				/* FPE handshake enable */
> -	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
> -	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
> +	bool pmac_enabled;			/* see ethtool_mm_state */
> +	bool verify_enabled;			/* see ethtool_mm_state */
> +	u32 verify_time;			/* see ethtool_mm_state */
> +	enum ethtool_mm_verify_status status;
>  	u32 fpe_csr;				/* MAC_FPE_CTRL_STS reg cache */
>  };
>  
> @@ -366,6 +358,10 @@ struct stmmac_priv {
>  	struct workqueue_struct *wq;
>  	struct work_struct service_task;
>  
> +	/* Serialize access to MAC Merge state between ethtool requests
> +	 * and link state updates.
> +	 */
> +	spinlock_t mm_lock;

Given that it protects members of struct stmmac_fpe_cfg, would it make
sense for it to be placed in that structure instead? fpe_cfg->lock.

>  	struct stmmac_fpe_cfg fpe_cfg;
>  
>  	/* Workqueue for handling FPE hand-shaking */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3072ad33b105..628354f60c54 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -969,17 +969,21 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
>  static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> -	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
> -	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
> -	bool *hs_enable = &fpe_cfg->hs_enable;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->mm_lock, flags);
>  
> -	if (is_up && *hs_enable) {
> +	if (!fpe_cfg->pmac_enabled)
> +		goto __unlock_out;
> +
> +	if (is_up && fpe_cfg->verify_enabled)
>  		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
>  					MPACKET_VERIFY);
> -	} else {
> -		*lo_state = FPE_STATE_OFF;
> -		*lp_state = FPE_STATE_OFF;
> -	}
> +	else
> +		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
> +
> +__unlock_out:
> +	spin_unlock_irqrestore(&priv->mm_lock, flags);
>  }
>  
>  static void stmmac_mac_link_down(struct phylink_config *config,
> @@ -3533,9 +3537,19 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  
>  	stmmac_set_hw_vlan_mode(priv, priv->hw);
>  
> -	if (priv->dma_cap.fpesel)
> +	if (priv->dma_cap.fpesel) {
>  		stmmac_fpe_start_wq(priv);
>  
> +		/* phylink and irq are not enabled yet,
> +		 * mm_lock is unnecessary here.
> +		 */
> +		stmmac_fpe_configure(priv, priv->ioaddr,
> +				     &priv->fpe_cfg,
> +				     priv->plat->tx_queues_to_use,
> +				     priv->plat->rx_queues_to_use,
> +				     false);

This is probably unintended, but &priv->fpe_cfg has just been zeroed out
earlier by __stmmac_open().

> +	}
> +
>  	return 0;
>  }
>  
> @@ -3978,6 +3992,12 @@ static int __stmmac_open(struct net_device *dev,
>  		}
>  	}
>  
> +	/* phylink and irq are not enabled yet, mm_lock is unnecessary here */
> +	priv->fpe_cfg.pmac_enabled = false;
> +	priv->fpe_cfg.verify_time = 128; /* ethtool_mm_state.max_verify_time */
> +	priv->fpe_cfg.verify_enabled = false;
> +	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
> +

stmmac_set_mm() can be called before __stmmac_open(), which is entirely
legal. You'd be overwriting the configuration made by the user in that
case. Same is true for the snippet below from stmmac_release().
Personally I think work items should be put on the fpe_wq only when
netif_running() and during __stmmac_open(), but configuration changes
should also be accepted while down. Maybe this also implies that during
stmmac_get_mm() and stmmac_set_mm() it must temporarily use
pm_runtime_resume_and_get() and pm_runtime_put(), and get whatever
clocks are necessary for the registers to be accessible.

>  	ret = stmmac_hw_setup(dev, true);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> @@ -4091,11 +4111,19 @@ static int stmmac_release(struct net_device *dev)
>  
>  	stmmac_release_ptp(priv);
>  
> -	pm_runtime_put(priv->device);
> -
> -	if (priv->dma_cap.fpesel)
> +	if (priv->dma_cap.fpesel) {
>  		stmmac_fpe_stop_wq(priv);
>  
> +		/* phylink and irq have already disabled,
> +		 * mm_lock is unnecessary here.
> +		 */
> +		priv->fpe_cfg.pmac_enabled = false;
> +		priv->fpe_cfg.verify_enabled = false;
> +		priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
> +	}
> +
> +	pm_runtime_put(priv->device);
> +
>  	return 0;
>  }
>  
> @@ -5979,44 +6007,34 @@ static int stmmac_set_features(struct net_device *netdev,
>  static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> -	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
> -	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
> -	bool *hs_enable = &fpe_cfg->hs_enable;
>  
> -	if (status == FPE_EVENT_UNKNOWN || !*hs_enable)
> -		return;
> +	spin_lock(&priv->mm_lock);
>  
> -	/* If LP has sent verify mPacket, LP is FPE capable */
> -	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER) {
> -		if (*lp_state < FPE_STATE_CAPABLE)
> -			*lp_state = FPE_STATE_CAPABLE;
> +	if (!fpe_cfg->pmac_enabled || status == FPE_EVENT_UNKNOWN)
> +		goto __unlock_out;
>  
> -		/* If user has requested FPE enable, quickly response */
> -		if (*hs_enable)
> -			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> -						fpe_cfg,
> -						MPACKET_RESPONSE);
> -	}
> +	/* LP has sent verify mPacket */
> +	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER)
> +		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> +					MPACKET_RESPONSE);
>  
> -	/* If Local has sent verify mPacket, Local is FPE capable */
> -	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER) {
> -		if (*lo_state < FPE_STATE_CAPABLE)
> -			*lo_state = FPE_STATE_CAPABLE;
> -	}
> +	/* Local has sent verify mPacket */
> +	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER &&
> +	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED)
> +		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_VERIFYING;
>  
> -	/* If LP has sent response mPacket, LP is entering FPE ON */
> +	/* LP has sent response mPacket */
>  	if ((status & FPE_EVENT_RRSP) == FPE_EVENT_RRSP)
> -		*lp_state = FPE_STATE_ENTERING_ON;
> -
> -	/* If Local has sent response mPacket, Local is entering FPE ON */
> -	if ((status & FPE_EVENT_TRSP) == FPE_EVENT_TRSP)
> -		*lo_state = FPE_STATE_ENTERING_ON;
> +		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED;
>  
>  	if (!test_bit(__FPE_REMOVING, &priv->fpe_task_state) &&
>  	    !test_and_set_bit(__FPE_TASK_SCHED, &priv->fpe_task_state) &&
>  	    priv->fpe_wq) {
>  		queue_work(priv->fpe_wq, &priv->fpe_task);
>  	}
> +
> +__unlock_out:
> +	spin_unlock(&priv->mm_lock);
>  }
>  
>  static void stmmac_common_interrupt(struct stmmac_priv *priv)
> @@ -7372,50 +7390,47 @@ int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
>  	return ret;
>  }
>  
> -#define SEND_VERIFY_MPAKCET_FMT "Send Verify mPacket lo_state=%d lp_state=%d\n"
> -static void stmmac_fpe_lp_task(struct work_struct *work)
> +static void stmmac_fpe_verify_task(struct work_struct *work)
>  {
>  	struct stmmac_priv *priv = container_of(work, struct stmmac_priv,
>  						fpe_task);
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> -	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
> -	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
> -	bool *hs_enable = &fpe_cfg->hs_enable;
> -	bool *enable = &fpe_cfg->enable;
> -	int retries = 20;
> -
> -	while (retries-- > 0) {
> -		/* Bail out immediately if FPE handshake is OFF */
> -		if (*lo_state == FPE_STATE_OFF || !*hs_enable)
> +	int verify_limit = 3; /* defined by 802.3 */
> +	unsigned long flags;
> +
> +	while (1) {
> +		msleep(fpe_cfg->verify_time);
> +

Sleep for 1 ms without having done anything prior?

> +		if (!netif_running(priv->dev))
>  			break;
>  
> -		if (*lo_state == FPE_STATE_ENTERING_ON &&
> -		    *lp_state == FPE_STATE_ENTERING_ON) {
> -			stmmac_fpe_configure(priv, priv->ioaddr,
> -					     fpe_cfg,
> -					     priv->plat->tx_queues_to_use,
> -					     priv->plat->rx_queues_to_use,
> -					     *enable);
> +		spin_lock_irqsave(&priv->mm_lock, flags);

Thanks for reconsidering the locking.

Unless I'm missing something, it would be good to read fpe_cfg->verify_time
also under the lock. You can save it to a temporary local variable, then
release the lock and go to sleep (waiting for the IRQ to change the FPE
state).

Note that in between fpe_task sleeps, the user could in theory also
change the FPE configuration. I think that in stmmac_set_mm() you should
wait for the fpe_task that's currently in progress to finish, in order
not to change its state from one spin_lock_irqsave() to another.
flush_workqueue() should help with this - but needs to be done without
holding the mm_lock.

>  
> -			netdev_info(priv->dev, "configured FPE\n");
> +		if (fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_DISABLED ||
> +		    fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED ||
> +		    !fpe_cfg->pmac_enabled || !fpe_cfg->verify_enabled) {
> +			spin_unlock_irqrestore(&priv->mm_lock, flags);
> +			break;
> +		}
>  
> -			*lo_state = FPE_STATE_ON;
> -			*lp_state = FPE_STATE_ON;
> -			netdev_info(priv->dev, "!!! BOTH FPE stations ON\n");
> +		if (verify_limit == 0) {
> +			fpe_cfg->verify_enabled = false;
> +			fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
> +			stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> +					     priv->plat->tx_queues_to_use,
> +					     priv->plat->rx_queues_to_use,
> +					     false);
> +			spin_unlock_irqrestore(&priv->mm_lock, flags);
>  			break;
>  		}
>  
> -		if ((*lo_state == FPE_STATE_CAPABLE ||
> -		     *lo_state == FPE_STATE_ENTERING_ON) &&
> -		     *lp_state != FPE_STATE_ON) {
> -			netdev_info(priv->dev, SEND_VERIFY_MPAKCET_FMT,
> -				    *lo_state, *lp_state);
> -			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> -						fpe_cfg,
> +		if (fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_VERIFYING)
> +			stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
>  						MPACKET_VERIFY);
> -		}
> -		/* Sleep then retry */
> -		msleep(500);
> +
> +		spin_unlock_irqrestore(&priv->mm_lock, flags);
> +
> +		verify_limit--;
>  	}
>  
>  	clear_bit(__FPE_TASK_SCHED, &priv->fpe_task_state);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
