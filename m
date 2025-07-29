Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED89B151C2
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 18:58:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B607AC349C1;
	Tue, 29 Jul 2025 16:58:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A19E3C35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 16:58:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C90560202;
 Tue, 29 Jul 2025 16:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A35EC4CEF5;
 Tue, 29 Jul 2025 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753808296;
 bh=Hb9smdHf0g56CpF8sBWDOF38RasuaUJ0puvOlmqvOjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KlPT85UP6HQLETFTi6OtUJx9aRuyZBcfrc4BG0gLSetfvPPGD3huNlBLFo0yL5k22
 Mtx9Bqa1YmgYyOQeni00rZcMrLD1xMmj+A/AcO7/p2AZGoUM57od4OFqJgUlcbZPy1
 vwoHTTPkVS1J/e0Wea9moLyTMgW5hPt3gOmatUFpd7vYVdHguB+8uTPSslkTw2M+Nd
 AQ9lmMqb8djPioT5MzVN22+r099MIJTq6z508uKiDs1wcvKL++f6Yh4T1g5d9/PNTn
 kMtkM/iz68Sx+YMXAHzvOowhlMKSqVIczcTgLwLbXL7BKChTSMwB2V7Xl1e7J3sn/D
 v2qe7PZzt4j6A==
Date: Tue, 29 Jul 2025 17:58:10 +0100
From: Simon Horman <horms@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20250729165810.GG1877762@horms.kernel.org>
References: <20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com>
 <20250729-relative_flex_pps-v2-1-3e5f03525c45@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729-relative_flex_pps-v2-1-3e5f03525c45@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] drivers: net: stmmac:
 handle start time set in the past for flexible PPS
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

On Tue, Jul 29, 2025 at 04:52:00PM +0200, Gatien Chevallier wrote:
> In case the time arguments used for flexible PPS signal generation are in
> the past, consider the arguments to be a time offset relative to the MAC
> system time.
> 
> This way, past time use case is handled and it avoids the tedious work
> of passing an absolute time value for the flexible PPS signal generation
> while not breaking existing scripts that may rely on this behavior.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 31 ++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index 3767ba495e78d210b0529ee1754e5331f2dd0a47..5c712b33851081b5ae1dbf2a0988919ae647a9e2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -10,6 +10,8 @@
>  #include "stmmac.h"
>  #include "stmmac_ptp.h"
>  
> +#define PTP_SAFE_TIME_OFFSET_NS	500000
> +
>  /**
>   * stmmac_adjust_freq
>   *
> @@ -172,6 +174,10 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
>  
>  	switch (rq->type) {
>  	case PTP_CLK_REQ_PEROUT:
> +		struct timespec64 curr_time;
> +		u64 target_ns = 0;
> +		u64 ns = 0;
> +

I think you need to wrap this case in {}, as is already done for the following
case.

Clang 20.1.8 W=1 build warn about the current arrangement as follows.

  .../stmmac_ptp.c:177:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    177 |                 struct timespec64 curr_time;
        |                 ^
  1 warning generated.

GCC 8.5.0 (but not 15.1.0) also flags this problem.

Also, please note:

## Form letter - net-next-closed

The merge window for v6.17 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after 11th August.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

-- 
pw-bot: defer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
