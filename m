Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3FE6C28A7
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 04:42:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE19C6A603;
	Tue, 21 Mar 2023 03:42:02 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 624C7C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 03:42:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6AD44CE173E;
 Tue, 21 Mar 2023 03:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17888C433EF;
 Tue, 21 Mar 2023 03:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679370116;
 bh=Jk2T8KzAk6AYQ1kjo+O7hUQbaKhmKLsFTuvlYvwxK/A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oLf3l/0yU8YpuM7jfKUSyIKeoRoUdovOG9TYbeB30Wm8DCFIhnaL6MV24hkWZyeUi
 6zntvyKAunOQIffo2oeilPDVtH4aJAV0jofS/FBZkNcRE+rIbye/YZnJ1A3rnj/G9N
 rIvBgzbrwLPBn3WT5EBKLRtM/fCUT4srAorE1TX+XroTG2dxAn3sjDnSNVzrDn63Z5
 4U0YEr+xP21vy0nzcmFci9MHCHCEsBP903MTQ5c275B9i8ZSY9Kn6uHYE4A5RvCkBX
 CL+b8t1GpWaKooO9pIVDpcC21GnX3+ZTBEVLVQcqcQUApDiAeDVzcATDiDvffwRsiR
 wQjxtHPocjnNg==
Date: Mon, 20 Mar 2023 20:41:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20230320204153.21736840@kernel.org>
In-Reply-To: <20230320221617.236323-10-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-10-ahalaney@redhat.com>
MIME-Version: 1.0
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, pabeni@redhat.com, andrey.konovalov@linaro.org,
 ncai@quicinc.com, devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 09/12] net: stmmac: Add EMAC3
 variant of dwmac4
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

On Mon, 20 Mar 2023 17:16:14 -0500 Andrew Halaney wrote:
> The next approach that was checked was to have a function pointer
> embedded inside a structure that does the appropriate conversion based
> on the variant that's in use. However, some of the function definitions
> are like the following:
> 
>     void emac3_set_rx_ring_len(void __iomem *ioaddr, u32 len, u32 chan)

I checked a couple of callbacks and they seem to all be called with
priv->iomem as an arg, so there is no strong reason to pass iomem
instead of priv / hw. Or at least not to pass both..

I think that's a better approach than adding the wrappers :(

Are you familiar with coccinelle / spatch? It's often better than 
just regexps for refactoring, maybe it can help?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
