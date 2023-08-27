Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F40F87899E8
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 02:18:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72F27C6B454;
	Sun, 27 Aug 2023 00:18:08 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E497C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 00:18:07 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so31508151fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 17:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693095486; x=1693700286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R0O9+Nd81lV61HUqL9J8WFR0wEb+50cA6S0W+jgCLe8=;
 b=c/affskxQbENShZrDrcXcKAkTEXbHsnQQKmV0Pou8bPhhXgqTFq+jOGmmDB/J9k+Z3
 Lwj8SoVltyelWC4dq4f05GgIu1Vl3mAC1moPIvkwCjrkQda++FmI0T73NwWdda9WZ4tl
 ZPUL61i4oIuWMvnAWboCGhLHW5Yiz4OTRdctRiGAv3YePFte8v7Eb0sfg1dqQeEuzE6p
 GI41iMMFHl97rHL/QlgVJZnR2W2SO8laQCgdHK0nAUme/x6tOqEILrLVU82JZDGO5H0c
 NVJNCC7/BocOfV9X13sU7FSmqaC1KEGSjvkPH9+ez455BpePqhA8J5kTYASrGoC8D72D
 8fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693095486; x=1693700286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0O9+Nd81lV61HUqL9J8WFR0wEb+50cA6S0W+jgCLe8=;
 b=Vir/6SPJ5nc9IfmYDNZRPjJLRBPFhJ0M8+sIfu+Gn9KprsqHl2XbJ4sQvvQA+jyVBA
 R6k7eyKIAZKzW49USellw6Dbng4g6IjMGdz1VAbnSta7plrO0h5E67n4OMmE6Zunrheh
 vybaK+QbCAtYIDv4P2R5dNNywhNWwr5nxRS+yK1eHvHzhAGOB+U+L0KbVcdUcVpOoxOn
 bAJZ9v3VGBzgV+wE9P1/0OklnV3/+EV871HtU4WopJ59kMJiTASqKQUSq4GZJIxruiUn
 bbWsP7ZF95kTn6MGAahMzU/gBcghZPEWS5qFF22dSiLpftSUtjf0xydpPLnUKlV1MXuM
 7//Q==
X-Gm-Message-State: AOJu0YxQD4IWxbV0AJ5MVNGwOunDotniVM7a2OnK9BYVzEUbsdTSy7hX
 GWQk6mzQxv6y+m9lO19Kr3c=
X-Google-Smtp-Source: AGHT+IETf2PT2oT9j6J9nHb3QF2V2wh+kc6yhG5eIffZAbTs9nY9WVTgxgZMkeph09QnN5G5PyYhHw==
X-Received: by 2002:a2e:3c0e:0:b0:2b6:3651:f12f with SMTP id
 j14-20020a2e3c0e000000b002b63651f12fmr17021462lja.3.1693095486177; 
 Sat, 26 Aug 2023 17:18:06 -0700 (PDT)
Received: from mobilestation ([95.79.200.178])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a05651c104100b002bcd2653872sm1015042ljm.30.2023.08.26.17.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 17:18:05 -0700 (PDT)
Date: Sun, 27 Aug 2023 03:18:03 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <stdtvjzyaudpnxoj4pxdqw4okrmq2bkmbefvyapbs2racx4dhv@of5t463f4nm5>
References: <l7yajzhpuotn62pjkxk43qtcn3u4zltpyqcvo224737bjg3eab@bzu6pirxbvh2>
 <20230823171004.6825-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823171004.6825-1-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, conor.dooley@microchip.com,
 linux-stm32@st-md-mailman.stormreply.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/2] dt-bindings: net: snps,
 dwmac: Tx queues with coe
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

On Thu, Aug 24, 2023 at 01:10:04AM +0800, Rohan G Thomas wrote:
> >On Tue, Aug 22, 2023 at 05:15:25PM -0700, Jakub Kicinski wrote:
> >> On Sat, 19 Aug 2023 10:31:31 +0800 Rohan G Thomas wrote:
> >> > +      snps,tx-queues-with-coe:
> >> > +        $ref: /schemas/types.yaml#/definitions/uint32
> >> > +        description: number of TX queues that support TX checksum offloading
> >> 
> >
> >> Is it going to be obvious that if not present all queues support
> >> checksum offload? I think we should document the default.
> >
> >This question is debatable:
> >1. By default the DW xGMAC and DW QoS Eth IP-cores are
> >synthesized with only the very first Tx queue having Tx COE enabled.
> >2. If TSO is disabled then the Tx COE can be individually enabled
> >for each queue available on DW QoS Eth controller and for the very
> >first N queues on DW xGMAC controller.
> >3. If TSO is enabled then the Tx COE will be automatically and always
> >enabled for as many first queues as there are TSO-capable
> >DMA-channels.
> >4. At the current state the STMMAC driver assumes that all Tx Queues
> >support Tx COE.
> >
> >The entry 4 can't be changed since we'll risk to catch regressions on
> >the platforms with no property specified. On the other hand it partly
> >contradicts to the rest of the entries. I don't know what would be a
> >correct way to specify the default value in this case. Most likely
> >just keep the entry 4 and be done with it.
> >
> >BTW I just noticed that but the suggested "snps,tx-queues-with-coe"
> >property semantic will only cover a DW XGMAC-part of the case 2. DW
> >QoS Eth can be synthesized with Tx COE individually enabled for a
> >particular queue if TSO is unavailable.
> 
> Hi Serge,
> 
> Didn't know about a different IP configuration supported by DW QoS Eth IP. If
> this is the case, I think we can have a flag 'coe-unsupported' for any TX
> queue subnode as below.
> 
> +          snps,coe-unsupported:

> +            $ref: /schemas/types.yaml#/definitions/flag

AFAIR tKrzysztof preferred to use type: boolean for the flags.

> +            description:
> +              TX checksum offload is unsupported by the TX queue. 

> +              If TX checksum
> +              offload is requested for a packet to be transmitted through this
> +              TX queue then have a software fallback in the driver for checksum
> +              calculation.

This is redundant in the HW description.

> 

> If this is okay, I can rework the patch based on this. Covers both DW QoS Eth IP
> and DW XGMAC IP cases.

I guess that's the only choice we have seeing the driver already
expects all the Tx queues having the COE supported.

-Serge(y)

> 
> >
> >-Serge(y)
> >
> >> -- 
> >> pw-bot: cr
> 
> BR,
> Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
