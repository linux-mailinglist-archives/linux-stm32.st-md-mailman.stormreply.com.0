Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C1F9C8205
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 05:37:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E700DC78F98;
	Thu, 14 Nov 2024 04:37:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E2EBC78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 04:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731559075; x=1763095075;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WKOXFnXXfoup+z1HHcm+BHwMVCrgMUWLaq9XXRMUTgQ=;
 b=KSJfzrfxkoQQxcypN59oj9/d3PYkD37k0xrppVCcmrx0c8GhcG4cbiuW
 42yKGnpiStwX5aZwhyw+mG+4MVmZZxE30+Y6f6Sqdx+BSZ3MfUwkNE5YY
 aeLzVlRtlfl/Iwp7951iO1CL0LD/8Dqc7D4GH0VcvZtCS1f04SKlOzXkj
 XrTWrkw6/rB7ZO3gDojASM238HuTQaE2d1XRXNoZ/EBdxKd97K/gJGAMU
 SjTwaO2/bsBO/c/pJ273nqHIErEK49CNVN+gB6lhTN/ErBnOdYTFPjjTM
 30ftVk2J+nkb7ddaPh7854dFtg7d7A81oCCQsCNSY0O9xXLdBqXuXsHzw w==;
X-CSE-ConnectionGUID: kyGEB2ubRUasuSa5Fpj9Kg==
X-CSE-MsgGUID: okD8D6qfS0eoG5CEf9urQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42864461"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="42864461"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:37:47 -0800
X-CSE-ConnectionGUID: kE45sCQ0RsO5lvNHx0MVow==
X-CSE-MsgGUID: f67o2F7qRBenNM1uR0308g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88261207"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.16.168])
 ([10.247.16.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:37:43 -0800
Message-ID: <1a94d554-c043-4444-85a1-d30d07e7580f@linux.intel.com>
Date: Thu, 14 Nov 2024 12:37:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
 <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
 <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
 <b61a9c36-dfd5-4b90-88a6-90e43cfae000@lunn.ch>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <b61a9c36-dfd5-4b90-88a6-90e43cfae000@lunn.ch>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] net: phy: Introduce
 phy_update_eee() to update eee_cfg values
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



On 14/11/2024 7:05 am, Andrew Lunn wrote:

> tx_lpi_timer is a MAC property, but phylib does track it across
> --set-eee calls and will fill it in for get-eee. What however is
> missing it setting its default value. There is currently no API the
> MAC driver can call to let phylib know what default value it is using.
> Either such an API could be added, e.g. as part of phy_support_eee(),
> or we could hard code a value, probably again in phy_support_eee().
> 
> tx_lpi_enabled is filled in by phy_ethtool_get_eee(), and its default
> value is set by phy_support_eee(). So i don't see what is wrong here.
> 

Thank you for your detailed explanation. I will follow your suggestion to 
set the default value for tx_lpi_timer in phy_support_eee().

>> Currently, we are facing 3 issues:
>> 1. When we boot up our system and do not issue the 'ethtool --set-eee'
>> command, and then directly issue the 'ethtool --show-eee' command, it always
>> shows that EEE is disabled due to the eeecfg values not being set. However,
>> in the Maxliner GPY PHY, the driver EEE is enabled. If we try to disable
>> EEE, nothing happens because the eeecfg matches the setting required to
>> disable EEE in ethnl_set_eee(). The phy_support_eee() was introduced to set
>> the initial values to enable eee_enabled and tx_lpi_enabled. This would
>> allow 'ethtool --show-eee' to show that EEE is enabled during the initial
>> state. However, the Marvell PHY is designed to have hardware disabled EEE
>> during the initial state. Users are required to use Ethtool to enable the
>> EEE. phy_support_eee() does not show the correct for Marvell PHY.
> 
> We discussed what to set the initial state to when we reworked the EEE
> support. It is a hard problem, because changing anything could cause
> regressions. Some users don't want EEE enabled, because it can add
> latency and jitter, e.g. to PTP packets. Some users want it enabled
> for the power savings.
> 
> We decided to leave the PHY untouched, and will read out its
> configuration. If this is going wrong, that is a bug which should be
> found and fixed.
> 

I do agree with your point about leaving the PHY untouched and reading out 
its configuration as the default values in phy_support_eee() instead of 
setting the existing values to true for eee_enabled and tx_lpi_enabled.

> We want the core to be fixed, not workaround added to MAC
> drivers. Please think about this when proposing future patches.
> 
> 	Andrew
I will create different small patch fixes for each of the implementations. 
Thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
