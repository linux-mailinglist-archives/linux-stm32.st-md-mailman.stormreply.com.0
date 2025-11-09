Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0BC4428B
	for <lists+linux-stm32@lfdr.de>; Sun, 09 Nov 2025 17:39:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 694F9C60496;
	Sun,  9 Nov 2025 16:39:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3CD2C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Nov 2025 16:39:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 082504E415EB;
 Sun,  9 Nov 2025 16:39:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BCD0D606F5;
 Sun,  9 Nov 2025 16:39:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66E9011853189; Sun,  9 Nov 2025 17:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762706339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ZPRMEMcp2dhUGBHSuTRmxmLz/+slEndBNL5XpFqtZ1U=;
 b=aIoKA3TZ8t6K+Vrshq3NfDorKiZuRejrlRcVM0UIqysbh10hoVWL/cFDQhnbe6lSgmOWR0
 uarz8vGDSht8iVMcwkPYyBxJjPFdP7M6zXkR37d8DrJIdoZygxRdQq+7li1H0hHStZwqWR
 daNbvdSgrgRc7RjtZdrQcXdI8UR0Aph/BG+sFxJJTMPqR/sWkHAj6VUwTAXQK8OSr8e/Mr
 KGNYX84FHVQkFyJhxmFq51m5AWO/5263nSruhA8vU2zzrFNPt2eFYtVdJFTHqJkYsTJkpW
 nyIToGDmgTbgMXEt7bAePomqHPtkWBJ+w4z9jj9+8PmpuLrHiKK2RuV0GMylRw==
Message-ID: <e309efc0-1b03-416c-8464-af92cc428acf@bootlin.com>
Date: Sun, 9 Nov 2025 17:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
 <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
 <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 16/16] net: stmmac: visconti: use
 stmmac_get_phy_intf_sel()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 08/11/2025 08:58, Russell King (Oracle) wrote:
> On Fri, Nov 07, 2025 at 07:23:26PM +0100, Maxime Chevallier wrote:
>> Hi Russell,
>>
>> On 07/11/2025 15:29, Russell King (Oracle) wrote:
>>> -	switch (plat_dat->phy_interface) {
>>> -	case PHY_INTERFACE_MODE_RGMII:
>>> -	case PHY_INTERFACE_MODE_RGMII_ID:
>>> -	case PHY_INTERFACE_MODE_RGMII_RXID:
>>> -	case PHY_INTERFACE_MODE_RGMII_TXID:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
>>> -		break;
>>> -	case PHY_INTERFACE_MODE_MII:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_MII;
>>> -		break;
>>> -	case PHY_INTERFACE_MODE_RMII:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
>>> -		break;
>>> -	default:
>>> +	int phy_intf_sel;
>>> +
>>> +	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
>>> +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
>>> +	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
>>> +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
>>>  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
>>>  		return -EOPNOTSUPP;
>>>  	}
>>
>> Probably not too big of a deal, but don't we now incorrectly accept the
>> "gmii" mode ?
> 
> We will accept GMII mode, but (a) does that matter, and (b) shouldn't
> the DT binding be checking the phy-mode (we have some bindings that do.)

Thanks for the clarification, that's fine by me then :)

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
