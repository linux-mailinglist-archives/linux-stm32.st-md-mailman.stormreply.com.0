Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E749CD51B
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 02:45:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 850DCC7A833;
	Fri, 15 Nov 2024 01:45:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73D04C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 01:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731635147; x=1763171147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yJjdF32OY6zfb+mESQ3VGqFK0PLcIWDQ8VkuY/mylkw=;
 b=JvKMsbv5qkVO2XtaWqwEN2TQa9zAJs+IimwO2wWJlSXviklZ/bCc1CBX
 jCv0SsD94OuXJBJxkcit4UrHI7hiu/iFQR26mOrNYXeAyB6zfoxEw19wK
 N1l+AE7TAyFUWLWRU6gwUVc7ncyPZCAkKBWahn06n0zxsi/rm6rvIdBE5
 BbvTneZJl3BLmJr4XtO9XH+LYqfe7+c+GLo0HILEEuYNN8+ulI3aJ58pa
 i/9owAZQzWnBOUPYVcQGyCs8QWeAKSRufb5MfQuv6IW5Fev0wMJygRe24
 CFYxRRMOboEutpo856K9wgB22ov2ZJHj35WDFwsNN3VJgPMBLzAa7hbzO w==;
X-CSE-ConnectionGUID: YnqjBOthQWqYONy+5gg1wg==
X-CSE-MsgGUID: RAXiWmZYQli3lnlTmCs65g==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31028264"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="31028264"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 17:45:38 -0800
X-CSE-ConnectionGUID: ZSoy7dh8QXaberbAbMlhuA==
X-CSE-MsgGUID: PWUnzZUpRcCKkFqhTZne+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="89153074"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.75.68])
 ([10.247.75.68])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 17:45:26 -0800
Message-ID: <fdac60cd-dd7d-4e7b-a65e-2c2a01f4f147@linux.intel.com>
Date: Fri, 15 Nov 2024 09:45:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-3-yong.liang.choong@linux.intel.com>
 <a6cbf428-4672-4beb-8c55-e4d3ae684458@lunn.ch>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <a6cbf428-4672-4beb-8c55-e4d3ae684458@lunn.ch>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v1 2/2] net: stmmac: set initial EEE
 policy configuration
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



On 14/11/2024 10:19 pm, Andrew Lunn wrote:
> On Thu, Nov 14, 2024 at 04:16:53PM +0800, Choong Yong Liang wrote:
>> Set the initial eee_cfg values to have 'ethtool --show-eee ' display
>> the initial EEE configuration.
>>
>> Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 7bf275f127c9..5fce52a9412e 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -1204,7 +1204,7 @@ static int stmmac_init_phy(struct net_device *dev)
>>   			netdev_err(priv->dev, "no phy at addr %d\n", addr);
>>   			return -ENODEV;
>>   		}
>> -
>> +		phy_support_eee(phydev);
>>   		ret = phylink_connect_phy(priv->phylink, phydev);
> 
> Is supporting EEE a synthesis option, or is it always available?
> 
> Some EEE code is guarded by:
> 
>          if (!priv->dma_cap.eee)
>                  return -EOPNOTSUPP;
> 
> 	Andrew

It's a synthesis option that should check priv->dma_cap.eee before setting 
EEE. I will update it in the next version.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
