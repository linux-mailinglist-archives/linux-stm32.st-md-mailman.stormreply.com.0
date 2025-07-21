Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20160B0C411
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 14:26:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF157C32E93;
	Mon, 21 Jul 2025 12:26:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08A36C32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 12:26:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCB6IN007054;
 Mon, 21 Jul 2025 14:26:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 fqiwAVutR1r5EQfU0bWFAUEcQiPbqDN4nQ+mORgbmZw=; b=DAyLPBEAplfXgm0X
 o93LZeJwbDtNejaod2Dtz+F0rJSKVcNuTfA8NE1KghKatYoZ3/0IcygcXYkoASoe
 zEN/P+q4CSd4zAqlViY2B+SC3gd82JhjD6eY0nDP+zDwI+9VHZQtpMx64ghQ8G1z
 7GlfFqfrDZ1b8QpSZanCAOI/VykHbgASaUp2DbRXvaaVFCu+6kO0LMlodu08HsSH
 MTJY9ox9uug/nPb/MrOkP1kxXx7+zdjn7c2KQLqh3C0ZK7yHRzo5UC5DiV4cm/28
 HVMXPWAZCEfXT+PvLJd7Ls6uk3fzkEjiiF8EXa+at4Mfdd7r/Esojzkev0DL+s7l
 shNFCQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028g0fh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jul 2025 14:26:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 56DDC40047;
 Mon, 21 Jul 2025 14:24:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CF5B7A4C92;
 Mon, 21 Jul 2025 14:23:30 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 14:23:29 +0200
Message-ID: <1fc9d75e-459d-454f-b8dc-1fb7f59d09b4@foss.st.com>
Date: Mon, 21 Jul 2025 14:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
 <aH4kVBTxd4zRYv2l@shell.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <aH4kVBTxd4zRYv2l@shell.armlinux.org.uk>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
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

Hello Russel,

On 7/21/25 13:28, Russell King (Oracle) wrote:
> On Mon, Jul 21, 2025 at 01:14:45PM +0200, Gatien Chevallier wrote:
>> +static int smsc_phy_suspend(struct phy_device *phydev)
>> +{
>> +	if (!phydev->wol_enabled)
>> +		return genphy_suspend(phydev);
> 
> This should not be necessary. Take a look at phy_suspend(). Notice:
> 
>          phydev->wol_enabled = phy_drv_wol_enabled(phydev) ||
>                                (netdev && netdev->ethtool->wol_enabled);
>          /* If the device has WOL enabled, we cannot suspend the PHY */
>          if (phydev->wol_enabled && !(phydrv->flags & PHY_ALWAYS_CALL_SUSPEND))
>                  return -EBUSY;
> 
> PHY_ALWAYS_CALL_SUSPEND is not set for this PHY, therefore if
> phydev->wol_enabled is set by the above code, phydrv->suspend will
> not be called.
> 

Indeed, thank you for pointing this out. I will remove this callback for
v2.

>> +
>> +	return 0;
>> +}
>> +
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
>> +	rc = phy_write_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR,
>> +			   rc | MII_LAN874X_PHY_WOL_STATUS_MASK);
>> +
>> +	return rc;
> 
> Note that this will be called multiple times, e.g. during attachment of
> the PHY to the network device, when the device is opened, etc even
> without ->suspend having been called, and before ->wol_enabled has
> been set. Make sure your code is safe for this.
> 

If ->wol_enabled isn't set, then we should fallback to the previous
implementation so I expect it to be fine for that matter.
Then, I expect flags to be set only in case of WoL event received.
Nevertheless, I will double check the phy_* API used in this sequence
for V2, thank you.

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
