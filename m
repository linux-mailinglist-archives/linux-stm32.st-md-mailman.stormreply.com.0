Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F370197B855
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2024 09:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F632C6DD72;
	Wed, 18 Sep 2024 07:07:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A80CC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2024 07:06:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 614FE5C5440;
 Wed, 18 Sep 2024 07:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4FAC4CECE;
 Wed, 18 Sep 2024 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726643214;
 bh=JHFisloYJ8iNozFHBXze6I2YOCTCLbb8vU2LUj9xLzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YjPfdOO6zoXO5DtfASuViQvoPC6Jn+8HRSlyH/Ja2NsNA5j3c7kzMZ7Cgzc75/9Mk
 2rUDnDJeMiAAb8SWvctJhsjVtHR6DVJB6LXE1vbRIe/q/xkhT9/sP2p8h15b8lLJbA
 6GeRtVhUfX0XggY+yje0tmM6jc1H7NCCxWoyal9sgqQ9/5Zhk9+oA3H5CaEYvs7T9t
 xFTUL9GlFJBEXawzaHut5UkoqGWOxvQGQHfE5ZeAnQbq0+Xxe+PIjrQ7HwNM53pAQY
 u7PS2CEdhP/qbusMWyS9Bi8QpCFdL8Jj9omWc5PoNSqN42Np9slQJsFJRXZJaXfcVy
 fuzboYA/oXy5w==
Date: Wed, 18 Sep 2024 08:06:49 +0100
From: Simon Horman <horms@kernel.org>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>
Message-ID: <20240918070649.GR167971@kernel.org>
References: <20240918061422.1589662-1-khai.wen.tan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240918061422.1589662-1-khai.wen.tan@linux.intel.com>
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Khai Wen <khai.wen.tan@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: Fix zero-division
 error when disabling tc cbs
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

On Wed, Sep 18, 2024 at 02:14:22PM +0800, KhaiWenTan wrote:
> The commit b8c43360f6e4 ("net: stmmac: No need to calculate speed divider
> when offload is disabled") allows the "port_transmit_rate_kbps" to be
> set to a value of 0, which is then passed to the "div_s64" function when
> tc-cbs is disabled. This leads to a zero-division error.
> 
> When tc-cbs is disabled, the idleslope, sendslope, and credit values the
> credit values are not required to be configured. Therefore, adding a return
> statement after setting the txQ mode to DCB when tc-cbs is disabled would
> prevent a zero-division error.
> 
> Fixes: b8c43360f6e4 ("net: stmmac: No need to calculate speed divider when offload is disabled")
> Cc: <stable@vger.kernel.org>
> Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
> ---
> v2:
>   - reflected code for better understanding
> v1: https://patchwork.kernel.org/project/netdevbpf/patch/20240912015541.363600-1-khai.wen.tan@linux.intel.com/

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
