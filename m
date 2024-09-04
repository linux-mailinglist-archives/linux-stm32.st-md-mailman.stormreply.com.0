Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B596C185
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 16:58:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A329C78011;
	Wed,  4 Sep 2024 14:58:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 157ABC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 14:58:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a86696b29d8so33169666b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725461921; x=1726066721;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nyHRUbS96LQJMnxC77/pMoO0AXemk+GGLf2OYY2VbUE=;
 b=lyb/UxbK9Nl57QFzz9wdH5Gm2XpMIzUYz/1jvQsM2Xf9uTL6p16sbFJDjCwmKpwxuw
 yH+DmKzKrO+ZEgL5uHmtKbNa7HFanURz2I4t3OjsUcPkfYvi+b27vj6W4C4J13LVN9IL
 k1nsdAPTFto+wN3o9+PW60q6OKnhdMmoLlJ2I3GkQFu+hgXrb3d4lP9hQkAgpQQ61GA5
 R55Ac42N4NpYA0hfAUycnQWWQU5y54TjnUtMixQA6ZL0+oLuFuXIrxj+sTrhBlCcWIpI
 IyMSYxsWmyQKc1fqCo5EZztMnateoxGMsluegj/JUheMETIkJLmBjba/hf4p2Or4AiGg
 gIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725461921; x=1726066721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyHRUbS96LQJMnxC77/pMoO0AXemk+GGLf2OYY2VbUE=;
 b=MmzGkYnHVVPJGvq3RGvCc4xU0uTIRM7o78mMVEqUEK3vRSNWgl1Et5HgSwNzd9DP/j
 jZXSdNsqxPBDsvE/DJVk47YmgWVpPvjCHn9OebeKtr5fv5iqcTXX+lzr2+okI0N8eT8x
 y3Z+p1fFgTwqz4Os0tzCbt2lyw1FXNZYQ/LaFcRyi8ta9YFGYBlQDUsVZ4MBUaLlbAFj
 7Z8NihAGv/kXro3K8qzwE2/2NEcKiGU+SRrqTV3Z9feBgoonYvUPKAigkbQNKVp+aZ8N
 fQxYqRMr4oFxkpXy0wt+cviIE3vYxHRvobe4rakp0ne7s1niPyJdns8g45IRH8E/9jJ7
 MnGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZfKZnfAT63deauFCE446cnsRdygmVwKojRiygfyPWBe4YsPWwlYDE3dIiW9VHg3+ctRxDxCzRQ4aX8A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyL1yVRqUTAtLZfzPTvryCVY1973M91TK77myIDnCP97oZrRcYR
 FPCO787rHKHrMoHc6vYpQaEf9V5UiMZv/cS0+iFH0xa3+4Q8yICH
X-Google-Smtp-Source: AGHT+IF9fNPAMV3rkGRPbruFXWJ88SAxEy28gAk+8MFg+kx8FVMQrf0q3A1TSlP9jRdQelWzVhiB+g==
X-Received: by 2002:a17:907:3e92:b0:a80:a37f:c303 with SMTP id
 a640c23a62f3a-a89a357825bmr653597266b.4.1725461921263; 
 Wed, 04 Sep 2024 07:58:41 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d041sm1984566b.132.2024.09.04.07.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:58:40 -0700 (PDT)
Date: Wed, 4 Sep 2024 17:58:37 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240904145837.wh7tdrffsiqpot22@skbuf>
References: <cover.1725441317.git.0x1207@gmail.com>
 <cover.1725441317.git.0x1207@gmail.com>
 <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
 <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
 <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/7] net: stmmac: refactor FPE
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

On Wed, Sep 04, 2024 at 05:21:18PM +0800, Furong Xu wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3072ad33b105..e2f933353f40 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -969,17 +969,30 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
>  static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> -	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
> -	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
> -	bool *hs_enable = &fpe_cfg->hs_enable;
> +	unsigned long flags;
>  
> -	if (is_up && *hs_enable) {
> -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> -					MPACKET_VERIFY);
> +	del_timer_sync(&fpe_cfg->verify_timer);

Interesting comments in include/linux/timer.h:
 * Do not use in new code. Use timer_delete_sync() instead.

Also, interesting comment in the timer_delete_sync() kernel-doc:
 Callers must prevent restarting of the timer, otherwise this function is meaningless.

I don't think you have any restart prevention mechanism. So between the
timer deletion and the spin_lock_irqsave(), another thread has enough
time to acquire fpe_cfg->lock first, and run stmmac_fpe_verify_timer_arm().
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
