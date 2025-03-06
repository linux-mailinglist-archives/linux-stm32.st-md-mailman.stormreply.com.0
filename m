Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C763A56172
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 08:05:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61E49C7A823;
	Fri,  7 Mar 2025 07:05:09 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B291C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 23:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741303737;
 bh=q2c6AS1rlUDUzvA6Yu68aG7T+Ty/a7PAe/Tq0jI31fc=;
 b=tv1LwmEHL6b6OqO03H5ZgDBFbrFwURY4t6IPOqGnRRwB0gAhhNkd0CSZsaq/0TkdLdANV7z8o
 yz7+DFteQQHUOGunubrXGL/fh5AkkwQZBFS3C/vuTsF1dtWPv6Ru9WS/ylwim6oqPhkxbRcP93G
 qgNDyDfaKHIjskJWrU17gUCZgpVxaGeV1GXQDjQN67zQQ3rb4ALJgW/lwbcX5HAhpAaKROMk42Y
 n9oVWS1GH3ZVIBpMJalLXBXiGehG5FKB1dQVn36vwlJeg/O5+/REb6hYUMErIsL8OkqIR3GNFkW
 faobwQaHT1A5d07aDw6uC8ZkPmH3yKtFs2VqIYXaaWkw==
X-Forward-Email-ID: 67ca2fafc1763851c065d15d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <624f2474-9a39-46a3-a6e5-f9966471bf3d@kwiboo.se>
Date: Fri, 7 Mar 2025 00:28:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-2-jonas@kwiboo.se>
 <d6b15dc2-f6b2-4703-a4da-07618eaed4db@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <d6b15dc2-f6b2-4703-a4da-07618eaed4db@lunn.ch>
X-Mailman-Approved-At: Fri, 07 Mar 2025 07:05:06 +0000
Cc: Wadim Egorov <w.egorov@phytec.de>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: dwmac-rk: Use
 DELAY_ENABLE macro for RK3328
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

On 2025-03-06 23:25, Andrew Lunn wrote:
> On Thu, Mar 06, 2025 at 08:38:52PM +0000, Jonas Karlman wrote:
>> Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
>> was merged in the same merge window. This resulted in RK3328 not being
>> converted to use the new DELAY_ENABLE macro.
>>
>> Change to use the DELAY_ENABLE macro to help disable MAC delay when
>> RGMII_ID/RXID/TXID is used.
>>
>> Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for RGMII_ID/RXID/TXID")
> 
> Please add a description of the broken behaviour. How would i know i
> need this fix? What would i see?

Based on my layman testing I have not seen any real broken behaviour
with current enablement of a zero rx/tx MAC delay for RGMII_ID/RXID/TXID.

The driver ops is called with a rx/tx_delay=0 for RGMII_ID/RXID/TXID
modes, what the MAC does with enable=true and rx/tx_delay=0 is unclear
to me.

> 
> We also need to be careful with backwards compatibility. Is there the
> potential for double bugs cancelling each other out? A board which has
> the wrong phy-mode in DT, but because of this bug, the wrong register
> is written and it actually works because of reset defaults?

To my knowledge this should have very limited effect, however I am no
network expert and after doing very basic testing on several different
rk3328/rk3566/rk3568/rk3588 I could not see any real affect with/without
this change.

The use of Fixes-tag was more to have a reference to the commit that
first should have used the DELAY_ENABLE macro.

Regards,
Jonas

> 
>     Andrew
> 
> ---
> pw-bot: cr
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
