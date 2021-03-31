Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA3234F6F2
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 04:48:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA755C57B5B;
	Wed, 31 Mar 2021 02:48:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41AD1C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 02:48:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDA0C619D3;
 Wed, 31 Mar 2021 02:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617158921;
 bh=a5Zjyrdx2349NQa+T6hwW+EkY6zzo08x0wON8Albck0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JyYkbrwxvlLCuuAPfmHI6bRXSEeJdXHgcFsylOTFBa2xy0MUCh5nWZ4Ow9nlrd3/V
 H9w4cS5Xfu9ROLY+OiwxN4iMV/fdt5bWHSCVkoZyD/CovlkHgQ6CCnR1ewMhCLRlhU
 5qUzg5xAcFIne/G5vjEMNNd3SgFOlhGqboSpZN2/JFUnx9A2KIKIv7j+l0TL5foCId
 Q3Coyiv4AtYNDcj6tLcm2xsIhcL1fkjyD2B9+mPQz+6WrUKajpEpfNbn2M12aRpDPG
 XnKJSYbPMqRXCWeOQYUhRRGmWPeFyrk1s5K7Zjnx2J/62L8mjWeQDizTP2ncVIE6z6
 wjblHUoZ+kFgQ==
Date: Tue, 30 Mar 2021 19:48:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20210330194839.0b8596f2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210330024949.14010-6-boon.leong.ong@intel.com>
References: <20210330024949.14010-1-boon.leong.ong@intel.com>
 <20210330024949.14010-6-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 bpf@vger.kernel.org, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2 5/6] net: stmmac: Add support
 for XDP_TX action
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

On Tue, 30 Mar 2021 10:49:48 +0800 Ong Boon Leong wrote:
> +	__netif_tx_lock(nq, cpu);
> +	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf);
> +	if (res == STMMAC_XDP_TX) {
> +		stmmac_flush_tx_descriptors(priv, queue);
> +		stmmac_tx_timer_arm(priv, queue);
> +	}
> +	__netif_tx_unlock(nq);

You may want to update nq->trans_start, see commit ec107e775d843
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
