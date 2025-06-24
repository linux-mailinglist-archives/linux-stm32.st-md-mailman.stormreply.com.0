Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A46AE5DB2
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jun 2025 09:29:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 415C5C36B29;
	Tue, 24 Jun 2025 07:29:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66DDEC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jun 2025 07:29:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 268A749BCC;
 Tue, 24 Jun 2025 07:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D785C4CEEF;
 Tue, 24 Jun 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750750163;
 bh=O27h05PvealtzA1SswhnPXVG+5x+RcHWMCkh/jC3fzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qPEmQW1inTq4Rpz5TUtePLSc6M6wPN0iX9FAI+ANN3bNbUoGhlMxDrBNp4HIv9N8O
 IfZFoam4LndvThNLZjiuuozIkQldFXvt6eumbSasbO4ll51KjH0wpn7w+p2gDtX4le
 SNr5kv6XvlY85pE7L3jZNdA1+qRcUn8eegbfyVTvFCFubK7H1VfA6H140rF76hBRAN
 k5AMMfiXVOBLFR6KPhbmH55pm91lEbGhYT4zMSW/D6IO1TbA4sM566MkDttt0VMA+m
 697fFdIMkAx7lPtBbZ/GqzgVUgykeoUilBk51aczraYcbmI58+/DmBDu8uGqPobKaX
 TjlOImCORjQLQ==
Date: Tue, 24 Jun 2025 09:29:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <t5lg2iw2ha3xpqnce64k4xgaim3f2shfe4ccgnqggtouzy2lc3@se4e6ldggjtx>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623095732.2139853-1-joy.zou@nxp.com>
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, ping.bai@nxp.com,
 catalin.marinas@arm.com, frank.li@nxp.com, edumazet@google.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 will@kernel.org, kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ye.li@nxp.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux-pm@vger.kernel.or
Subject: Re: [Linux-stm32] [PATCH v6 0/9] Add i.MX91 platform support
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

On Mon, Jun 23, 2025 at 05:57:23PM +0800, Joy Zou wrote:
> The design of i.MX91 platform is very similar to i.MX93.
> Extracts the common parts in order to reuse code.
> 
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core.
> - i.MX91 has different pinmux.
> - i.MX91 has updated to new temperature sensor same with i.MX95.
> 
> ---
> Changes for v6:
> - add changelog in per patch.
> - correct commit message spell for patch #1.
> - merge rename imx93.dtsi to imx91_93_common.dtsi and move i.MX93
>   specific part from imx91_93_common.dtsi to imx93.dtsi for patch #3.
> - modify the commit message for patch #3.
> - restore copyright time and add modification time for common dtsi for patch #3.
> - remove unused map0 label in imx91_93_common.dtsi for patch #3.
> - remove tmu related node for patch #4.
> - remove unused regulators and pinctrl settings for patch #5.
> - add new modification for aliases change patch #6.


Where are the links to the previous versions? Why are you not using b4?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
