Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73EA69C5F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 00:00:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5C26C7803C;
	Wed, 19 Mar 2025 23:00:54 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB21C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 23:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742425252;
 bh=jyTLNPs087w5BxM7OveqzCRi5hUy7RVtutepUjFchbA=;
 b=d9eAEmo+bx6+4OeejiCE2yIb+9KToI//j0Go03qfxN2TCKUfXALMlBgeZ8iqty6u1ivwf0AuR
 Brd0BndqLhs0vQ0lpNZERnxqjAQAt3pUFFghhwTrgkca9Xz8kALGNQHvqTfv9r/Mf+qvrTCSt54
 nEGkh7ISnthdyq58HQVXGlZjNbuaIhVUps8RgRmlM/7wd7X4Qf0psZqQtZXEN300/IHLqh1xqQI
 xnAtlWpswSuAi1fk66tUIpIWoYBPBD1bOdAEQFXCyEFOSoF3/YdjcD8Ao6sPGou7U38ekb2QybI
 rPXDMLPjX+OPthDgwYUz1mO0YHj89Bx3laE8ttdiZj5g==
X-Forward-Email-ID: 67db4c9027ee59b783a86bdf
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e766eb6d-618a-43a0-b1e1-954c2c3fbf0e@kwiboo.se>
Date: Thu, 20 Mar 2025 00:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-4-jonas@kwiboo.se>
 <d7b3ec5c-2d74-4409-9894-8f2cb3e055f6@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <d7b3ec5c-2d74-4409-9894-8f2cb3e055f6@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/5] net: stmmac: dwmac-rk:
 Move integrated_phy_powerup/down functions
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

Hi Andrew,

On 2025-03-19 23:39, Andrew Lunn wrote:
> On Wed, Mar 19, 2025 at 09:44:07PM +0000, Jonas Karlman wrote:
>> Rockchip RK3528 (and RV1106) has a different integrated PHY compared to
>> the integrated PHY on RK3228/RK3328. Current powerup/down operation is
>> not compatible with the integrated PHY found in these SoCs.
>>
>> Move the rk_gmac_integrated_phy_powerup/down functions to top of the
>> file to prepare for them to be called directly by a GMAC variant
>> specific powerup/down operation.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>> +#define RK_GRF_CON2_MACPHY_ID		HIWORD_UPDATE(0x1234, 0xffff, 0)
>> +#define RK_GRF_CON3_MACPHY_ID		HIWORD_UPDATE(0x35, 0x3f, 0)
>> +
>> +static void rk_gmac_integrated_phy_powerup(struct rk_priv_data *priv)
>> +{
>> +	if (priv->ops->integrated_phy_powerup)
>> +		priv->ops->integrated_phy_powerup(priv);
>> +
>> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_MACPHY_CFG_CLK_50M);
>> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_GMAC2PHY_RMII_MODE);
>> +
>> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON2, RK_GRF_CON2_MACPHY_ID);
>> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON3, RK_GRF_CON3_MACPHY_ID);
> 
> I know you are just moving code around....
> 
> Do you know what these MACPHY_ID are? I hope it is not what you get
> when you read PHY registers 2 and 3?

I think it may be:

  GRF_MACPHY_CON2
  15:0   macphy_id / PHY ID Number, macphy_cfg_phy_id[15:0]

  GRF_MACPHY_CON3
  15:12  macphy_cfg_rev_nr / Manufacturer's Revision Number
  11:6   macphy_model_nr / Manufacturer's Model Number
  5:0    macphy_id / PHY ID Number, macphy_cfg_phy_id[21:16]

and

  MACPHY_PHY_IDENTIFIER1 - Address: 02
  15:0   PHY ID number / default:cfg_phy_id[15:0]

  MACPHY_PHY_IDENTIFIER2 - Address: 03
  15:10  PHY ID number / default:cfg_phy_id[21:16]
  9:4    Model number / default:cfg_model_nr[5:0]
  3:0    Revision number / default:cfg_rev_nr[3:0]

So likely what you get when you read PHY registers 2 and 3.

Regards,
Jonas

> 
> 	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
