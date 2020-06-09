Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B41F3FB1
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 17:44:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F04FC36B23;
	Tue,  9 Jun 2020 15:44:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C201BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 15:43:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E60621FB;
 Tue,  9 Jun 2020 08:43:58 -0700 (PDT)
Received: from [10.57.49.155] (unknown [10.57.49.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2950B3F66F;
 Tue,  9 Jun 2020 08:43:55 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, dillon min <dillon.minfei@gmail.com>
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
 <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
 <90df5646-e0c4-fcac-d934-4cc922230dd2@arm.com>
 <CAL9mu0+__0Z3R3TcSrj9-kPxsyQHKS9WqK1u58P0dEZ+Jd-wbQ@mail.gmail.com>
 <20200609153646.GA17969@lst.de>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <031034fb-b109-7410-3ff8-e78cd12a5552@arm.com>
Date: Tue, 9 Jun 2020 16:43:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200609153646.GA17969@lst.de>
Content-Language: en-US
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux@armlinux.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, tglx@linutronix.de,
 info@metux.net, linux-stm32@st-md-mailman.stormreply.com, allison@lohutok.net
Subject: Re: [Linux-stm32] [PATCH 2/2] arm-nommu: Add use_reserved_mem() to
 check if device support reserved memory
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

On 6/9/20 4:36 PM, Christoph Hellwig wrote:
> On Tue, Jun 09, 2020 at 11:22:24PM +0800, dillon min wrote:
>> Hi Vladimir,
>>
>> Thanks for reviewing.
>>
>> Hi Christoph Hellwig,
>>
>> I just want to know if kernel dma mapping/direct is focused on
>> platforms with MMU.
>> leave arch code to handle dma coherent memory management themself for
>> no-MMU platform.
> 
> No, I'd really like to consolidate everything that isn't overly
> arch specific eventually.
> 
>>
>> so, you just return error code in kernel/dma/mapping.c,direct.c
>> without CONFIG_MMU defined ?
>> which means dma-direct mapping doesn't support !CONFIG_MMU is not a
>> bug, but design as it's.
>> or, just return error code currently, will add dma direct mapping
>> support for !CONFIG_MMU in the
>> future?
>>
>> As Vladimir Murzin's suggestion has changes in kernel code, I need
>> your input to get
>> the design goal about dma-direct mapping, thanks.
> 
> Can someone repost the whole patch?
> 

Happy to repost as separate patch once dillon confirms it actually works.

Meanwhile, I'm trying to understand at which point we lost this 
functionality for NOMMU... maybe it will become different patch :)

Cheers
Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
