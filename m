Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21596DADF
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 15:54:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A983C78013;
	Thu,  5 Sep 2024 13:54:53 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D13BC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 13:54:46 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-535be0a9b9bso132377e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725544485; x=1726149285;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j72SRMwZbgesZJhHX6WjWoZslyaQOKCacKBuJblmEuE=;
 b=cdLTr/PggFjoyT/P7KqYofQCH3wMckiaa2SjIXrFCmEE5ESwDGT1TPYshntzZ9XUez
 gE/4mtBNG/oH4RYsgrIj6aFINhssJiAUo8foQoqIoSdeQYvDb6FaZIgRl1rQ32bhb9cY
 fRWRqoQe1ThchGg57Qadj13JWIvD2a/ym9pXKIOM4IBkTnqyyxuRWppKeywkJa9TfO2i
 4Vg1U55r9vSYSeYc5BGxNrZGCd+XbVXsPYG7mCoFVO7XCDxKRaV2jhahbM7/mh1DxGZo
 RLlbI1D49q/To7tWFucM3BtTNo+lL5CmfX4+LvJ/muXoH7nRvcmGaHfP8w92FBoytkMD
 uWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725544485; x=1726149285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j72SRMwZbgesZJhHX6WjWoZslyaQOKCacKBuJblmEuE=;
 b=LGQILLxv7QXt3HTIlHsm5aEPbWXbY/611LcTVC3egqXc8cRmCxcf3v1yTJZ4wWZ9aB
 TLiSk9i8nMnQI1wEQMbASss8O/6EXEL2Qs03Pom8Lmv4viqQQs1+xvzAfZYh8opSAkJ8
 /SgJJahVcaeNG21MWPE7A4p4cGzu2rD7ApYxrSQD6u9kq8SuLwGxqPMh1GabyYcl73zO
 0YZT1SA1JjGFVKlR3adOJnItI6Ojq1xwRpu9n5DIruLDtkEgIblBAANM2b+o1U9azxMr
 ShY5xEA00DoGHQly68gvtFPuLpGERbT/98K2xAgf4TFphLy6MQwUXs+WjqghPADuW9OQ
 T04w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDDsZkgqG5asJJ8A7InAbPmeUEWtRQZ01VVowWCE3qsd5v1K9Wqe+DuXiPEsRGcw4g2s6eYjKuYYGGjA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDT133RH8yZsUXlHr7jl+CH0npFgk/pplHElTM+Kt0VpFq5Xk0
 fr20SKEjZjzFBxT5UrLBRG6yhB2s9TQhIMN+I2jREmG1Q27Jm+zP
X-Google-Smtp-Source: AGHT+IEGHceBUm9ge3LWUoJ0fD0Z2UOrlf5AZ1gk7JTSUBOffG9cHqN+jDgXYhMUztM4Iwbd35KQOw==
X-Received: by 2002:ac2:5695:0:b0:536:54df:c000 with SMTP id
 2adb3069b0e04-53654dfc031mr481122e87.8.1725544484197; 
 Thu, 05 Sep 2024 06:54:44 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a7c662bcdsm33568166b.34.2024.09.05.06.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 06:54:43 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:54:40 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240905135440.hcgbva7fzic2x4ps@skbuf>
References: <cover.1725518135.git.0x1207@gmail.com>
 <0b72fd0463b662796fd3eaa996211f1a5d0a4341.1725518135.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b72fd0463b662796fd3eaa996211f1a5d0a4341.1725518135.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 3/7] net: stmmac: refactor FPE
 verification process
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

On Thu, Sep 05, 2024 at 03:02:24PM +0800, Furong Xu wrote:
> +void stmmac_fpe_apply(struct stmmac_priv *priv)
> +{
> +	struct ethtool_mm_state *state = &priv->fpe_cfg.state;
> +	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> +
> +	/* If verification is disabled, configure FPE right away.
> +	 * Otherwise let the timer code do it.
> +	 */
> +	if (!state->verify_enabled) {
> +		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> +				     priv->plat->tx_queues_to_use,
> +				     priv->plat->rx_queues_to_use,
> +				     state->tx_enabled,
> +				     state->pmac_enabled);
> +	} else {
> +		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
> +		fpe_cfg->verify_retries = STMMAC_FPE_MM_MAX_VERIFY_RETRIES;
> +
> +		if (netif_device_present(priv->dev) && netif_running(priv->dev))
> +			stmmac_fpe_verify_timer_arm(fpe_cfg);
> +	}
>  }

In the cover letter, you say:

  2. check netif_running() to guarantee synchronization rules between
  mod_timer() and timer_delete_sync()

[ by the way, it would be nice if you could list the changes in
  individual patches as well ]

but I guess this helps with something other than what you say it helps
with.

netif_running() essentially checks that __dev_open() has been called,
aka "ip link set dev eth0 up". And I don't see the ethtool_ops :: begin()
implemented by the driver any longer, so I think you've done this in
order to accept stmmac_set_mm() calls even before the netdev has been
brought operationally up. Okay.

