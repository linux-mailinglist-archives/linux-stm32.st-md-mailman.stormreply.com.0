Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A3946321
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 20:27:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA61C7129D;
	Fri,  2 Aug 2024 18:27:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C9C1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722623232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I5miG/LYykrFB6MuC6ZGvL0Cnhqv4tIkWzf6SQErnGI=;
 b=Pu/bQD9Rvq2ulWpOVIQAH0o2w9FqWK0e7t4H7OLifhG15T6X6Bocm41C4As+HFGutkvGWs
 7WxmoRtuH7bbTb7A2VSKw2Y/ofa4lBAtbjGl3Iac5bmB8wiGT89kQkqDEpsuxzXi7wsndQ
 Aq5of9u8S/k10GRVj+HoLGM5c9E9/xs=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-QMVa2rwbNh26zCU-IYr4Pg-1; Fri, 02 Aug 2024 14:27:08 -0400
X-MC-Unique: QMVa2rwbNh26zCU-IYr4Pg-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-70935ae14c5so12896432a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 11:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722623227; x=1723228027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I5miG/LYykrFB6MuC6ZGvL0Cnhqv4tIkWzf6SQErnGI=;
 b=iyCBVQJhLLqWXagal63a+lcKnAEwgNjiTZJZw5FsjJ0Udf3ZwSO4Z+/466E5P/KZgA
 bO6aitQg2JWatheuroyo/v2V9CtPu+gQP0YYHI4hDB2q6/WcQdyOFmxxLVfTSDfvJtTq
 z167SsZ9xqfzlt+HbtndAbdbPZD7SbNcEx0kpiiE9GWf1mn1vXy34MDKQaiPIjWQUcrp
 K4lX0GJSh7acPtc9asY3To5dvgnhiUXrFXST5IlF8evqagXKHmZZQmojlyKjv9kmjWWX
 xBgQXeumr+/1ZmCtYcJN09NJ8NctkA7haogemhwfyVb1LhzrHiNiLBdWOxSKSLxv1eLn
 2WpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG1Mg5+2vHch7+WBHHTUIDKUcCpDus9O6+xKhhJ4ElkA/GeH0Z2Nt64+HLtvNf5RP1T2mViNxBDohZXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy9NuS0qM0MNEQXD/orY29YbWXTuPg98ifEwLruf9z45qOgeMrT
 SJA2WDCAjNEjrLZR8Vpapi1k8TbupyAW1Ye+CRb+QSSsNYvawoaDIuuTllAxd1Rg58pDPy9ZCxH
 M091Ww54UJd10/V3ch+d+r/DnPghbTJk1EUi6+YcYDm+eA+Hw1RVRZ+aMkwnJBaBTxfkkw4OJAC
 izGA==
X-Received: by 2002:a05:6358:5294:b0:1ac:552:2431 with SMTP id
 e5c5f4694b2df-1af3ba3b11cmr518710155d.12.1722623227221; 
 Fri, 02 Aug 2024 11:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH62CCTEL5p+nOIXsMZGz2pIZuf2KqO6SJ7rPhz4HTOaYP+tFTvOeriXu99Z27gU8aDZw+bnw==
X-Received: by 2002:a05:6358:5294:b0:1ac:552:2431 with SMTP id
 e5c5f4694b2df-1af3ba3b11cmr518707855d.12.1722623226898; 
 Fri, 02 Aug 2024 11:27:06 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c7972eesm9253626d6.41.2024.08.02.11.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 11:27:06 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:27:04 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <tffqhorela6brffruxx3rq4cksabzzjrg6zosudqddplv7v6hd@2knfbquqsrmi>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpo6-000eH7-Aa@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sZpo6-000eH7-Aa@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 04/14] net: stmmac: add
 infrastructure for hwifs to provide PCS
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

On Fri, Aug 02, 2024 at 11:46:46AM GMT, Russell King (Oracle) wrote:
> Allow hwifs to provide a phylink_select_pcs() implementation via struct
> stmmac_ops, which can be used to provide a phylink PCS.
> 
> Code analysis shows that when STMMAC_FLAG_HAS_INTEGRATED_PCS is set,
> then:
> 
> 	stmmac_common_interrupt()
> 	stmmac_ethtool_set_link_ksettings()
> 	stmmac_ethtool_get_link_ksettings()
> 
> will all ignore the presence of the PCS. The latter two will pass the
> ethtool commands to phylink. The former will avoid manipulating the
> netif carrier state behind phylink's back based on the PCS status.
> 
> This flag is only set by the ethqos driver. From what I can tell,
> amongst the current kernel DT files that use the ethqos driver, only
> sa8775p-ride.dts enables ethernet, and this defines a SGMII-mode link
> to its PHYs without the "managed" property. Thus, phylink will be
> operating in MLO_AN_PHY mode, and inband mode will not be used.

"only sa8775p-ride.dts enables ethernet" is making this paragraph
confuse me a bit. I think you mean that only sa8775p-ride.dts is the
only device that is upstream and would use the flag?

There's a few other Qualcomm platforms that use the driver, but none of
them are SGMII (and none of them use the flag mentioned).

Otherwise I think this looks good to me.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
