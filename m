Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E91A570D0
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 19:50:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC4B2C78F96;
	Fri,  7 Mar 2025 18:50:39 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F1E2C78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 18:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741373437;
 bh=qmRiDQKZXzZ5w+8TJZygVsnLCM0DBXbnOysWCxlvMp4=;
 b=nez2KURC9ip1Gl20ApP7lUvHX8A0tfQHxY2QIvZGqyR3zUpVhPRZvXwQvzmpfT6FbaqTqp8Dc
 eblpf1wuso5relMkI2Jq0DtUUc1+em5oaMpXvgZfqy4+FPGOBAN3MUF5jkrxp13LoHzMRNgBMid
 02UljFMBSQg3aer3SbjKMrs7e2QgExdltNSYnY4PXYM5J5tLrHdFhMkoSZze5hVx2nVpNGXsfLX
 v6cdGPWvwEhXdfxOJxOF2hHXmzfuzd5Q1rja6myeOVoZ5ug4qtPCJWP7RXd1jHt/WeBxchWyFt0
 mIE+aRwTSljmXH3R3vN9WDRHjf0E4JrNx2BYCYY7PVbg==
X-Forward-Email-ID: 67cb3fe8789af4fdcbb0b28f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <67294dfc-a816-4828-9e45-6a897c5710d5@kwiboo.se>
Date: Fri, 7 Mar 2025 19:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
 <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
 <1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
 <20250307085558.5f8fcb90@kernel.org> <Z8s5ZZyTCpS9xHlA@shell.armlinux.org.uk>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z8s5ZZyTCpS9xHlA@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rockchip@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 devicetree@vger.kernel.org
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

On 2025-03-07 19:22, Russell King (Oracle) wrote:
> On Fri, Mar 07, 2025 at 08:55:58AM -0800, Jakub Kicinski wrote:
>> On Fri, 7 Mar 2025 00:49:38 +0100 Jonas Karlman wrote:
>>> Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and php-grf during probe
>>>
>>> [encrypted.asc  application/octet-stream (3384 bytes)] 
>>
>> Is it just me or does anyone else get blobs from Jonas?
>> The list gets text, according to lore.
> 
> Looking at the emails I've received, some which were via the list, some
> which were direct, I don't see anything out of the ordinary - seems to
> just be text/plain here.
> 

I just learned that my outgoing email provider will automatically
attempt to PGP encrypt messages on a per-recipient basis using Web Key
Directory ("WKD"), and Jakub Kicinski seem to have an openpgpkey
published at [1].

Should I reach out to my outgoing email provider and ask if they can
disable the automatic encryption feature?

[1] https://kernel.org/.well-known/openpgpkey/hu/k5mqwn6xdasq745xgzbqu7eq3p5ysxjz?l=kuba

Regards,
Jonas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
