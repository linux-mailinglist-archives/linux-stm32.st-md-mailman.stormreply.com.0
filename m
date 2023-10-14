Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 776FB7C920E
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 03:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02B06C6A613;
	Sat, 14 Oct 2023 01:13:12 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D51FCC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 01:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C19C1CE3396;
 Sat, 14 Oct 2023 01:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED41C433C7;
 Sat, 14 Oct 2023 01:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697245987;
 bh=n50kcxXI9A3yMV6jxB8NrEwZdjVrYAXqsMjPwBDWtY8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rNoygbMPeUIwtR64hZ7Q9YWWviszucUMdTDI1AIStFs/rvaOC69pt3n9quzesBklA
 QSAIC1b1su7cYyKrsjrSTAbSJNA4+Eq/7vBX5pRwX8JuEkD1u442a7Qz3sYL+tVjH6
 DtAOwHRgKy++OtzgwGKsxXIbNu+45VYfWHcjhYJQ3c4tcxjIq82FPKlNLawkVoEGyY
 cl9plrQrT7vQesR4b8c1y7wnQKg5AQQmi5XkP4EyaDQ0pLKwAM/TShTPymf0aWp0Q8
 x+qbRJu+c+B0N/m1qoJ5lnrHiHRS12f5N8pv67DNwUMkG+F1sdMpEoX2V6CcSyIQ8c
 9HlJizg1+GI/w==
Date: Fri, 13 Oct 2023 18:13:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20231013181305.605fc789@kernel.org>
In-Reply-To: <20231012100459.6158-4-ansuelsmth@gmail.com>
References: <20231012100459.6158-1-ansuelsmth@gmail.com>
 <20231012100459.6158-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v2 3/4] net: stmmac: move TX
 timer arm after DMA enable
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

On Thu, 12 Oct 2023 12:04:58 +0200 Christian Marangi wrote:
> +static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue

missing comma at the end, does not build :(
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
