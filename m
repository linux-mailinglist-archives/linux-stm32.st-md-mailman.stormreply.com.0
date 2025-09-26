Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B5ABA4F18
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 21:05:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CC0FC3FADA;
	Fri, 26 Sep 2025 19:05:28 +0000 (UTC)
Received: from mail-io1-f97.google.com (mail-io1-f97.google.com
 [209.85.166.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44993C3F950
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 19:05:27 +0000 (UTC)
Received: by mail-io1-f97.google.com with SMTP id
 ca18e2360f4ac-917be46c59bso13834839f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 12:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758913526; x=1759518326;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dRmwJqq2SxsiFB6VEpR33/U1NputiwE3QM2SDlba7Y=;
 b=JldaY+fg51pcqTeBI4wCW9plWBUSGpAz6ppQ7oPjYcmsQymuHzBBTORr2qLFHCMrdG
 saDVXULldKn1Qy9aJ4LEYwDjDlvy8ruvVggdiVQ4Vy7OrvzVl+vkoGIXsZk7TpTNj2Kt
 2GR6H7vGje6DTlZpmCPtxC2edSUQSppgz7OY21n0YCL5kj7wny9kYFDbsU3TgJXCqSir
 mWk5J1U2wbmq5HfUuCq4cAV5z7ARb3XZCg/cQ3Y9f712qF8Q+8U7hFq9nomG82sxjkFf
 W7V2uEA6jq+TSHJ9zS7OrMUDcJDEuG3wP0zy74R+uFn+2P+gw+QUah9pXfW43OA5AOCW
 9yOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXlwygis70TqcZ+/MCt1jUanldLe/sqddU8Pht8uvdpKaYFnzyvtz4qoE5BZI+prOON14SR+A35dg37w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLoNEhWHRQ7xMFKTjJPj/lOFs4A3TORzdPhAnw49IKbDgQ7Dam
 1ZpnIjbzImNkSEf/mRzv4H+vfVN2nPNeZaKm1aKdgeqrmXgCQbgDywk/a//F9lfSSNGsT8eOqqd
 bQRVTZ85pXiyaQEyDTA3HfYYjHHrypl+CBDdOoWLxZLNBQoDAat/nUSsUwzaM+QGg3MaBsjzvi1
 qjo1NfS+YpgcKLeu8/FklELWEdG0N7bZGy4sCHqovdWJKLDw2C+TJxEDjKw/hQGUlNcTKHY8TsS
 NMH5uPqJnxD+ElQXAS8rSlXA6cq8Hf2TJZ6PB4K
X-Gm-Gg: ASbGncsN2vAAY1HGoCWbZCjRvkwuTTYyxe0GDdqZCdQIC741rfYV/S4rG12XkD2wtiN
 cpJvcdA3H6u0wH2ay3VRyLkIo8ZvnrouUDttUkFKFtUTLJiw/TWPeJeS4mxYdgKvQMXXUDF/lxg
 +N73auk86gPw43YIvYE55zqfb+0v12W46TGlWeZF9iGsw+xt5IyRY+Id3+eGgtoMfC+DPS4USo6
 mJlcN55/QQR73HEGXNlbJMhKPNTWniLMG6/9x5FpJbjpaETQESclvPN/dxZUziA0VIqCSCuCsnU
 mM5tAA91b15ikokrKNih9fXIMxmTeJb4UkuEVo6BPed2RIPZyNQlUMN3UelZTu1oKyfNq2/t/eK
 owLiOFpBcTHKgG3ltFm43jtH+FWa2W3FXFiuxfCO2Cfzy75XBTUrMpkQMZwCMW9IHNo7j9wKlpp
 3krHHx1IM=
X-Google-Smtp-Source: AGHT+IH3DGoSjIwgN5IdCVV7/6n6LayGHs0HKhgseFiZQOPftD2awUG5IHlYrebrKyGa4o4Lc/QN7i4S2kBh
X-Received: by 2002:a05:6e02:1d86:b0:424:20a6:4a75 with SMTP id
 e9e14a558f8ab-425955ed581mr121839085ab.5.1758913525742; 
 Fri, 26 Sep 2025 12:05:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
 by smtp-relay.gmail.com with ESMTPS id
 8926c6da1cb9f-56a642124a3sm301607173.10.2025.09.26.12.05.25
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Sep 2025 12:05:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2697410e7f9so53101775ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 12:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1758913524; x=1759518324;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0dRmwJqq2SxsiFB6VEpR33/U1NputiwE3QM2SDlba7Y=;
 b=X4Nyp19MxrVT/LHoOaQx6oTOLAqPHttOrLky58qZ81Q691FerLi5EMthL2rc3gmeQF
 1waHmi8/RcpLvM1ikHM8YQ9NoL0K3etIeBM84bVegtE7zR2ciP22tKHbQoVJ3cPN2tM0
 +NGijDZCJau7A7gyQHQXfV/8qd67nVQMRF5Ek=
X-Forwarded-Encrypted: i=1;
 AJvYcCVoyTLqlQCPt+bKZfuOZ+Kz0p6uQoqFSDREiR99RpXSXa9to77vZZ3m3EyVWRqqaWpinm3nIxZgWdNj1A==@st-md-mailman.stormreply.com
X-Received: by 2002:a17:902:db01:b0:272:dee1:c133 with SMTP id
 d9443c01a7336-27ed49ded13mr86956865ad.22.1758913523901; 
 Fri, 26 Sep 2025 12:05:23 -0700 (PDT)
X-Received: by 2002:a17:902:db01:b0:272:dee1:c133 with SMTP id
 d9443c01a7336-27ed49ded13mr86956455ad.22.1758913523442; 
 Fri, 26 Sep 2025 12:05:23 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac9ae0sm60832835ad.140.2025.09.26.12.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 12:05:22 -0700 (PDT)
Message-ID: <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
Date: Fri, 26 Sep 2025 12:05:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: stm32: add
 WoL from PHY support
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



On 9/26/2025 10:59 AM, Russell King (Oracle) wrote:
> On Wed, Sep 17, 2025 at 05:31:16PM +0100, Russell King (Oracle) wrote:
>> On Wed, Sep 17, 2025 at 05:36:37PM +0200, Gatien Chevallier wrote:
>>> If the "st,phy-wol" property is present in the device tree node,
>>> set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
>>> the PHY.
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>   drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> index 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d6959158b795e4bca46869c5 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> @@ -106,6 +106,7 @@ struct stm32_dwmac {
>>>   	u32 speed;
>>>   	const struct stm32_ops *ops;
>>>   	struct device *dev;
>>> +	bool phy_wol;
>>>   };
>>>   
>>>   struct stm32_ops {
>>> @@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>>>   		}
>>>   	}
>>>   
>>> +	dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
>>> +
>>>   	return err;
>>>   }
>>>   
>>> @@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
>>>   	plat_dat->bsp_priv = dwmac;
>>>   	plat_dat->suspend = stm32_dwmac_suspend;
>>>   	plat_dat->resume = stm32_dwmac_resume;
>>> +	if (dwmac->phy_wol)
>>> +		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
>>
>> I would much rather we found a different approach, rather than adding
>> custom per-driver DT properties to figure this out.
>>
>> Andrew has previously suggested that MAC drivers should ask the PHY
>> whether WoL is supported, but this pre-supposes that PHY drivers are
>> coded correctly to only report WoL capabilities if they are really
>> capable of waking the system. As shown in your smsc PHY driver patch,
>> this may not be the case.
>>
>> Given that we have historically had PHY drivers reporting WoL
>> capabilities without being able to wake the system, we can't
>> implement Andrew's suggestion easily.
>>
>> The only approach I can think that would allow us to transition is
>> to add:
>>
>> static inline bool phy_can_wakeup(struct phy_device *phy_dev)
>> {
>> 	return device_can_wakeup(&phy_dev->mdio.dev);
>> }
>>
>> to include/linux/phy.h, and a corresponding wrapper for phylink.
>> This can then be used to determine whether to attempt to use PHY-based
>> Wol in stmmac_get_wol() and rtl8211f_set_wol(), falling back to
>> PMT-based WoL if supported at the MAC.
>>
>> So, maybe something like:
>>
>> static u32 stmmac_wol_support(struct stmmac_priv *priv)
>> {
>> 	u32 support = 0;
>>
>> 	if (priv->plat->pmt && device_can_wakeup(priv->device)) {
>> 		support = WAKE_UCAST;
>> 		if (priv->hw_cap_support && priv->dma_cap.pmt_magic_frame)
>> 			support |= WAKE_MAGIC;
>> 	}
>>
>> 	return support;
>> }
>>
>> static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
>> {
>> 	struct stmmac_priv *priv = netdev_priv(dev);
>> 	int err;
>>
>> 	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
>> 	if (phylink_can_wakeup(priv->phylink) ||
>> 	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
>> 		err = phylink_ethtool_get_wol(priv->phylink, wol);
>> 		if (err != 0 && err != -EOPNOTSUPP)
>> 			return;
>> 	}
>>
>> 	wol->supported |= stmmac_wol_support(priv);
>>
>> 	/* A read of priv->wolopts is single-copy atomic. Locking
>> 	 * doesn't add any benefit.
>> 	 */
>> 	wol->wolopts |= priv->wolopts;
>> }
>>
>> static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
>> {
>> 	struct stmmac_priv *priv = netdev_priv(dev);
>> 	u32 support, wolopts;
>> 	int err;
>>
>> 	wolopts = wol->wolopts;
>>
>> 	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
>> 	if (phylink_can_wakeup(priv->phylink) ||
>> 	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
>> 		struct ethtool_wolinfo w;
>>
>> 		err = phylink_ethtool_set_wol(priv->phylink, wol);
>> 		if (err != -EOPNOTSUPP)
>> 			return err;
>>
>> 		/* Remove the WoL modes that the PHY is handling */
>> 		if (!phylink_ethtool_get_wol(priv->phylink, &w))
>> 			wolopts &= ~w.wolopts;
>> 	}
>>
>> 	support = stmmac_wol_support(priv);
>>
>> 	mutex_lock(&priv->lock);
>> 	priv->wolopts = wolopts & support;
>> 	device_set_wakeup_enable(priv->device, !!priv->wolopts);
>> 	mutex_unlock(&priv->lock);
>>
>> 	return 0;
>> }
>>
>> ... and now I'm wondering whether this complexity is something that
>> phylink should handle internally, presenting a mac_set_wol() method
>> to configure the MAC-side WoL settings. What makes it difficult to
>> just move into phylink is the STMMAC_FLAG_USE_PHY_WOL flag, but
>> that could be a "force_phy_wol" flag in struct phylink_config as
>> a transitionary measure... so long as PHY drivers get fixed.
> 
> I came up with this as an experiment - I haven't tested it beyond
> running it through the compiler (didn't let it get to the link stage
> yet.) Haven't even done anything with it for stmmac yet.
> 

I like the direction this is going, we could probably take one step 
further and extract the logic present in bcmgenet_wol.c and make those 
helper functions for other drivers to get the overlay of PHY+MAC WoL 
options/password consistent across all drivers. What do you think?
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
