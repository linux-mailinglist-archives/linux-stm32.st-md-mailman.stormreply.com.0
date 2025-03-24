Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F2A6E266
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 19:34:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA917C7802F;
	Mon, 24 Mar 2025 18:34:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15822C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 18:34:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 325B243C49;
 Mon, 24 Mar 2025 18:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E7DC4CEDD;
 Mon, 24 Mar 2025 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742841292;
 bh=y0BX7r8ryEWjMxOOO9xrdurEHkOyQxtBaLfq3+2msBM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C1ndWjuCBM1XTyGk+PbUv3bAeqUBsI3f24qAxf75F3b2S0gBLd/gxLK1M8CTwycGR
 EGEq+rV4FcPUlMjmWU4JOpNtB3XdC+BC5Jqn9AAWoZ5lDVqq8C96oFOiv6LAfclzM5
 Z2EopyxqpZmamZ0gLvM6yuMsAzi8tCP7HkvlvRs9ytQICu82Vq+ySL3Sd7/Xzemijt
 qMHfgbc0K18Rxf7iYK4nD0HtFXlIfQcqfY4OUCdg3e006ueekYleJb46lZO21O9bY0
 Kv7yZS3Qa03m826wLjqxcA2B7ONVeKA16uJ7ok2OJ6CqFsdByI733foISPHls3XQqG
 Sj0nP2/SznzyQ==
Date: Mon, 24 Mar 2025 11:34:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Message-ID: <20250324113443.215c036f@kernel.org>
In-Reply-To: <20250318032424.112067-1-dqfext@gmail.com>
References: <20250318032424.112067-1-dqfext@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Fix accessing freed
 irq affinity_hint
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

On Tue, 18 Mar 2025 11:24:23 +0800 Qingfang Deng wrote:
> -		cpumask_clear(&cpu_mask);
> -		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
> -		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
> +		irq_set_affinity_hint(priv->rx_irq[i],
> +				      cpumask_of(i % num_online_cpus()));

This does fix the bug you're targeting, but FWIW num_online_cpus() 
is not great in general. The online CPU mask can be sparse.
You may want to look into finding 'nth' online CPU instead of the naive
modulo as a follow up.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
