Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 277E8A47BCC
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 12:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD74BC7A847;
	Thu, 27 Feb 2025 11:18:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8C31C7A843
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740655118; x=1772191118;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IDZov/Dczn2f/ieNl0tUIoh9CnexHmfb2x1sTLNrFZA=;
 b=D7ss2VTtVfOPCleJDguLbD1wEByflEvVOS1A4u04ZALSorWd6oPq1TEm
 Xoddi8hEXQuySSwKF/ZvmAoNNSKFGHLmw3YM9USfhBAvbDvmINosJKmrC
 M7K60so5XAIu5US62aTLbbMX9Z+L6hfHs3S3qZ5SJljKRO0O1MCLYereK
 /ImTyujUGcmsVSiDoXvticwO2XKCJAonv2QvilynfKCrOmTjLZG0z8ojF
 ap5fe0G8/vTwtSTuQ6Vs+hrQSi9jqt00BhvjiXl7yUgbLT2+Py2Xtw0ps
 BAuNE2t1BpOX8V3Bro2dBT1zdh1nXSnFXXxY4DvVgQKpnVqxWkM9wn2xr w==;
X-CSE-ConnectionGUID: CHRN1X+GSLOEFLSVO2a/2A==
X-CSE-MsgGUID: h7Pn6DiATLSt2aG+atL+gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58955633"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="58955633"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:18:36 -0800
X-CSE-ConnectionGUID: CyeTxPjwSHeHLctx7MMYQw==
X-CSE-MsgGUID: 9QUOdIUaRUO9MO1mKfn1Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117172376"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.81.210])
 ([10.247.81.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:18:28 -0800
Message-ID: <8395554a-4aaf-45fb-a89d-34f5b10255fb@linux.intel.com>
Date: Thu, 27 Feb 2025 19:18:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-5-yong.liang.choong@linux.intel.com>
 <Z782i67tlpj6d57m@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z782i67tlpj6d57m@shell.armlinux.org.uk>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Simon Horman <horms@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v8 4/6] stmmac: intel: configure
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



On 26/2/2025 11:43 pm, Russell King (Oracle) wrote:
> On Wed, Feb 26, 2025 at 03:48:35PM +0800, Choong Yong Liang wrote:
>> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
>> index 6d2aa77ea963..af22a11c2b8a 100644
>> --- a/include/linux/stmmac.h
>> +++ b/include/linux/stmmac.h
>> @@ -236,6 +236,10 @@ struct plat_stmmacenet_data {
>>   	int (*serdes_powerup)(struct net_device *ndev, void *priv);
>>   	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
>>   	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
>> +	int (*mac_finish)(struct net_device *ndev,
>> +			  void *priv,
>> +			  unsigned int mode,
>> +			  phy_interface_t interface);
>>   	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
>>   	int (*init)(struct platform_device *pdev, void *priv);
>>   	void (*exit)(struct platform_device *pdev, void *priv);
> 
> This should be part of patch 5, and the order of patches 4 and 5
> reversed.
> 
> The subject line should also be "net: stmmac: ..."
> 
Thank you for your guidance. I will adjust the patch sequence as suggested 
and update the subject line to "net: stmmac: ...". I appreciate your 
attention to detail.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
