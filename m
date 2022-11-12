Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE416266D5
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Nov 2022 05:05:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1CEDC6506B;
	Sat, 12 Nov 2022 04:05:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A219CC65069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Nov 2022 04:05:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 574FA62162;
 Sat, 12 Nov 2022 04:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B837C433C1;
 Sat, 12 Nov 2022 04:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668225929;
 bh=nfkO2oakwXbsXV+Bx9tVN0tDdiORcPa8UJoKUe4po1o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XHngi1vXRn1yXKYcAWqqEHGNPWpF9/2uxfjNIoSQQ0AWIHZFAVEauX9LLAf13ppwe
 Hu1pxqHtFPgQc/FBeSf1Lve30eKZNI+AnWXZNvVh6sgsq+L4kZ7IwK7R8DC3xi/uDn
 GrzLQ31zwVMKp9Cgafv6C0aIuwejtkROhV8VYDoEOheacgglXCm3ydNGeqwJmgqJxq
 rs2NqegdMUvC569Ubtdth0Wte12yOuZwybbghLuDZM/8RuB6kapQTY8dEbfVIJD18A
 xoj6oaDPL7z7gnoiyXhbUiKEJ91Ki0vwmTXxIwF9beH3Ms/DZIsaaHmqB0KsIbNYz9
 bKM8jLEMK8gKg==
Date: Fri, 11 Nov 2022 20:05:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>
Message-ID: <20221111200528.1ca0aa29@kernel.org>
In-Reply-To: <20221110064552.22504-1-noor.azura.ahmad.tarmizi@linux.intel.com>
References: <20221110064552.22504-1-noor.azura.ahmad.tarmizi@linux.intel.com>
MIME-Version: 1.0
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: ensure tx function
 is not running in stmmac_xdp_release()
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

On Thu, 10 Nov 2022 14:45:52 +0800 Noor Azura Ahmad Tarmizi wrote:
> When stmmac_xdp_release() is called, there is a possibility that tx
> function is still running on other queues which will lead to tx queue
> timed out and reset adapter.
> 
> This commit ensure that tx function is not running xdp before release
> flow continue to run.

Do we still need that netif_trans_update() later in the function?
That looks odd.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
