Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F95828FCC
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 23:20:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9729C6B452;
	Tue,  9 Jan 2024 22:20:44 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9D1BC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 22:20:43 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-50eabd1c701so4264355e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jan 2024 14:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704838843; x=1705443643;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FHficcIIFY7DUie+kBBBxCI5Hfo9wpTnRz3NE6iiBRs=;
 b=LbATdDLU13Ah4MaoaYjM2bft/koQtcNTkZWqOtYWCIDG1iZil/keL1H/67H/7725kI
 uC67hX5zlVF1+2k4B+0Yowdj1qhAwl4rpLv+/CsImK0iiRa9cBLSEYIhron+ru/sGJEj
 AXl5ofDOYgnzkY94wQ7Y2RTHIQpfet2vB/UnSi864mUKOTn3tg1osevhDjfQaE9sFKUp
 XuKl7Yl/NOVCMw6Zs/Y5FUBlzPAf/a1Z/F8MU5PPK6JLnAeeZqjQkq0ukOCbnu0ByVYb
 qZpML1WdFlxpZ+opvmQ4b9AK1+PVOmL5F7XRGGkOzDcPBJ0bQRvROJetwDWYz1MZNiU8
 bFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704838843; x=1705443643;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHficcIIFY7DUie+kBBBxCI5Hfo9wpTnRz3NE6iiBRs=;
 b=HDrdRpcDcgYQNFmASGDnokCnyRmfvR5QKUgKPd+qwz2e7t+cynJP6FXzdb/R6TBhXb
 inSa95AVXR4HlVkWm83eYvm5kRqjmkKr9L5cKbGyfoydmWr+tgPJA1v3nvKxs8A88mSY
 ocYAcW9KGXd2N6+EPnBrvTdZo8wetB9pJBaARQ+oN/I7ebl3Tdwt/cO0M2tDQAl470TZ
 aC0Niz68hEW1QmXngGct/fg0cycSljJra15zQxAR5S2ElvANrWe/PBV0UU3cTufIADu+
 FofDfNF5PTknFGNhMTs0gvRkOWvAJbOuAMNR2qXsq07qyky0LsYCyseXCFu5ztNRsFgZ
 iR/g==
X-Gm-Message-State: AOJu0YwxwX9zvlsImFXVQltYKYwWi3bmjJ3HWbL7Z81L2LA9Rfj6UQ/p
 RtDwCnLOw1CDbha1wAKyjMg=
X-Google-Smtp-Source: AGHT+IHzUaf7cXQ3/+rzpIrUR/8dYETycPMk53CfPA2rWOWhUqHeEZ9pITM3KmFaD9xESKzduOK3OQ==
X-Received: by 2002:a19:645e:0:b0:50e:7479:79da with SMTP id
 b30-20020a19645e000000b0050e747979damr19306lfj.24.1704838842804; 
 Tue, 09 Jan 2024 14:20:42 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a056512305000b0050ea1f2baeasm474292lfb.20.2024.01.09.14.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 14:20:42 -0800 (PST)
Date: Wed, 10 Jan 2024 01:20:40 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <5y3ed4greqcdz6hsepvpqstyabxupqbw7dc3eilgi64acrbkoc@oy2c7flu33gs>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
 <20240105070925.2948871-2-leong.ching.swee@intel.com>
 <ffiewfybqvh66nmri4im4veupwytvlxk5jfgdy3nbj6wldxjl2@2vwvnnu37pt7>
 <7cc4fa92-27cb-4b0d-8f1b-88091548bdb9@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cc4fa92-27cb-4b0d-8f1b-88091548bdb9@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/4] dt-bindings: net: snps,
 dwmac: per channel irq
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

