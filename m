Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874776295E
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 05:39:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A928AC6A61A;
	Wed, 26 Jul 2023 03:39:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 743D7C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 03:39:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1142C611BE;
 Wed, 26 Jul 2023 03:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EB0C433C7;
 Wed, 26 Jul 2023 03:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690342790;
 bh=/DXkxDc0cjY513B5QGcbSthekDMBSig0Uuz5USmRB9g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H157GANRAtY9o9O/MLKKTTbuWpOwR4XmTVaem5NtxNwnkOrUiwqdx6pKbPVRZyxZp
 XsrhqhKIY1O74VUIwmGYMvKVAa7F/mum5SbnVjk+tZ2dUYbv4brqLThJ0UPAXGhjc4
 nO1vw4bl4Iv66QnJ4u0WwqG0pd8FueE8M/yzw7B4zWsoHYI1fbR9LYzkXa78PgjWTJ
 DQVv4aw6MZVD7uzWaIvbUJ/K4ImsCSxC73xWyDRUOXIUKsX1rSQlztJloyiBGiOJ7k
 N/h7SBzK5mn5cwjYvmMEe9Da0xYHpv5gXt/zbrYdsZGYhFItjoUZKl2NSaVLZrTUkP
 pK1jE7jQdNRTQ==
Date: Tue, 25 Jul 2023 20:39:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Message-ID: <20230725203948.4037fee7@kernel.org>
In-Reply-To: <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org>
 <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
MIME-Version: 1.0
Cc: Johannes Zink <j.zink@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

On Tue, 25 Jul 2023 20:22:53 -0700 Richard Cochran wrote:
> > any opinion on this one?  
> 
> Yeah, I saw it, but I can't get excited about drivers trying to
> correct delays.  I don't think this can be done automatically in a
> reliable way, and so I expect that the few end users who are really
> getting into the microseconds and nanoseconds will calibrate their
> systems end to end, maybe even patching out this driver nonsense in
> their kernels.
> 
> Having said that, I won't stand in the way of such driver stuff.
> After all, who cares about a few microseconds time error one way or
> the other?

I see :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
