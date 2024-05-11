Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A18C2ED1
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 04:08:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55EDAC6A613;
	Sat, 11 May 2024 02:08:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AB63C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 02:08:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF4396203D;
 Sat, 11 May 2024 02:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1878EC113CC;
 Sat, 11 May 2024 02:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715393311;
 bh=R0x8obuPsGeOf3eMhsjoyyJL1qvGIsDXmpUyjG7RnVU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QZahE2HB08jYVtIYa6IMDmfjKfJr/4gdpVVmZdb9GFz9GMY9eTDSBuYnhvDbe2im6
 vub9qzWuQ8p+S1Lxv94763m4u3jHIMJR1a8P9RT7jM8+i9a2xvSjlHSWo2HMX1gHXF
 H2usIafdSgTez/GtWlXmIjxx+M1j4PuuenFch3dDjTViqDrp1NB6KRrcxLTXyrWwq9
 MTuJTxWLImGJes5EgvUrc4gB0jCMKY0Lp9FWAEoz7fWPpGWZ9m7W4PB0qe3VdvvkTV
 /ODP+kih6zlSMUPzEJ5MxTsUFmNNvs8zWa5DxSgvhwd4WtcIHjesn4TJOvfUs1I2u2
 GZ3Z690511Feg==
Date: Fri, 10 May 2024 19:08:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <20240510190830.54671849@kernel.org>
In-Reply-To: <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

On Fri, 10 May 2024 18:59:24 -0700 Jitendra Vegiraju wrote:
> v2: code cleanup to address patchwork reports.

Please read:

https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