On Tue, Jan 09, 2024 at 10:10:37AM +0100, Krzysztof Kozlowski wrote:
> On 07/01/2024 21:10, Serge Semin wrote:
> > On Fri, Jan 05, 2024 at 03:09:22PM +0800, Leong Ching Swee wrote:
> >> From: Swee Leong Ching <leong.ching.swee@intel.com>
> >>
> >> Add dt-bindings for per channel irq.
> >>
> >> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> >> Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
> >> ---
> >>  .../devicetree/bindings/net/snps,dwmac.yaml   | 24 +++++++++++++------
> >>  1 file changed, 17 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >> index 5c2769dc689a..e72dded824f4 100644
> >> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >> @@ -103,17 +103,27 @@ properties:
> >>  
> >>    interrupts:
> >>      minItems: 1
> >> -    items:
> >> -      - description: Combined signal for various interrupt events
> >> -      - description: The interrupt to manage the remote wake-up packet detection
> >> -      - description: The interrupt that occurs when Rx exits the LPI state
> >> +    maxItems: 19
> >>  
> >>    interrupt-names:
> >>      minItems: 1
> >> +    maxItems: 19
> >>      items:
> >> -      - const: macirq
> >> -      - enum: [eth_wake_irq, eth_lpi]
> >> -      - const: eth_lpi
> >> +      oneOf:
> >> +        - description: Combined signal for various interrupt events
> >> +          const: macirq
> >> +        - description: The interrupt to manage the remote wake-up packet detection
> >> +          const: eth_wake_irq
> >> +        - description: The interrupt that occurs when Rx exits the LPI state
> >> +          const: eth_lpi
> >> +        - description: DMA Tx per-channel interrupt
> >> +          pattern: '^dma_tx[0-7]?$'
> >> +        - description: DMA Rx per-channel interrupt
> >> +          pattern: '^dma_rx[0-7]?$'
> >> +
> >> +    allOf:
> >> +      - contains:
> >> +          const: macirq
> > 
> > In order to restore the v1 discussion around this change, here is my
> > comment copied from there:
> > 
> >> As Rob correctly noted it's also better to make sure that 'macirq' is placed first
> >> in the array. So instead of the constraint above I guess the next one would
> >> make sure both the array has 'macirq' name and it's the first item:
> >>
> >> allOf:
> >>   - maxItems: 34
> >>     items:
> >>       - const: macirq
> > 
> > Leong said it didn't work:
> > https://lore.kernel.org/netdev/CH0PR11MB54904615B45E521DE6B1A7B3CF61A@CH0PR11MB5490.namprd11.prod.outlook.com/
> > 
> > Rob, Krzysztof, Conor could you please clarify whether this change is ok the
> > way it is or it would be better to preserve the stricter constraint
> > and fix the DT-schema validation tool somehow?
> 

> First of all this change is not good, because commit msg explains
> absolutely nothing why this is done and what exactly you want to achieve
> here. The "what" part often is obvious from the code, but not in this
> case. Are the per-channel IRQs conflicting with macirq or others? Are
> they complementary (maxItems: 19 suggests that, though, but could be
> mistake as well)? Do they affect all snps,dwmac derivatives or only some?
> 
> So many questions and zero answers in one liner commit msg!

Right. The commit message is way too modest =) Leong?

> 
> Now about the problem, I think we should preserve the order, assuming
> that these are complementary so first three must be defined.

Ok. But please note that "Wake" and "LPI" IRQs are optional. It's
possible to have a device with the "MAC" and "DMA" IRQs and no
individual "Wake"/"LPI" IRQ lines. Thus the only mandatory IRQ is
"MAC" which order (being always first), I agree, should be preserved.

> This
> however could be done in the device schema referencing snps,dwmac. I
> think I will repeat myself: I dislike this schema, because it mixes two
> purposes: defining shared part and defining final device part. The code
> in this patch is fine for a schema defining the shared part.
> 
> Therefore before we start growing this monstrosity into bigger one, I
> think we should go back to the plans of reworking and cleaning it.

If you are talking about the changes like introduced here (essentially
it's Patch 4):
https://www.spinics.net/lists/netdev/msg888079.html
I can resurrect it (rebase on the latest kernel, fix the notes, run
dt-validation, etc) and submit for review on the next week or so.
Then the Leong' patch in subject either won't be necessary or will
concern the shared schema only. Does it sound acceptable?

-Serge(y)

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
