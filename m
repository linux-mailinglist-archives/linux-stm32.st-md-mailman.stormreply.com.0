Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C35E720E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 04:45:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DC15C04003;
	Fri, 23 Sep 2022 02:45:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CABEDC03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 02:45:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98F5F622EF;
 Fri, 23 Sep 2022 02:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C96C433C1;
 Fri, 23 Sep 2022 02:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663901146;
 bh=DVpEhkll466QsOtEVq9IpaSrEpmDqujHhiywA3pe3YU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PS+WhfuXSiw90HTDCc1yyTMOMk3o3V2CMGY+Pk20PyCgDxL/P1CDmlojyusNdG69y
 eubthREj+XIqQWrP8IZvS+4jTdfwlAAYc8qRWnMLmhatvLBBaLCzeHVAiUJ2Avv9lN
 08GNpmHUlgB2iCHdpoFtySalKZfhQlNZIpUcQxBadEGQ7U4Cup6+jrCHweMQ1CpAEF
 tTsj194UJDIrBh15z+VZGGooWKna5D4BkF1Nw81JY/msNBSP7pzPaksA+UoCCUMZuv
 pgDLVqEEvrc2HOsQvh0M0qmFWjh8r/qmhfX9amlReHxKzbZl1OYYGw4SMqJ/dbP3Gt
 OEh4aEFOOao3A==
Date: Thu, 22 Sep 2022 19:45:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Junxiao Chang <junxiao.chang@intel.com>
Message-ID: <20220922194543.5b9f75a0@kernel.org>
In-Reply-To: <20220923005014.955076-1-junxiao.chang@intel.com>
References: <20220923005014.955076-1-junxiao.chang@intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 jimmyjs.chen@adlinktech.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, hong.aun.looi@intel.com,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net] net: stmmac: power up/down serdes in
	stmmac_open/release
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

On Fri, 23 Sep 2022 08:50:13 +0800 Junxiao Chang wrote:
> -
> -		if (ret < 0)
> -			goto error_serdes_powerup;
> -	}

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7322:1: warning: unused label 'error_serdes_powerup' [-Wunused-label]
error_serdes_powerup:
^~~~~~~~~~~~~~~~~~~~~
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
