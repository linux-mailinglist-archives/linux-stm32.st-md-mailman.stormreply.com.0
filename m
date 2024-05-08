Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F458BF451
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2024 04:03:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 502F4C6907A;
	Wed,  8 May 2024 02:03:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB079C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2024 02:03:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7802961702;
 Wed,  8 May 2024 02:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE7BC2BBFC;
 Wed,  8 May 2024 02:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715133830;
 bh=u1HK3lKrCXfmSNN4df0DTFJ09j4yFFS2SW0WGxuOVdU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KF75b58955oCdvUbr9+ISjBQ18eL34qjS/7cgPiVTdi6Ql/Zv5RMim9LBcEfrm+Lw
 h+CCTwtOfMzJBjZIGWan1Svk5EKw4S0eDak0tro++DbpNp6wOXt7/V22/g+uPUZjFJ
 GLL1rGehmFejgBgJsXivUHGHHsvPb7mJNH/V96H68WYm+tE1zz01TVvZko9XUnzRFl
 5omX7obcfzzsmgek2LbFyrAecZkd+TpyYU8PqeZJ7H1DalbrmsuuiyTrSfEeirvX3C
 PeAi7jdkWV2ji3YbR8nu0sFf6xNrG0YNuDTDlzG05QGaz1n0GEpK4Ak04EjTf+TcwP
 43c6gWN+dn8SQ==
Date: Tue, 7 May 2024 19:03:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Message-ID: <20240507190348.1bd1c446@kernel.org>
In-Reply-To: <20240503231804.2323666-1-xiaolei.wang@windriver.com>
References: <20240503231804.2323666-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Initialize the other members
 except the est->lock
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

On Sat,  4 May 2024 07:18:04 +0800 Xiaolei Wang wrote:
> Reinitialize the whole est structure would also reset the mutex lock
> which is embedded in the est structure, and then trigger the following
> warning. To address this, define all the other members except mutex lock
> as a struct group and use that for the reinitialization. We also need
> to require the mutex lock when doing this initialization.

Seems better to move the lock outside of the struct to 
struct plat_stmmacenet_data. 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
