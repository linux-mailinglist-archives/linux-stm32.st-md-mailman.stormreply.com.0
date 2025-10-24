Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A89C05B12
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 12:54:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D7ABC5F1C5;
	Fri, 24 Oct 2025 10:54:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67574C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 10:54:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 340764E412D8;
 Fri, 24 Oct 2025 10:54:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECEF160703;
 Fri, 24 Oct 2025 10:54:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 96ECB102F2355; 
 Fri, 24 Oct 2025 12:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761303255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=y1Ao409MtaPgUYRpBahYZXHRywkGhOPNNwYQ3CbOmSk=;
 b=wFOTnljMgZcJ9fFHGVUItDYZLELl/nQ9UUjZkKVBZJ440S5fcemvTZjmbaMAdRgSKyuPz/
 8lsfoDzhq2GxO9LzzfOwG4pEW1uh+ApYVf0cjxtPFBmz3Z3b41IxtAqXOjgpkrg4ZMVwRf
 LsrdvvwKXqgxFfBn+dwd1CAiRrutSKALKw/kGdv9Xuxfu8LVqJ4+jn821L91R9OTL6Mdu6
 NcFpnAtXY3nHeQn1imhGR8o123Lrkivf8wYdoLljGN/f/V2m/fW7MHsCuz0u2op1dJNw5L
 6yL9i5xDEF+X/qPX1MthiIvhw+8BJruccXktW9g7OJwJ8DS4bhbeNq4ZuA74Sw==
Message-ID: <1a1cacb5-0005-4b32-8e68-624644a38f92@bootlin.com>
Date: Fri, 24 Oct 2025 12:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <28d91eca-28dd-4e5b-ae60-021e777ee064@bootlin.com>
 <aPtZg_v3H53hiQXo@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aPtZg_v3H53hiQXo@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
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

Hi Russell,

On 24/10/2025 12:48, Russell King (Oracle) wrote:
> On Fri, Oct 24, 2025 at 08:44:07AM +0200, Maxime Chevallier wrote:
>> Hello Russell,
>>
>> On 23/10/2025 11:36, Russell King (Oracle) wrote:
>>> Hi,
>>>
>>> This series cleans up hwif.c:
>>>
>>> - move the reading of the version information out of stmmac_hwif_init()
>>>   into its own function, stmmac_get_version(), storing the result in a
>>>   new struct.
>>>
>>> - simplify stmmac_get_version().
>>>
>>> - read the version register once, passing it to stmmac_get_id() and
>>>   stmmac_get_dev_id().
>>>
>>> - move stmmac_get_id() and stmmac_get_dev_id() into
>>>   stmmac_get_version()
>>>
>>> - define version register fields and use FIELD_GET() to decode
>>>
>>> - start tackling the big loop in stmmac_hwif_init() - provide a
>>>   function, stmmac_hwif_find(), which looks up the hwif entry, thus
>>>   making a much smaller loop, which improves readability of this code.
>>>
>>> - change the use of '^' to '!=' when comparing the dev_id, which is
>>>   what is really meant here.
>>>
>>> - reorganise the test after calling stmmac_hwif_init() so that we
>>>   handle the error case in the indented code, and the success case
>>>   with no indent, which is the classical arrangement.
>>>
>>>  drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
>>>  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
>>>  2 files changed, 98 insertions(+), 71 deletions(-)
>>
>> I didn't have the bandwidth to do a full review, however I ran tests
>> with this series on dwmac-socfpga and dwmac-stm32, no regressions found.
>>
>> For the series,
>>
>> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Thanks, it's good to have someone else testing. I do need to post v2
> with some tweaks to patches 2, 3 and 4 due to a typo that gets
> eliminated in later patches. "verison*" -> "version*" in one instance.
> 
If it's only typos, feel free to keep the t-b tag :)

Thanks,

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
