Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C02129C3C30
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 11:40:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 860D6C78F60;
	Mon, 11 Nov 2024 10:40:05 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B5D9C7803D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 10:39:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5cf0810f5f9so2816834a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 02:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731321598; x=1731926398;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=83Ex4i0amGXOVK4wdTZcphg7YQMJCRSlYiBwa9dai4Q=;
 b=ivquE6tnP/jNCB1/08T6szL2PkpgxJqvAajjsvabtZLcvwa/FRVuJ6/G4/qaLkmMc6
 oOnBwZR0q7+d8XjlLPogUGknDdtqgi1DV/2brJiD/ovlwAVL/HELwal05NAaTi7dC3Z9
 oSvlZPSLHBlSaYNa8Mwz6l8yeQPuf8zqWQVg16Pu76S+Ye+1AlBFOm8oOw01xuCug9yZ
 2ODt+HciwjgaopBFX1wRw//glP05YrFUwhGDB2K1gpV6UwoNmXk9Mbn01HNAqnsQ88h6
 GJBjcp46+vgriN0yRoTWJ19AFQv/Cidh/R05OHwWYTqsEwl/gI/VBMdlIgD74A0E/5Tv
 ngow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731321598; x=1731926398;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83Ex4i0amGXOVK4wdTZcphg7YQMJCRSlYiBwa9dai4Q=;
 b=vRQD9VVcGMMP+TuyRoWt0yNXF98zi3/bdIH1EGR9Xe+HGNxQSxHWwr5TZPc+qK08xr
 dnHwN8LgmcTXXcnfn6EEM704KQsWgYnqfJwDbVQpJaOIo45wblxjdFSVPBnoiiePIKFS
 asCjUuC20VeP2G2RMTdEdYVmT2ho/nknYSgAqi60tmBZwDNxiMQm+ISUBxhto8XxPtP4
 o3NPs1fvx7XlNr9eZNuZPve7+p3mlTzRbD+fBFc/ig/rQppMWM4dr2ot8Q6I4/j+HiPa
 9EOiqkwbayH7UYuaehvRSAmG3rBByHkf/Eo5D2OiJ22jHbMKxg3env4IYgUpHScA7Gzc
 mZHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkIKwY/OZfV0KVjjZkGw+qg4sjlzMNJg3+mjguRw6iFcqyqe7lR3JWNOl1jnxgr4co8yGT56fZOWLEAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzv2o5+CKrLexb6+64NrlI2WY3BnSsimQx3/VlwDbcImbJXdodI
 RD1Lf5fqOyMHf7b1n4LeAePmMPpPIB0ouVouuzuulRp6yzJ+yEYlHzuVUX+hcSg=
X-Google-Smtp-Source: AGHT+IG3n2/H+iwpqZ5QO1ewQ3Ger1ZK+UE8iF8Hgk62H7RKzgwtzGUzRUPggQWQjwX8bVTQ7/DvaQ==
X-Received: by 2002:a05:6402:51cc:b0:5ca:efe:10de with SMTP id
 4fb4d7f45d1cf-5cf0a4467eemr14296940a12.30.1731321597634; 
 Mon, 11 Nov 2024 02:39:57 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03c4ed9fsm4794848a12.62.2024.11.11.02.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 02:39:57 -0800 (PST)
Date: Mon, 11 Nov 2024 13:39:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Message-ID: <9e7d4adf-f147-43a8-a654-8c2ee722121e@stanley.mountain>
References: <20241108173334.2973603-1-mordan@ispras.ru>
 <e1b263d8-adc0-455b-adf1-9247fae1b320@stanley.mountain>
 <20241111-def1390bf54ce26f76be250c-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241111-def1390bf54ce26f76be250c-pchelkin@ispras.ru>
Cc: lvc-project@linuxtesting.org, lkp@intel.com, netdev@vger.kernel.org,
 Vadim Mutilin <mutilin@ispras.ru>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vitalii Mordan <mordan@ispras.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, oe-kbuild@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net v2]: stmmac: dwmac-intel-plat: fix
 call balance of tx_clk handling routines
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

On Mon, Nov 11, 2024 at 01:25:42PM +0300, Fedor Pchelkin wrote:
> Hi,
> 
> On Mon, 11. Nov 12:39, Dan Carpenter wrote:
> > smatch warnings:
> > drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c:163 intel_eth_plat_probe() error: we previously assumed 'dwmac->data' could be null (see line 101)
> 
> There is a patch [1] targeted at net-next tree which removes the check. I
> think there should be v2 posted soon.
> 
> As it's not the first time Smatch is pointing at this issue [2], is there
> something to improve? I mean, posting the patches in form of a series or
> explaining in commit message that the check is redundant and is a subject
> for removal? Adding new redundant checks for the fix-patch would not be
> good..
> 
> What would be the most appropriate way?
> 
> [1]: https://lore.kernel.org/netdev/20240930183926.2112546-1-mordan@ispras.ru/
> [2]: https://lore.kernel.org/netdev/20241003111811.GJ1310185@kernel.org/
> 

Once we remove the NULL check then the warning will go away.

I don't look at it like a big deal that both Simon and kbuild-bot reported the
same issue.  Especially since he reported it against an earlier version of this
patch.

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
