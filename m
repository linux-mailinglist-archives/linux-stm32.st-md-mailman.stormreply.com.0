Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C546B856B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:57:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E258AC6A60F;
	Mon, 13 Mar 2023 22:57:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46CD5C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:57:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9F136152C;
 Mon, 13 Mar 2023 22:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B70C433D2;
 Mon, 13 Mar 2023 22:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678748250;
 bh=vByp+cleYjNRsooeWKVsK7Pf6qW+dTVxWVIfmwEMi/k=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LAMexyxtT93hnMxPAeSJOm3HE6EXQjwmlwxCGOXssdRS7y0uE9RV33QYRlCWl2zCF
 oT2WoR4xFQGd2eahk/s/g1Tq+mXi8SE8BHmXfwyDltOv4PJqTl4SL2QEBhBONTKvq/
 wNTh5B1YVB8wowIGd9k6hTpKPEPQKYUf7zyYVLnia+oJ9d4Gb+TTfyDBaQER8lBh7C
 BbB4IMv61ivPl9wGiWQdHwZqeNetxZ7FCjxwQLHjCpGugSTXIIQuG0yJt0SwuVVJ1X
 w+cWiz35fhNVaRCOYiNT7GqK55c4HyXYTNY18/tAxvKCDCZCQVuMKuHMt+/H6QdoJu
 wPdA15ba4fiQg==
Message-ID: <e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230313165620.128463-6-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 15:57:27 -0700
User-Agent: alot/0.10
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp:
	Add EMAC GDSCs
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

Quoting Andrew Halaney (2023-03-13 09:56:14)
> Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

I'm not sure if Bjorn Andersson is planning on modifying this file too,
so please confirm it can go through netdev tree.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
