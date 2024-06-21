Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03478912950
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 17:20:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A870AC7128E;
	Fri, 21 Jun 2024 15:20:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB5BBC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=1rN6ZtuZ5WiYgM8LdZtjJXv4iNlUIE3YjUW4O8w3ias=; b=RkImYVMW0MqdSdKN1Vaf402F4p
 RxZPvDc2tmKVj+XeuspgLNAU2CLSd2MW+IrKN2TWrrxkvV9uRyi1SGUWR1ahrci0UMhlTEUqc5+u+
 3SDJP/EJzlUmIUmDCJFcCfXaAF1GrQJnZi4HdHjGe1r/35ZJB5qxGFT2yovc8nf/b6E8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sKg3d-000gGX-89; Fri, 21 Jun 2024 17:20:09 +0200
Date: Fri, 21 Jun 2024 17:20:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: WangYuli <wangyuli@uniontech.com>
Message-ID: <3f36c1c1-b561-49a7-82a7-a0aaef60cf83@lunn.ch>
References: <F19E93E071D95714+20240621101836.167600-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F19E93E071D95714+20240621101836.167600-1-wangyuli@uniontech.com>
Cc: Li Wencheng <liwencheng@phytium.com.cn>, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, Wang Zhimin <wangzhimin1179@phytium.com.cn>,
 Wang Yinfeng <wangyinfeng@phytium.com.cn>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 Chen Baozi <chenbaozi@phytium.com.cn>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Add a barrier to make sure
 all access coherent
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

On Fri, Jun 21, 2024 at 06:18:36PM +0800, WangYuli wrote:
> Add a memory barrier to sync TX descriptor to avoid data error.
> Besides, increase the ring buffer size to avoid buffer overflow.

This sounds to do two things. Two patches please, each with a good
commit message.

> Signed-off-by: Wang Zhimin <wangzhimin1179@phytium.com.cn>
> Signed-off-by: Li Wencheng <liwencheng@phytium.com.cn>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> Signed-off-by: Wang Yinfeng <wangyinfeng@phytium.com.cn>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Five developers for a 25 line patch? Should some of these be
Suggested-by:, Tested-by: Reported-by:?

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
