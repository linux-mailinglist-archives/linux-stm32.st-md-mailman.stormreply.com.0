Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D52B95483C
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 13:48:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26879C71290;
	Fri, 16 Aug 2024 11:48:30 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF704C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 11:48:22 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a7a94478a4eso516562466b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723808902; x=1724413702;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IY44BvNIQ8HMdyx0QMRty049Oi1G15aZuupS+GebtAw=;
 b=kXF2TvwamM28JU7mZdeoBZeH5SxZof2pyMKYRb3/bRi0BiS5BOz4yTlF1tTICSRR3d
 4xYjOFZ7TQ8g74D+g1HITgWaNaWAZPQLgC2Jro15VOd4A3XqnkneBoBlOlELNbac8qZN
 vVFTiklP57n8ipV3xsWPH5E1WVz6tOQrOk71SH69au5PrWi6t8giBqP02NSziep1Xt8v
 QSW6Cn0SCNWNF38NvrtNjAtjUvvi2qfuL6+fiBHdCb4/mJd6TAA5uk35tB/iioPetHjQ
 /QQ2vCm7m+GByxPXYiBp0HrTvW25V4v4O8ctIoS30mgXPX6IRE+JolvJqCkOPDczGO6w
 BLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723808902; x=1724413702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IY44BvNIQ8HMdyx0QMRty049Oi1G15aZuupS+GebtAw=;
 b=v+78vhbqMEFbgzrAr65jektgeJiUljmSkGM5c11fsry0/Be9tVUNPfsk1aiLKvG/fW
 t9oKTPHnwVLmvDZcr9+Jf9HdLzt2yRHKNIaGFaD9sXnZwF8D41YTR1bYdG7z654iDvc+
 na1JOBfMzbDizglz8dS1oBQVfr8aHQscmnJb338L72Nqdp7HvjIxApbvHRw5FbWYdIz2
 QNsGBySNWpUYDXkxdDKQ/ZhrdGbhDAulHNbXABuwTp0i/vfgBLL9JcQLqoqNnt1I43F0
 weVKrqqn8YCfqH98tojdr/51zfxlHUWQOnr5IYIHAMLjKm7Psr/oU/YA1YfSGcOQu6Xc
 2zRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU81y4cFizGfHznZ2zF9t+5SHnH0d6zFtE2RCxuunG2i5hk7+qxV/Z3PybqT+C8QxooQn+9E7OucZMOK0V0Gcz4u2fswuxUSvysPjFKX8KLFtuYvMwi4PcJ
X-Gm-Message-State: AOJu0Yz0Ibr/reGZP4EZWUacM4jN+c6v5KMylSGy+tcfOvvqbgtOmOju
 xeCURqc4rzVmxYCIZSp5wbftBGEDRKTNND5cllH4neJRBWO9QGOH
X-Google-Smtp-Source: AGHT+IEMqNZbH50JXVZEb5SoTpw0eEiq2X6PpNhKEqpktgqE6co9AWSShXZz8K636iWMPF7XES4lEA==
X-Received: by 2002:a17:907:3fa4:b0:a72:64f0:552e with SMTP id
 a640c23a62f3a-a8394e34235mr243281566b.19.1723808901548; 
 Fri, 16 Aug 2024 04:48:21 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839344fdsm244834166b.100.2024.08.16.04.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 04:48:20 -0700 (PDT)
Date: Fri, 16 Aug 2024 14:48:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240816114817.gp7m6k2rlz7s4e5a@skbuf>
References: <cover.1723548320.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1723548320.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac: FPE via
	ethtool + tc
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

On Tue, Aug 13, 2024 at 07:47:26PM +0800, Furong Xu wrote:
> Move the Frame Preemption(FPE) over to the new standard API which uses
> ethtool-mm/tc-mqprio/tc-taprio.
> 
> Changes in v2:
>   1. refactor FPE verification processe
>   2. suspend/resume and kselftest-ethtool_mm, all test cases passed
>   3. handle TC:TXQ remapping for DWMAC CORE4+

This is starting to look better and better. I wouldn't be sad if it was
merged like this, but the locking still looks a little bit wacky to me,
and it's not 100% clear what priv->mm_lock protects and what it doesn't.

I can make a breakdown of how each member of fpe_cfg is used, and thus
understand exactly what are the locking needs and how they are addressed
in this version, but most likely not today.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
