Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F469A32E9
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 04:33:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD1B3C78032;
	Fri, 18 Oct 2024 02:33:14 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CE47C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 02:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=FDJn4XXIjtyq1C4WRBOEnHEbGl9tvoFq7BB0FTlNUn4=; b=E5MpfvRyOOAbCVMvQjDs7hrWjD
 B6mlxRZ8DnBTSxKsn/lH+6wCOcSDhKUIjNwent6D9SpdmpbOY8sJp960hsjO1pIshOGLW7eZjM6TE
 uNZIttKZmebHFASK7dFjRgJsfBXy7lSTAUvJdNBW64ydSibRSIBJMIhErJyv1dRmaNpI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t1cnR-00AJ0Z-VP; Fri, 18 Oct 2024 04:32:57 +0200
Date: Fri, 18 Oct 2024 04:32:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <8677a11c-8735-43c7-ae5b-6dc894d94677@lunn.ch>
References: <20241015121009.3903121-1-quic_jsuraj@quicinc.com>
 <20241017194258.000044b3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241017194258.000044b3@gmail.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Prasad Sodagudi <psodagud@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: allocate separate page
	for buffer
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

On Thu, Oct 17, 2024 at 07:42:58PM +0800, Furong Xu wrote:
> Hi Suraj,
> 
> Thanks for this fix.
> 
> I tested your patch on XGMAC 3.20a, all goes well, except a performance
> drop of ~10%
> Like Jakub Kicinski said in V2, this involves more dma_map() and does add
> overhead :-/
> 
> I might have a better fix for this, I will send to review and CC it to you.

Lets mark this as changed-requested, due to the performance drop

It also introduces one more kdoc warning.


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
