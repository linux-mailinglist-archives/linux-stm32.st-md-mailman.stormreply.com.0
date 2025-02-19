Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3CA3AF1B
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 02:48:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5B52C78F96;
	Wed, 19 Feb 2025 01:48:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7655BC7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 01:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739929737; x=1771465737;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/6YPLRHm6H9wPjnB667+gK6xaD7arKiwsNiLpHXnheg=;
 b=mXsirviXn5s1a6/B5lH+nQeyPBTAbr3ntFgG5BQuwoCSDQhxm/ttSxcv
 KQc2X3i2RCI84A+Cu3mZJAsqzeWakFNXBZ5WU+hRFyusEJ5+YFLTvOMq5
 /tWO+SuTc7SRpiu29618828ahGDhKCwwblAsp1TG75LQJdWCW52qF5hzg
 kuTJ5ynQqxVB9eaXfAKKfN/QuFtul911uSGrC+o/VSKwVEOKlsh3Fyefr
 tww6PumeDleDpGP+U2bQE3gmdRa78+QDnNKgyu4xVas3Nz8yaQYyaE1cQ
 PsamPt74bfJ2/zq5NPjNxJo+VSb30vr+yGDCbqsl7O5VdKdDFIaAV1eDW A==;
X-CSE-ConnectionGUID: QRb/FsZHST+zKvK+xavhVw==
X-CSE-MsgGUID: Q3RFqgsuRAyGHOP8pPPCMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="66006878"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="66006878"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 17:48:49 -0800
X-CSE-ConnectionGUID: 3tCnTqP2SCm9n+J0hFQeZw==
X-CSE-MsgGUID: pUBD94G+R3qLe0pCfMzcOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114748406"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.64.179])
 ([10.247.64.179])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 17:48:36 -0800
Message-ID: <b3e02516-d59c-4ed4-b59d-afa72c23d04b@linux.intel.com>
Date: Wed, 19 Feb 2025 09:48:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-6-faizal.abdul.rahim@linux.intel.com>
 <20250217113113.GK1615191@kernel.org>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250217113113.GK1615191@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 17/2/2025 7:31 pm, Simon Horman wrote:
> On Mon, Feb 10, 2025 at 02:02:03AM -0500, Faizal Rahim wrote:
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.c b/drivers/net/ethernet/intel/igc/igc_tsn.c
> 
> ...
> 
>> +bool igc_fpe_transmitted_smd_v(union igc_adv_tx_desc *tx_desc)
>> +{
>> +	u8 smd = FIELD_GET(IGC_TXD_POPTS_SMD_MASK, tx_desc->read.olinfo_status);
> 
> olininfo_status is little-endian, so I think it needs
> to be converted to host byte order when used as an
> argument to FIELD_GET().
> 
> Flagged by Sparse.
> 
>> +
>> +	return smd == SMD_V;
>> +}
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.h b/drivers/net/ethernet/intel/igc/igc_tsn.h
> 
> ...
> 
>> +static inline void igc_fpe_lp_event_status(union igc_adv_rx_desc *rx_desc,
>> +					   struct ethtool_mmsv *mmsv)
>> +{
>> +	__le32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);
> 
> It looks like the type of status_error should be a host byte order integer,
> such as u32.
> 
> Also flagged by Sparse.

Thanks for spotting these, I'll update them.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
