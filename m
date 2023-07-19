Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F1758A8F
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jul 2023 03:01:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8116C6B44D;
	Wed, 19 Jul 2023 01:01:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FA43C6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jul 2023 01:01:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E05E3615DC;
 Wed, 19 Jul 2023 01:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C750AC433C7;
 Wed, 19 Jul 2023 01:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689728510;
 bh=DErPakduFqhgq+XgSW/ZrwNOszO28tTHkZXEYy5pKSc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=owbr9Ll38m9telfzm+Q+UeIGv0gZ+QJBwa+XOR/u3k/zDw3jyTdT12TSkk8Nv9vbm
 1L86mr3GPnXaV0zf20IU2MZmEGMa10XbA7MuKNwRwcSukUfm4R6LLmn48puNGKGz2R
 NUiWOom2OsnEU/v1r40sroRLsDDtNdZ3gTi6yS4BwsmdB2O5fw3uyoCkzJReuu4sw+
 dGbbt+sRIqE5U+u98C9yKylCnrloFczRmCFDKcknY8euiE5hJSobXs7HvyulGvDFb5
 8iOOA3iJ4NYJa0+6xt3Os7VZRXBB8ykzMIdC8YxkCbLKJsVeL6h7j3q4NG0nIVaYRo
 PYwSGTYEhV+FQ==
Date: Tue, 18 Jul 2023 18:01:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Message-ID: <20230718180148.4fe125d9@kernel.org>
In-Reply-To: <20230717160630.1892-1-jszhang@kernel.org>
References: <20230717160630.1892-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Jisheng Zhang <jszhang@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/2] net: stmmac: improve
	driver statistics
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

On Tue, 18 Jul 2023 00:06:28 +0800 Jisheng Zhang wrote:
> improve the stmmac driver statistics:
> 
> 1. don't clear network driver statistics in .ndo_close() and
> .ndo_open() cycle
> 2. avoid some network driver statistics overflow on 32 bit platforms
> 3. use per-queue statistics where necessary to remove frequent
> cacheline ping pongs.
> 
> NOTE: v1 and v2 are back ported from an internal LTS tree, I made
> some mistakes when backporting and squashing. Now, net-next + v3
> has been well tested with 'ethtool -s' and 'ip -s link show'.

Giuseppe, please take a look.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
