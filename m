Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F749901F7
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 13:19:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72808C78023;
	Fri,  4 Oct 2024 11:19:52 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D652C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 11:19:45 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a8d1a00e0d0so26764266b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Oct 2024 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728040785; x=1728645585;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=21/ANHQaVAmEnIKVWasnSHMY8ie5sYhBEQjQDCw2+OI=;
 b=nrpy4zFjXsnJ4UuKC4g0HH7E4h4SrOhgEifm4ULktdTgkJnbHXdGrHMEGNOlgdVKKG
 PUdfXmiwSsapKIKTl59tEcuRz90QW5j8bb++BrhKM/rSkNJmKouk88nw1UY5lpffS9le
 QuO841oJPzP0IAlXy4S03sgGCbUiP4RvPlr9q4Sktv7ge/cWaYqTCTwIsOQhJBFaWavF
 NDKR5hHCgVrfNLzJb9kn6Enta21mzfcs2V3AqsxU7rv7jwK27K8dExtzRJ+GnLB3Uvjs
 jb323yaZckIxW3t6WtE+4BMi6acBMOUKZJFijiVHaVty67xSjqVwAG3CG2fHjBGCS2v+
 f7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728040785; x=1728645585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21/ANHQaVAmEnIKVWasnSHMY8ie5sYhBEQjQDCw2+OI=;
 b=gKiC3JQbBPVqdfAjV0+yy8VAX/jCMv9qcksyXAeKQJ7l4iByRoQkKwvVTqu+JeyVjs
 kChTk6uNVAX0EazMCWfTj7zCHOyR6FKSOPcq3g1Xfrfs8t4iesfjkHsivRLcqtvYVcSF
 7R85U81gO+6nzeLQ2tCaLOBGfL8mCvKite3hsmirZbHh5IxhcMCEOmQFdAaYlrMMiKSM
 Vwt+LuVvn1VRKBlK3xgDKKt/1Wpe/HMEasZyFIY2z75HMQkDhxqU3lGrN78ohGl4VwKv
 yj0uHEe6N+ZS4IvN7kM7izTPmnjGV60nqLN8RDD8e5XvrqRTPpqBQZt3LQhbLSg43PZU
 gBDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLuuCpHx/cKY6PmtXOYVLwYlPw72laW9SYe6zf30X7T41jNunxU3yY1vbImsM9EIHexJcKDedO2DTNXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjQuP/sr5Zha/2zmTvUAOBbkVFbXIGANCKQCF8Z89/aXEqZDU7
 HrGJMMt6jI/1kgxCxsB7ccNsXYTSGIhmicoNpTSlrAaDJITtYwLB
X-Google-Smtp-Source: AGHT+IFPKLUaC6w5boja1xHVBGVElwe3dN447ckuLj8ZW8kJK8aoR+nYtgFWEIxSqzAexPpQpvcpJw==
X-Received: by 2002:a17:906:7310:b0:a8d:2624:1a84 with SMTP id
 a640c23a62f3a-a991bed1a26mr110366866b.11.1728040784216; 
 Fri, 04 Oct 2024 04:19:44 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9910473155sm212364466b.151.2024.10.04.04.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 04:19:43 -0700 (PDT)
Date: Fri, 4 Oct 2024 14:19:40 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20241004111940.xbtssgeggp5mcprl@skbuf>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 00/13] net: pcs: xpcs: cleanups
	batch 2
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

On Fri, Oct 04, 2024 at 11:19:57AM +0100, Russell King (Oracle) wrote:
>  drivers/net/pcs/pcs-xpcs-nxp.c                    |  24 +-

I want to test this on the SJA1110, but every XPCS cleanup series day is
a new unpacking day. I have to take the board out of a box and make sure
it still works. It might take a while.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
