Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB69B2162
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Oct 2024 00:33:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D324C6DD94;
	Sun, 27 Oct 2024 23:33:02 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30F18C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 23:32:55 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20cceb8d8b4so20355355ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 16:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730071974; x=1730676774;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=63amZP33iYpS8AXXhtgX4nWJKEpmd3UTb0cRGCmUwK0=;
 b=ipcAMIJ64e5/BdTeOihFSsynqkbRQuXko8VUmYeiXbpJQafszYgIePlv25uz6VxdSH
 GUYftpWyUhVxsKc3jzFGXopA7bmT4exNkpVEEQvAmUpco+Qi+ZJGAklOho7ja6RI6bWB
 kIaFXesKOjgTPHcx0ZlG/jRHSPrpZGbkrf3lLCMc/fxT0swU0NKULwQNH4DLyENl7/Hj
 TYX1KCUAE5Mjyp/BnsYX6Ml5ZGCqQGMixgn8ehUeNSu/OuavVKeu80syKW4ufvX9OuBQ
 4bfkbFiGEcCkt0IjskX9UabNf2AGyJaFfjI2pCfRGVFI9ovFO6DpwUhHd6JB1HY1+hDq
 dIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730071974; x=1730676774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63amZP33iYpS8AXXhtgX4nWJKEpmd3UTb0cRGCmUwK0=;
 b=KPbCw6/keIrNxa4JHQkyfrR8z7z/oZcZdzrQlj4V1vH+EZ4VwVnqgCnkfkCGIkWOYL
 6yXRkwvUBxwWP+9sCr7o9n44ZvOHCKMOnpfGDi7aZKQZziqS2TXnKhWkdIgEKabOL2Vr
 KCI3bhCuJ7kWdCMMTdJFwwVpHxYW/NmLyGsIzclc28QIyF1h/cQpHVNsaoiS+fUYN7tC
 qbDHCkjVdv2j544owgIj0ng43NxFzBwcCe38u2rrc1PKYNHdXv8n0wtT7AcvIBiNZnic
 moGcHOIhU4WpNGhuxBgQLWhCy7eORb2EZt5G5EwE2LXupfdobzfrOGLAbHKZqnRALmiU
 i71Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrQuD2fqpDK/nfYzyclHhV8/m58wvs/dtz723khv19dIOQbDhtkXqb4AtYCrSIv+/Af0EQXzGKhL5Hrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6jt6GApZoF9N+xZ9f7zSBCp5G80xJlxXqi5LebF0VJ/CVG6gl
 jjeca+YplCf4dZy9jHB5GEi7IRAOgk8WFLBt0PcotHbiH4jQGyw9
X-Google-Smtp-Source: AGHT+IGH/FrrfW96edZYOU/1eyhLzJAIrm6AzqPxdvn8RuUgJVuG2hN9MhbFU5coSZ1MSxKcT0X90A==
X-Received: by 2002:a17:902:db0f:b0:20c:c482:1d72 with SMTP id
 d9443c01a7336-210c5a46f96mr94859525ad.20.1730071973692; 
 Sun, 27 Oct 2024 16:32:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc044cb1sm39854595ad.249.2024.10.27.16.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:32:53 -0700 (PDT)
Date: Mon, 28 Oct 2024 07:32:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <mwlbdxw7yh5cqqi5mnbhelf4ihqihup4zkzppkxm7ggsb5itbb@mcbyevoat76d>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-3-inochiama@gmail.com>
 <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: net: Add support for
 Sophgo SG2044 dwmac
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

On Sun, Oct 27, 2024 at 09:38:00PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 25, 2024 at 09:09:58AM +0800, Inochi Amaoto wrote:
> > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> 
> This should be squashed with a corrected previous patch 

Good, I will.

> (why do you need to select snps,dwmac-5.30a?), 

The is because the driver use the fallback versioned compatible 
string to set up some common arguments. (This is what the patch
3 does). It is also better to have a accurate fallback compatible
if we already know what it is.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
