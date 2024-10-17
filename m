Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C19A2A85
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 19:16:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC622C78032;
	Thu, 17 Oct 2024 17:16:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39CD7C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 17:16:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37d5045987dso142506f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729185406; x=1729790206;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CHTkMCTOi4KADRR0Qt2Niy3JkOX6fjvWm/vnn6ueic8=;
 b=m69ERdfNj0b+ZLvvAtDE3XbGsf6wrJCCr9V6GKvUwRDwBBmRc+XKoCTomqe4Zux9ZN
 FJmUeCkZLPW/2ojCAuEsxileXGc78+yOKtdMvaKl0d640/kwyOsLGfMgi/gPw3EQtziZ
 KPtIMMldYDteWVOG8AC6zdxn02bn3Nnpb5UyThHUyITWHjJ7giVpR7h7Icz1mg0QX3oK
 I9C5KJZo4h3bW+9DyZ3qOCpxEQXapowfg4RpdzL7HHSE9EuNsSvIpiunDAsARN9Ml2gZ
 /Aqa+XeeaFQ8ppydpiP+RdTR1qUFJqAz0lrffvku5H5Tv39yKQfZ2joldyA/VyqlKuS7
 ZJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729185406; x=1729790206;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHTkMCTOi4KADRR0Qt2Niy3JkOX6fjvWm/vnn6ueic8=;
 b=TO1oc2TiPXh4ekbWYjds8sbZ32qRJ5G5QPULYi1EC3vjFQqUemw0rLFGZJ1df+lCeF
 1vXioRjHKFDZf86RTYWcCjvvr3oBEH0qwFco4A5srQ3K065rAOPOvacpMCSHb+LCVl+5
 /GCTEsc/+i0ZKfGdnt9to6RBT9M48swXsj3SLU7UeLoDF2ZylRDbC+7LZAt5deny/DsO
 sdJCRC5eVmPqNn5G5qQCUt7yuZkRbxly4pXhrb1/5eRw2WNuyL3k+KU9yIzTNVHlGymh
 Hy3fc6KTe3WFYypwBhAzv9jyW5if40QUE9CDnY+UIlBczidehHVOm3FdSks0LUZKlKm+
 nhZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUJXNqzy2EwNGqPZR6tXUQNljGOERNIea7Ype9Yf7uoK58BwEmzqo39F3uS7Pa745oEdkGU5LYSaibfg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx67ad6vMtY5IKuCPfbVS8Kl/QkrfL6qfVIr0uWcFe2LlW616YU
 dv4pNv1N85YcxRSGJff7nqWKi95qXOqn1lr83pQjzvsn+AyqJoSZ
X-Google-Smtp-Source: AGHT+IHybU/ZmFXrzf4w9xc8BacfuSn5MWDGIn00ngDmgGYyYXsHgb2X+ig6bMR+mxD9CZpdU0D5RA==
X-Received: by 2002:a5d:6c61:0:b0:37c:d0d6:ab1a with SMTP id
 ffacd0b85a97d-37d939bd9cbmr1387179f8f.12.1729185406268; 
 Thu, 17 Oct 2024 10:16:46 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa7a09dsm7938351f8f.23.2024.10.17.10.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 10:16:45 -0700 (PDT)
Date: Thu, 17 Oct 2024 20:16:43 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241017171643.kmg7gvemmedl74r7@skbuf>
References: <cover.1728980110.git.0x1207@gmail.com>
 <94705afa1d2815e82c27d3d1a13b2ad6ada8952f.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94705afa1d2815e82c27d3d1a13b2ad6ada8952f.1728980110.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 3/5] net: stmmac: Rework marco
 definitions for gmac4 and xgmac
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

On Tue, Oct 15, 2024 at 05:09:24PM +0800, Furong Xu wrote:
> Rename and add marco definitions to better reuse them in common code.

s/marco/macro/ (twice)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
