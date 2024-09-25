Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DBB985E36
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 15:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2D41C78006;
	Wed, 25 Sep 2024 13:30:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFC2EC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 13:30:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42cdefe9ae8so9902415e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727271021; x=1727875821;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fcExjZD6GjJkh+Ch/TQ0zSPJzI/BvYIuC1gYrl2MmA0=;
 b=gplIHDx8IgLd9d40wfYOZXB/xINtGImbBQcBh9LjCUbYa4+Lj70fvlzQKiw3TV6QlG
 zQ9FpTaa8wTIGUN+1xGC5/eX/RWlXN72nrHzHEORPwLOeM6PxXHC1jKZn11wGu/wauEe
 w8oEqtewAwgfmNsDEG0X9X3Ll/BVtNkQt1LHmMUivNWCSMdbAh2oIOp4rRejGgs7Uykx
 ROM/2U2VPyf8JQLhVpktJudTklV5WxKdcKgM/AUN1RGhkV/WP36lqNWU/+fsrUoGlLsx
 5rVRLCtpj+9J2asXG933cLlidglhqpdCS+8H2ESqVZuoVa9pWs8UMPSua8nocEVAYilo
 jB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271021; x=1727875821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcExjZD6GjJkh+Ch/TQ0zSPJzI/BvYIuC1gYrl2MmA0=;
 b=W29oCe2i62HMWQrGfjfekZZo2P5L96zm5fWImm0DOyNFrgXlb2aFWI9v7scVxsxwSL
 JgB4xvLIlVJOAwYhEi1+zuHcXVS2tWStqOIux8G+cd7T16+FnjENJ++CwAJKMo7QyxCA
 7yg89MS4v2bxpN5x3x2ea5Y7vblEbxhMFgzGxblFWNdCw4e+pulTu5IvIp8+U+Wsg3Yv
 mLwqr2QgNEfFpFKOyPqBLqeZKBqfmrcLqD05XTv85ofssDWqHDxKDzuMTmwfpuOpcDY5
 RWeC5J6z+jUO+WPpCYZY1W5QKusLRv75IGy9hFbd7cClQ/u2gP+EofnzJ5kSroedM5/1
 f5LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuJJy7swnp1HBrY+ptvjmtD4rL9ViQl2DtvzWCPkcDzN8XinetQpopVM9+J9V5FXL/3xtmbK9Z959/JA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx3EgfVvDKhZUrj21fLrpfx1GhVBfgtqPDo2bgAIO01tYhqnLdq
 mUzgUo8fkl4E3ucQL05pmjGr88k79NZDp7/P9ZrdSMQYMMjullNZ
X-Google-Smtp-Source: AGHT+IF/+L5Ux4OC3vvpK1CYy2l0wO3oeoT3+Zdrd7bfiNMUm91iREsXW6wGQCOPxXZd1JHnIRCkvA==
X-Received: by 2002:a05:600c:4751:b0:42c:b172:8c53 with SMTP id
 5b1f17b1804b1-42e96144d4dmr8619215e9.5.1727271020959; 
 Wed, 25 Sep 2024 06:30:20 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969e1957sm19177795e9.9.2024.09.25.06.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:30:20 -0700 (PDT)
Date: Wed, 25 Sep 2024 16:30:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240925133017.qerqjslhzs7l2h7q@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjd4-005NsF-Gt@rmk-PC.armlinux.org.uk>
 <E1ssjd4-005NsF-Gt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ssjd4-005NsF-Gt@rmk-PC.armlinux.org.uk>
 <E1ssjd4-005NsF-Gt@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 07/10] net: dsa: sja1105:
 call PCS config/link_up via pcs_ops structure
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

On Mon, Sep 23, 2024 at 03:01:30PM +0100, Russell King (Oracle) wrote:
> Call the PCS operations through the ops structure, which avoids needing
> to export xpcs internal functions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
