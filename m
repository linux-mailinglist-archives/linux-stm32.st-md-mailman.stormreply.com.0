Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D8A56173
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 08:05:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E304C7A825;
	Fri,  7 Mar 2025 07:05:09 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90116C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 23:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741304988;
 bh=oDJmvAX7nAqa4Vhl4U1zjfFrd0jhOQ7wzffB0eGRfkE=;
 b=GpgPu2AUbNHWX+mccsHZrxMS9C0kNVY/jogO8MGd7AU16uNQp1F2ta7r2T0DUxb7T+PeDDll2
 ZhFMpb7A8SJgrQAfzUIlYRzT7O7vqWAvJmEDEE8BvZdFRmwJgxtkaw8JghJESJam7daGsqJzb7B
 itd8zx5mo/o1lupzrdlLlbdUNNp0DCBEM82XvhTmd6v2n11R27aTnLQ3rsSf3m8S/Qw38SFaRHf
 mmylCyhyGnqqWXXwDP+ppOZ4bR06jiWHE13mBRAEhKPpVGdEJx4ec3350Kt4dj1oe5NsHFnPMy5
 TxuWYmGucI9HRylCH870G9CPRGm3R0DIPJUxFzEKeZSQ==
X-Forward-Email-ID: 67ca3498c1763851c065d4e9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
Date: Fri, 7 Mar 2025 00:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
 <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
X-Mailman-Approved-At: Fri, 07 Mar 2025 07:05:06 +0000
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-rk: Validate
 rockchip, grf and php-grf during probe
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

On 2025-03-06 23:37, Andrew Lunn wrote:
> On Thu, Mar 06, 2025 at 09:09:46PM +0000, Jonas Karlman wrote:
>> All Rockchip GMAC variants require writing to GRF to configure e.g.
>> interface mode and MAC rx/tx delay. The GRF syscon regmap is located
>> with help of a rockchip,grf and rockchip,php-grf phandle.
> 
>> @@ -1813,8 +1564,24 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>>  
>>  	bsp_priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>>  							"rockchip,grf");
>> -	bsp_priv->php_grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>> -							    "rockchip,php-grf");
>> +	if (IS_ERR(bsp_priv->grf)) {
>> +		ret = PTR_ERR(bsp_priv->grf);
>> +		dev_err_probe(dev, ret, "failed to lookup rockchip,grf\n");
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	bsp_priv->php_grf =
>> +		syscon_regmap_lookup_by_phandle_optional(dev->of_node,
>> +							 "rockchip,php-grf");
>> +	if ((of_device_is_compatible(dev->of_node, "rockchip,rk3588-gmac") ||
>> +	     of_device_is_compatible(dev->of_node, "rockchip,rk3576-gmac")) &&
>> +	    !bsp_priv->php_grf)
>> +		bsp_priv->php_grf = ERR_PTR(-ENODEV);
> 
> It seems odd you say all variants need this property, and then you
> look for two specific variants here and do something different? Why
> are these two special?

rockchip,grf is required for all GMACs, rockchip,php-grf is also needed
on rk3576 and rk3588 (+rk3562 that has been posted on ML) :-S

Above use of of_device_is_compatible() was my attempt at requiring the
syscon regmap for those variants that make use of php_grf. And still not
break rk3562 depending on the order these would land.

Should probably clarify a little bit with a code comment in a v2.

Regards,
Jonas

> 
> 	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
