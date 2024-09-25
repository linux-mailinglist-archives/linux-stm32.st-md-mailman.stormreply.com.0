Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B65985E91
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 15:38:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47A73C78006;
	Wed, 25 Sep 2024 13:38:29 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20AB2C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 13:38:22 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a8713b00219so90692466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727271501; x=1727876301;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jumFeyHQNb3jbXPMZm46Zc7E2u4fD+56kCRyCgQWUes=;
 b=fpnHjcurVjfxqly/d4pk8t3R22NJhLx5SGfdfnWjohO3+yGYnjOwtFh8vfnPTJ04L9
 nKTirPCS7arlKou/L8xLHKTg+wDa3rCDiRHHxIMir/O/o1FQdtCiz5Dqir44/pTSwqIb
 F01/dIituQ4xwbba0Au8YIaeBfIHTcQsyX96cHFsLSODTK0lu2mLItIKljn7J9J0m9R7
 l8GmlyOB7//UnBlL8ELeTfJyKsQzg1oY7a1MNPrkJ00Fd4NQfa9RbHFQ9s48zCZoxlZZ
 V4Ah9emffvXyj2E3TxW1qd/BFMvJv235jR9Qtih5LXYsnQ2PPMNcA4V0QSdQZtTI0Cxa
 eBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271501; x=1727876301;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jumFeyHQNb3jbXPMZm46Zc7E2u4fD+56kCRyCgQWUes=;
 b=KPwCE2ggo/F+1LPqB5J12d+jyY7OUPjVPUBX1/OrdD+i0Jt+1lJKq92T/h4oqaIRM9
 kyorbwVClnaHwl1/AkVAXgS7q+fnMo3N27uD5N6D3dw3DzL9nuqWyZKB/XE6wz8uacrH
 lL4541W+KohBppHtmeTZL6emSL1GzAKH8bHryYkGJAD1qA4XxwmIRQCXGzXXjGNgczTs
 oYhUNyQe7kuaYMJU6O3soi70673HJ67qWljQ+LTNAN4LjCivyw/o0BaTLBpKy1u6LzLb
 68gynx93dptGYC1SgeKQkXAfRrc8uolIiuDPsRuzVaOx2hgzVQA3gxL+OVA+Mi/iLzjI
 Q6zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnmJW0T3cL+ywAjz+eZdW9cvS/KDO4F4g+i8ESzjMWJg/AhFRAkapr/PSqqbnUYttfbo/mcR84iM1vQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxeDEsF/WStCkO2UuFxGo3TU1+mEPy96k8YYYqyK8MTqVNse1hw
 VQbCUhPUkoO/xUutzNLaNkS0346sRDASIyJidnle4NG0kVmvqMV5
X-Google-Smtp-Source: AGHT+IF2htZh7Ei+1/UW/R1vgBmmoGpgMYctzse87AfZCt6nbk9UJZlxDZj2P/2mpqAHyr7RQZAblg==
X-Received: by 2002:a17:906:da8d:b0:a8d:2623:cd49 with SMTP id
 a640c23a62f3a-a93a061db9amr134422066b.11.1727271501207; 
 Wed, 25 Sep 2024 06:38:21 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f78a1sm206539766b.161.2024.09.25.06.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:38:20 -0700 (PDT)
Date: Wed, 25 Sep 2024 16:38:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240925133817.csb6o5yxo5i47vza@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjdJ-005NsX-S8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ssjdJ-005NsX-S8@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 10/10] net: pcs: xpcs: make
 xpcs_do_config() and xpcs_link_up() internal
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

On Mon, Sep 23, 2024 at 03:01:45PM +0100, Russell King (Oracle) wrote:
> As nothing outside pcs-xpcs.c calls neither xpcs_do_config() nor
> xpcs_link_up(), remove their exports and prototypes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
