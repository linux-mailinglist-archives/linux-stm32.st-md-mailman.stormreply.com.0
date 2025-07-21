Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1FCB0C7C1
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 17:37:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFCDCC32E8F;
	Mon, 21 Jul 2025 15:37:45 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78B5BC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 15:37:44 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso3855213b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753112263; x=1753717063;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SDh6f89OtCRQRfeV7TsPgYDLKkybdTNwjOtD8a9eZwA=;
 b=XpaSNDZ+deo13GOrqS3wq7b87C4EDGJFdlqgvpNW244bZFhdQokcJJbfeXOKfplzYN
 2bMSscP9ekdM7kFOggmVDCNvRwSUOtKMgST8lnhAR5Jbjdrv2TVH3RDbTfLD2BNbmMoS
 kHLu3DyLk0L+9qKSnwPljjqXFJSpNgxqt9b78fyRo60bsPmMkiGgppG0NRpipnvY5sdn
 OkjQpgEE9dxXqBDh1CtBiJ6Ezpyt2kjg4HOrnJ2yntlaokU2kUYuWoQHuy2IuWGDp89W
 HPjkXJLukDZaH2AG2ZVPIjXLYGHOPQ6zleCG2A3VhCqfwvW/3bO9g2UG5Xc217p71xbD
 z1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112263; x=1753717063;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDh6f89OtCRQRfeV7TsPgYDLKkybdTNwjOtD8a9eZwA=;
 b=o27hSSiza4yYisWNQmIOf3KFVWIeI6TezCzvLHUpF2fE5Bkt93too56jQkmQfgZoKL
 d29TXiXhjopOr/itzwmildq+orJOVcoPgfWQfAWOY8TqMEtKXJyJ6ByfWbZ1YlrPdHGk
 TjNrSOSibKkVGgM9vcq3ShjG46Edw53ocdWbGFAzUP+q18UaU4kMRHxgeUOAHiINChBj
 D0DY1mdywmmoZ4aohevyN0vSwCaTCm3zLkjQ00UD2/AGsJZdjLz7tqdCB1mwP9yQE9kN
 cfjyqhSczj8L6zG6XllPE4jKV2pqUiCf/eC8YLXBgUVAbiU+SNiYcYJZLKcUfLcvID4n
 ZPNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK6gQyhTRctg1WewcuatT/8NXQ4/ty2RRK5vwgSGKpszLu8vWFb+O/3lSxHSyIOzWi8BYFgK5/aEwxVA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzHMfySjFaoRq7G0Q4xxdH3l1P1DaXQhDSSZGUHOOGk27BAYswA
 7mkH0lU3L/ee+VhDdZK/7jRSSDH2ldCK8GKXsRKixCvOEao0x0yoPO4=
X-Gm-Gg: ASbGncsk5skb+L7hpx9J1UiEbfS0v2O0twq1nUGLDwMNgCq+/BTSeFP7KgT6VSjcca6
 eEP+VILXntIxAcZuclQhSNKXzKkxWSENglnB42QH0VIpItZJK8ocffmJUFzyx/eovfW77qkm6vc
 nPtMmBYyfH/+hPVoFl+RUwu8SbYP2MLTpUuVlJS0CJZ1woiNKIOlfxJtIy2JZWNi47E6X1my7hl
 XXBCc2C7XbgaNqFeSERRfKcMe8OG6k6HqYxA+9psvPLYjHBEV0Au6uU69qd2PmkOIrEsLt/WnRu
 4UEWYoGqg9W5cfJf/mwBcvfAPyLIdFPpuLL9WYhNrvN4ILuQ+Q2ikOzse7RhmsNfaWvlDAB4JT2
 yATppvD1voaFBlTJM/PIc5Uh8ZyC76iawrJdtHM1F7Ds5VHfrq9xd3h3GP/WRPXaKRBlv1Q==
X-Google-Smtp-Source: AGHT+IEaIspNuv99Qrfx4sC4q4Y93JQlnVL5ZHYgom/rDGQzYOHx3souBPvCEmbOTJYWppBnuW8WRw==
X-Received: by 2002:a05:6a00:856:b0:748:f1ba:9b0d with SMTP id
 d2e1a72fcca58-75723e74318mr31994730b3a.11.1753112262692; 
 Mon, 21 Jul 2025 08:37:42 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net.
 [73.158.218.242]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-759cb155de8sm6048908b3a.84.2025.07.21.08.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:37:42 -0700 (PDT)
Date: Mon, 21 Jul 2025 08:37:41 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Message-ID: <aH5exXo_BdonTfmf@mini-arch>
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721083343.16482-2-kerneljasonxing@gmail.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, magnus.karlsson@intel.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, bjorn@kernel.org,
 mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] stmmac: xsk: fix underflow
 of budget in zerocopy mode
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

On 07/21, Jason Xing wrote:
> From: Jason Xing <kernelxing@tencent.com>
> 
> The issue can happen when the budget number of descs are consumed. As
> long as the budget is decreased to zero, it will again go into
> while (budget-- > 0) statement and get decreased by one, so the
> underflow issue can happen. It will lead to returning true whereas the
> expected value should be false.
> 
> In this case where all the budget are used up, it means zc function
> should return false to let the poll run again because normally we
> might have more data to process.
> 
> Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
> Signed-off-by: Jason Xing <kernelxing@tencent.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f350a6662880..ea5541f9e9a6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2596,7 +2596,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
>  
>  	budget = min(budget, stmmac_tx_avail(priv, queue));
>  
> -	while (budget-- > 0) {
> +	while (budget > 0) {

There is a continue on line 2621. Should we do 'for (; budget > 0; budget--)'
instead? And maybe the same for ixgbe [0]?

0: https://lore.kernel.org/netdev/20250720091123.474-3-kerneljasonxing@gmail.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
