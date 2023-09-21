Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EF57A9250
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 09:55:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3691C6C822;
	Thu, 21 Sep 2023 07:55:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40D43C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695282920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8073cadbomZvzn1x3/jFCjzqqbS1eUbDSTmbFgCsS0=;
 b=P8Z3I9LRcSPBzJqODsLnezhP/0nhp1e4Pn3QJwk4Gx1aaPrkI70fgKUTcerpvsG73SoJOb
 MNyZokWXFZzre3BasmrmhvAtlWTR5EHqTwOl/7Sk/RaIh8x19oPm78y4xcMHFYROrP5xE+
 /I+PYB8MUTMzXEPCvsDU2dg4FjgLE8k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-X7dHz3zPOHW14JtBK_KWPQ-1; Thu, 21 Sep 2023 03:55:19 -0400
X-MC-Unique: X7dHz3zPOHW14JtBK_KWPQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9ae5f4ebe7eso12545866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 00:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695282918; x=1695887718;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M8073cadbomZvzn1x3/jFCjzqqbS1eUbDSTmbFgCsS0=;
 b=mX9FBgjK079vPTmXM9teIBJgqZFKhZZaon9kZASfYKudWPHgH9bI5q5q8Cqgi8jFh2
 nKUpWbIh6QbjJdQnXmsssp3GKJsVtFpEo1XOadLC74E3JcaUm+Hd4RPmRM/N6mwk3lhE
 v9bNRFhwvhovTFF/kTUj1sHsC/qQiqGoMyooUTh80r8vVu3kIAy6t/m405tibvh+UAvi
 q3mSj7QdUiZI4oi3ZDOye6GCR1jOB30EHcfS63vhfFW1squa0V76HUh/ThVrO6TayM5y
 b2KQ6uNhK889g7U5ixDz/2PaFUWF2pRpVJUZ63DTbefXM33nZNJVFvAVraAozcRnCe9d
 GV3Q==
X-Gm-Message-State: AOJu0YzIbCQrMVose1F6ZbkGHSrBbh+YxHZys5sz8r31x8XDz6bBlN1V
 c0HASRSGOFYWY1WY4BkqmIWUQMheA7FB25AzUQ0Mu8BpOLE52RcCg3ER1P6lp9qVk0Z7mKyGZot
 v0t6JLiIVjdOoXPsz0fMLZFdOUZvTSjGVsi/KJaXA
X-Received: by 2002:a17:906:d3:b0:9a1:d915:6372 with SMTP id
 19-20020a17090600d300b009a1d9156372mr3807376eji.4.1695282917999; 
 Thu, 21 Sep 2023 00:55:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSF1UlZO3avrXPLFXBb/vxNsqsACyKLXNET84ThtyZNLMmNfBCh4PTxsgjk9xoZz4KcuIv7Q==
X-Received: by 2002:a17:906:d3:b0:9a1:d915:6372 with SMTP id
 19-20020a17090600d300b009a1d9156372mr3807366eji.4.1695282917682; 
 Thu, 21 Sep 2023 00:55:17 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-251-4.dyn.eolo.it. [146.241.251.4])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a17090614c400b00992b510089asm647510ejc.84.2023.09.21.00.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 00:55:17 -0700 (PDT)
Message-ID: <9eac9749406d91fd42520479b4c463417717246f.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 21 Sep 2023 09:55:15 +0200
In-Reply-To: <20230919164535.128125-4-ben.wolsieffer@hefring.com>
References: <20230919164535.128125-2-ben.wolsieffer@hefring.com>
 <20230919164535.128125-4-ben.wolsieffer@hefring.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-stm32: refactor
	clock config
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

On Tue, 2023-09-19 at 12:45 -0400, Ben Wolsieffer wrote:
> Currently, clock configuration is spread throughout the driver and
> partially duplicated for the STM32MP1 and STM32 MCU variants. This makes
> it difficult to keep track of which clocks need to be enabled or disabled
> in various scenarios.
> 
> This patch adds symmetric stm32_dwmac_clk_enable/disable() functions
> that handle all clock configuration, including quirks required while
> suspending or resuming. syscfg_clk and clk_eth_ck are not present on
> STM32 MCUs, but it is fine to try to configure them anyway since NULL
> clocks are ignored.
> 
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>

This patch is for net-next, while the previous one targets the -net
tree: you can't bundle them in a single series. Please re-post the
first one individually, specifying the target tree into the subj.

If there is a code dependency, you can post this one for net-next,
after -net is merged back into -net-next (Usually within a week since
the net patch is applied).

Cheers,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
