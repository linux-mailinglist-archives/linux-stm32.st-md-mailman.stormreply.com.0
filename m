Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE02A29EBD
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 03:23:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C58B5C7128F;
	Thu,  6 Feb 2025 02:23:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD689C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 02:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738808614; x=1770344614;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MX/9vrVMWFYRt4Rmji6I71xtTK2XSPOEL24m4oemfv0=;
 b=eFkO/3BEIZxtiUoNRpBCBXpKFN26IHzVptLQ/o2F/CNdJpEZSEWYBS8H
 ur2OA6J3BDGJE1gQxP2PKAYq2cx1rxPKbzdJBSVuiwZsClYKHsBUlHiyP
 SkM3BJcJkwcEZR9z3KVP9scvIa6+fBWgM0Hc98f2fr2qsUorrfVoLJ4yj
 JQA0C7lem422zcTYuJP510vlYkc9RIiX7sPoOtHBQEd+lRMGi6FexpyJm
 xUGSiXhMebGxY2NZq//ksoTHzkCZZVp7u952wePRvNq2Nc7KQNXmP0z25
 Lk2pR1AvZO1mWXQhld3UO3thl1D/KKPh8rVLVsywGEYQssl87iqsKtlI3 g==;
X-CSE-ConnectionGUID: vIb638kgTeqisCarbOPf5g==
X-CSE-MsgGUID: W01r2TzWSi2YA/EtMo1+nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56945599"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="56945599"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 18:23:26 -0800
X-CSE-ConnectionGUID: 9N2QkdZTQnGEp6akn4nL/A==
X-CSE-MsgGUID: E5VLiOZUS+ykXC3zAo3hKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="110858842"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.114.122])
 ([10.247.114.122])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 18:23:18 -0800
Message-ID: <603921dc-4cc0-4bc6-960a-00ce6f8dfd5a@linux.intel.com>
Date: Thu, 6 Feb 2025 10:23:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
 <20250204181339.GM234677@kernel.org>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <20250204181339.GM234677@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v6 4/7] stmmac: intel: configure
 SerDes according to the interface mode
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



On 5/2/2025 2:13 am, Simon Horman wrote:
>> +static int intel_config_serdes(struct net_device *ndev,
>> +			       void *intel_data,
>> +			       phy_interface_t interface)
>> +{
>> +	struct intel_priv_data *intel_priv = intel_data;
>> +	struct stmmac_priv *priv = netdev_priv(ndev);
>> +	int ret = 0;
>> +
>> +	if (!intel_tsn_lane_is_available(ndev, intel_priv)) {
>> +		netdev_info(priv->dev,
>> +			    "No TSN lane available to set the registers.\n");
>> +		goto pmc_read_error;
>> +	}
>> +
>> +	if (intel_priv->pid_modphy == PID_MODPHY1) {
>> +		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
>> +			ret = intel_set_reg_access(pid_modphy1_2p5g_regs,
>> +						   ARRAY_SIZE(pid_modphy1_2p5g_regs));
>> +		} else {
>> +			ret = intel_set_reg_access(pid_modphy1_1g_regs,
>> +						   ARRAY_SIZE(pid_modphy1_1g_regs));
>> +		}
>> +	} else {
>> +		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
>> +			ret = intel_set_reg_access(pid_modphy3_2p5g_regs,
>> +						   ARRAY_SIZE(pid_modphy3_2p5g_regs));
>> +		} else {
>> +			ret = intel_set_reg_access(pid_modphy3_1g_regs,
>> +						   ARRAY_SIZE(pid_modphy3_1g_regs));
>> +		}
>> +	}
>> +
>> +	priv->plat->phy_interface = interface;
>> +
>> +	if (ret < 0)
>> +		goto pmc_read_error;
> 
> Perhaps this is an artifact of earlier refactoring,
> but the condition above seems to be without meaning
> as in either case the code goes directly to pmc_read_error.
> 
>> +
>> +pmc_read_error:
>> +	intel_serdes_powerdown(ndev, intel_priv);
>> +	intel_serdes_powerup(ndev, intel_priv);
>> +
>> +	return ret;
>> +}
>> +
>>   static void common_default_data(struct plat_stmmacenet_data *plat)
>>   {
>>   	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
> 
> ...
> 

Hi Simon,

You are right.
I will perform the cleanup on the code and submit the next version.

Thank you for your feedback.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
