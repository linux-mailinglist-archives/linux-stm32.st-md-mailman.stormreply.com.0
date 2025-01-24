Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAEFA1AE55
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 02:53:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9693C78F85;
	Fri, 24 Jan 2025 01:53:27 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B8B5C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 01:53:20 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21634338cfdso35345565ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 17:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737683599; x=1738288399;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0CIWoUy3ha4vzmjbfSmJFxTGA26KK4HHUmc6qsOMGbs=;
 b=nfTFylKXGiB2CUW7ui7iiVXmpF6sJOk5f1KdHsP6/in7qiQAsJyRxtHgGHdLOsNKug
 n2KhuT15o6HjKF6qyRnZ9F7i5YJNpmPnaX4HAr2UKgEvk6f2RyEPtzEhv2UeEu08Q/l0
 ThgpuW+BviTC8z1liZ6ldQb4P/SwK0i8WVgO38oqMjs4K3KStsSjP3rCI1aw5+kyK+vh
 uN7VU8qLdps3JLckcZkiQiyON1KsiAge6q2/xpdzi81rSxzvObsz/EsyYyjiMop7djq5
 I6Yv0VI+5/KkoO9x9jR8+Ps2dGNg6VDfmMP2sEbLSRySHzG5d3xfVJ/GxLSQisIa5SFf
 C9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737683599; x=1738288399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0CIWoUy3ha4vzmjbfSmJFxTGA26KK4HHUmc6qsOMGbs=;
 b=TEPXryUA1/c0Z1a+cDf7ZCeqp9fkitzTM9nUxgk9RK0xzpl0BOVI9p6fp6sZcMkN1P
 0I9nmsbXxPBCVSkvzaAAvFwcqLNiAGf2Lo6eq7myBvujBqEpvj0oSTt8xGh3W/H9Yru+
 TIZCVTmz+HmjcXTmaFT9hEaADKwApcxxhMDywi+jqiN4cm6LAPL3xPoPSanny2Yvk4Zr
 YOzKxifzvdEXj72zxkvsTY4Ui1FGW/oM6WtVJSso58vbAexfrNPvFgTggO+z8rzZAJZO
 YPPevyfH/vkwPWi1Q53SQYmtLTvfMYNoeoLmlN40//U+mAOVHDIKi7CGq0DfzW37+/Re
 emEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWItQaJe/rHbj7r7JZdoN/ftXT46K8AMVZGxOkbL7DetPn/kgpoXRbi67C6aVuLzI3AdTQPkJM5+iVIrA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzc/tKgpg3eAmdKuXTIeJcEZ1qLB4RwE+HBsNb3C+RNPAH5L5lC
 5cYUNFMMpxyPhpsBKf2hvD7tzpfahF9OWH6DhApXl2Knt/4RaHmd
X-Gm-Gg: ASbGncsdWdYlUohNPk0hEb5xOtBBCb2R/032qQkwnE+Izeb1//f2N42eWHaNo+GjEnY
 sbOIOaCAN9/K6g4afz7p/CaYUFhg5ynNOvQ2zvBYjfmKKn637jThelYPBUUFZLpYSxh3nzugCD0
 lOHA80dMn0PBcI6Ncpzo7PW5rd12RgUHuyZVvvCaEv7nVpg76/lrFINdoDfyGg7MCh270SaAF0+
 mMeQXxzm/n6nlB76MLv9ES4Lq/83Vc9jwmP5Q0PKvgj7MzgJtWBoAMjpWvYtzXP1FAeKVUUun0d
 xA==
X-Google-Smtp-Source: AGHT+IFZRfnI30bnwFu/Rtxq5p6ANLOVPVizJ9I6bLn4f1DAiaJJMm0/EPmYHmngP0TFWmohDF1dbQ==
X-Received: by 2002:a17:902:ce8d:b0:216:591a:8544 with SMTP id
 d9443c01a7336-21c35630a13mr474511075ad.34.1737683598984; 
 Thu, 23 Jan 2025 17:53:18 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141100sm5538865ad.137.2025.01.23.17.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 17:53:18 -0800 (PST)
Date: Fri, 24 Jan 2025 09:53:05 +0800
From: Furong Xu <0x1207@gmail.com>
To: Brad Griffis <bgriffis@nvidia.com>
Message-ID: <20250124095305.00002b3e@gmail.com>
In-Reply-To: <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

On Thu, 23 Jan 2025 11:53:21 -0800, Brad Griffis <bgriffis@nvidia.com> wrote:

> On 1/23/25 08:35, Furong Xu wrote:
> > What is the MTU of Tegra234 and NFS server? Are they both 1500?  
> 
> I see the same issue.  Yes, both are 1500.
> 
> > Could you please try attached patch to confirm if this regression is
> > fixed?  
> 
> Patch fixes the issue.
> 
> > If the attached patch fixes this regression, and so it seems to be a
> > cache coherence issue specific to Tegra234, since this patch avoid
> > memcpy and the page buffers may be modified by upper network stack of
> > course, then cache lines of page buffers may become dirty. But by
> > reverting this patch, cache lines of page buffers never become dirty,
> > this is the core difference.  
> 
> Thanks for these insights. I don't have specific experience in this 
> driver, but I see we have dma-coherent turned on for this driver in our 
> downstream device tree files (i.e. dtbs that coincide with our 
> out-of-tree implementation of this driver).  I went back to the original 
> code and verified that the issue was there. I did a new test where I 
> added dma-coherent to this ethernet node in the dtb and retested. It worked!
> 
> Just to clarify, the patch that you had us try was not intended as an 
> actual fix, correct? It was only for diagnostic purposes, i.e. to see if 
> there is some kind of cache coherence issue, which seems to be the case? 

It is not an actual fix, it is only for diagnostic purposes.

>   So perhaps the only fix needed is to add dma-coherent to our device tree?

Yes, add dma-coherent to ethernet node is the correct fix.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