As for netif_device_present(), I don't know, maybe the intention was to
suppress stmmac_set_mm() calls made after stmmac_suspend(). But
ethnl_ops_begin() has its own netif_device_present() call, so I'm not
sure why it is needed - they should already be suppressed.

But in v7, I was thinking about the concurrency issues here:

static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
			 struct netlink_ext_ack *extack)
{
	/* Wait for the verification that's currently in progress to finish */
	del_timer_sync(&fpe_cfg->verify_timer);

								<- Concurrent code can run here:
								   stmmac_fpe_link_state_handle(),
								   called from phylink_resolve()
								   workqueue context, rtnl_lock()
								   not held.

	spin_lock_irqsave(&fpe_cfg->lock, flags);
	stmmac_fpe_apply(priv);
	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
}

static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
{
	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
	unsigned long flags;

	timer_delete_sync(&fpe_cfg->verify_timer);

								<- Concurrent code can run here:
								   stmmac_set_mm()

	spin_lock_irqsave(&fpe_cfg->lock, flags);

	if (is_up && fpe_cfg->state.pmac_enabled) {
		/* VERIFY process requires pmac enabled when NIC comes up */
		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
				     priv->plat->tx_queues_to_use,
				     priv->plat->rx_queues_to_use,
				     false, true);

		/* New link => maybe new partner => new verification process */
		stmmac_fpe_apply(priv);
	} else {
		/* No link => turn off EFPE */
		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
				     priv->plat->tx_queues_to_use,
				     priv->plat->rx_queues_to_use,
				     false, false);
	}

	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
}

[ oh btw, you forgot to replace the del_timer_sync() instance from
  stmmac_set_mm() to timer_delete_sync() ]

Because the timer can be restarted right after the timer_delete_sync()
call, this is a half-baked implementation.

I think at the end of the day, we need to ask ourselves: what is the
timer_delete_sync() call even supposed to accomplish? What if the verify
timer is allowed to run concurrently with us changing the settings?

Well, for example, if it runs concurrently with
stmmac_fpe_link_state_handle(is_down==false), it will not learn that the
link is down, it will send an MPACKET_VERIFY, get no response, and fail.
So, not very bad.

And the other way around: stmmac_set_mm() stops the verify timer, but
the link comes up, the timer is armed with the old settings, it does
whatever (succeeds, fails), and only afterwards does stmmac_set_mm()
manage to grab &fpe_cfg->lock, change the settings to the new ones, and
re-trigger the verify timer once again, if needed.

So bottom line, I think timer_delete_sync() is to avoid some useless
work, but otherwise, it is not critical to have it. The choice is
between removing the timer_delete_sync() calls from these 2 functions
altogether, or implementing an actually effective mechanism to stop the
timer for a while.

I _think_ that the simplest way to stop it is to hold one more lock for
the verify_timer when we call timer_delete_sync() and stmmac_fpe_verify_timer_arm(),
lock which _is_ IRQ-safe, unlike &fpe_cfg->lock.

static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
			 struct netlink_ext_ack *extack)
{
	spin_lock(&fpe_cfg->verify_timer_lock);

	timer_delete_sync(&fpe_cfg->verify_timer);

	spin_lock_irqsave(&fpe_cfg->lock, flags);
	stmmac_fpe_apply(priv);
	spin_unlock_irqrestore(&fpe_cfg->lock, flags);

	spin_unlock(&fpe_cfg->verify_timer_lock);
}

static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
{
	spin_lock(&fpe_cfg->verify_timer_lock);

	timer_delete_sync(&fpe_cfg->verify_timer);

	spin_lock_irqsave(&fpe_cfg->lock, flags);

	if (is_up && fpe_cfg->state.pmac_enabled) {
		/* VERIFY process requires pmac enabled when NIC comes up */
		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
				     priv->plat->tx_queues_to_use,
				     priv->plat->rx_queues_to_use,
				     false, true);

		/* New link => maybe new partner => new verification process */
		stmmac_fpe_apply(priv);
	} else {
		/* No link => turn off EFPE */
		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
				     priv->plat->tx_queues_to_use,
				     priv->plat->rx_queues_to_use,
				     false, false);
	}

	spin_unlock_irqrestore(&fpe_cfg->lock, flags);

	spin_unlock(&fpe_cfg->verify_timer_lock);
}

Looking at the __timer_delete_sync() implementation, I don't think
verify_timer_lock needs to be sleepable and hence a mutex (except on
PREEMPT_RT where spinlocks are sleepable no matter what you do).

But I think the implementation would be simpler without
timer_delete_sync() in these 2 functions, and this overengineered
mechanism.


I would expect a comment in stmmac_release() here:

	if (priv->dma_cap.fpesel)
		timer_delete_sync(&priv->fpe_cfg.verify_timer);

that timer restarts are not possible, because we have rtnl_lock() held
and a concurrent stmmac_set_mm() cannot run now, and the earlier
phylink_stop() has also ensured stmmac_fpe_link_state_handle() cannot
run any longer.

Similarly, I would like to see an explanation in the form of a comment
for why timer restarts are not possible after the same pattern in
stmmac_suspend(). The explanation is different there, I think.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
