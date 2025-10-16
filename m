Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E993BE21B3
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 10:15:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15626C57A42;
	Thu, 16 Oct 2025 08:15:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA6CCC5719D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 08:15:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 09E151A1410;
 Thu, 16 Oct 2025 08:15:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D17616062C;
 Thu, 16 Oct 2025 08:15:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACE2B102F22B9; 
 Thu, 16 Oct 2025 10:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760602512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=dXsurt/UB6adbtX7xqXZLThjuVgu/eCgnHbY5gWKelw=;
 b=pBEULoiRmAouS3SHUlKOJyrqWJ1t2pWZMEbbaVEaGbDYSH8OzKzPbTtL5dRUoMhvF95Czb
 2A5X4dM7SfrhDOhll7Qjw/V3SmjgkR3m0USf630ew4Kns4/6FGHU/Sy527JAvABxPeBc53
 tEqrPxK2eGLRHIF2YDaF0FGQTOdf5Jp+vf1PKMPgca8yso8uIL3nlUP7lQ7jhH3f6k/IU3
 GtTcWvhzBu8exiUKbVHyINlfRkh8a/F7HLdPego1MiE4fuabbF4MyWu2ZkNz0FFkCPLrRJ
 KOizvsmFFq+vZVxJOQxaPLAAiy0mCHeWPQulGTJZGpUL73FZIkidBmQbw32sJw==
Message-ID: <328d5953-aec3-4a1e-b2e3-268155793996@bootlin.com>
Date: Thu, 16 Oct 2025 10:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015145519.280b6263@kmaincent-XPS-13-7390>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251015145519.280b6263@kmaincent-XPS-13-7390>
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Add support for
 coarse timestamping
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

Hi,

On 15/10/2025 14:55, Kory Maincent wrote:
> On Wed, 15 Oct 2025 12:27:20 +0200
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
>> Hello everyone,
>>
>> This is another attempt to support the fine vs coarse timestamping modes
>> in stmmac.
>>
>> This mode allows trading off PTP clock frequency adjustment precision
>> versus timestamping precision.
>>
>> In coarse mode, we lose the ability to fine-tune the PTP clock
>> frequency, but get better timestamping precision instead. This is
>> especially useful when acting as a PTP Grand Master, where the PTP clock
>> in sync'd to a high-precision GPS clock through PPS inputs.
>>
>> This has been submitted before as a dedicated ioctl() back in 2020 [1].
>> Since then, we now have a better representation of timestamp providers
>> with a dedicated qualifier (approx vs precise).
>>
>> This series attempts to map these new qualifiers to stmmac's
>> timestamping modes, see patch 2 for details.
>>
>> The main drawback IMO is that the qualifiers don't map very well to our
>> timestamping modes, as the "approx" qualifier actually maps to stmmac's
>> "coars" mode, but we actually gain in timestamping precision (while
>> losing frequency precision).
> 
> https://elixir.bootlin.com/linux/v6.17.1/source/include/uapi/linux/net_tstamp.h#L16
> "approx" was initially added for DMA timestamp point.
> Maybe we should add a new enum value here with a more suitable name.

Yeah, the terminology in stmmac of "coarse/fine" refers to frequency adjustment, while
the "fine/approx" qualifiers refer to timestamping.

I'm OK to add a new value, with the usual risk of seeing the number of qualifiers
explode if different hardware to that in different ways.

I suggest keeping "precise" for the default mode, and maybe use "enhanced" or
a similar term that would imply that the improved precision is done at the expense
of some some other aspect of the system (and therefore probably not
suitable as a default).

Maybe Richard can shed some light on that ?

> Regards,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
