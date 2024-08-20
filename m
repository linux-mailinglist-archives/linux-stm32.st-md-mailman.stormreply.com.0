Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E643958335
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 11:51:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5A60C6DD66;
	Tue, 20 Aug 2024 09:51:26 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0649CC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 09:51:20 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a864574429aso82545066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 02:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724147479; x=1724752279;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QMRO5aEOOPp2GA4SgmW2MhbGQ/rLz3tZNU53B/4+f4g=;
 b=iAUJX9bRlY79iEQ2o5wrGVeDCg+AKB6Zb/kVBStZPu7dKWafB17FrFrvcnv3RIEQf9
 5xJ53Oc2UwLjm2twd3uRz73ukGrUwEqkc1oHAM6aGbRqu3uYRrDaOwxOF8e1f/6U6oi8
 tmzFyuAFSO49Z1s30zQ9J7asVPrdLiP+CgnFhwPVOiHaq4Z9wK+M1EejpDQpXCBMHrjo
 Qw10PX7Cfsbu0o31M10ekX2IRxwU+uFtxzd6IobTs0L1ZuhjQ9m391IDc0F9Zjki3HZD
 RUjPV4FXtAnJesqSi9+9dBFgjENZTOJNOgsw8Ux/pdQQPWPLB7Bxz5+E0JhcqYguoMXc
 YPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724147479; x=1724752279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMRO5aEOOPp2GA4SgmW2MhbGQ/rLz3tZNU53B/4+f4g=;
 b=nwhWGATtyEt6nFOF7epunovmXextV+asdvzM0NtYH/edLYAkFHSfmbhqjRgDfUm5vg
 dvQ2qZlySoZLok1qJim+7ls7lOcZ2vDCWlwCl0wzCGF1m1jTrtJZAE6zVrdBwaXz+znN
 QDbn2hl5BCkN7f6m91Mplrs7XDyF68IuToiCSkG5G6WAJEiPvoUIo9nyqVl32XQNdN7o
 zMKPQDvX72Lq1WVj6qCLpUgDfBVdV/EGx1EJq3qft9bE8avyW1Uf0S8RURq4s9C6uohy
 Qh8pw7oCZljWO7l8mLag647vSAZcKD39FM+hWqzTqfG9A2KJbPTgmUaYmrejHGX9FMWo
 C9vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXasj38hPAQUSmTPLqrgw8vccF62boD/arA+WHUVRfr5kdCeBu7063QEi3s9GXP1SJ5LBLGO0TLRKxx3PDEezihu6Om/eNop8N7FkdEdPNBxxmnUTtWp5eM
X-Gm-Message-State: AOJu0YxZzbAXjySm7hS59dBtQ82oZYofCbstGaqMlYQlMJlgi/hluZj3
 5uD9a+pT23TgO1oR4CHGlw1E8+d8XX+OCbqoNAXoJLey937+aEU5
X-Google-Smtp-Source: AGHT+IFe89MF4PAXRq87PUkDRnYToPhl3veGvDUpACgEFBVjcT25Az4FnOvuI3g+DR4n6Ox2qbTARg==
X-Received: by 2002:a17:907:7e94:b0:a7d:c148:ec85 with SMTP id
 a640c23a62f3a-a8392a38e70mr1068397266b.62.1724147478406; 
 Tue, 20 Aug 2024 02:51:18 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838393560bsm741330866b.139.2024.08.20.02.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:51:17 -0700 (PDT)
Date: Tue, 20 Aug 2024 12:51:15 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240820095115.bhg4rv7oeondetol@skbuf>
References: <cover.1724145786.git.0x1207@gmail.com>
 <413a36781a9b215c857bd8ec3c9ee03462e861d7.1724145786.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <413a36781a9b215c857bd8ec3c9ee03462e861d7.1724145786.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 5/7] net: stmmac: support fp
 parameter of tc-mqprio
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

On Tue, Aug 20, 2024 at 05:38:33PM +0800, Furong Xu wrote:
> +static int tc_setup_mqprio(struct stmmac_priv *priv,
> +			   struct tc_mqprio_qopt_offload *mqprio)
> +{
> +	struct netlink_ext_ack *extack = mqprio->extack;
> +	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
> +	struct net_device *ndev = priv->dev;
> +	int num_stack_tx_queues = 0;
> +	int num_tc = qopt->num_tc;
> +	u16 offset, count;
> +	int tc, err;
> +
> +	if (!num_tc) {
> +		stmmac_reset_tc_mqprio(ndev, extack);
> +		return 0;
> +	}
> +
> +	if (mqprio->preemptible_tcs && !ethtool_dev_mm_supported(ndev)) {
> +		NL_SET_ERR_MSG_MOD(extack, "Device does not support preemption");
> +		return -EOPNOTSUPP;
> +	}

When I said that "this condition is dealt with by the core, now"
https://lore.kernel.org/netdev/20240819114242.2m6okk7bq64e437c@skbuf/
I meant that the driver doesn't need to check anything - the check has
already run once, in the Qdisc layer. See taprio_parse_tc_entries() and
mqprio_parse_tc_entries(). I was not asking to insert this test, just to
completely remove, rather than adapt, the entire block:

	if (fpe && !priv->dma_cap.fpesel) {
		mutex_unlock(&priv->est_lock);
		return -EOPNOTSUPP;
	}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
