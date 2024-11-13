Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A49C6C74
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2024 11:11:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBDA0C78F89;
	Wed, 13 Nov 2024 10:11:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0701C7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731492683; x=1763028683;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vy8Iqu3OFXniKxvWbng1DoVI0tlBlU/xFf+XDj6PoTQ=;
 b=BlMXbjQOL4yNdQqoKFMdfgnl3jXYJ/gkm4jipgwpExMjDpN8G9TM2BRE
 F9qrktzvy3V2/55n8NuDq4RUhiHnJlQpdP/NKrth16/qPJeWH23moTyPJ
 fZATxXzBVDp2hGVqGfmf4sB9/x61oYSMI6xO9MSEgRWJO8yO/ZN4QWD21
 2LzzEzn8n1gsfU+5A5CrApo6sxxNgiUTb/B4rkfPreW7AGK+SQxo1MMch
 z7t+kc/5O7rplzdtf2ngcsJBVvMwd+1wsxue3WNh747jB5lqH7y0VLvLH
 R9hsI4ZMKULLPDWbe0DkvByNV8kuxjI1MVgx3FvGAoDt3uXmSHXJsAgrm w==;
X-CSE-ConnectionGUID: aQ+AcW39RmWg+8MUtaXKEQ==
X-CSE-MsgGUID: Oksg3ANoQo2cw11e74+xuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31608044"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="31608044"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:11:15 -0800
X-CSE-ConnectionGUID: 05tXbYHhRACmOLJ2EKDmjQ==
X-CSE-MsgGUID: uVFc8516StGJKtpbzyMqgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87395176"
Received: from hooisan-mobl.gar.corp.intel.com (HELO [10.247.100.100])
 ([10.247.100.100])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:11:11 -0800
Message-ID: <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
Date: Wed, 13 Nov 2024 18:10:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
 <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
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



On 12/11/2024 9:04 pm, Andrew Lunn wrote:
> On Tue, Nov 12, 2024 at 12:03:15PM +0100, Heiner Kallweit wrote:
>> In stmmac_ethtool_op_get_eee() you have the following:
>>
>> edata->tx_lpi_timer = priv->tx_lpi_timer;
>> edata->tx_lpi_enabled = priv->tx_lpi_enabled;
>> return phylink_ethtool_get_eee(priv->phylink, edata);
>>
>> You have to call phylink_ethtool_get_eee() first, otherwise the manually
>> set values will be overridden. However setting tx_lpi_enabled shouldn't
>> be needed if you respect phydev->enable_tx_lpi.
> 
> I agree with Heiner here, this sounds like a bug somewhere, not
> something which needs new code in phylib. Lets understand why it gives
> the wrong results.
> 
> 	Andrew
Hi Russell, Andrew, and Heiner, thanks a lot for your valuable feedback.

The current implementation of the 'ethtool --show-eee' command heavily 
relies on the phy_ethtool_get_eee() in phy.c. The eeecfg values are set by 
the 'ethtool --set-eee' command and the phy_support_eee() during the 
initial state. The phy_ethtool_get_eee() calls eeecfg_to_eee(), which 
returns the eeecfg containing tx_lpi_timer, tx_lpi_enabled, and eee_enable 
for the 'ethtool --show-eee' command.

The tx_lpi_timer and tx_lpi_enabled values stored in the MAC or PHY driver 
are not retrieved by the 'ethtool --show-eee' command.

Currently, we are facing 3 issues:
1. When we boot up our system and do not issue the 'ethtool --set-eee' 
command, and then directly issue the 'ethtool --show-eee' command, it 
always shows that EEE is disabled due to the eeecfg values not being set. 
However, in the Maxliner GPY PHY, the driver EEE is enabled. If we try to 
disable EEE, nothing happens because the eeecfg matches the setting 
required to disable EEE in ethnl_set_eee(). The phy_support_eee() was 
introduced to set the initial values to enable eee_enabled and 
tx_lpi_enabled. This would allow 'ethtool --show-eee' to show that EEE is 
enabled during the initial state. However, the Marvell PHY is designed to 
have hardware disabled EEE during the initial state. Users are required to 
use Ethtool to enable the EEE. phy_support_eee() does not show the correct 
for Marvell PHY.

2. The 'ethtool --show-eee' command does not display the correct status, 
even if the link is down or the speed changes to one that does not support EEE.

3. The tx_lpi_timer in 'ethtool --show-eee' always shows 0 if we have not 
used 'ethtool --set-eee' to set the values, even though the driver sets 
different values.

I appreciate Russell's point that eee_enabled is a user configuration bit, 
not a status bit. However, I am curious if tx_lpi_timer, tx_lpi_enabled, 
and other fields are also considered configuration bits.

According to the ethtool man page:
--show-eee
Queries the specified network device for its support of Energy-Efficient 
Ethernet (according to the IEEE 802.3az specifications)

It does not specify which fields are configuration bits and which are 
status bits.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
