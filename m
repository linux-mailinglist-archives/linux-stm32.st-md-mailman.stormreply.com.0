Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0F9AB3D99
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 18:32:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDDB5C7A82D;
	Mon, 12 May 2025 16:32:05 +0000 (UTC)
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7EBBC7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 16:32:04 +0000 (UTC)
Message-ID: <76961134-0676-4ec5-b5e1-5a9693bff268@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1747067523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmNM1qr8paaatXiculJ5HFFWSqjMdY6Pe+6AalpRTVI=;
 b=wA4CXoJ3Ta2nrePmKsSMlFl45w4ah+sYkf90mdblqcv0w7R7YfJTu4FFoj6O+va9Nbua8V
 zJxlAWuM58jZjnzKgoGyEB8k0EzZ+hhfJ36dqnkC00BVGWfxGzckTK+coS29mkNyVtkbD/
 8yCOMdAmcCPjUDvV1EJyctB+tXS/UFI=
Date: Mon, 12 May 2025 17:31:57 +0100
MIME-Version: 1.0
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250512143607.595490-1-vladimir.oltean@nxp.com>
 <2ca5f592-74d3-41ff-8282-4359cb5ec171@linux.dev>
 <20250512155846.vbmc3wrvpidbzxqc@skbuf>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250512155846.vbmc3wrvpidbzxqc@skbuf>
X-Migadu-Flow: FLOW_OUT
Cc: Furong Xu <0x1207@gmail.com>, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: convert to
 ndo_hwtstamp_get() and ndo_hwtstamp_set()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/05/2025 16:58, Vladimir Oltean wrote:
> On Mon, May 12, 2025 at 04:50:35PM +0100, Vadim Fedorenko wrote:
>> On 12/05/2025 15:36, Vladimir Oltean wrote:
>>> New timestamping API was introduced in commit 66f7223039c0 ("net: add
>>> NDOs for configuring hardware timestamping") from kernel v6.6. It is
>>> time to convert the stmmac driver to the new API, so that the
>>> ndo_eth_ioctl() path can be removed completely.
>>
>> The conversion to the new API looks good, but stmmac_ioctl() isn't
>> removed keeping ndo_eth_ioctl() path in place. Did I miss something in
>> the patch?
> 
> I was never intending with this work to remove ndo_eth_ioctl()
> completely, but instead to completely remove the timestamping
> configuration path that goes through ndo_eth_ioctl(). I apologize for
> any false marketing and I will be more explicit about this in further
> patches.

Got it. The patch itself looks good:
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
