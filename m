Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 532697FB050
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 04:04:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00034C6B469;
	Tue, 28 Nov 2023 03:04:50 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72312C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 03:04:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D2737B83947;
 Tue, 28 Nov 2023 03:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19AC4C433C8;
 Tue, 28 Nov 2023 03:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701140688;
 bh=0vxwWk/VtiJW0Rl/IFPmfADKzDSf/OCJueWE5wdyi8I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I/5Y4FwXlHyjodxNo0IyDpBLKOgRgfNrb/EIB6ikSZmOTkmzdUneCtLpBvckwvno0
 sqHJ9px9v6GOF6B1V+jUwkkSi60XoCAeNE/8yQoH5TsAmyuBp12pmZYTKU4BZs5iQ5
 ODgbqb5yh33cUJxuyPnWZFuSLT3sQFfdf4ieZrs+rr0fDSHw0Gc6W/FwCPdIUt2vqm
 4cFSdenddOGYWtg2Yvze9OHaawUlbZ1c36aG2bD+PA3FE4f4SVlZMLVGrmUXtt+c9p
 UDjbYPSFslp9SvhPEiw7ZS7RYL9bp3zRn2AsDirTKt7daJDPscV4P1hDPWboXlHH9F
 /N7A9M4FD0hyw==
Date: Mon, 27 Nov 2023 19:04:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <20231127190446.58f14db6@kernel.org>
In-Reply-To: <CY5PR12MB637218C74342CCAF7AFCB85FBFBDA@CY5PR12MB6372.namprd12.prod.outlook.com>
References: <CY5PR12MB637218C74342CCAF7AFCB85FBFBDA@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Cc: Voon Weifeng <weifeng.voon@intel.com>, James Li <James.Li1@synopsys.com>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, "moderated 
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Russell King  \(Oracle" <rmk+kernel@armlinux.org.uk>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix FPE events losing
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

On Mon, 27 Nov 2023 07:08:17 +0000 Jianheng Zhang wrote:
> Signed-off-by: jianheng <jianheng@synopsys.com>

Your name and email addr in From are both different than the form used
in the Signed-off-by tag. Please fix that and repost (keep Serge's
review tag).
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
