Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C9BA69CE3
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 00:52:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D50CC7803A;
	Wed, 19 Mar 2025 23:52:51 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4020BC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 23:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742428367;
 bh=v2ctdz7uayF07UCPNi//R/x3v+JmE0rED8OH/LNmzM8=;
 b=Y3S5WI6xpmkz+Q6UhQjTY/0SaTkK5aYfcIFcLidi3iFwtqC72nUcJ6Yx34M+qUEQHyBZ4ARea
 3ekNjEmPeO/9GKuF184P1j+hTfOe1hus1biCB98kyNFdKYOhki2oXAgEkhAJK3eKoCrVq+vhJ74
 GBjriivA+XvOprCqytd/KaQl6zj75sO5USH0Pfg1yCqlnMHXuKJBXqSrS+AG5wTv20c1TN6Hezb
 h2+ZVnvYqufr2SLgf5I3xhVuqs9D70RQN60zSFwbOmO/fqAC7lkXhHcN6N9doreGaKr8WrD82F5
 qCC/O0u2ufSe4LHpilOJXtjpyIyiwVIdvULx23koO7Sw==
X-Forward-Email-ID: 67db58c827ee59b783a8734c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <eabc0fb8-10cc-465c-9434-b0804418dcb6@kwiboo.se>
Date: Thu, 20 Mar 2025 00:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-6-jonas@kwiboo.se>
 <d53a2119-2650-4a87-af94-1b9c2297cf72@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <d53a2119-2650-4a87-af94-1b9c2297cf72@lunn.ch>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 5/5] net: stmmac: dwmac-rk:
 Add initial support for RK3528 integrated PHY
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

On 2025-03-20 00:27, Andrew Lunn wrote:
> On Wed, Mar 19, 2025 at 09:44:09PM +0000, Jonas Karlman wrote:
>> Rockchip RK3528 (and RV1106) has a different integrated PHY compared to
>> the integrated PHY on RK3228/RK3328.
> 
> What ID does this PHY have? Is it just the reset which is different,
> or is it actually a different PHY, and the rockchip PHY driver needs
> additions?

Sorry, look like I missed to include the phy-id reported in this patch
and only included that detail in the related device tree patch [1].

This PHY seem to be different compared to the PHY used in older SoCs.

The PHY identified on addr 0x2 as 0044.1400 and in vendor kernel this
relate to the Rockchip RK630 PHY [2].

  #define RK630_PHY_ID				0x00441400

  /*
   * Fixed address:
   * Addr: 1 --- RK630@S40
   *       2 --- RV1106@T22
   */
  #define PHY_ADDR_S40				1
  #define PHY_ADDR_T22				2

[1] https://lore.kernel.org/all/20250310001254.1516138-2-jonas@kwiboo.se/
[2] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr5/drivers/net/phy/rk630phy.c

Regards,
Jonas

> 
> 	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
