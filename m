Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C650F95697F
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 13:40:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC1EC6DD9D;
	Mon, 19 Aug 2024 11:40:48 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C8E1C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 11:40:41 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so721625766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 04:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724067640; x=1724672440;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L1LPhpIw6zUplYseeK4Y27omRELGjVo6B0WUUXO19x8=;
 b=JTKxNU2EP9ntaTPI+zyWR6dW7O4pYN+NhxbDyWG+oVU+3y/fM+rJzIqLKW4RxO/m1r
 O/S9LQmskR0RZ2uDaMICP5JZIombMijhlXh46Ux8/ub4Eckgz2sstTtgqU3MY1WbD+X9
 HTJxvCFvzJO8ZK8XrJqojySwyYNNDRN8eaNbIGoSvdKCEMcr17qx6my1UUc3GDBhQt7Q
 TP4fAOxC/q4tM2DH+UDHV3zW292WVYycRe/o/n5bj0dzOC+mToKyZotC+xEhFhpwAOFw
 7tk2mr3xf5Px8E6KJxg2viIhLqngvWC3XZ+LaA6flw5asMDD0D9tMdM8lZ3ifuIFctL7
 D1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724067640; x=1724672440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1LPhpIw6zUplYseeK4Y27omRELGjVo6B0WUUXO19x8=;
 b=ZWz7MkRXK4fyFIGX3byum0u2vGT1VMLz71fUeus8JiAdwh2s7wNjLRdHG9RYYI8fml
 HcT3p74RG8Nvc3YN93Tl8CstSeQfYEQqQG2muvwon9qbPaLQ5eDf5RZodWH+uyKO+T8Y
 zb8x7KwamwolJ8O7LGt7/pLcUjDGqVYYNMIlrZKxnxGTghHMfXCY8WgeaDS1xlRg6QMJ
 i4XQkVdYUHd2M8JVKAhN2eOhy2aD9LtxgX9sE8Lm4u9qjib5rF+gblH+/LjeYPtDlSSF
 QC5NPhZu7R2JO3IOvsOHRp7ysaBaENlFQ268/upYKUGAYbeecFzRTuGPMc6GlzExt2sm
 ZHlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUot03pXHINm+vuAIa9PElf+szGspSCp7QDPSHeBf9g5C75QlhnG2w23w3dCYeL4RTNIaEL2LJ8RiAp39DEDhvOEdLOWdl+YTOsFlq/xOyn4q5H7qgqb5yB
X-Gm-Message-State: AOJu0Yzz9dcMtizJYFoHu2krl5GxUqahawp1avuSLLneRjRhAObgsZST
 2O8c3L54EiHdymCkl02PyNxS8s3GTBBZKQvWatChRm98WCwVgnqS
X-Google-Smtp-Source: AGHT+IF3kiosIQALUEVpVEF+AHu5uPDBEnwfKksdilsy2OZ6truteS3BEbGZJ5aRsdPuzaV7qhc0FA==
X-Received: by 2002:a17:907:970b:b0:a7a:87c1:26c4 with SMTP id
 a640c23a62f3a-a8394e16cb8mr900443366b.17.1724067639927; 
 Mon, 19 Aug 2024 04:40:39 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c67d3sm624082966b.1.2024.08.19.04.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:40:39 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:40:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240819114036.af7gjv6j3p2r3c75@skbuf>
References: <cover.1724051326.git.0x1207@gmail.com>
 <375534116912f13cb744c386e33c856c953b258b.1724051326.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <375534116912f13cb744c386e33c856c953b258b.1724051326.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 7/7] net: stmmac: silence FPE
	kernel logs
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

On Mon, Aug 19, 2024 at 03:25:20PM +0800, Furong Xu wrote:
> ethtool --show-mm can get real-time state of FPE.
> Those kernel logs should keep quiet.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

These prints are equally useless?
	netdev_info(priv->dev, "FPE workqueue start");
	netdev_info(priv->dev, "FPE workqueue stop");
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
