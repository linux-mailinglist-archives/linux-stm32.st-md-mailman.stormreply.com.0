Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D536D2E3C
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Apr 2023 06:55:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47A4BC69069;
	Sat,  1 Apr 2023 04:55:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69A2AC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Apr 2023 04:55:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EAF1AB83367;
 Sat,  1 Apr 2023 04:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EC5C433D2;
 Sat,  1 Apr 2023 04:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680324906;
 bh=doMEXp7g4Mi+U4ogcvsQzEVvkyrG3KfqBOkNEZBmucY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QmeQwqPIUOLAx+/0TRAFGNCemB8Mxd/GAIZex9HTrz1AdQ5FbeDxsatbW+GfwEo8i
 aWqhM8UeM6Q8rTcntaicUsHQApOjY3jst8ObwcMR5oUgU+QJHbaCxyC9PGeKiHa6BJ
 RyOQquolki6Rumcuqhop22QgddSFzntE4DxvlkbFUaCFBpxm6fTelbe+mVpvnC8yE6
 T54cQ0F6N1crYNfNHK6TfD3wX9cgb+IVrOVsWpS+Ke78spXMN8mzj8SzIXMjg9KiLJ
 khtbfgnPOGEGICTkwQFFJw2sPHegkV2Ul3FZzgpihXmRRcewgS/K6k6R8qvjrT7zVP
 moT/HlGLr5c/Q==
Date: Fri, 31 Mar 2023 21:55:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20230331215504.0169293a@kernel.org>
In-Reply-To: <20230331220613.2cr2r5mcf2wwse4j@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331220613.2cr2r5mcf2wwse4j@halaney-x13s>
MIME-Version: 1.0
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, agross@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 00/12] Add EMAC3 support for
	sa8540p-ride
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

On Fri, 31 Mar 2023 17:06:13 -0500 Andrew Halaney wrote:
> As promised: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#t

Patch 12 never made it to netdev or lore :(
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
