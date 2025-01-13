Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5AA0BDEF
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 17:48:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02C4DC78018;
	Mon, 13 Jan 2025 16:48:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF182C030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=NJOghlU8ppSEsLnsa+7G654aZpvcnksHwQ+VO9d8IOI=; b=aCiEXW2+MU0SobXi9dTn0RJT42
 D7mHtH5qln/3dYjZVfQMZRksLtTRuL3tfH1O3LdtTyOuQ+kIpCMZZjz5oGbolHVP0eesfubaPlUx3
 0DzvvWGuxXKaPTYEwSAOTX4WENu0EFZ8iiS/aIRQ7mqCxvnPKJbC/c5eI+47inFZZpeA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tXNby-0049kS-3R; Mon, 13 Jan 2025 17:48:22 +0100
Date: Mon, 13 Jan 2025 17:48:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Message-ID: <e9cacef2-1049-4296-92f4-85041f4b6eaf@lunn.ch>
References: <cover.1736500685.git.0x1207@gmail.com>
 <600c76e88b6510f6a4635401ec1e224b3bbb76ec.1736500685.git.0x1207@gmail.com>
 <f1062d1c-f39d-4c9e-9b50-f6ae0bcf27d5@linux.dev>
 <054ae4bf-37a8-4e4e-8631-dedded8f30f1@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <054ae4bf-37a8-4e4e-8631-dedded8f30f1@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Yanteng Si <si.yanteng@linux.dev>, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/3] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

> 1. It's author's responsibility to read netdev CI output on Patchwork,
>    reviewers shouldn't copy its logs.

I somewhat disagree with that. We want the author to of already run
all the static analysers before they post code. We don't want the
mailing list abused as a CI system.

So rather than pointing out a specific problem, it can be better to
say that static analysers XZY is not happy with this patch, please run
it and fix the issues it reports.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
