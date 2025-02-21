Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C363A3F0B0
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 10:43:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9C79C7A838;
	Fri, 21 Feb 2025 09:43:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A303C7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 09:43:08 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2fc33aef343so3876912a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740130987; x=1740735787;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qp8DvYGUWgTHXAPWqbMBZV8Rl/qxPnTYUxFzmDOOo1U=;
 b=FDnPLTmBd4wpz2CHAuQ/g0EtiBtVzDq3dEv4NweJaY/PS6QUCMpuQvPGHZBN3MdruM
 UV5ukXCihzWV4jPg+z1HKOLrUwg1XH9iobj+yGEHRHWhE4PCelMDkG0AEpRQWvF6ZoEA
 0uB0hytG6993jcdNei5s+/yrij1BCyCIFEVCbQok2RcuxpUVhRyTLWUSZ8VzhaR4OpbA
 8QmY5mm+hE/WMZRYLJ6VXDLoa5qxfEZOzub2eC4KS7nbJUPKq2EY6Xq493Mof3c8Iv0i
 CaW2zAHj3KMDkuU3Uy5HNmlkED753xF3XDmut0Z37JE3jJgxNv9BQOJmff8nxc5o+QB7
 qmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740130987; x=1740735787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qp8DvYGUWgTHXAPWqbMBZV8Rl/qxPnTYUxFzmDOOo1U=;
 b=d2KvDh+tnRO9IM7NU7rh2/hBzhz4loNVJzza4JOahyx0YgbMyJXJ2/mso0f+iZyE02
 zERiQzA0uxnG+/k23aWQgv2PPOjew5DetAEqwE6pmLiWRx52qjvvA00wtt+xuQGZKfgI
 zMaPvflV0Sks/3MumnNruHc0cIgZh+DS0xMD04WSXV8ifzupQFo5GlvkCQ7uH0ydPnSY
 aL1OxqVB/bxE+Z9DqNHa+0pNO0dShD4sBy+EDhkPmlxZWKQ+GmOFSXKoVHWxxTNDpgMw
 1X3JrDKbQ/macSiNNUm5J9LMYsp5mf9hSPGqSca8sImm/J/aXMXwhjA4qddCLL71gmGf
 JT/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Q6uH//46Rbj/2xdecDoaVOvpkSVGbX5M/TIBIdFsl5oSNiVeKQYP3t9XN7R40+C1ElevPxqoxhuQmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYmFkjZFtj0yW9NeBZTvNlDneb4ZrNFAZPK1JCNfOwLu5/pSP9
 zJ/O/yJUhXAQaMrJ2T98uQJAg4GKX0r7rlMzoHgGr6PGbNM7qN/v
X-Gm-Gg: ASbGncv8jTN1HwY4HBhiEnMEwGuAiRRcyqySsSWrzyPOaK/1530A3F/u7FwzdPGFN6Q
 bFgCtIdjGc4K+EPpG5uiUAT5c5etMg3cUble8pZuHc/Mg1L5KPVsHYNXfp+vCaR4COVdECgYnrN
 3UfbkJ+afRNeXRzF+X037Wdwinqrcrf3S8PLx8Od1+xGYOFt98y7H9FhcDO2JEJ/3t8m2uV3PLH
 c2kMslshzO1H5sOIW9r2SJ87G0nB5KbBccBbHjEbJKwReVz9M5ZfE1vOTOHbPEsde48Kuw+vy0m
 1MY0fra0zLkyR/3JXH6H/n0=
X-Google-Smtp-Source: AGHT+IEFLkFCj2bQJ0yLXnoXnz387Bz22Ke8KnkO2x0EryQr6MWOx9pTmc0bN1V4MOkAKGnHvqQCJw==
X-Received: by 2002:a17:90b:2e0d:b0:2fa:2124:8782 with SMTP id
 98e67ed59e1d1-2fce7b1f6afmr4454759a91.25.1740130987274; 
 Fri, 21 Feb 2025 01:43:07 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fcb844c60asm3042021a91.0.2025.02.21.01.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 01:43:07 -0800 (PST)
