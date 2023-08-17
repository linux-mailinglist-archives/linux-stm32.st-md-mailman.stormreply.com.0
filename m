Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46892784740
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03851C6DD7F;
	Tue, 22 Aug 2023 16:25:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C466AC6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 08:03:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92D186343C;
 Thu, 17 Aug 2023 08:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A114C433C7;
 Thu, 17 Aug 2023 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692259382;
 bh=qHhD0UVnV47SYp//W121/iPNgLZ88B0c8IP9WQRtSnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pX0JsShXEwIdADNqJaCdTF69t4iyiGO/hdr2+/12zhTsQtCy0dzli3q/1qS+m484c
 1oEFFBt78BibHuyLtZUK93NGVKofIPtPHizxF2ck21hzlzNoHo7TUvTDJ4k4TVFNR8
 CtnJFMIDIY9vuxvZzg/Oy7ce+Xs9yEtRwEhFYypNDStM2VsqV4dWbBwr0iJf+Rg2Xc
 hqER9KuIk0RiOmL8kF24xuKLI7+EDelZvqMRoPNPPjiZf5YXOzjViI4Tb1NXTZFf2w
 2kvBf7mA/MUcUUKacohPii2wHt2bmoBRY4fC77R9fmlhudusN6t0D5TOwn5wNns75y
 krk5Weeeg30sA==
Date: Thu, 17 Aug 2023 11:02:57 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Message-ID: <20230817080257.GD22185@unreal>
References: <20230817071941.346590-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817071941.346590-1-ruanjinjie@huawei.com>
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: daniel.machon@microchip.com, simon.horman@corigine.com,
 Steen.Hegelund@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 horatiu.vultur@microchip.com, edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, lars.povlsen@microchip.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: Use helper function
	IS_ERR_OR_NULL()
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

On Thu, Aug 17, 2023 at 03:19:39PM +0800, Ruan Jinjie wrote:
> Use IS_ERR_OR_NULL() instead of open-coding it
> to simplify the code.
> 
> Ruan Jinjie (2):
>   net: microchip: sparx5: Use helper function IS_ERR_OR_NULL()
>   net: stmmac: Use helper function IS_ERR_OR_NULL()
> 
>  drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

As a side note, grep of vcap_get_rule() shows that many callers don't
properly check return value and expect it to be or valid or NULL.

For example this code is not correct:
drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c
    61         vrule = vcap_get_rule(lan966x->vcap_ctrl, rule_id);
    62         if (vrule) {
    63                 u32 value, mask;
    64
    65                 /* Just modify the ingress port mask and exit */
    66                 vcap_rule_get_key_u32(vrule, VCAP_KF_IF_IGR_PORT_MASK,
    67                                       &value, &mask);
    68                 mask &= ~BIT(port->chip_port);
    69                 vcap_rule_mod_key_u32(vrule, VCAP_KF_IF_IGR_PORT_MASK,
    70                                       value, mask);
    71
    72                 err = vcap_mod_rule(vrule);
    73                 goto free_rule;
    74         }

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
