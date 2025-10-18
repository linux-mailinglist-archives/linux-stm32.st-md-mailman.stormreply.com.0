Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE3C0C4D7
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A163EC60470;
	Mon, 27 Oct 2025 08:30:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7827DC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 03:59:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 225F941B3C;
 Sat, 18 Oct 2025 03:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E640C4CEF8;
 Sat, 18 Oct 2025 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760759947;
 bh=EU6U5Z1y6eCiRh+fXNU8O/thPLmzUksR4n4H3faDx18=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=krIfENMfuFjiHhOD9R6DJZJbEI9qyq58vTH4tVORoQRTS2pGY5lkJEIZDY6cO/JsF
 7rV4qf/QB3xJavBLHP0t1tOOd2ijiKeeH7r5PBJer2K+56mKaBeK4gxS6ShjW6W321
 VkvkNEiUhE+GJg+MsRokLA9CNBFgs7U0v7KF5BOur/qWmLZ7DKTce6BLHyqQ3UmI3d
 h3G0koy5DXW63vce1vAszW8CD0JUM4rwNfwwIrL7aT81malR9QIBv5/P/aZVWwdmzB
 yRQW1/nRqFaZ64tNvz5lQ6FqKOjnXl5DoM5YdsFKHtq3AqF25dzypI1i46AMW/sKZH
 62a7C0hJMLpqQ==
Date: Fri, 17 Oct 2025 21:59:03 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <20250828103828.33255-1-twoerner@gmail.com>
Message-ID: <e88ab2ff-dc16-dab7-0ff3-702f093563ce@kernel.org>
References: <20250828103828.33255-1-twoerner@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:01 +0000
Cc: linux-parisc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] defconfig: cleanup orphaned
	CONFIG_SCHED_DEBUG
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

On Thu, 28 Aug 2025, Trevor Woerner wrote:

> In commit b52173065e0a ("sched/debug: Remove CONFIG_SCHED_DEBUG") this
> Kconfig option was removed since CONFIG_SCHED_DEBUG was made unconditional
> by patches preceding it.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

[ ... ]

>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  arch/riscv/configs/nommu_virt_defconfig        | 1 -

[ ... ]

Acked-by: Paul Walmsley <pjw@kernel.org>  # for arch/riscv


- Paul
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
