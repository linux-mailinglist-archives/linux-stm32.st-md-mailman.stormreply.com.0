Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4808796DB04
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 16:02:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9087C78013;
	Thu,  5 Sep 2024 14:02:42 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58BEAC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 14:02:35 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5befecad20eso129833a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725544955; x=1726149755;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6yg3+jwU4jsvMwPvd27IzjCRFri5P2daDxYa2vfW+fU=;
 b=B2rucV8OjUtq2E9SmDAnPcCOWnUzwDuH/qDMJFEtjS4mk/QEnil4jymVqGqh+P2ugN
 wL95uMM+79U8PFqNyS6+W0wkr+FWsjITSKmGKKQdiMQqjhRLQXEiKQzbd1AFEjZPvz9L
 eKY/rjapt/tNDMMkhj9zlfXFYXDnGIb6CHw43604jb0hac68DstDjdiklqKzIiA8dFFK
 nxHPb4zDhj5Nh1sCNu+ZV8d2tqn5aU28uat3DmzZYTElyrxI8OLNmfI4F0d0uvvm4hOA
 cAaAlaWfihXgOQR2OVd2wjljq4Hx47x/MW+P1fOuYGvCSDuE0wmvqBuGDXg2e9fRPss9
 edQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725544955; x=1726149755;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yg3+jwU4jsvMwPvd27IzjCRFri5P2daDxYa2vfW+fU=;
 b=JVULSn/npQoCd9zJrXPqtp4+nfmktARzjRj6O7WxtWz3stb4m7Fc4I+B/yJO3YAdBd
 I4leXYDq26MhVc0+gTqMjd2no8YDORnbLUcjCKqqWiR0GOhptdqauWBAUoQHcTG0ikyr
 hLaT8PX1u02KOSilRqhsQm1pyV+QOoqhEDd8vDeeUfS8hFWiQuKpCSPA/3Qf/BkGuczJ
 dN7af4KUMzsoWlgSQw4Hs47S3kM3wgnQkENgXfUxuuOTXAT+hvEEgULXUf+MwiFiqXwP
 CTY63hoPZtDMWmlGxgOocB5C4UWtBYfViixjh1pDCKOW0DG4n3UAH99ic5dIu1Np/qn0
 F8Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWNvPt8hHbv/llMXtnrHIuK/8fryUEzJx8S0w3oerX64js55zUhl+GE2LPMRdZD3RvtZ/0GJ4eaEJv3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+Q3hYOevWGLdLlDM936xPnzua3vjFYP8L+TQU5SK3zMMPgkez
 nps2alHY1IQqqwMs129tKAoprUm40rxt2MZ7RZzKUlSlAH02FSjG
X-Google-Smtp-Source: AGHT+IFTHXZF/Kygyg2GeFlEexjRun07g46Rg8fnTdbK4URXrkrQG0hN6dN+YvbeF08Vd52ORQadgQ==
X-Received: by 2002:a05:6402:2687:b0:5c3:c42e:d5f2 with SMTP id
 4fb4d7f45d1cf-5c3c42edc9cmr2009136a12.1.1725544953626; 
 Thu, 05 Sep 2024 07:02:33 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc6a51d1sm1270730a12.89.2024.09.05.07.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:02:32 -0700 (PDT)
Date: Thu, 5 Sep 2024 17:02:30 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240905140230.42bdnndi5fn5ifmi@skbuf>
References: <cover.1725518135.git.0x1207@gmail.com>
 <cover.1725518135.git.0x1207@gmail.com>
 <b12e36639ee0cd77f3238fe418af70f975988fc8.1725518136.git.0x1207@gmail.com>
 <b12e36639ee0cd77f3238fe418af70f975988fc8.1725518136.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b12e36639ee0cd77f3238fe418af70f975988fc8.1725518136.git.0x1207@gmail.com>
 <b12e36639ee0cd77f3238fe418af70f975988fc8.1725518136.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 5/7] net: stmmac: support fp
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

