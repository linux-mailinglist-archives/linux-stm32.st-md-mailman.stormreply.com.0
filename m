Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E1B777467
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:25:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6674BC6B469;
	Thu, 10 Aug 2023 09:25:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9343AC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691659518; x=1723195518;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0kRWsvAisMK8ylRZ6jr2PcSZ59g1ZWZu9ngL3IpeqhQ=;
 b=S7RRdaYWZW/AJtoYXHq/USLcl6O5KRXLx9YPhu2KRSfJz47NU/PHcvuW
 C/4Z0Y8kvg0m6RDBDdaJl///0yKg0gCSHPS3RHRTlYZukBGsk1JnGXhy5
 +Kkjdewe/VxyIJb0IzlaResC/9XyTfgIPPxWbXxt6JJN7AqeX/qS0pE8p
 bPMqW0u7tZafSf42aEy8mrr8Yl4LQkMkyXZ1NNu36RIEc5d9EAbYQpB+B
 q89fjnSnyfyJES4gMG57yrUMpIriDf0lAY6QJJK9ehXt8hq2CIiK7uNlI
 w2U2jDwEdtno1whhH4wAf7IMJiEfsfWeCTeSj3uVYwNIg0AO0Ye1HcvTL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375066408"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="375066408"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 02:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905981541"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="905981541"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.213.42.193])
 ([10.213.42.193])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 02:23:48 -0700
Message-ID: <0aacc9b8-3780-6298-60db-7b140a52b92f@linux.intel.com>
Date: Thu, 10 Aug 2023 17:23:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20230804084527.2082302-1-yong.liang.choong@linux.intel.com>
 <20230804084527.2082302-4-yong.liang.choong@linux.intel.com>
 <ZMy+q84hVAbTQIk5@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZMy+q84hVAbTQIk5@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 platform-driver-x86@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/5] net: phy: update in-band
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



On 4/8/2023 5:02 pm, Russell King (Oracle) wrote:
> On Fri, Aug 04, 2023 at 04:45:25PM +0800, Choong Yong Liang wrote:
>> From: "Tan, Tee Min" <tee.min.tan@linux.intel.com>
>>
>> Add cur_link_an_mode into phy_device struct for PHY drivers to
>> communicate the in-band AN mode setting with phylink framework.
>>
>> As there is a mechanism in PHY drivers to switch the PHY interface
>> between SGMII and 2500BaseX according to link speed. In this case,
>> the in-band AN mode should be switching based on the PHY interface
>> as well, if the PHY interface has been changed/updated by PHY driver.
>>
>> For e.g., disable in-band AN in 2500BaseX mode, or enable in-band AN
>> back for SGMII mode (10/100/1000Mbps).
>>
>> Signed-off-by: Tan, Tee Min <tee.min.tan@linux.intel.com>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>> ---
>>   drivers/net/phy/marvell10g.c | 6 ++++++
>>   drivers/net/phy/phylink.c    | 4 ++++
>>   include/linux/phy.h          | 3 +++
>>   3 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
>> index d4bb90d76881..a9df19278618 100644
>> --- a/drivers/net/phy/marvell10g.c
>> +++ b/drivers/net/phy/marvell10g.c
>> @@ -30,6 +30,7 @@
>>   #include <linux/phy.h>
>>   #include <linux/sfp.h>
>>   #include <linux/netdevice.h>
>> +#include <linux/phylink.h>
>>   
>>   #define MV_PHY_ALASKA_NBT_QUIRK_MASK	0xfffffffe
>>   #define MV_PHY_ALASKA_NBT_QUIRK_REV	(MARVELL_PHY_ID_88X3310 | 0xa)
>> @@ -946,6 +947,9 @@ static void mv3310_update_interface(struct phy_device *phydev)
>>   	 * xaui / rxaui modes according to the speed.
>>   	 * Florian suggests setting phydev->interface to communicate this to the
>>   	 * MAC. Only do this if we are already in one of the above modes.
>> +	 * In-band Auto-negotiation is not supported in 2500BASE-X.
>> +	 * Setting phydev->cur_link_an_mode to communicate this to the
>> +	 * phylink framework.
>>   	 */
>>   	switch (phydev->speed) {
>>   	case SPEED_10000:
>> @@ -956,11 +960,13 @@ static void mv3310_update_interface(struct phy_device *phydev)
>>   		break;
>>   	case SPEED_2500:
>>   		phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
>> +		phydev->cur_link_an_mode = MLO_AN_PHY;
>>   		break;
>>   	case SPEED_1000:
>>   	case SPEED_100:
>>   	case SPEED_10:
>>   		phydev->interface = PHY_INTERFACE_MODE_SGMII;
>> +		phydev->cur_link_an_mode = MLO_AN_INBAND;
>>   		break;
>>   	default:
>>   		break;
>> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
>> index 4f1c8bb199e9..f9cbb6d7e134 100644
>> --- a/drivers/net/phy/phylink.c
>> +++ b/drivers/net/phy/phylink.c
>> @@ -1720,6 +1720,8 @@ static void phylink_phy_change(struct phy_device *phydev, bool up)
>>   		pl->phy_state.pause |= MLO_PAUSE_RX;
>>   	pl->phy_state.interface = phydev->interface;
>>   	pl->phy_state.link = up;
>> +	pl->cur_link_an_mode = phydev->cur_link_an_mode;
>> +	pl->cfg_link_an_mode = phydev->cur_link_an_mode;
>>   	mutex_unlock(&pl->state_mutex);
>>   
>>   	phylink_run_resolve(pl);
>> @@ -1824,6 +1826,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
>>   	if (pl->config->mac_managed_pm)
>>   		phy->mac_managed_pm = true;
>>   
>> +	pl->phydev->cur_link_an_mode = pl->cur_link_an_mode;
> 
> I am really not happy with exposing phylink's AN mode into phylib.
> 
Hi Russell,

Thank you for the feedback.
After conducting further analysis on my end, it appears that this line 
"pl->phydev->cur_link_an_mode = pl->cur_link_an_mode;" is not necessary.
If we remove this line of code, would the implementation of this patch be 
acceptable to you?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
