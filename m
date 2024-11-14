Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF39C8201
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 05:35:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA248C78F98;
	Thu, 14 Nov 2024 04:35:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94BD4C78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 04:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731558951; x=1763094951;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qD1IW+f1kR09edDspe+k6r67xtRpNtIiv+xj7UhMIfU=;
 b=lP+4ASE5M29jGmWrICm9WWCjMPLjgzbn0pvBYVn/VLwshZ6P347E7Qok
 BH7Wd/Ni8Zndd6CeII6LpUIHAl1RkNFXYbBCu/JcfMNf7T05Lu9I0YnKy
 2iCquxEm0975xEZCXDwBolsre7gVSxxg9YdwmvJLf5yJZROTMU/c7PUHm
 KFX/jMUIkKf8E2p1koznSKeeaGSox1AK5xLWPIRT+m/zvmN3av4cq6jGy
 B5fwUGZdlnmYvy73SR9D8NRLJ0Rw5kd+moU9bo604oMyk8PPD408cbTAQ
 5e0oD1sdMJ7uCdhEWMHgHXBRypkxTbv2kgFYfX24zYJBb6NWplOFpZjAi A==;
X-CSE-ConnectionGUID: W8K3Vc7eT4q9+go9GivffQ==
X-CSE-MsgGUID: S/XVUiQdQzK6xNXcR3+FiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42864378"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="42864378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:35:42 -0800
X-CSE-ConnectionGUID: llR+QJXdTuucDK8/8v7CBA==
X-CSE-MsgGUID: UTS55jWTSVK1r8iz+qNE1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88260930"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.16.168])
 ([10.247.16.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:35:39 -0800
Message-ID: <5401b791-3c69-4603-ba14-7d430df25667@linux.intel.com>
Date: Thu, 14 Nov 2024 12:35:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
 <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
 <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
 <392105cb-3f73-4765-a702-7cce0c6ac62c@gmail.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <392105cb-3f73-4765-a702-7cce0c6ac62c@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
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



On 14/11/2024 5:48 am, Heiner Kallweit wrote:
> "relies on" may be the wrong term here. There's an API definition,
> and phy_ethtool_get_eee() takes care of the PHY-related kernel part,
> provided that the MAC driver uses phylib.
> I say "PHY-related part", because tx_lpi_timer is something relevant
> for the MAC only. Therefore phylib stores the master config timer value
> only, not the actual value.
> The MAC driver should populate tx_lpi_timer in the get_eee() callback,
> in addition to what phy_ethtool_get_eee() populates.
> This may result in the master config value being overwritten with actual
> value in cases where the MAC doesn't support the master config value.
> 
> One (maybe there are more) special case of tx_lpi_timer handling is
> Realtek chips, as they store the LPI timer in bytes. Means whenever
> the link speed changes, the actual timer value also changes implicitly.
> 
> Few values exist twice: As a master config value, and as status.
> struct phy_device has the status values:
> @eee_enabled: Flag indicating whether the EEE feature is enabled
> @enable_tx_lpi: When True, MAC should transmit LPI to PHY
> 
> And master config values are in struct eee_cfg:
> 
> struct eee_config {
> 	u32 tx_lpi_timer;
> 	bool tx_lpi_enabled;
> 	bool eee_enabled;
> };
> 
> And yes, it may be a little misleading that eee_enabled exists twice,
> you have to be careful which one you're referring to.
> 
> ethtool handles the master config values, only "active" is a status
> information.
> 
> So the MAC driver should:
> - provide a link change handler in e.g. phy_connect_direct()
> - this handler should:
>    - use phydev->enable_tx_lpi to set whether MAC transmits LPI or not
>    - use phydev->eee_cfg.tx_lpi_timer to set the timer (if the config
>      value is set)
> 
> Important note:
> This describes how MAC drivers *should* behave. Some don't get it right.
> So part of your confusion may be caused by misbehaving MAC drivers.
> One example of a MAC driver bug is what I wrote earlier about
> stmmac_ethtool_op_get_eee().
> 
> And what I write here refers to plain phylib, I don't cover phylink as
> additional layer.
> 

Thank you for your detailed explanation. It has been very helpful and has 
clarified how the code behaves.

Based on your and Andrew's input, I agree that phy_update_eee() is not needed.

I will ensure that our implementation follows these guidelines and will 
address any potential issues with misbehaving MAC drivers.

Thank you again for your valuable insights.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
