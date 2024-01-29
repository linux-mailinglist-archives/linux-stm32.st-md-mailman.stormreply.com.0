Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7F84068A
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:18:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDAC3C6A613;
	Mon, 29 Jan 2024 13:18:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F28A8C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706534328; x=1738070328;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JpFZYsNzV1BEiQaBqprQnIqEqg0c3XqDOiJt3LcQ2KU=;
 b=SRjFIlIKZU4adx6MZqssKz39kZftrZEioV9AuJT2CxCl4JMTtlVKOPRF
 u5PJ/9o172lzysV19qSs7mk5I576DiJiJP5LN727mvDbDSj8Wjq41qgBa
 GPa14bqke7eoO8MU8pF24oO/WIOnN9eihkprXdN0vRAq3BZ8pyDfVeNsv
 E3G8Q/wAu8Wt7Pmw414PH9hbFolDUknZ4S+yW1s2Z1INX9H8IELC1UxZo
 wqOwDgImWn62j9oWgHnFqfqLuPg5f+vJA9FEcLLn6EmrSCenslxPxf9Hq
 UdWyZo7EOgryzdwYdq2gcpt967JYmt166jIW/7TTtb702pG6KzJaY3sOJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="400092663"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="400092663"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="787828961"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="787828961"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.122.111])
 ([10.247.122.111])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:18:33 -0800
Message-ID: <d1e28a1e-5d82-40bd-99d5-ca30a1744ccc@linux.intel.com>
Date: Mon, 29 Jan 2024 21:18:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <20230921121946.3025771-4-yong.liang.choong@linux.intel.com>
 <ZQxNhYcusHfrJvxM@shell.armlinux.org.uk>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZQxNhYcusHfrJvxM@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, platform-driver-x86@vger.kernel.org,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Jean Delvare <jdelvare@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/5] net: phy: update in-band
 AN mode when changing interface by PHY driver
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



On 21/9/2023 10:04 pm, Russell King (Oracle) wrote:
> On Thu, Sep 21, 2023 at 08:19:44PM +0800, Choong Yong Liang wrote:
>> As there is a mechanism in PHY drivers to switch the PHY interface
>> between SGMII and 2500BaseX according to link speed. In this case,
>> the in-band AN mode should be switching based on the PHY interface
>> as well, if the PHY interface has been changed/updated by PHY driver.
>>
>> For e.g., disable in-band AN in 2500BaseX mode, or enable in-band AN
>> back for SGMII mode (10/100/1000Mbps).
>>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> This approach is *going* to break existing setups, sorry.
> 
>> +/**
>> + * phylink_interface_change() - update both cfg_link_an_mode and
>> + * cur_link_an_mode when there is a change in the interface.
>> + * @phydev: pointer to &struct phy_device
>> + *
>> + * When the PHY interface switches between SGMII and 2500BaseX in
>> + * accordance with the link speed, the in-band AN mode should also switch
>> + * based on the PHY interface
>> + */
>> +static void phylink_interface_change(struct phy_device *phydev)
>> +{
>> +	struct phylink *pl = phydev->phylink;
>> +
>> +	if (pl->phy_state.interface != phydev->interface) {
>> +		/* Fallback to the correct AN mode. */
>> +		if (phy_interface_mode_is_8023z(phydev->interface) &&
>> +		    pl->cfg_link_an_mode == MLO_AN_INBAND) {
>> +			pl->cfg_link_an_mode = MLO_AN_PHY;
>> +			pl->cur_link_an_mode = MLO_AN_PHY;
> 
> 1. Why are you changing both cfg_link_an_mode (configured link AN mode)
> and cur_link_an_mode (current link AN mode) ?
> 
> The "configured" link AN mode is supposed to be whatever was configured
> at phylink creation time, and it's never supposed to change. The
> "current" link AN mode can change, but changing that must be followed
> by a major reconfiguration to ensure everything is correctly setup.
> That will happen only because the change to the current link AN mode
> can only happen when pl->phy_state.interface has changed, and the
> change of pl->phy_state.interface triggers the reconfiguration.
> 
During the phylink_create, the cfg_link_an_mode will be set to MLO_AN_INBAND.

Then we switch from the SGMII interface to 2500BASEX interface. When we 
perform 'ifconfig eth0 down' and 'ifconfig eth0 up' then we will not able 
to bring up the PHY due to the phylink_attach_phy function. It is not 
expect to have MLO_AN_INBAND with PHY_INTERFACE_MODE_2500BASEX interface.

static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
			      phy_interface_t interface)
{
	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
		return -EINVAL;

	if (pl->phydev)
		return -EBUSY;

	return phy_attach_direct(pl->netdev, phy, 0, interface);
}

I did change different ways to handle it in the new patch series.
So it should not impact much on the existing phylink framework.

> 2. You force this behaviour on everyone, so now everyone with a SFP
> module that operates in 802.3z mode will be switched out of inband mode
> whether they want that or not. This is likely to cause some breakage.
> 
>> +		} else if (pl->config->ovr_an_inband) {
>> +			pl->cfg_link_an_mode = MLO_AN_INBAND;
>> +			pl->cur_link_an_mode = MLO_AN_INBAND;
> 
> Here you force inband when not 802.3z mode and ovr_an_inband is set.
> There are SFP modules that do *not* support in-band at all, and this
> will break these modules when combined with a driver that sets
> ovr_an_inband. So more breakage.
> 
> Please enumerate the PHY interface modes that you are trying to support
> with this patch set, and indicate whether you want in-band for that
> mode or not, and where the restriction for whether in-band can be used
> comes from (PHY, PCS or MAC) so that it's possible to better understand
> what you're trying to achieve.
> 
> Thanks.
> 
Thank you for pointing out the bug that will impact everyone. Actually 
cur_link_an_mode is just required for PCS, I did handle it that only intel 
platforms will get the PCS negotiation mode for the PCS.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
