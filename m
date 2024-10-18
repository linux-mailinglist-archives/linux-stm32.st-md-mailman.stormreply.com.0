Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3CF9A3AB2
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 12:00:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8631C78038;
	Fri, 18 Oct 2024 10:00:42 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 275CFC78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 10:00:36 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20cdb889222so19985735ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 03:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729245635; x=1729850435;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5lubNeeLRmHthC4s9tNZn8PtHhfCx2MwTc3L+mSp18=;
 b=iQmqfZna1YJCpkRG19Fd55D8dP1m6yP0UkgrCykZqkhnbp9JI8bSHqZKYb9cizn0uv
 IAXAjp5asCOSWiwLAtiQ1h5fGmh5YUzu0cZeisbGAg2ZPBqiGC7oRZ8dKA226lU5eb31
 Pi1ijgypPTjE//rAXlmkLrAyi4jUeap2/21SNlg4qhIXE98DZTrS8dgeDhqN+v3yZJxc
 oi8pfmgfZ4bdN5JvqciEQioXRii3YTkT9PFEbZ/tqml6yB2r20Oru6YJ8435u172rJGr
 yglOVFPkaqShcMI53qnQSA1BtGfg//9MeglkOMFBivA9pVuAnvYT1WfIxYM1zc8yXgkm
 /Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729245635; x=1729850435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5lubNeeLRmHthC4s9tNZn8PtHhfCx2MwTc3L+mSp18=;
 b=YYzmTaM1ZI2JV+FaOSx2crd//+TZtWcc0qiOPtiOxIxDyiLiwTGUYV+1Ovyyylrftc
 0nQsQzZVYZfVrNRaagQxJ/hnyoHil3T9WkcN2hgoYNr+oPvf+HRS/OTMuK9OBRm3N1hl
 ol8B7TGM89RTGCADi9//hCQbFZnz9Bb2sr4oqhjXuqXInxc3PrJP7HxrSrkVdG/T8V6Y
 mOZQs9OQeAsgtZho1qTwifX7m6t5vUM6Rvl/DywgcestZYfq7188yVyeLK/rA+XI5cLW
 CNAQtMedZB4UXlAEQRg5Ur5olXvivmFpPyW7qfOr7JOqh/KDWFOUxVJWH47gMszrNHJO
 WwHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRhrn79UQRuUleyeFwNwFNOSuoASxJtO4tSx5lfl6ssThHofOT7Z9J6iE2p5M+10b2Cokzj5QnpeDKdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyoGxaK8aDznbMhPFvv9TNCY4OObt3uM1aWzhCZP4BxoMkq6tty
 1pgaWnGvH7IFX4zZ7REO1UWFCxe2p6DEH9v5aRNrDRyv9TrZlTLw
X-Google-Smtp-Source: AGHT+IFR6ppSFGXKnbyyRbTLquP9bQee0BM/QDbaB/L3oOWSNl9Ejff+zHPGZ4gjWD8RwNrZRPZWrQ==
X-Received: by 2002:a17:902:f60e:b0:20b:ab4b:5432 with SMTP id
 d9443c01a7336-20e5a70d59amr22619825ad.12.1729245634446; 
 Fri, 18 Oct 2024 03:00:34 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e5a8d6cd6sm9343225ad.131.2024.10.18.03.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 03:00:34 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:00:23 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20241018180023.000045d8@gmail.com>
In-Reply-To: <20241018091321.gfsdx7qzl4yoixgb@skbuf>
References: <cover.1729233020.git.0x1207@gmail.com>
 <1776606b2eda8430077551ca117b035f987b5b70.1729233020.git.0x1207@gmail.com>
 <20241018091321.gfsdx7qzl4yoixgb@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 7/8] net: stmmac: xgmac:
 Complete FPE support
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

On Fri, 18 Oct 2024 12:13:21 +0300, Vladimir Oltean <olteanv@gmail.com> wrote:

> This is much better in terms of visibility into the change.
> 
> Though I cannot stop thinking that this implementation design:
> 
> stmmac_fpe_configure()
> -> stmmac_do_void_callback()
>    -> fpe_ops->fpe_configure()  
>       /                    \
>      /                      \
>     v                        v
> dwmac5_fpe_configure   dwxgmac3_fpe_configure
>      \                      /
>       \                    /
>        v                  v
>        common_fpe_configure()
> 
> is, pardon the expression, stuffy.
> 
> If you aren't very opposed to the idea of having struct stmmac_fpe_ops
> contain a mix of function pointers and integer constants, I would
> suggest removing:
> 
> 	.fpe_configure()
> 	.fpe_send_mpacket()
> 	.fpe_irq_status()
> 	.fpe_get_add_frag_size()
> 	.fpe_set_add_frag_size()
> 
> and just keeping a single function pointer, .fpe_map_preemption_class(),
> inside stmmac_fpe_ops. Only that is sufficiently different to warrant a
> completely separate implementation. Then move all current struct
> stmmac_fpe_configure_info to struct stmmac_fpe_ops, and reimplement
> stmmac_fpe_configure() directly like common_fpe_configure(),
> stmmac_fpe_send_mpacket() directly like common_fpe_send_mpacket(), etc etc.
> This lets us avoid the antipattern of calling a function pointer (hidden
> by an opaque macro) from common code, only to gather some parameters to
> call again a common implementation.
> 
> I know this is a preposterous and heretic thing to suggest, but a person
> who isn't knee-deep in stmmac has a very hard time locating himself in
> space due to the unnecessarily complex layering. If that isn't something
> that is important, feel free to ignore.

In fact, I can drop the stmmac_fpe_ops at all, avoid the antipattern of
calling a function pointer for good.
Since this is a new module, we can try something new ;)
Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
