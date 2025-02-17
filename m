Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D9CA381B5
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 12:31:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFC9BC7803C;
	Mon, 17 Feb 2025 11:31:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37DD8C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 11:31:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3043A5C51A7;
 Mon, 17 Feb 2025 11:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322ECC4CED1;
 Mon, 17 Feb 2025 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739791882;
 bh=x59L7IqL94IFM2zao/QYrrn1Ck873l+zRRObe6nR3ZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FntKGJ2gEe8KQtXAM1A7/RQn+PfYq8H5dWKYZn5oss5qZBf9JJncJE+R18hFL8Lm9
 PFPpYqcpS5EoPKMf2J66Tc0mJGlB837NAOJlOR8NTAl4z0mfHEvAkYdhwMS9wYhdKJ
 HEiZuuptHx2U2UuENVvlZPPOD8mlcYbVLdg9xYKBvzRLVk1cxv7vKgZUb9VcRqL5Lp
 nZcpJgysIZTcUAwuJCuFc5CgPBBFycmNx72h4mVdtw8TrXX0x7EKS9IV1CpLtU44w5
 2lFAIvwLk9KmxV7+5Q6jltQEsCH16ycLhTcgGiskBxqc2hX/gfn1u19wzSWtFwHK40
 qURVopF4ZbD4g==
Date: Mon, 17 Feb 2025 11:31:13 +0000
From: Simon Horman <horms@kernel.org>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250217113113.GK1615191@kernel.org>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-6-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210070207.2615418-6-faizal.abdul.rahim@linux.intel.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 5/9] igc: Add support for
 frame preemption verification
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

On Mon, Feb 10, 2025 at 02:02:03AM -0500, Faizal Rahim wrote:

...

> diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.c b/drivers/net/ethernet/intel/igc/igc_tsn.c

...

> +bool igc_fpe_transmitted_smd_v(union igc_adv_tx_desc *tx_desc)
> +{
> +	u8 smd = FIELD_GET(IGC_TXD_POPTS_SMD_MASK, tx_desc->read.olinfo_status);

olininfo_status is little-endian, so I think it needs
to be converted to host byte order when used as an
argument to FIELD_GET().

Flagged by Sparse.

> +
> +	return smd == SMD_V;
> +}

...

> diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.h b/drivers/net/ethernet/intel/igc/igc_tsn.h

...

> +static inline void igc_fpe_lp_event_status(union igc_adv_rx_desc *rx_desc,
> +					   struct ethtool_mmsv *mmsv)
> +{
> +	__le32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);

It looks like the type of status_error should be a host byte order integer,
such as u32.

Also flagged by Sparse.

> +	int smd;
> +
> +	smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
> +
> +	if (smd == IGC_RXD_STAT_SMD_TYPE_V)
> +		ethtool_mmsv_event_handle(mmsv, ETHTOOL_MMSV_LP_SENT_VERIFY_MPACKET);
> +	else if (smd == IGC_RXD_STAT_SMD_TYPE_R)
> +		ethtool_mmsv_event_handle(mmsv, ETHTOOL_MMSV_LP_SENT_RESPONSE_MPACKET);
> +}
> +
> +static inline bool igc_fpe_is_verify_or_response(union igc_adv_rx_desc *rx_desc,
> +						 unsigned int size)
> +{
> +	__le32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);

Ditto.

> +	int smd;
> +
> +	smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
> +
> +	return ((smd == IGC_RXD_STAT_SMD_TYPE_V || smd == IGC_RXD_STAT_SMD_TYPE_R) &&
> +		size == SMD_FRAME_SIZE);
> +}
> +
>  #endif /* _IGC_BASE_H */
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
