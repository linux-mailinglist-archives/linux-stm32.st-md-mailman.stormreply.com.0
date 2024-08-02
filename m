Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD08946362
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 20:52:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FD55C7129D;
	Fri,  2 Aug 2024 18:52:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 806E4C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722624734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CG1jgLVdC2fEObYmK2QTtuJTwCPC+G97aquoLWftjeI=;
 b=DBRV6dExMHErpcwhj2TzP2IEfrBx76e5LCsZxfvfL+IhaNl7dMwsbsNIhqFLyZCelvgXdh
 rotNQBU4RtC/QglzQrLUl4PIWq+YQnWKjJ+wlVbcNfX8FNQiXuEC0ugltSib0vqf/J3IdA
 dOZA9sQT/N1/Ly9YlaUMr7W5Rgvfpus=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-m28L3-SFP8O68naUnhslOg-1; Fri, 02 Aug 2024 14:52:11 -0400
X-MC-Unique: m28L3-SFP8O68naUnhslOg-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-44f594e5605so115994311cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 11:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722624730; x=1723229530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CG1jgLVdC2fEObYmK2QTtuJTwCPC+G97aquoLWftjeI=;
 b=VdeG9rt/hpHowdk4Hh67WyynFqb5GI1qQl4WsGv2RK6+W6GN7B3Mt0+OPHmjcfYYec
 PYai5ZZCKptLctv+hcgIv0TfBHX5UjFEaypn2rtRe9hMoizpfA49cnGLr7La6HrfoOf3
 R5/zMe93o3RJIxk+n0oq5rXQKZYjnTNceqqxP3i0/NPO3gOFQwuq3mXB54iDDt83qmHx
 2L5eIG6PHPcIgLcG7Dv9WSvueWqLFrhlaWmIe4WcrFn5lXA1nAYdtYTAov30FSwx3gTq
 KDfb9fA3gsMChieNi2/1e6IRCFTSBtnlAKj2x3RL0sen7xWsHdIZliqXI8Lk2B32kM8Z
 Fu6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxGFeou0H0sG5TKkAXZpkIoryNMlnDKeaprvceQMVFMrr2GxkNjuco/it6MPVRIHqcmNTZG0RS+yR7nabh76p7REt/+E7Yyc9wJGsx4IubkVJPTjux2tPR
X-Gm-Message-State: AOJu0YxBm8otZXowCSvpQaw+2rTZgNwMFgrJml2qvWUamQHQbdu6vLCC
 9zR8NpEQkREtHndabx4Qt4JzMPsccOi7KTZbtUXyES/nWbmZ8h5CeWDEPFDomzoSdcBBAjvD0Zk
 7ef2fiM0z6VOsVzyPK9QuC2rxVTwfWemFamEneO5I/hk/33/J52hffIM2piup0Nx3cdNY6UuCBd
 HZIA==
X-Received: by 2002:a05:622a:34c:b0:447:d4ce:dd26 with SMTP id
 d75a77b69052e-451892c1523mr52041241cf.56.1722624730528; 
 Fri, 02 Aug 2024 11:52:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaUYKiXGc9VmWENZJ7EtnEJAQEzZy6OYbhTn3EVsmtVqd1bg6xDc1wbjVNcpxbrWR12YCYMA==
X-Received: by 2002:a05:622a:34c:b0:447:d4ce:dd26 with SMTP id
 d75a77b69052e-451892c1523mr52040901cf.56.1722624730143; 
 Fri, 02 Aug 2024 11:52:10 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4518a755579sm9510731cf.59.2024.08.02.11.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 11:52:09 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:52:07 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <eyup477eanpmbgldj63cvwwkwqjshweqrve6u2enyzodoqillw@cuzhm7u37rz7>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpog-000eHn-8r@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sZpog-000eHn-8r@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 11/14] net: stmmac: pass
 stmmac_pcs into dwmac_pcs_isr()
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

On Fri, Aug 02, 2024 at 11:47:22AM GMT, Russell King (Oracle) wrote:
> Pass the stmmac_pcs into dwmac_pcs_isr() so that we have the base
> address of the PCS block available.

nitpicky, but I think it would be nice say something like "stmmac_pcs
already contains the base address of the PCS registers. Pass that in
instead of recalculating the base address again" if I'm following the
motivation correctly.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index 083128e0013c..c73a08dab7b2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -61,18 +61,18 @@
>  
>  /**
>   * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
> - * @ioaddr: IO registers pointer
> + * @spcs: pointer to &struct stmmac_pcs
>   * @reg: Base address of the AN Control Register.
>   * @intr_status: GMAC core interrupt status
>   * @x: pointer to log these events as stats
>   * Description: it is the ISR for PCS events: Auto-Negotiation Completed and
>   * Link status.
>   */
> -static inline void dwmac_pcs_isr(void __iomem *ioaddr, u32 reg,
> +static inline void dwmac_pcs_isr(struct stmmac_pcs *spcs,
>  				 unsigned int intr_status,
>  				 struct stmmac_extra_stats *x)

Please drop the reg variable from the kerneldoc, you've annihilated it!

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
