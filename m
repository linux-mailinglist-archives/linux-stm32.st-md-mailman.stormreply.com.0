Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055BB0C0FB
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 12:12:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFCF4C32E8F;
	Mon, 21 Jul 2025 10:12:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFBADC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 10:12:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A9D22601E8;
 Mon, 21 Jul 2025 10:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC5BC4CEED;
 Mon, 21 Jul 2025 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753092743;
 bh=dH+et4IVFehAoofbz4bjXr/dEXWhL6mRUcMkBd7PQ98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EF83KfN0RR+kBLAAoTiFCigRniZfIBmzhofNXQtSRhe0mIc+mSmwaXLpSIeKFOTrA
 mmn2x+EnoGxkQK/rmulUujuDzayGk1EYz8CbEkTMMlZscPF/p/LpkR6Oiph/tODjtl
 r/AkOmZCVFFKCmzmBPMd0dxwjdMm1XaHscvOVFYQ/QrjPKpYJMWvOLxtgc3kVm7jUZ
 IO2CT8AOBAFLJhHf4843gZASPIUT8QWci9esovDs6sXmKSY7VrC0I8xN24r2q1611n
 +H4X9So0PKaKtjBzQBYKcoOvo3At/KLZRv86DxF+2rSI8J99LitFD4/mcgYMkBS7hH
 CyswzAJMYqjOg==
Date: Mon, 21 Jul 2025 11:12:17 +0100
From: Simon Horman <horms@kernel.org>
To: Jason Xing <kerneljasonxing@gmail.com>
Message-ID: <20250721101217.GC2459@horms.kernel.org>
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-3-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721083343.16482-3-kerneljasonxing@gmail.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, magnus.karlsson@intel.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, bjorn@kernel.org,
 mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] igb: xsk: solve underflow of
 nb_pkts in zerocopy mode
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

On Mon, Jul 21, 2025 at 04:33:43PM +0800, Jason Xing wrote:
> From: Jason Xing <kernelxing@tencent.com>
> 
> There is no break time in the while() loop, so every time at the end of
> igb_xmit_zc(), underflow of nb_pkts will occur, which renders the return
> value always false. But theoretically, the result should be set after
> calling xsk_tx_peek_release_desc_batch(). We can take i40e_xmit_zc() as
> a good example.
> 
> Returning false means we're not done with transmission and we need one
> more poll, which is exactly what igb_xmit_zc() always did before this
> patch. After this patch, the return value depends on the nb_pkts value.
> Two cases might happen then:
> 1. if (nb_pkts < budget), it means we process all the possible data, so
>    return true and no more necessary poll will be triggered because of
>    this.
> 2. if (nb_pkts == budget), it means we might have more data, so return
>    false to let another poll run again.
> 
> Fixes: f8e284a02afc ("igb: Add AF_XDP zero-copy Tx support")
> Signed-off-by: Jason Xing <kernelxing@tencent.com>
> ---
>  drivers/net/ethernet/intel/igb/igb_xsk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/igb/igb_xsk.c b/drivers/net/ethernet/intel/igb/igb_xsk.c
> index 5cf67ba29269..243f4246fee8 100644
> --- a/drivers/net/ethernet/intel/igb/igb_xsk.c
> +++ b/drivers/net/ethernet/intel/igb/igb_xsk.c
> @@ -482,7 +482,7 @@ bool igb_xmit_zc(struct igb_ring *tx_ring, struct xsk_buff_pool *xsk_pool)
>  	if (!nb_pkts)
>  		return true;
>  
> -	while (nb_pkts-- > 0) {
> +	while (i < nb_pkts) {

Hi Jason,

FWIIW, I think using a for loop is a more idiomatic way
of handling the relationship between i, nb_pkts, and
the iterations of this loop.

>  		dma = xsk_buff_raw_get_dma(xsk_pool, descs[i].addr);
>  		xsk_buff_raw_dma_sync_for_device(xsk_pool, dma, descs[i].len);
>  
> -- 
> 2.41.3
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
