Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7442FCAEA
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jan 2021 07:08:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFBF9C3FADA;
	Wed, 20 Jan 2021 06:08:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50399C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 06:08:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C44C6217BA;
 Wed, 20 Jan 2021 06:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611122897;
 bh=RR54Qs4HyvFncXLjeeZ8ZNoWbpER2eGQN67MAA65J8g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n8ZMmcVpD1uURQ5NGIAawLGiLgoRL2IAUVgy9CnCdUSYva1zb9C/4vq4IQ4uIJ7EM
 HGTqKG7/BNZL4PfOqcKP3WNISw6EtYR1OrQaf/ea19W3qq8JLPmfrwkdWXwOH5qQk2
 q9U+gthlT1Pz61jqJBZR2LNKJ8OPL7aAMeg2UFJJaFrNJB/4dHuLljKNc2s12Tqki+
 SqiWM0xJNMLD1oIZPU6ay0Mh1AitLYMB6UCbBVKVrYm7jji9KAke9dlTjN+azi7ufg
 2yp5Xo9bYxFK6y+BhMS1cNATbYAiH39s4auOZJ7lz9TlsRiLBo3rsH+HRRR8nWE2hx
 zD5LenpclqHHQ==
Date: Tue, 19 Jan 2021 22:08:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20210119220815.039ac330@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210120012602.769683-28-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
 <20210120012602.769683-28-sashal@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, David Wu <david.wu@rock-chips.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH AUTOSEL 5.10 28/45] net: stmmac: Fixed mtu
 channged by cache aligned
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

On Tue, 19 Jan 2021 20:25:45 -0500 Sasha Levin wrote:
> From: David Wu <david.wu@rock-chips.com>
> 
> [ Upstream commit 5b55299eed78538cc4746e50ee97103a1643249c ]
> 
> Since the original mtu is not used when the mtu is updated,
> the mtu is aligned with cache, this will get an incorrect.
> For example, if you want to configure the mtu to be 1500,
> but mtu 1536 is configured in fact.
> 
> Fixed: eaf4fac478077 ("net: stmmac: Do not accept invalid MTU values")
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Link: https://lore.kernel.org/r/20210113034109.27865-1-david.wu@rock-chips.com
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This was applied 6 days ago, I thought you said you wait two weeks.
What am I missing?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
