Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A577BB924
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 15:35:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB779C6C837;
	Fri,  6 Oct 2023 13:35:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F82DC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 13:35:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B5E24B82935;
 Fri,  6 Oct 2023 13:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EACC433C7;
 Fri,  6 Oct 2023 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696599302;
 bh=WKO6RcQqAG8IX5IcPTGrGweYu9Qjx2yG0cnrvA8Gkd4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gj2NXk61K87JY0oX6au3+Ysj6IhCgw3YMqHreFXxuH3eq2QqFWc3/5/ZTKYgi/8a9
 hVfC5oJv63xCu5zYPoRcLJ23MMNVMESIgLmMBsSlFXuHS1R+mFIupWPvEplDjPZMiI
 a6gyqSCLjnJsfB0fhXVy9Ia8qWzXE+VN3/5du1rfUEEE+CIyaqDitasrFzQxC61lhe
 Z60QmQnIionHURo01fqBf47eVJEKImRVeX5Zhu3TFHPoSRc54xIyF2e2j/HRB2jhFa
 87qYVmtbjuehh1Une71VwddZIH/RaOq1f7Rj2W++MFvFJzpgB7h+EOi1gksX7zJwvk
 yBywdNK8XiLUA==
Date: Fri, 6 Oct 2023 06:35:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20231006063500.035f3604@kernel.org>
In-Reply-To: <cjgx6e3agc6gpvs75nhkf6wlztk73epmct6tcuooyqvk2nx2o2@vr5buyk637t3>
References: <20231005070538.0826bf9d@kernel.org>
 <20231006072319.22441-1-rohan.g.thomas@intel.com>
 <cjgx6e3agc6gpvs75nhkf6wlztk73epmct6tcuooyqvk2nx2o2@vr5buyk637t3>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 Rohan G Thomas <rohan.g.thomas@intel.com>, andriy.shevchenko@linux.intel.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: xgmac: EST
 interrupts handling
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

On Fri, 6 Oct 2023 13:08:33 +0300 Serge Semin wrote:
> Jakub, what do you say if Rohan will just re-submit v2 with the
> addition cleanup patch and let him to decided whether the cleanup
> should be done first or after his XGMAC-EST IRQ update?

Sure thing, whatever is more readable for the reviewer.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
