Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D464C2A7
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Dec 2022 04:15:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEE4EC65E5F;
	Wed, 14 Dec 2022 03:15:32 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01EA7C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 03:15:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41E67B8163C;
 Wed, 14 Dec 2022 03:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402FEC433EF;
 Wed, 14 Dec 2022 03:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670987729;
 bh=PxLV5VwlxVtw6OSZ3KLbpL+I2EUP7MmcuVvbdO5REos=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kYLU8v4v8oQl7rgdZ3v3RZ13tietFegOmUmqs1Fba9KE/OQ/xmecI6SET3pqarcf/
 +RKHemMxsHDzK+s/AEvow7X2zFvOtfvAjmrl8LsXin+geblRhdWQ1x+FOx0Z49Vhlf
 QrxN0r+FAdVzfTphl7ULiAQrTHA5LZmNQ1b7k74D9NZ7hxV59PXSdxfK9NbGNFJK7e
 bU7QbMF5uwdlf07GWwr8rbf1tNsX0SaX0nluCyh5bDDzLsH1loT7ei2GwKnWd1uyhu
 RznF0zh48bYRD0a3xBIDMG5rO7R5NRCM7qONJ9UDEskqsI93rq4cwMmEp4GEt9vFSf
 1V3ItX82k+KVQ==
Date: Tue, 13 Dec 2022 19:15:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Message-ID: <20221213191528.75cd2ff0@kernel.org>
In-Reply-To: <20221212021350.3066631-1-cuigaosheng1@huawei.com>
References: <20221212021350.3066631-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix possible memory leak
 in stmmac_dvr_probe()
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

On Mon, 12 Dec 2022 10:13:50 +0800 Gaosheng Cui wrote:
> The bitmap_free() should be called to free priv->af_xdp_zc_qps
> when create_singlethread_workqueue() fails, otherwise there will
> be a memory leak, so we add the err path error_wq_init to fix it.
> 
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

The previous version has already been applied and we can't remove it.
Could you send an incremental change to just add the errno?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
