Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05F9B59F0
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 03:29:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA50EC78020;
	Wed, 30 Oct 2024 02:29:58 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 351DDC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 02:29:51 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2e59746062fso4963420a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 19:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730255390; x=1730860190;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/o5XK5OJrkzuHt0jaoQyx3CwN+lOhE6gCV0XZuBDN8=;
 b=KDW0ppgQVBfiI8ULhVWywLMG9O5R3Fap7ByZRZ71Lu7BWEfIMMXUPhdR8UBZbcwgZh
 lZM3jzmg0JJW2PZ8ygo6xIpJ4sO7mjwqtA+igPg+zALs7ONQ7H3asqbtja0fNd9qwnMr
 oNgNLZB3mwYQasW2fULlowKVJkACJmWUtAqnBRKiX2v55B82OrAAsc6kDspAmY8aRtPf
 Iz/1M5yG+FmyRt8+yxBjuXDw3AdfLIEF7ustCei0im6Vuh0u3KKh3uFU2isVPuc0pZkF
 luELoH+DJQ2GU6Uyy6cDAQNgzM+U0KBSdgIUOWNnQsteVParU0OFTeOl6/gQMNQbj8Ub
 WQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730255390; x=1730860190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/o5XK5OJrkzuHt0jaoQyx3CwN+lOhE6gCV0XZuBDN8=;
 b=ltUt6eWrCgxPKGXgJKL+Kjx/X57rdSA+jnboglNZdAXdSwd5tpfhwzrA6+6QbSeEWK
 6pxL02oOujbz9yGlDkkoMou/2LlY5AuoYLh2lvkulc0aYmQ0xWjQEurmI6exlxbNVNvs
 ozsR3s+TKflayxv49bu/tTt1+ibRLUXEzd38CEbJZwb9eys8tvfXnj13szf7Q4pSkQMi
 YBrKjMG/n0UJrYavQ6VNy8MXVELOztkEu6AEWEyA6D+b7PU8Dpsv1dG01IjohZgYi9bi
 1Wrs5KFEGzwo4KuPwyH/uQ8F1r9zBJ6Zo/ZGSo7kiYkox/rFB0i9E9LoVYy3ZU5aaf4h
 9Q1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTPZSC7Hv1bcCfru6coBJQ7ERowXb5RvLLQwiWXAECpIOIqyP32CRZGS/25bUjBb5NsQloOCo5G/Ij2Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwtrBipP7gXGkDll4gyFyqRIJTdB5wrevHDDC9eN8iDny1GYo6M
 9SQEZfmcRb8/ZqKbF1o0aR9/iAtkr85qQgbFFcsIwjMIf65kkpIE
X-Google-Smtp-Source: AGHT+IFijIy1xOySQ/m5xGQRS6VrQCf5Idul7+RyGkBFMYnlMj95XQcicMtXJGIScuTdNjzKS8VqNw==
X-Received: by 2002:a17:90a:c703:b0:2d8:7561:db71 with SMTP id
 98e67ed59e1d1-2e8f10a6eadmr14210471a91.25.1730255389397; 
 Tue, 29 Oct 2024 19:29:49 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa0ed8fsm431801a91.3.2024.10.29.19.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 19:29:49 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:29:35 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20241030102935.00005ad5@gmail.com>
In-Reply-To: <20241029185231.fgy6tofi2uoslp3l@skbuf>
References: <cover.1730084449.git.0x1207@gmail.com>
 <0f13217c5f7a543121286f13b389b5800bde1730.1730084449.git.0x1207@gmail.com>
 <20241029185231.fgy6tofi2uoslp3l@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/6] net: stmmac: Refactor FPE
 functions to generic version
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

Hi Vladimir,

On Tue, 29 Oct 2024 20:52:31 +0200, Vladimir Oltean <olteanv@gmail.com> wrote:
> Let's not change the output of stmmac_dma_cap_show() sysfs attribute if
> we don't have to. Who knows what depends on that. It's better to
> introduce stmmac_fpe_supported(), which tests for both conditions,
> and use it throughout (except, of course, for the sysfs, which should
> still print the raw DMA capability).

stmmac_fpe_supported() is a better option, thanks.

> 
> Which devices would those even be, which support FPE but the driver
> doesn't deal with them (after your XGMAC addition), do you have any idea?
> 

Well, nobody can tell that but only Synopsys, as you can see that
stmmac_hwif_entry in hwif.c defines quite a few MAC cores.

Since FPE have been an optional implementation for MAC cores, so I think
we should not convert FPE implementation from optional to mandatory for
new MAC cores, for example, a new MAC support is pending for merge:
https://lore.kernel.org/netdev/20240904054815.1341712-1-jitendra.vegiraju@broadcom.com/

stmmac_fpe_supported() is a perfect option to handle these concerns.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
