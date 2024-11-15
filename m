Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5F99CD520
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 02:46:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96FF0C7A833;
	Fri, 15 Nov 2024 01:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 312E9C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 01:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731635178; x=1763171178;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m5vc2Wizx2rJbKoJg3DIZCEwDfTT1ErdANobu7oKqtg=;
 b=JTKe2B/fNi760pY7cg66r1VNrikTrwcWd9ClI0NQEFpJqdw1HsXsARnF
 wUj0AUFUFPnxde/hB4V1XUTq9RtyAnT5KcnvD1ByAz3lAewZ48TWtCAXf
 RduxMcBUvFx2Lyej9A13VPeIRxTOh51RFHmsIuEZWR6eJAxZtUZ4s+x/k
 Q7JKj9pSsx39HCAUGxvR/xvpLAgufxjkqNNn6MoIa70jd77M9DQ/3bJWJ
 NDmPiuxf9IGZOtX76jT4faJpBNz0HryWphG56LlLSOASMSrsJfCN7QUFN
 AshCI1dcPRH/WugIanNnsEq98+FaIf30JTh0zHbVOhKN2AHlNgWX53C6g Q==;
X-CSE-ConnectionGUID: rW3ZgevkQgmX/7I0Bsgcrw==
X-CSE-MsgGUID: /UJbUu4/TJeo9iDIVIH9Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31028348"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="31028348"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 17:46:13 -0800
X-CSE-ConnectionGUID: 5je70P8PRcmZc2W8TeLARg==
X-CSE-MsgGUID: RJOEMptXRAm1HGWlvPOq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="89153309"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.75.68])
 ([10.247.75.68])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 17:46:09 -0800
Message-ID: <6c023200-5e81-432c-b21d-d7a9cf1bfc92@linux.intel.com>
Date: Fri, 15 Nov 2024 09:46:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
 <ZzXBpEHs0y2_elqK@shell.armlinux.org.uk>
 <ZzXLgEjElnJD1445@shell.armlinux.org.uk>
 <ZzXOAvc__iQscSb4@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZzXOAvc__iQscSb4@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] net: phy: set eee_cfg based on
 PHY configuration
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



On 14/11/2024 6:16 pm, Russell King (Oracle) wrote:
> On Thu, Nov 14, 2024 at 10:05:52AM +0000, Russell King (Oracle) wrote:
>> On Thu, Nov 14, 2024 at 09:23:48AM +0000, Russell King (Oracle) wrote:
>>> On Thu, Nov 14, 2024 at 04:16:52PM +0800, Choong Yong Liang wrote:
>>>> Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
>>>> designed to have EEE hardware disabled during the initial state, and it
>>>> needs to be configured to turn it on again.
>>>>
>>>> This patch reads the PHY configuration and sets it as the initial value for
>>>> eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled instead of having them set to
>>>> true by default.
>>>
>>> eee_cfg.tx_lpi_enabled is something phylib tracks, and it merely means
>>> that LPI needs to be enabled at the MAC if EEE was negotiated:
>>>
>>>   * @tx_lpi_enabled: Whether the interface should assert its tx lpi, given
>>>   *      that eee was negotiated.
>>>
>>> eee_cfg.eee_enabled means that EEE mode was enabled - which is user
>>> configuration:
>>>
>>>   * @eee_enabled: EEE configured mode (enabled/disabled).
>>>
>>> phy_probe() reads the initial PHY state and sets things up
>>> appropriately.
>>>
>>> However, there is a point where the EEE configuration (advertisement,
>>> and therefore eee_enabled state) is written to the PHY, and that should
>>> be config_aneg(). Looking at the Marvell driver, it's calling
>>> genphy_config_aneg() which eventually calls
>>> genphy_c45_an_config_eee_aneg() which does this (via
>>> __genphy_config_aneg()).
>>>
>>> Please investigate why the hardware state is going out of sync with the
>>> software state.
>>
>> I think I've found the issue.
>>
>> We have phydev->eee_enabled and phydev->eee_cfg.eee_enabled, which looks
>> like a bug to me. We write to phydev->eee_cfg.eee_enabled in
>> phy_support_eee(), leaving phydev->eee_enabled untouched.
>>
>> However, most other places are using phydev->eee_enabled.
>>
>> This is (a) confusing and (b) wrong, and having the two members leads
>> to this confusion, and makes the code more difficult to follow (unless
>> one has already clocked that there are these two different things both
>> called eee_enabled).
>>
>> This is my untested prototype patch to fix this - it may cause breakage
>> elsewhere:
> 
> As mentioned in the other thread:
> 
> Without a call to phy_support_eee():
> 
> EEE settings for eth2:
>          EEE status: disabled
>          Tx LPI: disabled
>          Supported EEE link modes:  100baseT/Full
>                                     1000baseT/Full
>          Advertised EEE link modes:  Not reported
>          Link partner advertised EEE link modes:  100baseT/Full
>                                                   1000baseT/Full
> 
> With a call to phy_support_eee():
> 
> EEE settings for eth2:
>          EEE status: enabled - active
>          Tx LPI: 0 (us)
>          Supported EEE link modes:  100baseT/Full
>                                     1000baseT/Full
>          Advertised EEE link modes:  100baseT/Full
>                                      1000baseT/Full
>          Link partner advertised EEE link modes:  100baseT/Full
>                                                   1000baseT/Full
> 
> So the EEE status is now behaving correctly, and the Marvell PHY is
> being programmed with the advertisement correctly.
> 

Thank you for all the suggestions, the provided prototype, and the tested 
results.

I will study the suggestions in depth, test the provided prototype, and 
provide more feedback.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
