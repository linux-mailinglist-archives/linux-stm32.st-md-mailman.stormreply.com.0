Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A311F4E84
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2020 09:04:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E7B0C36B21;
	Wed, 10 Jun 2020 07:04:01 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 717D2C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 15:36:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B476668B02; Tue,  9 Jun 2020 17:36:46 +0200 (CEST)
Date: Tue, 9 Jun 2020 17:36:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: dillon min <dillon.minfei@gmail.com>
Message-ID: <20200609153646.GA17969@lst.de>
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
 <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
 <90df5646-e0c4-fcac-d934-4cc922230dd2@arm.com>
 <CAL9mu0+__0Z3R3TcSrj9-kPxsyQHKS9WqK1u58P0dEZ+Jd-wbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL9mu0+__0Z3R3TcSrj9-kPxsyQHKS9WqK1u58P0dEZ+Jd-wbQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:03:59 +0000
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, tglx@linutronix.de,
 info@metux.net, hch@lst.de, allison@lohutok.net
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

On Tue, Jun 09, 2020 at 11:22:24PM +0800, dillon min wrote:
> Hi Vladimir,
> 
> Thanks for reviewing.
> 
> Hi Christoph Hellwig,
> 
> I just want to know if kernel dma mapping/direct is focused on
> platforms with MMU.
> leave arch code to handle dma coherent memory management themself for
> no-MMU platform.

No, I'd really like to consolidate everything that isn't overly
arch specific eventually.

> 
> so, you just return error code in kernel/dma/mapping.c,direct.c
> without CONFIG_MMU defined ?
> which means dma-direct mapping doesn't support !CONFIG_MMU is not a
> bug, but design as it's.
> or, just return error code currently, will add dma direct mapping
> support for !CONFIG_MMU in the
> future?
> 
> As Vladimir Murzin's suggestion has changes in kernel code, I need
> your input to get
> the design goal about dma-direct mapping, thanks.

Can someone repost the whole patch?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
