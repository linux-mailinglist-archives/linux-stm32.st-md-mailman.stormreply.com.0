Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE019F4A58
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 12:55:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16B62C78012;
	Tue, 17 Dec 2024 11:55:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67B61C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 11:55:07 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ee86a1a92dso3590564a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 03:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734436506; x=1735041306;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KbDpu+5dgXCRMaHlMudK/PfUogFA3io0WjXBUI+vpI=;
 b=K33DSiSlfWptM2eAQDFHTmcIW5iVALLccY4/lqcTv6SvvhiWZLoH+o5JfUjo2GgEGl
 g/COWP42gmkFhOR4nozxe3F1NQvFyT2R2K+I7mixcQ65kk7L3wI91NAqc/qpFDUpcLck
 ffX3Y9C6g9suJizDlUzVrDatFqY6n9tbdHkEoUdjA+3aEw7/pHYLVWse2X0Abvn+BsnN
 n79Mr6H1V/iK6HKziF2RW5ojN0vk+A/x7Fdi521ajiowtNalWXHno2ztSp5H8LMYfmGh
 S/tokTmvhGINNAIjT0zXMbsUPl+r6+uF6st8ZvPwp3xJlxMusNnnTqgzUSFTxwVQx6l2
 P+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734436506; x=1735041306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3KbDpu+5dgXCRMaHlMudK/PfUogFA3io0WjXBUI+vpI=;
 b=lz2EhlmVVdcPASdXsz60j5ffGWDSiwKLVU3hqjQJ84PTJ+umCsLhbfzafC/omJZ4jo
 vD7h9cH55yZq55LgIUwC3FYoeUy5ZYDh++ktN6cUFv3j8+A5HRg8LMPGaFjgn+87P7zf
 ZfyHmND+hZ4HMQwGrZtRvDHottbZtlK+tzVMPzwvZjdKgLinuB9A2TFVv2kBQ+6GyBr3
 xzm6cW5B/cZSGB35Tu37eRSL335hOUStk9tfiGbWnz5arGY3Sk0n6rhhkhKBuybd7RtF
 HZhg3NwMMTo++6gUYWROoZSHjs80CPMpU5GnX0QTj4DDObv9c1KatAZEpbHdUi/wDa06
 P5VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULh7ySHpESg62mnMqg4mkqp9byvMf0jHH/JY7kVa3idK6W+CVD9OyDIZev8E9CG938cwjU56qC6Rq17g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwyHsE8ZhJVV6mDjUyHL5lk7TNru8Q8+bXtXxO+1JGWk3Icweo1
 XJ9ifQEgpxWbfhT/HbLCxDJHRkL3svrzCWOfkI1toyJHCo1JeDgy
X-Gm-Gg: ASbGncvZS+uappID//hNcvxc3vv/+os/e6z56lB5+yWQSWcmtHL9tDZJG9CMYybjg5N
 W1gLTj2n3XETU1fBipd6aDYvGbAFqM53TV6xwQeamXnDubl5UQoqD0RlzNCllnW36vFQ0PmboWT
 fcgisNSHrwUv4zErYbzee5K+BDEpqriHxjZNBL68OQ8J61ktCjlwus1toJ+oayikfiX0qjNS0Fn
 0VYMaVGMByBOK1kQXCICaBh4q9+x3mJ9gbDdjw/b/qyOXYyXcZ1jw==
X-Google-Smtp-Source: AGHT+IHngxmcUWV4lDNQlA0QXiov5JsCMkpOQ73Ck+LNIruRGkRdnCgPCkMNUjWYyHkKOes0d7ocDQ==
X-Received: by 2002:a17:90b:1810:b0:2ee:94d1:7a9d with SMTP id
 98e67ed59e1d1-2f2901b3bb3mr21024098a91.32.1734436505718; 
 Tue, 17 Dec 2024 03:55:05 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2a1ebba00sm7161517a91.26.2024.12.17.03.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 03:55:05 -0800 (PST)
Date: Tue, 17 Dec 2024 19:54:54 +0800
From: Furong Xu <0x1207@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <20241217195454.000016ce@gmail.com>
In-Reply-To: <9d0722fe-1547-4b44-8a4a-69a8756bdb39@redhat.com>
References: <20241213030006.337695-1-0x1207@gmail.com>
 <9d0722fe-1547-4b44-8a4a-69a8756bdb39@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: TSO: Simplify
 the code flow of DMA descriptor allocations
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

On Tue, 17 Dec 2024 10:30:24 +0100, Paolo Abeni <pabeni@redhat.com> wrote:

> On 12/13/24 04:00, Furong Xu wrote:
> > The DMA AXI address width of DWMAC cores can be configured to
> > 32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
> > get a little different between 32-bit and 40-bit/48-bit.
> > Current driver code checks priv->dma_cap.addr64 to use certain format
> > with certain configuration.
> > 
> > This patch converts the format of DMA transmit descriptors on platforms
> > that the DMA AXI address width is configured to 32-bit (as described by
> > function comments of stmmac_tso_xmit() in current code) to a more generic
> > format (see the updated function comments after this patch) which is
> > actually already used on 40-bit/48-bit platforms to provide better
> > compatibility and make code flow cleaner.
> > 
> > Tested and verified on:
> > DWMAC CORE 5.10a with 32-bit DMA AXI address width
> > DWXGMAC CORE 3.20a with 40-bit DMA AXI address width
> > 
> > Signed-off-by: Furong Xu <0x1207@gmail.com>  
> 
> Makes sense to me.
> 
> Since this could potentially impact multiple versions, it would be great
> if we could have a little more 3rd parties testing.

Totally agree.

Multiple devices with multiple versions of DWMAC core which is
configured to 32-bit DMA AXI address width seem to very hard to find
and test this patch :(

Jon Hunter @ NVIDIA has two versions of DWMAC cores different from mine,
Tegra186 Jetson TX2 (DWMAC CORE 4.10) and
Tegra194 Jetson AGX Xavier (DWMAC CORE 5.00),
but both of them are configured to 40-bit DMA AXI address width, this does
not match the case that this patch tries to convert. So I decided not to
request him to provide help.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
