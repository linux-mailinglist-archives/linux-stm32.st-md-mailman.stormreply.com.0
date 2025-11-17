Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BDC66224
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Nov 2025 21:43:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E86DEC628CF;
	Mon, 17 Nov 2025 20:43:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD066C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 20:43:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD76C605D2;
 Mon, 17 Nov 2025 20:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AE5C113D0;
 Mon, 17 Nov 2025 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763412231;
 bh=8ed1/LqTDi9J6Cd/l8V0MNcIqQta3AJ4Jk23LfPDRwA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=re3U4Mqpb5UfMPsEjbI9h8j/NOQXU9xKb6om6xXZDQ4bzV+8YGee5+2u5y/XEDuF5
 dv0HHmUJ0QA8vHoT8R1QME1qkU21Va8lXH0yhNNJS0vePBBCa/rDLWcm9KTSytZXRQ
 OcGw2qZ1bBnkdV6SV0fbxBjL2TAz6ftP6GRRAH1V6LZPq93OE7e7In6K9ILm69+9O5
 +rs5VtSfgtKGNWMkW5b5w61EemVmnAd/tpPhdiWLM3Hi0eOwXyKv0huX/75IuFaXXm
 j1b8zD8/d439dekML6TfSfyZfVuq5lEH+l8IZAMSNakKnGwXSTEHQ1rZsD2YGGV6MY
 Up/PD1sWvTQrg==
Date: Mon, 17 Nov 2025 14:43:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20251117204348.GA2522408@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114185534.3287497-1-andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-kernel@vger.kernel.org, Christian Bruel <christian.bruel@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] PCI: stm32: Don't use "proxy"
	headers
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

On Fri, Nov 14, 2025 at 07:52:01PM +0100, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> In particular, replace of_gpio.h, which is subject to remove by the GPIOLIB
> subsystem, with the respective headers that are being used by the driver.

Thanks, Andy!  It looks like a lot of work to figure this out by hand.
Is there a tool to figure this out?  Maybe something I could run when
reviewing patches?

IWYU seems like a nice principle but I couldn't find any mention in
Documentation/.  Should it be covered there somehow?

Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
