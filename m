Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B34113947E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 16:13:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58FB8C36B0C;
	Mon, 13 Jan 2020 15:13:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6B13C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 15:13:55 +0000 (UTC)
Received: from cakuba (unknown [172.58.35.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E949207E0;
 Mon, 13 Jan 2020 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578928434;
 bh=k37G7crg/rnM1OPMgaFjdTDn+Y4irTU6HvEVxVieUjM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2hwwdBpUxEHlF/MjAnrClMUvpSXE0hViNfyJbeItXwrJg/UYJfNs7k4g0NTGgL4qg
 oB47bgNla0FdArsPtX9RFkZtKktMmYBl6EAK5tKv6DMGQWLM3whpFWy2ndFngr58H1
 e/SiSW/FESxRge2qm/qM6l5ZH530SABcPO51G5uQ=
Date: Mon, 13 Jan 2020 07:12:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20200113071251.1d9d51f6@cakuba>
In-Reply-To: <4a4290706a9166d67d2d455dfa9d5f259699a036.1578920366.git.Jose.Abreu@synopsys.com>
References: <cover.1578920366.git.Jose.Abreu@synopsys.com>
 <4a4290706a9166d67d2d455dfa9d5f259699a036.1578920366.git.Jose.Abreu@synopsys.com>
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/8] net: stmmac: tc: Add
 support for ETF Scheduler using TBS
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

On Mon, 13 Jan 2020 14:02:37 +0100, Jose Abreu wrote:
> +static int tc_setup_etf(struct stmmac_priv *priv,
> +			struct tc_etf_qopt_offload *qopt)
> +{
> +

There's a couple places I spotted where continuation lines are not
aligned to the opening parenthesis, and here we have a spurious blank
line. Please run this through checkpatch --strict, I see quite a few
legit errors there.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