On Thu, Sep 05, 2024 at 03:02:26PM +0800, Furong Xu wrote:
> tc-mqprio can select whether traffic classes are express or preemptible.
> 
> After some traffic tests, MAC merge layer statistics are all good.
> 
> Local device:
> ethtool --include-statistics --json --show-mm eth1
> [ {
>         "ifname": "eth1",
>         "pmac-enabled": true,
>         "tx-enabled": true,
>         "tx-active": true,
>         "tx-min-frag-size": 60,
>         "rx-min-frag-size": 60,
>         "verify-enabled": true,
>         "verify-time": 100,
>         "max-verify-time": 128,
>         "verify-status": "SUCCEEDED",
>         "statistics": {
>             "MACMergeFrameAssErrorCount": 0,
>             "MACMergeFrameSmdErrorCount": 0,
>             "MACMergeFrameAssOkCount": 0,
>             "MACMergeFragCountRx": 0,
>             "MACMergeFragCountTx": 35105,
>             "MACMergeHoldCount": 0
>         }
>     } ]
> 
> Remote device:
> ethtool --include-statistics --json --show-mm end1
> [ {
>         "ifname": "end1",
>         "pmac-enabled": true,
>         "tx-enabled": true,
>         "tx-active": true,
>         "tx-min-frag-size": 60,
>         "rx-min-frag-size": 60,
>         "verify-enabled": true,
>         "verify-time": 100,
>         "max-verify-time": 128,
>         "verify-status": "SUCCEEDED",
>         "statistics": {
>             "MACMergeFrameAssErrorCount": 0,
>             "MACMergeFrameSmdErrorCount": 0,
>             "MACMergeFrameAssOkCount": 35105,
>             "MACMergeFragCountRx": 35105,
>             "MACMergeFragCountTx": 0,
>             "MACMergeHoldCount": 0
>         }
>     } ]
> 
> Tested on DWMAC CORE 5.10a
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> +int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
> +				    struct netlink_ext_ack *extack, u32 pclass)
> +{
> +	u32 offset, count, val, preemptible_txqs = 0;
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	u32 num_tc = ndev->num_tc;
> +
> +	if (!pclass)
> +		goto update_mapping;
> +
> +	/* DWMAC CORE4+ can not program TC:TXQ mapping to hardware.
> +	 *
> +	 * Synopsys Databook:
> +	 * "The number of Tx DMA channels is equal to the number of Tx queues,
> +	 * and is direct one-to-one mapping."
> +	 */
> +	for (u32 tc = 0; tc < num_tc; tc++) {
> +		count = ndev->tc_to_txq[tc].count;
> +		offset = ndev->tc_to_txq[tc].offset;
> +
> +		if (pclass & BIT(tc))
> +			preemptible_txqs |= GENMASK(offset + count - 1, offset);
> +
> +		/* This is 1:1 mapping, go to next TC */
> +		if (count == 1)
> +			continue;
> +
> +		if (priv->plat->tx_sched_algorithm == MTL_TX_ALGORITHM_SP) {
> +			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
> +			return -EINVAL;
> +		}
> +
> +		u32 queue_weight = priv->plat->tx_queues_cfg[offset].weight;

Please do not put variable declarations in the middle of the scope.
Declare "u32 queue_weight" separately and just keep the assignment here.

> +
> +		for (u32 i = 1; i < count; i++) {
> +			if (priv->plat->tx_queues_cfg[offset + i].weight !=
> +			    queue_weight) {
> +				NL_SET_ERR_MSG_FMT_MOD(extack, WEIGHT_ERR_MSG,
> +						       queue_weight, tc);
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +update_mapping:
> +	val = readl(priv->ioaddr + MTL_FPE_CTRL_STS);
> +	writel(u32_replace_bits(val, preemptible_txqs, DWMAC5_PREEMPTION_CLASS),
> +	       priv->ioaddr + MTL_FPE_CTRL_STS);
> +
> +	return 0;
> +}

Otherwise:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
