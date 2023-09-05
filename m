Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7734793053
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Sep 2023 22:51:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B9C9C6B44E;
	Tue,  5 Sep 2023 20:51:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CDF1C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Sep 2023 20:51:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEC1B60E97;
 Tue,  5 Sep 2023 20:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF0AC433C9;
 Tue,  5 Sep 2023 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693947065;
 bh=IAfZD62GpmBQoVGiSUG9EApPenk0Eiw2bjCJMCsRqyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n9LEKj/AoIxy36nnexsV6oqzkMZkl9gynD9E6ojvBpffxxQVRz816uTmHvLZg4sFo
 NN57OGAR0rV6mxxgUA6NAFrDnSjn9rZ8N/VxkXyq1TppUgXaBNwOo7DZZzXlOWb6rc
 bvAsBxk54AHgNLe3uYYw6WXw7JbXJQpjWx50HDIhL9N3bBBgxExKob/9ybRAl8nm8v
 9cQd+1bLrqOuVo0qZ0jchYJlbjfpQjhz9jQxsW0Fy91wUZWx54vME6lPktNNc3dwgH
 Ua7q3i/fobLiaB+Wkwpbr73SlUgm1QoRAC9A0uGuF1uQltel6QeByTVXKh5PFAtCVD
 N7irBo0mhMZVA==
Date: Tue, 5 Sep 2023 13:51:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Message-ID: <20230905135103.04649841@kernel.org>
In-Reply-To: <20230905-stmmac-coaloff-v1-1-e29820e8ff6d@axis.com>
References: <20230905-stmmac-coaloff-v1-1-e29820e8ff6d@axis.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxim Mikityanskiy <maxtram95@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@axis.com,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix handling of zero
 coalescing tx-usecs
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

On Tue, 5 Sep 2023 13:32:48 +0200 Vincent Whitchurch wrote:
> Setting ethtool -C eth0 tx-usecs 0 is supposed to disable the use of the
> coalescing timer but currently it gets programmed with zero delay
> instead.
> 
> Disable the use of the coalescing timer if tx-usecs is zero by
> preventing it from being restarted.  Note that to keep things simple we
> don't start/stop the timer when the coalescing settings are changed, but
> just let that happen on the next transmit or timer expiry.
> 
> Fixes: 8fce33317023 ("net: stmmac: Rework coalesce timer and fix multi-queue races")
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

This does not apply cleanly to net, please rebase and repost.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
