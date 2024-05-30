Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C78D4C2F
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 15:01:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4600C6C859;
	Thu, 30 May 2024 13:01:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D464FC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717074065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9qH6bqXZWDj2VvkhQa8r0x2CDiDZr/N+uYFn9yj//1U=;
 b=ED8paIrYZWhr4SIW2g1q+PCn8bQ7osKJaRdKp8lT4MvvwYdT/ydcskt2lk+LJpnaoxDWxV
 LVCpyXtamtEEbTJDvFQM25zQamDPAJhs85LptYY+QsZPnbm1hzNojN2s332h1qHMWMi69M
 0iE+zYKFttKEEqEgdV+7dLlUcxJXNqw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-uR2iIuLOMgClwQydoU1bIg-1; Thu, 30 May 2024 09:01:04 -0400
X-MC-Unique: uR2iIuLOMgClwQydoU1bIg-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-43fb05ef704so7912801cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 06:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717074063; x=1717678863;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qH6bqXZWDj2VvkhQa8r0x2CDiDZr/N+uYFn9yj//1U=;
 b=SwFLAr+BFfLRJskx4XsWve/kiCyDndIm56n0yI3oP+wDxGV4q4aGg7Qkv1EBqJpOI3
 zIIhrjlB5ywmreEwn+vq4nwHn4zxjJ5xiKSSEb7tZ0I3vt3Xbt6u/2y8BRa8j1XVgxAB
 H/vk3cFPPRndHErydzKzJs/cMomnEFumpqyaZzjqo8mO1EZK/MR/kxABnspeEhRRyzs0
 zNTUmO3ljJVzDFtiRvUhT2uj1o6hWBAmYrzYK5DQUi8RQY9yamABzDoV1neuJKXF5yCr
 q0LTexkIJ0HU62CPYdAT64jr/e6TZNtE4ObriqynBL3e/hIGmv0t1+yfxYs4RueMKUFz
 BMAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgb9mu4gL8VKh973e+Ay1bJMKQWTU1l3vuU/ZaD2d1+32+L9ExDoCDOEnpyKX4Dq0yjjgVl/TxtHjIGs4d8DcrA6h1gC2PCIAz9aA/p8iwLuuNUXCbtfim
X-Gm-Message-State: AOJu0YykfB+jt8WuyOZEvWHZk3HnxWxVhzKSCB+P+eT3EqEOSY8aTnzL
 Z1A37ddbFDaYggehRDhVTOa95aFxsJylnSChb3MAnVFjEJlL2s6Afl7BglPclfBylRoN5wkHXla
 1keDCrjfo9t32DxkYhhn3wm7vs5wtPT16Wa3IDy8JmNsp3T04867bBYCStxkf7nQOSeiTQ6WvCC
 jGLg==
X-Received: by 2002:a05:622a:83:b0:43e:3d8b:b6b9 with SMTP id
 d75a77b69052e-43fe930e9e0mr21742021cf.44.1717074062010; 
 Thu, 30 May 2024 06:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmqMkYgzTY+K+MR+AsBjg7npPdMxiUXyD3C6fsmskBzvTeam+eNVGfcssNbpZMomvAfvLBqQ==
X-Received: by 2002:a05:622a:83:b0:43e:3d8b:b6b9 with SMTP id
 d75a77b69052e-43fe930e9e0mr21741561cf.44.1717074061340; 
 Thu, 30 May 2024 06:01:01 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb18b0e3bsm65135651cf.68.2024.05.30.06.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 06:01:00 -0700 (PDT)
Date: Thu, 30 May 2024 08:00:58 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <busrdvbjh7eigqgpgwl4k5tergt263gfjcpti7jutdyk37cnse@iotdvflbsca6>
References: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
 <7w5bibuejmd5kg3ssozaql4urews26kpj57zvsaoq2pva3vrlo@agfxwq5i65pc>
 <d8ad4e59-5725-4a7d-a2ad-ce5d92553525@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <d8ad4e59-5725-4a7d-a2ad-ce5d92553525@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: Configure
	host DMA width
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

On Thu, May 30, 2024 at 12:22:52AM GMT, Andrew Lunn wrote:
> On Wed, May 29, 2024 at 03:50:28PM -0500, Andrew Halaney wrote:
> > $Subject should be have [PATCH net] since this targets the net tree:
> > 
> > https://docs.kernel.org/process/maintainer-netdev.html
> > 
> > On Wed, May 29, 2024 at 11:39:04AM GMT, Sagar Cheluvegowda wrote:
> > > Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width")
> > > Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> 
> > Also, I think the Fixes: here would be for adding support for this SoC
> > in the driver, not what's listed? Might make more sense after you have a
> > proper body though.
> 
> This is a tricky one. 
> 
> Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA
> address width") is when support for different DMA address widths was
> added. This fix cannot easily be back ported past that.
> 
> 070246e4674b first appears in v6.3-rc4.
> 
> dwmac-qcom-ethqos.c first appears in v5.1-rc1. However, Qualcomm did
> not start hacking on it until v6.7-rc6. It is unclear to me without a
> deep dive when Qualcomm actually started using this driver.
> 
> We might actually be looking at this the wrong way, and should in fact
> be looking at when a DT patch was added that made use of the driver,
> not the driver itself. If it was not used, it cannot be broken....
> 

I should have been more specific, sorry.

I think this should be:

    Fixes: 8c4d92e82d500 ("net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms")

Which appears after 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width").

Reason being that specifically Sagar's patch is indicating that for the
SoC's/compatibles that currently use emac_v4_0_0_data structure, the DMA
address width needs to be specified.

If we were modifying structs that were added prior to 070246e4674b then
I agree, but at least the change as is I think could indicate the above
Fixes.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
