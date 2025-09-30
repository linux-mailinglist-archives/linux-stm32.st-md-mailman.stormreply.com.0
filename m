Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB349BAE0BA
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 18:32:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ECC5C35E3F;
	Tue, 30 Sep 2025 16:32:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78E94C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 16:32:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 28F9345985;
 Tue, 30 Sep 2025 16:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA54C4CEF0;
 Tue, 30 Sep 2025 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759249950;
 bh=jdVuehLsO2BbsXchfGIueYIfBtAAqPbDLFHoBeD0ySM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=btZxeuapgJ8cVMgABl2IrN7ULEYD/efA61/d6uFEPKikOD4Qv9PgFdecqs2WarnKh
 fM/lVEJ4DBWpwkaQELBbkgx9/+wjjv4ZO7+XaBKUX7vOpvL6JWPt60FgXI1GM4SUJJ
 rv4cMHFUzfTYQPe4wZv1LfqsvCW83Dj1iT04iPPdWXiJ9XaPUeCwD10mKq/8QKRTl2
 GG1UY6m+ZqyJxgEx17Pnrni2JmWvcPCaCXpMK/zVLAQOfhtC3fe34Kx3TWIVKhTQbn
 WSLpRsCuESis8oIaNeur0ZilZNqBIVwPOOjkG/X2tAIfoROkY+tvDVTdS5PLiBafuH
 iV+2vLz4an3Dw==
Date: Tue, 30 Sep 2025 11:32:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Message-ID: <20250930163228.GA183263@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175915669921.12348.6942864048975237850.b4-ty@kernel.org>
Cc: robh@kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, Christian Bruel <christian.bruel@foss.st.com>,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [PATCH] PCI: stm32: Remove link_status in PCIe EP.
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

On Mon, Sep 29, 2025 at 08:08:19PM +0530, Manivannan Sadhasivam wrote:
> 
> On Tue, 02 Sep 2025 14:26:41 +0200, Christian Bruel wrote:
> > Guarding enable_irq/disable_irq against successive link start
> > link does not seem necessary, since it is not possible to start
> > the link twice. Similarly for stop.
> 
> Applied, thanks!
> 
> [1/1] PCI: stm32: Remove link_status in PCIe EP.
>       commit: 7d1c807cd2ddf8ef771f214ae4dab9bebbc61522

Since this is essentially a fix to "PCI: stm32-ep: Add PCIe Endpoint
support for STM32MP25", which hasn't been merged upstream yet, I
squashed it into that patch:

  https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=013d82bb62c0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
