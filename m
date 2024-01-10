Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F82829DBA
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 16:40:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24639C6A61D;
	Wed, 10 Jan 2024 15:40:23 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92CF2C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 15:40:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CFACDCE1CF4;
 Wed, 10 Jan 2024 15:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A30C433C7;
 Wed, 10 Jan 2024 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704901213;
 bh=aOTgTnA8nEO8OVvqATRlcEqMBOCoeOSc2xVIPjbo8SQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=in3sKJOwfgN7F0JSNIXK8D9g4a6GmKrI9jocfChwTfMwgGmUKnnnmWdsqHVukn3cu
 CoMrOrc9irVLHHOeYfet2aPT7hRGGvHw3DFURO7Xb0T6yfyEJIZUk6b8+rzSR0GOij
 7sLECEmhcp10a86mFl89Y5IUtjMY2/sMaq+VP33WyhaDzUtG+ayk4Wn4Or7hh9qbb8
 OfRdzLiFs7hmTUz7hHVW5XtgVsujaEFJVs9XmaQE3twz6ICICAshoVE5vGabiO98KY
 xnwWaQevXX38VQkn7IHW5Wb4MC7B91Njg32SxFwP03XuOVzH+VmL3QHDx1UaB/Y8kW
 alUKmcAYdd3gQ==
Date: Wed, 10 Jan 2024 15:40:06 +0000
From: Simon Horman <horms@kernel.org>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <20240110154006.GG9296@kernel.org>
References: <20240110111649.2256450-1-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110111649.2256450-1-quic_jsuraj@quicinc.com>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v8 0/3] Ethernet DWMAC5 fault IRQ
	support
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

On Wed, Jan 10, 2024 at 04:46:46PM +0530, Suraj Jaiswal wrote:
> From: Suraj Jaiswal <jsuraj@qti.qualcomm.com>
> 
> Add support to listen Ethernet HW common safery IRQ for correctable and 
> uncorrectable fault. The safety IRQ will be triggered for ECC(error
> correction code), DPP(data path parity, FSM(finite state machine) error.

Hi Suraj,

[original text from Jakub]

## Form letter - net-next-closed

The merge window for v6.8 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens on or after 21st January.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
--
pw-bot: defer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
