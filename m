Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD2781625
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Aug 2023 02:53:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E2C3C6B460;
	Sat, 19 Aug 2023 00:53:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 625B9C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Aug 2023 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692406417; x=1723942417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TpUo5Edi6QFUhdJVj1ej9UvxlhacliszgVQIhmTKSe0=;
 b=H1AZOePPXI4uv6myaTdQD4IBzbUQN4vziGDUyAqHUbpyF64QC9QiZ0hI
 zy5zdITJtJ5h+5ltlomBzDfPt1aLjswbv1hH8QX4A5US+3jo+vrdNN3Ml
 aXCAK6qzlYuyAwNngeVkRrqgZr4+FTd2ynbhPUseistdAilckSeNFYPuq
 EmvX3ldm+Sc9tTiampIX7c2k08z7eXyPaoJPI/e2r/PNxRLj5Hona3MMs
 Cmo/+JFsqTfnWdRfTOweUQKOxi8Zuzt/IkqMkoiWyZAYg/WG8cUWiPLth
 Og88u3ebncMrnDUClb2w+vC6tpjwL/m62ZZI/sDJNeTYsuoMdPOymsH1i w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="373209896"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="373209896"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 17:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770311176"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="770311176"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 17:53:29 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: fancer.lancer@gmail.com
Date: Sat, 19 Aug 2023 08:53:26 +0800
Message-Id: <20230819005326.22204-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <trcp4f77dv2e36zpe53s7sjoyevgd5qtpv6m4a75ryalglqnev@trcsnsmvtijy>
References: <trcp4f77dv2e36zpe53s7sjoyevgd5qtpv6m4a75ryalglqnev@trcsnsmvtijy>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 2/2] net: stmmac: Tx coe sw
	fallback
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

On Fri, Aug 18, 2023 at 09:53:50PM +0800, Rohan G Thomas wrote:
>> +	u32 flags;
>
>This looks redundant. See my last comment.
>
>> +
>
>> +	u32 tx_q_with_coe;
>
>This one too. Can't you just use the
>plat_stmmacenet_data.tx_queues_with_coe field?
>
>> +	if (priv->plat->tx_coe &&
>> +	    priv->plat->tx_queues_with_coe < priv->plat->tx_queues_to_use) {
>> +		priv->flags |= STMMAC_PRIV_FLG_TXQ_COE_LIMIT;
>> +		priv->tx_q_with_coe = priv->plat->tx_queues_with_coe;
>> +		dev_info(priv->device, "TX COE limited to %u tx queues\n",
>> +			 priv->tx_q_with_coe);
>> +	}
>
>What about:
>+	if (priv->plat->tx_coe && !priv->plat->tx_queues_with_coe)
>+		priv->plat->tx_queues_with_coe = priv->plat->tx_queues_to_use;
>+	else if (!priv->plat->tx_coe)
>+		priv->plat->tx_queues_with_coe = 0;
>+	else if (priv->plat->tx_queues_with_coe < priv->plat->tx_queues_to_use)
>+		dev_info(priv->device, "TX COE is available for %u queues\n", priv->plat->tx_queues_with_coe);
>
>?
>
>-Serge(y)

Hi Serge,

Agreed.
Thanks for the suggestion. Will rework in next version.

BR,
Rohan

>> 
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
