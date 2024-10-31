Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BEB9B8163
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2024 18:39:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE438C78035;
	Thu, 31 Oct 2024 17:39:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B166C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 17:39:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d450de14fso69158f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730396389; x=1731001189;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uqvY1FdkPNuOeLMP1wREhSeYVKoRbaudNYxdHd3X7Lw=;
 b=jWRnO4eMVqSx1SJeb4CGGnveaxSWO9TTVArIff+SGsv1EHHO03gHsKBTtMlEgPzA/j
 +XrcTy2ib+r/VeQNTv/sbYBXy6Z0vIPqP9/wQJDRRsfNEbCnqZ9vH7glkXQXswGTnQwA
 JvzPDGt8llWgMVa3itmQkFffqIeACN7QfN4nwFeC/4KuIb0O3Vx2zFXv00kRYz1O0Tuy
 2WAR+uhU9lPT7KqE14Cd1EEarRV5y/zAnFXIv2ugVkPQfAwxKSs11GnnSjP46i4grzQ/
 R77oZ7xYNp3jzizSXFakEktmyG69ERk3eiEug8Ggun4i5tnRIh5Fxv3UztFXXXSumNLN
 +j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730396389; x=1731001189;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqvY1FdkPNuOeLMP1wREhSeYVKoRbaudNYxdHd3X7Lw=;
 b=VjETsGOqq1YZDlbctxmwspaQcaOJIY5/x/t9UphZ6IBllkAXM0CtUSEbV1GmPNOAUg
 9wZlb4f78jG4e1K8bDbtbfcZS2A7t17WIseN7sQXojoWSFxPewZ+GJQyuAJSqtIpkXES
 0FeZbNu3oQNlj46SF3nPwN/CWRmK8YBvXvrpaOIS81wcbExHyEPKIFINd7xs/AhALR/V
 pTbwcpOhSpsI92RMSjTMd1RmVqFIP29tPA8Coyo3pTiPyqKPRRNhBjsuo/w8/CAs3/0T
 zoNthxAbcqMsVXJXU3x0F2gOGhCZynD4uDk2NTgbSrner/wgT3NavwxBB2/iTm1Msg3d
 bc2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm3nAInF4u8cd4JNRJySF7hZ+Q2cEkOHRGqq80bfiFCN2UuckwUciVKHjenMlxPbzEcgkJqU/8gGIcvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/pWuOzV/cr6fS4vDzW+s/HwY2kYlw3wE0Q0T/MNM2AwlC5wDx
 gJZs4I7StX812OhLjAJ9ByRYHkZE1Ly00eUAwa9jHujegQYCuF6x
X-Google-Smtp-Source: AGHT+IHznYfg7XnUHFbFmXkwCN88TMBnRAuRY9xjBHvTnqdJucFrQwoWQFJgSXdcQGNoUalg4yBOhw==
X-Received: by 2002:a05:600c:1c29:b0:431:50b9:fa81 with SMTP id
 5b1f17b1804b1-4319ad368f4mr76025085e9.7.1730396389495; 
 Thu, 31 Oct 2024 10:39:49 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d6983ddsm34746115e9.44.2024.10.31.10.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 10:39:48 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:39:46 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241031173946.53ydl7v7gihtdkx5@skbuf>
References: <cover.1730376866.git.0x1207@gmail.com>
 <917f3868cdaf8ce1d45239117c3ea1c8c45ba56c.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <917f3868cdaf8ce1d45239117c3ea1c8c45ba56c.1730376866.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 4/8] net: stmmac: Introduce
 stmmac_fpe_supported()
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

On Thu, Oct 31, 2024 at 08:37:58PM +0800, Furong Xu wrote:
> Call stmmac_fpe_supported() to check both HW capability and
> driver capability to keep FPE as an optional implementation
> for current and new MAC cores.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

Doesn't this commit actually fix a bug which patch 3/8 introduced?
If priv->fpe_cfg.reg is NULL, we will dereference that after just
patch 3/8 has been applied. During e.g. a git bisect landing in between,
that crash might be seen by users.

Thus, please reorder these 2 patches to prevent the bug from existing in
the first place, and say in the commit message that the reason for the
introduction of stmmac_fpe_supported() - initially simply implemented as
a single "priv->dma_cap.fpesel" check - is to prevent unexpected
behavior on unsupported FPE MACs during further refactoring.

Then, the patch "net: stmmac: Refactor FPE functions to generic version"
should be the one which also reimplements stmmac_fpe_supported() to
check for the presence of the newly added primitives.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
