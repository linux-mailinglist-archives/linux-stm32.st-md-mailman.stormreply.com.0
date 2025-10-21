Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEC5BF521F
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 10:02:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60424C5A4FF;
	Tue, 21 Oct 2025 08:02:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74CDEC57184
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 08:02:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 915C41A1580;
 Tue, 21 Oct 2025 08:02:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6544860680;
 Tue, 21 Oct 2025 08:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 31523102F23E1; 
 Tue, 21 Oct 2025 10:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761033736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=OegdgNVbNw+KkRfrQDXaRBUpYFyQJOKVqsrjfmccusE=;
 b=Ujd1EYVBFKWa1NGizpbWWxW2JcSND0EfAG/uNPgiqM7MtxUPYXj8cvBuZHZECAxyzULNWV
 vrBlgx+YQ+SGfoxQFPBmfmlzDf2JlljWJvY9YIOQUM2sXrr9XlN/apuAR7bMj4vNmsHh1/
 CRK5W1KvP9/Grku+NViQRRcU4ACaP/dnORToyb2wIEjCCszc3MjS2hBUR2jgaINm1limPa
 iDTrdcJxefCwoOcD+uhypcdvOMqpgmish1KWBWd97oAHVNiFi36612MUwzASchfzMz7Bwe
 k4HUKjjt+XkJ2xwwejOCLPGk3Mot3GrOuwvIWFVqM/8uha1dTJIck21eUTKtkg==
Message-ID: <911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
Date: Tue, 21 Oct 2025 10:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
 <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
 <20251020180309.5e283d90@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251020180309.5e283d90@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow
 supporting coarse adjustment mode
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

Hi Jakub,

On 21/10/2025 03:03, Jakub Kicinski wrote:
> On Sat, 18 Oct 2025 09:42:57 +0200 Maxime Chevallier wrote:
>>> If the HW really needs it, just lob a devlink param at it?  
>>
>> I'm totally OK with that. I'm not well versed into devlink, working mostly with
>> embedded devices with simple-ish NICs, most of them don't use devlink. Let me
>> give it a try then :)
>>
>> Thanks for taking a look at this,
> 
> FWIW I dropped this form PW in an attempt to unblock testing of
> Russell's series.

Yup no problem for me

> I'm not convinced that the tsconfig API is correct
> here but I don't get how the HW works. Could you perhaps put together
> some pseudocode?

I'm not fully convinced either, devlink could also work. I already have 
a patchset ready that uses devlink for that.

Let's see if I can do a better job explaining this timestamping
parameter :


- In "fine" mode (mapped to precise qualifier if we go with the
tsinfo approach), which is the mode currently used in stmmac :

  u32 accumulator
  u32 addend
  u64 subsecond_increment

  at each ref ptp clock cycle {
    
    accumulator += addend;

    /* accumulator and addend are 32 bits. addend is adjusted
     * to control the drift of the target frequency.
     */
    if (accumulator overflows)
      current_time += subsecond_increment

  }

Main advantage: We can fine tune when we update the current_time, so
basically we can multiply or divide the ref ptp clock based on when
the accumulator overflows, and use the resulting clock as the
timestamp source.

In practice for stmmac, we set the addend to a value so that it takes
2 cycles to overflow, and we adjust the subsecond increment when
updating the PHC frequency. This gives a precision of 46-ish ns.

We do this by design as the ptp ref clk may be fairly slow (down to
5MHz in some cases). If we try to rely on accumulator overflowing at
every cycle to update the time, we'd have to overflow multiple times
per cycle, and the computation of the addend value simply overflows,
cf commit 91a2559 ("net: stmmac: Fix sub-second increment") [1]

This is basic PTP follower mode, we continuously update
the clock used for timestamping.


- In "coarse" mode :

  u32 subsecond_increment

  at each ref ptp clock cycle {
    current_time += subecond_increment
  }

We increment time at a fixed rate. The current_time can only be adjusted
by setting the entire current_time, which is jittery or even non-monotonically
increasing. However, we can use a 20ns increment (or even lower if the ref
clock is faster), and if our ref clock is externally provided by a high
precision source, this allows implementing Grand Master mode with the
highest possible precision.

[1] : https://lore.kernel.org/netdev/20200415122432.70972-2-julien.beraud@orolia.com/

Hopefully that's a bit clearer WRT what the HW can do.

Let me know if you need more clarifications on this, I'll send another
iteration once Russell's cleanup lands, using either devlink or tsconfig
depending on what we chose here.

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
