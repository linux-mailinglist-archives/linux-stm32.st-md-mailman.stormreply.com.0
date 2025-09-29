Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69933BA99BF
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Sep 2025 16:38:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C272EC3F939;
	Mon, 29 Sep 2025 14:38:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE120C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Sep 2025 14:38:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ABA806254E;
 Mon, 29 Sep 2025 14:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DD6C4CEF4;
 Mon, 29 Sep 2025 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759156704;
 bh=sLDFL9Wl+Iuq12IDgheionrwfrRHgVXtiDYtXHXsCrY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YJ3zrcQLw5rDQWPYhH77bBI8hSRc5rpFYkP9UrVEJCDJhjwfRy/TNVb4CjibWExaX
 YAcIwsq/RWB3pHd8Zr3yAwxFKU4dY+CCPhezjfxwJjYOK55JhYT7d3d86M0oGDkpO2
 vfgB0ecsvfPzBlDJNNs8n/Zl3xE2koAiu1xRZ8w3bqrWdK2yyVyY+H82v9S5PeqjXh
 tZLH1qdn0QFCxXZ+BlkDmokQX3Jht8zTLvGSvK+rSL81LHsmzSLRUAggA3vER/mplb
 pI9dODQQEaAITpyeuQt/iOBib9HMLB+bK3QyDTJUBtUBmK1kc9JHxs2ICdDczDf+3j
 7X5r12Veu556A==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20250902122641.269725-1-christian.bruel@foss.st.com>
References: <20250902122641.269725-1-christian.bruel@foss.st.com>
Message-Id: <175915669921.12348.6942864048975237850.b4-ty@kernel.org>
Date: Mon, 29 Sep 2025 20:08:19 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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


On Tue, 02 Sep 2025 14:26:41 +0200, Christian Bruel wrote:
> Guarding enable_irq/disable_irq against successive link start
> link does not seem necessary, since it is not possible to start
> the link twice. Similarly for stop.
> 
> 

Applied, thanks!

[1/1] PCI: stm32: Remove link_status in PCIe EP.
      commit: 7d1c807cd2ddf8ef771f214ae4dab9bebbc61522

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
