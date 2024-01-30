Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 890C1842818
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 16:33:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35949C6B477;
	Tue, 30 Jan 2024 15:33:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E588C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 15:33:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 211C660DF4;
 Tue, 30 Jan 2024 15:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEC3C433F1;
 Tue, 30 Jan 2024 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706628806;
 bh=xL9kFnUvGlP9fBkvgK0in4ewf6ZPO4qQZEK2ExFEHDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YEUZmIfF+/ZFfhkJ3j7kTnmXvKgFiXwU2qigFrT46q3b8HIMfyqkw+WzXrm9Mhkh4
 LZNOEMSgh85IO6caMHOLwHdKOohDvsEo3cgbbsQjw4m9c9lofKrVQ3k6yh4SNcwBoa
 Dan/4pjo9RcTNFU+BvpwXuRRtJxKgfg1EPWjWohZCKy2VqmS8iCmpGC48n4PHfjk6X
 I4Cmxyb+XMMh7NpYq0Lg9UZW1VjxvUBrilF0PRAuiQLlRj7p9jn/NYTj/IZx86z3le
 Eqsjgl06VCmBYhZu1PY+rAhK+lJnKpnxkgtzVZotG2k8sHTWulLXTaGFITD1+1EUxv
 RBELXLAODvuXA==
Date: Tue, 30 Jan 2024 21:03:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>, bhupesh.linux@gmail.com
Message-ID: <ZbkWwn-oN5wqoPfJ@matsya>
References: <20240129-remove-dwmac-qcom-ethqos-reviewer-v1-1-2645eab61451@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129-remove-dwmac-qcom-ethqos-reviewer-v1-1-2645eab61451@redhat.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: Drop unreachable reviewer
 for Qualcomm ETHQOS ethernet driver
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

On 29-01-24, 11:12, Andrew Halaney wrote:
> Bhupesh's email responds indicating they've changed employers and with
> no new contact information. Let's drop the line from MAINTAINERS to
> avoid getting the same response over and over.

Looks like Bhupesh sent the patch changing but never followed up with a
v2 for this:
lore.kernel.org/r/20230915191600.3410862-1-bhupesh.linux@gmail.com

Would prefer if this is changed to his email (copied him as well)


> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> If anyone knows how to contact Bhupesh / if they're willing to continue
> being a reviewer feel free to suggest an alternative, but for the moment
> this is better than nothing.
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 939f6dd0ef6a..b285d9a123ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18080,7 +18080,6 @@ F:	drivers/net/ethernet/qualcomm/emac/
>  
>  QUALCOMM ETHQOS ETHERNET DRIVER
>  M:	Vinod Koul <vkoul@kernel.org>
> -R:	Bhupesh Sharma <bhupesh.sharma@linaro.org>
>  L:	netdev@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> 
> ---
> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> change-id: 20240129-remove-dwmac-qcom-ethqos-reviewer-1a37d8c71383
> 
> Best regards,
> -- 
> Andrew Halaney <ahalaney@redhat.com>

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
