Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC8894D97
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 10:33:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 851F3C6B45B;
	Tue,  2 Apr 2024 08:33:43 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F122C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 08:33:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AAB2ACE1ADF;
 Tue,  2 Apr 2024 08:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E616C433C7;
 Tue,  2 Apr 2024 08:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712046818;
 bh=bXyppnTsq/tBX5BGx9iSKNg3xb6/ovlVg4bpOhE0X14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4xrcOTTfgxGpqGUxxTpuZVUl7cT4mU6NxiFC920NGVCiHoIpwjBG6cGAY4vtnKSw
 4bAh/XQWzg5AIbj5RJXD6HsflDLKeqoy2npzxF4aXu3A4imLUKq0FgSMF0iceQ/L5B
 UqlPU+YTmoC0Zfog3WxK+ksd20xPQxkQc4Wffcry+SCvIJ/jWbUgAfr0FHgOb4KFrr
 y2jIrjszos9ncX/K5kFImzQNHeXFUF6VHJwLLFcu0A7N6oz47V0ZQK49pkHogcwsc+
 HB68Y7KwRVDw1XmQAkeCVIs8nNOgLDVJgWdQoFhNemEYwrUwD/bPmzogXd9yk8NOtx
 XBXSQvRTCVmTg==
Date: Tue, 2 Apr 2024 09:33:34 +0100
From: Simon Horman <horms@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20240402083334.GM26556@kernel.org>
References: <20240401024456.41433-1-minda.chen@starfivetech.com>
 <20240401024456.41433-2-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401024456.41433-2-minda.chen@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: mmc_core: Add GMAC
 mmc tx/rx missing statistics
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

On Mon, Apr 01, 2024 at 10:44:56AM +0800, Minda Chen wrote:
> The missing statistics including Rx_Receive_Error_Packets,
> Rx_Control_Packets_Good and Tx_OSize_Packets_Good.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
