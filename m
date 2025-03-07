Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E75B0A55E3B
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 04:21:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 985D2C78F86;
	Fri,  7 Mar 2025 03:21:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC593C78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 03:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741317686; x=1772853686;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Jg5XeRxyuKD825uDbJYMZSOpqP9zMmh8t5nyw3/cSXk=;
 b=K1O4GCPaJDuqltioLdQKzZaH/YCzyVeHZf5a2xz9MvI2/IuM+0LkzcS4
 VvNh6t3gqLrCqFxi0wWjWEpzyInkE2nr+SddIrpZnmQqvomiXiVDuxeX0
 peMrVFQ/gyLPdfEJOe2QSwYcMe69Vcd1/Pki4RBANnLgSyYW/rHDwYex1
 8o6CkXrUjptNtpwU6TBWYDHR1BUMFSuJI9YhnWZSWNMSpoz2/9ZxJE1/8
 aFyLVnyAupWvvmkSQWUrKbjci+MBuXbOE97+7vkVZqpg0vKEy0gCuKwtG
 QCjf2yga1+IZ4z5xyh+8WxfFLsjCCTIOKSDREkDjPULcto/gg7XnLh0b5 g==;
X-CSE-ConnectionGUID: WuzBU6QQSwaoT6c4gK8Suw==
X-CSE-MsgGUID: bdnnrx3uR/2mNTTTnCHM3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="45164200"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="45164200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 19:21:23 -0800
X-CSE-ConnectionGUID: iDlWGXgBRa+qU7VDX2G/zg==
X-CSE-MsgGUID: jWEeBpZ0ToCaX0rjX89xkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="119388873"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.100.177])
 ([10.247.100.177])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 19:20:57 -0800
Message-ID: <df5f2ff0-2ead-4074-a40e-8a2fc9b63339@linux.intel.com>
Date: Fri, 7 Mar 2025 11:20:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-12-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-12-faizal.abdul.rahim@linux.intel.com>
 <20250306004809.q2x565rys5zja6kh@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250306004809.q2x565rys5zja6kh@skbuf>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v8 11/11] igc: add support to get
 frame preemption statistics via ethtool
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



On 6/3/2025 8:48 am, Vladimir Oltean wrote:
> On Wed, Mar 05, 2025 at 08:00:26AM -0500, Faizal Rahim wrote:
>> +/* Received out of order packets with SMD-C */
>> +#define IGC_PRMEXCPRCNT_OOO_SMDC			0x000000FF
>> +/* Received out of order packets with SMD-C and wrong Frame CNT */
>> +#define IGC_PRMEXCPRCNT_OOO_FRAME_CNT			0x0000FF00
>> +/* Received out of order packets with SMD-C and wrong Frag CNT */
>> +#define IGC_PRMEXCPRCNT_OOO_FRAG_CNT			0x00FF0000
>> +/* Received packets with SMD-S and wrong Frag CNT and Frame CNT */
>> +#define IGC_PRMEXCPRCNT_MISS_FRAME_FRAG_CNT		0xFF000000
>>   
>> +/**
>> + * igc_ethtool_get_frame_ass_error - Get the frame assembly error count.
>> + * @reg_value: Register value for IGC_PRMEXCPRCNT
>> + * Return: The count of frame assembly errors.
>> + */
>> +static u64 igc_ethtool_get_frame_ass_error(u32 reg_value)
>> +{
>> +	u32 ooo_frame_cnt, ooo_frag_cnt; /* Out of order statistics */
>> +	u32 miss_frame_frag_cnt;
>> +
>> +	ooo_frame_cnt = FIELD_GET(IGC_PRMEXCPRCNT_OOO_FRAME_CNT, reg_value);
>> +	ooo_frag_cnt = FIELD_GET(IGC_PRMEXCPRCNT_OOO_FRAG_CNT, reg_value);
>> +	miss_frame_frag_cnt = FIELD_GET(IGC_PRMEXCPRCNT_MISS_FRAME_FRAG_CNT, reg_value);
>> +
>> +	return ooo_frame_cnt + ooo_frag_cnt + miss_frame_frag_cnt;
>> +}
> 
> These counters are quite small (8 bits each). What is their behavior
> once they reach 255? Saturate? Truncate? Do they clear on read?
> 
Hi Vladimir,

These are part of the statistic registers, which in IGC, reset upon read. 
When they reach their maximum value, each field remain at 0xFF.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