Date: Fri, 21 Feb 2025 17:42:49 +0800
From: Furong Xu <0x1207@gmail.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250221174249.000000cc@gmail.com>
In-Reply-To: <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v5 1/9] net: ethtool: mm: extract
 stmmac verification logic into common library
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

On Wed, 19 Feb 2025 21:53:41 -0500, Faizal Rahim <faizal.abdul.rahim@linux.intel.com> wrote:

> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> It appears that stmmac is not the only hardware which requires a
> software-driven verification state machine for the MAC Merge layer.
> 
> While on the one hand it's good to encourage hardware implementations,
> on the other hand it's quite difficult to tolerate multiple drivers
> implementing independently fairly non-trivial logic.
> 
> Extract the hardware-independent logic from stmmac into library code and
> put it in ethtool. Name the state structure "mmsv" for MAC Merge
> Software Verification. Let this expose an operations structure for
> executing the hardware stuff: sync hardware with the tx_active boolean
> (result of verification process), enable/disable the pMAC, send mPackets,
> notify library of external events (reception of mPackets), as well as
> link state changes.
> 
> Note that it is assumed that the external events are received in hardirq
> context. If they are not, it is probably a good idea to disable hardirqs
> when calling ethtool_mmsv_event_handle(), because the library does not
> do so.
> 
> Also, the MM software verification process has no business with the
> tx_min_frag_size, that is all the driver's to handle.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Co-developed-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +-
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  41 +---
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 174 +++-----------
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |   5 -
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   8 +-
>  include/linux/ethtool.h                       | 131 ++++++++++
>  net/ethtool/mm.c                              | 225 +++++++++++++++++-
>  7 files changed, 399 insertions(+), 201 deletions(-)
> 
[...]
> +void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
> +{
> +	unsigned long flags;
> +
> +	ethtool_mmsv_stop(mmsv);
> +
> +	spin_lock_irqsave(&mmsv->lock, flags);
> +
> +	if (up && mmsv->pmac_enabled) {
> +		/* VERIFY process requires pMAC enabled when NIC comes up */
> +		ethtool_mmsv_configure_pmac(mmsv, true);
> +
> +		/* New link => maybe new partner => new verification process */
> +		ethtool_mmsv_apply(mmsv);
> +	} else {
> +		mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;

Tested this patch on my side, everything works well, but the verify-status
is a little weird:

# kernel booted, check initial states:
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": false,
        "tx-enabled": false,
        "tx-active": false,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": false,
        "verify-time": 128,
        "max-verify-time": 128,
        "verify-status": "INITIAL",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 0,
            "MACMergeFragCountRx": 0,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

# Enable pMAC by: ethtool --set-mm eth1 pmac-enabled on
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": true,
        "tx-enabled": false,
        "tx-active": false,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": false,
        "verify-time": 128,
        "max-verify-time": 128,
        "verify-status": "DISABLED",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 0,
            "MACMergeFragCountRx": 0,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

# Disable pMAC by: ethtool --set-mm eth1 pmac-enabled off
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": true,
        "tx-enabled": false,
        "tx-active": false,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": false,
        "verify-time": 128,
        "max-verify-time": 128,
        "verify-status": "DISABLED",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 0,
            "MACMergeFragCountRx": 0,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

verify-status always normal on other cases.

@Vladimir, maybe we shouldn't update mmsv->status in ethtool_mmsv_link_state_handle()?
Or, update mmsv->status like below:
mmsv->status = mmsv->pmac_enabled ?
		ETHTOOL_MM_VERIFY_STATUS_INITIAL :
		ETHTOOL_MM_VERIFY_STATUS_DISABLED;

Anyway, this is too minor, so:

Tested-by: Furong Xu <0x1207@gmail.com>


> +		mmsv->verify_retries = ETHTOOL_MM_MAX_VERIFY_RETRIES;
> +
> +		/* No link or pMAC not enabled */
> +		ethtool_mmsv_configure_pmac(mmsv, false);
> +		ethtool_mmsv_configure_tx(mmsv, false);
> +	}
> +
> +	spin_unlock_irqrestore(&mmsv->lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(ethtool_mmsv_link_state_handle);


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
