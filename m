Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC226B8712
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 01:39:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5901FC6904A;
	Tue, 14 Mar 2023 00:39:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C59D9C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 00:39:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AA1FB816A4;
 Tue, 14 Mar 2023 00:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD300C433D2;
 Tue, 14 Mar 2023 00:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678754347;
 bh=I5IHq5bn2nVWOr2WOI4rN3AaQ6amvwyigKJTJsYavWY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RruQ+s06WTk+cgWdUxjMHNjDsZv9dZeRSQBbtDz0mm8ecHaKRqyke90dcSCWbvpdf
 xOy6FZr9xiRMMF/3D/cbp9YhCSUxmF4asMpc9X0jdYOSBJLfzwpXIkETHdpLgvYyCO
 6ogWtkTJZhcch7QFSxcA7085rNO2EqjU0h3aQ5qvpCp+OQCJK1bpQylahTJj4TH7b1
 flkn6Ia7DtYZvHaLvyfmfKFMEcEqxDyH8NMzkQuRtlTccvCTa0Xd09hJOJ+cftRDxb
 aGOg+4Wf3ZWGxTxeTiNbrB9hUFlgB2r1+ebAK0+DVcjF0WdYdNoqS3IqP3KOrhN7iK
 GIEJl2rq3Q6LQ==
Date: Mon, 13 Mar 2023 17:39:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20230313173904.3d611e83@kernel.org>
In-Reply-To: <20230313165620.128463-9-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-9-ahalaney@redhat.com>
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
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: Add EMAC3
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

On Mon, 13 Mar 2023 11:56:17 -0500 Andrew Halaney wrote:
> EMAC3 is a Qualcomm variant of dwmac4 that functions the same, but has a
> different address space layout for MTL and DMA registers. This makes the
> patch a bit more complicated than we would like so let's explain why the
> current approach was used.

Please drop all the static inlines in C sources, you're wrapping 
a single function call, the compiler will do the right thing.

Please no more than 6 function arguments.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
