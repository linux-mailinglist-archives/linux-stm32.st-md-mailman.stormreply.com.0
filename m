Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B759E9B05
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 16:59:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC194C78014;
	Mon,  9 Dec 2024 15:59:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE5FFC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 15:58:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D5BDA41780;
 Mon,  9 Dec 2024 15:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4C6C4CED1;
 Mon,  9 Dec 2024 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733759932;
 bh=OO/cbnYzf7FBnThMr5HyGBtVFD9nIjTXZEtzGzeppGE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Fg+oFQeO2kxp5YwnqKCYMkxppM0DGUp3qVxQ5sA5nAhg3znZy/eC4jlBglaQcF/pD
 1ek0X+lGA/sb+0yV86GarHhJ0//nhWl6/GeurMFilAnXgVNik5+axaVubjfJjqrBrn
 86+D1UrJksk/A/x7WQkpy+hnh6fB3EM8+OelfkaB9ESisxtWQuZNPPWc8FbMqDy4kl
 8JkRD4kzTEhYQqrCcC5V/LWtyFXz9lTa1eRABmGQQ0yimefBwGiWp9fLGT93pJHCyk
 U2M6D7V794lB7TwBTexFvKiGyb5NKZYztjvbcbzPQRSGcT2/O8refdTkfvvj9cWQks
 R1eAulDtuAE/Q==
MIME-Version: 1.0
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr>
References: <78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173375992872.157598.4366313738760552668.kvalo@kernel.org>
Date: Mon,  9 Dec 2024 15:58:50 +0000 (UTC)
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] wifi: wlcore: testmode: Constify strutc nla_policy
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'struct nla_policy' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    5062	    528	      0	   5590	   15d6	drivers/net/wireless/ti/wlcore/testmode.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    5178	    404	      0	   5582	   15ce	drivers/net/wireless/ti/wlcore/testmode.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied to wireless-next.git, thanks.

01e767d6f783 wifi: wlcore: testmode: Constify strutc nla_policy

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
