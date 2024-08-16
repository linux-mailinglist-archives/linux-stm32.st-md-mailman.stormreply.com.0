Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E14289550D1
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 20:27:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E018C7129D;
	Fri, 16 Aug 2024 18:27:47 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E28CC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 18:27:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6CFA1CE1B45;
 Fri, 16 Aug 2024 18:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81552C32782;
 Fri, 16 Aug 2024 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723832863;
 bh=7hRyuPjRLop1xNh3m+HIzsw6TPl/Rhga53lhKhjmo6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lvh8mfqQWWNO95bHqCGvTn3e238eCjDwmdI8DYP/PqwdDkHXRlLjR6pQ+aWhsk/1I
 5Qkrm7+uCAkcrncMfOAo4tBq19PnyGKXUgmm4Iv9bssmHH8mLgbSD7IsipxsXlXYW3
 i38Fu+SO9BhmEIJn4IczcmXDmvoB3ZQ6dogHJDed7NTNdwfGoF4PIXUyNfuKfuCc7X
 MCVEViCK+fxuNfs9+6koKOtZDxRt9zwhSALsdATCd8OaR+ImsVXEevALsVHGlovBeU
 8IEb1ReyVEbx7vLQzPON4SDxMtFKRthJww23EWR5POtu/Vvl374GSKvS4fauXwWymZ
 N9zRgneda67aQ==
Date: Fri, 16 Aug 2024 11:27:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: jitendra.vegiraju@broadcom.com
Message-ID: <20240816112741.33a3405f@kernel.org>
In-Reply-To: <20240814221818.2612484-5-jitendra.vegiraju@broadcom.com>
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
 <20240814221818.2612484-5-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 4/5] net: stmmac: Add PCI driver
 support for BCM8958x
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

On Wed, 14 Aug 2024 15:18:17 -0700 jitendra.vegiraju@broadcom.com wrote:
> +	pci_restore_state(pdev);
> +	pci_set_power_state(pdev, PCI_D0);
> +
> +	ret = pci_enable_device(pdev);
> +	if (ret)
> +		return ret;
> +
> +	pci_set_master(pdev);

pci_restore_state() doesn't restore master and enable?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
