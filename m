Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1319B629A
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 13:10:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA912C78027;
	Wed, 30 Oct 2024 12:10:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58A0AC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 12:10:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4315549c4d5so8045285e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730290250; x=1730895050;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IAHJQTr5TuW3GGReDV5UZFJDEXYorIucpYIzOsAyFUg=;
 b=ao0YdleONKbl69XqVGdt3lnULnuxQxqDZx5GgW6tqC8oc+oZASI47NeF0KQ2d1mRdX
 koipc2cHpnwWsD2ixccGfsMoXTbCvDE7KG9z4ZyYmkvcM6+bA2kWKZKgXV+zWj4gC4ZP
 4YibcTe8wONlJa0ah6YwnS0Xw8RRhoH+WmdIm/EYynBVQJu0ssEPMcs8NB/QjfQcN2KS
 7ONNVg2hpyFxprAmpF8cgXFTYRNB7/D3LCZ5M3Z0LC8jxxsR+Pqz+zXfChWyafnQNf9x
 Mfks+9cKRBawm7b021zn9rZGK0vhz/UU8ApJEfMfo316QCNVgU7cI3+gLAwV1AM6c/si
 ZpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730290250; x=1730895050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAHJQTr5TuW3GGReDV5UZFJDEXYorIucpYIzOsAyFUg=;
 b=UylaR42d0goGJD4wX9EnjsaoFTxCWelUyKxoMCkDL5X/xTzc9kSFNZkr/IEdKSN54e
 zPOPikawI0QpYmSD5fc3IjTRTSu04c4gqhE+GZ+P9xLEZpKwj8aeTYcpZIG7RvgRlZBa
 2WKzb6wAB/X12Th/E9dCp/2/VTHFVraN3AcCpZyGRizUFfr4QN5nvGJi/xYOFGkyg1vP
 OAMdZxI/LXkrrJCAemCzdhLSm3IH1duQzDGPU+H2gG6WuxL8um1794PFVbiNx28orxFR
 6muFWrILtRSIc6vAonUQ7PzjHq3yqsK6Gyomy/ta0A/n2W/64iF0qw55FTBebGQ83AaA
 m2FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf0Y7/enE9KH0K23xzXiInUllSMjx+blkV0vdyY5YM3HJWGAr/15HTd7PV3ZD9QefmJzzLr1YLqpzEXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxmN3JBz7i23GwBcelQfThH3R8VD3j4F+fDEIi2ALGeeGEL4Hcl
 wK4PN38IZLqg1zo8CO1dSQ9U/6CV7REUVSU2dBuF+VY9F5WM6ssV
X-Google-Smtp-Source: AGHT+IHqD0tQoJjotGQMbkT9O5ybcV1GKcOxiI7uSjH0+aXwp1A/frWiXiw3u1p9Psnfso7u9ygY7w==
X-Received: by 2002:a05:600c:5494:b0:431:4a7e:a121 with SMTP id
 5b1f17b1804b1-4319ad4ee8emr55092335e9.9.1730290249500; 
 Wed, 30 Oct 2024 05:10:49 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd98e823sm19903975e9.38.2024.10.30.05.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 05:10:48 -0700 (PDT)
Date: Wed, 30 Oct 2024 14:10:46 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241030121046.ojd7zx3jbyg4l4iq@skbuf>
References: <cover.1730263957.git.0x1207@gmail.com>
 <cover.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/6] net: stmmac: Refactor FPE
 functions to generic version
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

On Wed, Oct 30, 2024 at 01:36:12PM +0800, Furong Xu wrote:
> +bool stmmac_fpe_supported(struct stmmac_priv *priv)
> +{
> +	return (priv->dma_cap.fpesel && priv->fpe_cfg.reg);
> +}

Should we also add the condition that stmmac_ops :: fpe_map_preemption_class()
is implemented? For future implementers to figure out what they need.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
