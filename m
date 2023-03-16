Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6D6BD858
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 19:52:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00E7EC65043;
	Thu, 16 Mar 2023 18:52:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26F97C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 18:52:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC35F620B9;
 Thu, 16 Mar 2023 18:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD8AC433EF;
 Thu, 16 Mar 2023 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678992757;
 bh=59kceHKTQ9pP2wUCJX8jKFzLo8hYVTu7itr7dC78eII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PGUIcaZp6+rvtdA+AXlsWzUw+mepWVcL6mXTXRgW0sgMF6pYGsV9aGt95mIYsEPPn
 mzR0GYlsSB8sEZ3LLO5iUqDWrNzh5Nt6HAgUhzT7o6VTkakqrGjq7kTr2cH10BBHCr
 OCo5l8B4olKfIqW8YTjTcNro8TfwpLnUErrl6QLzMDzn1LuMaECLpL/frKH3ydjtov
 98a0yAp+TFpFg+L3Qe+M5G46OTDt6AqowmZer9SfOghnhOB35do/BwnWONyOswUr/6
 /H2Im6x3rgFHDG+u7QfFUyhJiTRD9aUvzjRAv5JfnwbNRHk1pIg+XRHf/yJRir8/BP
 iv0OYqCiOSLXg==
Date: Thu, 16 Mar 2023 11:52:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20230316115234.393bca5d@kernel.org>
In-Reply-To: <20230316183609.a3ymuku2cmhpyrpc@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-9-ahalaney@redhat.com>
 <20230313173904.3d611e83@kernel.org>
 <20230316183609.a3ymuku2cmhpyrpc@halaney-x13s>
MIME-Version: 1.0
X-Topics: 
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

On Thu, 16 Mar 2023 13:36:09 -0500 Andrew Halaney wrote:
> static void emac3_config_cbs(struct mac_device_info *hw, u32 send_slope,
> 				    u32 idle_slope, u32 high_credit,
> 				    u32 low_credit, u32 queue)
> 
> I agree, that's quite gnarly to read. the emac3_config_cbs is the
> callback, so it's already at 6 arguments, so there's nothing I can
> trim there. I could create some struct for readability, populate that,
> then call the do_config_cbs() func with it from emac3_config_cbs.
> Is that the sort of thing you want to see?

Yes, a structure is much better, because it can be initialized member
by member,

struct bla my_bla = { .this = 1, .that = 2, .and = 3, another = 4, };

That's much easier to read. A poor man's version of Python's keyword
arguments, if you will.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
