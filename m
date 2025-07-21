Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E924B0C621
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 16:22:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF1C5C32E8F;
	Mon, 21 Jul 2025 14:22:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAB1EC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 14:22:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCPm57020352;
 Mon, 21 Jul 2025 16:22:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MlPUcJGCX9eGUJmog410SGdHvgab8UL6u6jJvem96Jg=; b=5iIxQfL4YWN2yOno
 Nav6nT0ot5lu7hhSPyXgIerU2aur1+pWl2zGqeVjwo5/MoRbNadUTCrznjLT6TA2
 TaNHCcQbUg79u4zgfZ1O9g9Vzdl9kvccvLpIX9bvOJJaLruoh8epwg9EXkyX5bZI
 HBffxDudJzyO/nBTZnXGGRTuIBlzLysZ8qs1DiKVOZiSbSdG/gSZSIL+QQcDwfNM
 8lHkW+sNsPxrhPb3JUzOj/Fg5nvwoylJ3DKlGL8PWv6cyARyZE2P2qxSoGTxpeJ8
 ClX+EVBlHiLtWapJDla7SIQTQ2zQW1eT6/lUrBSu7KW2M741cnudg2Mve0D671uW
 QvzB2A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q21em4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jul 2025 16:22:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B30240054;
 Mon, 21 Jul 2025 16:20:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2988376EA8E;
 Mon, 21 Jul 2025 16:19:09 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 16:19:08 +0200
Message-ID: <b95e3439-717b-4159-acf9-7ce76d1c43d4@foss.st.com>
Date: Mon, 21 Jul 2025 16:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
 <cca8e9e6-a063-4e00-87af-f59ea926cce3@lunn.ch>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <cca8e9e6-a063-4e00-87af-f59ea926cce3@lunn.ch>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, devicetree@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/4] net: phy: smsc: fix and
	improve WoL support
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

Hello Andrew,

On 7/21/25 15:26, Andrew Lunn wrote:
>> +static int smsc_phy_suspend(struct phy_device *phydev)
>> +{
>> +	if (!phydev->wol_enabled)
>> +		return genphy_suspend(phydev);
>> +
>> +	return 0;
>> +}
> 
> Suspend/resume is somewhat complex, and i don't know all the
> details. But this looks odd. Why does the phylib core call suspend
> when phydev->wol_enabled is true? That at least needs an explanation
> in the commit message.
> 

As stated by Russel, this callback is not needed because phy_suspend()
will not call this suspend() callback if phydev->wol_enabled is set.
Therefore, I'm removing it vor V2.

>> +static int smsc_phy_resume(struct phy_device *phydev)
>> +{
>> +	int rc;
>> +
>> +	if (!phydev->wol_enabled)
>> +		return genphy_resume(phydev);
>> +
>> +	rc = phy_read_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	if (!(rc & MII_LAN874X_PHY_WOL_STATUS_MASK))
>> +		return 0;
>> +
>> +	dev_info(&phydev->mdio.dev, "Woke up from LAN event.\n");
> 
> Please don't spam the log. It is clear the system woke up, there are
> messages in the log...

I wanted to state clearly that the wake up happended because of a WoL
event but sure, I understand that it's best if log isn't spammed. Do you
prefer it completely removed or dev_info()->dev_dbg() ?

Best regards,
Gatien

> 
> 	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
