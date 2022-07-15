Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE895765A5
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 19:05:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9BAC640EF;
	Fri, 15 Jul 2022 17:05:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73703C08D1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 17:05:34 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id l12so3701441plk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3F2Dyav1qJ5Ymnprccu3h+/op3LDhQRCn24iGv/mXi4=;
 b=B6RV0gNkNpL7CxjM3yr5/X6s39SewbqYQW5lBBG63+Pefp2pE1SgxSsyV5UWh1vt3+
 rc0ZbJoKBVU8xX99s9CTItshFLGPMoYa+E99ErWDIjWaAZ1jgJPLSzjsyjMco48S+EPt
 aFt9LtETeZbniwfBHE4T7EuFAblDAeNUaq7VP7bZc6b8aNmh/F2v5xfOMb93Io1QWhLW
 Xbz8bnTqvFMPOL/yHrpt85OXu/GLmZRoGLEs9dqf3QQqAkP6/Ako8wsqpTZoRHffBqdQ
 kabwqqsgNVeVRq1stWL4UPMNVNZWEz4A2H5wCrWBwn+yLGOpuO2A6I4wIQmLy7jQZ730
 8+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3F2Dyav1qJ5Ymnprccu3h+/op3LDhQRCn24iGv/mXi4=;
 b=s4iUaIyh/vNDRw96BYPge8O325/Gl+gOpNDa3PcuArzOXhcy+Bi5YFkvGU3uVOeeGf
 l1BkYEWEJQiQIgRK5OVxquOIgksN0Gx/UHbkK1V/v4UmDOS/+JWe1EA0N/cYHXVQhsqj
 8E+lN+MvgyfHnGaBP07+huWT2ti6l9jFN6SbbTifwy+QAqmkHgFV3q+0/LmgEkkNO6st
 FYdA5UwGoGz0WFnwbe8inIPHAx5V5kYWvR6OO7cX2n7JhiYU67c6G0gML3Cg4r8pARh9
 ZZGBXRLmR7sGz57nppBGv3rx7F3Hqj15riaGmmyRox+gBNgRfTkOgJZiEfgbYWwdYhwa
 XStQ==
X-Gm-Message-State: AJIora+47q/d8ivhDXfafpgXitz3Y/+meJM+i/Gs1GA+9YbZVODfXOfw
 ZEdywniO6oxrNgM3wfuFgM8=
X-Google-Smtp-Source: AGRyM1tz3FRIhzFUz7drLCRi9SZYYj78Ri/KA5ucb3y6J4xkZkTjaL58Eq1AQTUzIxBY0wYQmkr4Rg==
X-Received: by 2002:a17:902:cece:b0:16c:3683:8835 with SMTP id
 d14-20020a170902cece00b0016c36838835mr14824814plg.104.1657904732702; 
 Fri, 15 Jul 2022 10:05:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 u9-20020a170903124900b0016cabb9d77dsm3902963plh.169.2022.07.15.10.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 10:05:32 -0700 (PDT)
Message-ID: <8b875407-0321-8d50-7e34-077f48e11de2@gmail.com>
Date: Fri, 15 Jul 2022 10:05:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Junxiao Chang <junxiao.chang@intel.com>, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 netdev@vger.kernel.org
References: <20220715074701.194776-1-junxiao.chang@intel.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220715074701.194776-1-junxiao.chang@intel.com>
Cc: Joao.Pinto@synopsys.com, edumazet@google.com, mcoquelin.stm32@gmail.com,
 cedric@bytespeed.nl, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix dma queue left shift
	overflow issue
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

On 7/15/22 00:47, Junxiao Chang wrote:
> When queue number is > 4, left shift overflows due to 32 bits
> integer variable. Mask calculation is wrong for MTL_RXQ_DMA_MAP1.
> 
> If CONFIG_UBSAN is enabled, kernel dumps below warning:
> [   10.363842] ==================================================================
> [   10.363882] UBSAN: shift-out-of-bounds in /build/linux-intel-iotg-5.15-8e6Tf4/
> linux-intel-iotg-5.15-5.15.0/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:224:12
> [   10.363929] shift exponent 40 is too large for 32-bit type 'unsigned int'
> [   10.363953] CPU: 1 PID: 599 Comm: NetworkManager Not tainted 5.15.0-1003-intel-iotg
> [   10.363956] Hardware name: ADLINK Technology Inc. LEC-EL/LEC-EL, BIOS 0.15.11 12/22/2021
> [   10.363958] Call Trace:
> [   10.363960]  <TASK>
> [   10.363963]  dump_stack_lvl+0x4a/0x5f
> [   10.363971]  dump_stack+0x10/0x12
> [   10.363974]  ubsan_epilogue+0x9/0x45
> [   10.363976]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0x10e
> [   10.363979]  ? wake_up_klogd+0x4a/0x50
> [   10.363983]  ? vprintk_emit+0x8f/0x240
> [   10.363986]  dwmac4_map_mtl_dma.cold+0x42/0x91 [stmmac]
> [   10.364001]  stmmac_mtl_configuration+0x1ce/0x7a0 [stmmac]
> [   10.364009]  ? dwmac410_dma_init_channel+0x70/0x70 [stmmac]
> [   10.364020]  stmmac_hw_setup.cold+0xf/0xb14 [stmmac]
> [   10.364030]  ? page_pool_alloc_pages+0x4d/0x70
> [   10.364034]  ? stmmac_clear_tx_descriptors+0x6e/0xe0 [stmmac]
> [   10.364042]  stmmac_open+0x39e/0x920 [stmmac]
> [   10.364050]  __dev_open+0xf0/0x1a0
> [   10.364054]  __dev_change_flags+0x188/0x1f0
> [   10.364057]  dev_change_flags+0x26/0x60
> [   10.364059]  do_setlink+0x908/0xc40
> [   10.364062]  ? do_setlink+0xb10/0xc40
> [   10.364064]  ? __nla_validate_parse+0x4c/0x1a0
> [   10.364068]  __rtnl_newlink+0x597/0xa10
> [   10.364072]  ? __nla_reserve+0x41/0x50
> [   10.364074]  ? __kmalloc_node_track_caller+0x1d0/0x4d0
> [   10.364079]  ? pskb_expand_head+0x75/0x310
> [   10.364082]  ? nla_reserve_64bit+0x21/0x40
> [   10.364086]  ? skb_free_head+0x65/0x80
> [   10.364089]  ? security_sock_rcv_skb+0x2c/0x50
> [   10.364094]  ? __cond_resched+0x19/0x30
> [   10.364097]  ? kmem_cache_alloc_trace+0x15a/0x420
> [   10.364100]  rtnl_newlink+0x49/0x70
> 
> This change fixes MTL_RXQ_DMA_MAP1 mask issue and channel/queue
> mapping warning.
> 
> Fixes: d43042f4da3e ("net: stmmac: mapping mtl rx to dma channel")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216195
> Reported-by: Cedric Wassenaar <cedric@bytespeed.nl>
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thank you!
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
