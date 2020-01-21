Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E2144312
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2020 18:21:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60BB5C36B0C;
	Tue, 21 Jan 2020 17:21:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2CA2C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 17:21:41 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08D5F206A2;
 Tue, 21 Jan 2020 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579627300;
 bh=k1Ai2RRq3mJNU7KMm3C7i8tB7yI9m1tjX5kGHl57oqo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C5irau9WCRtngmtjdh4Xx6RwtafqYK8OiKe83QfJT/eZLpD8ZHLBBxe0T9xc797Q1
 KCCVklFYVaLbTNDsNMfYh3WewuTY+mUBR/9lb6KMJGaAXZ7227yJ99uPNjy7jiNCdr
 VlhTXqTI9F5g/HJl1eCfjynBSooICP/dg8+HFmwc=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1itxDe-000YDb-64; Tue, 21 Jan 2020 17:21:38 +0000
MIME-Version: 1.0
Date: Tue, 21 Jan 2020 17:21:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
In-Reply-To: <d6e02817-2464-51b9-246a-7720b607b8d6@st.com>
References: <20bb72d0-8258-abc0-e729-4d3d5a75c41c@denx.de>
 <d6e02817-2464-51b9-246a-7720b607b8d6@st.com>
Message-ID: <82d4619107e9ac76d317268637f050cf@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, marex@denx.de,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, patrick.delaunay@st.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Marek Vasut <marex@denx.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] STM32MP1 level triggered interrupts
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2020-01-21 17:12, Alexandre Torgue wrote:
> Hi Marek,
> 
> On 1/20/20 7:32 PM, Marek Vasut wrote:
>> Hi,
>> 
>> I have a device connected to STM32MP157C which requires active-low
>> level-triggered interrupt sink. The device interrupt line is connected
>> to the SoC gpio-C bank, which has it's interrupt line routed into 
>> EXTI,
>> which can only handle edge triggered interrupts to my understanding.
> 
> correct.
> 
>> 
>> However, ARM GIC should be able to do both and EXTI has this irqmux /
>> EXTImux functionality, which -- if my understanding is correct -- is
>> capable of routing a select GPIO line directly into the GIC as an 
>> EXTIn
>> interrupt signal. Thus, this might permit handling active low
>> level-triggered interrupts. Is there some DT binding to configure this 
>> yet ?
>> 
>> Or is there some other, better, way ?
>> 
> 
> For SPIs, GIC controller handles rising edge triggered interrupt and
> active high level-sensitive. GIC integration in STM32MP157c makes that
> only active high level-sensitive configuration for SPI interrupts is
> supported.

This statement is a slight exaggeration. *any* GIC will happily service
rising-edge triggered SPIs, as it is mandated by the spec. What I 
suspect
is that there is no SPI that is routed out of the SoC for anyone to 
directly
plug anything into it.

          M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
