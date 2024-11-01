Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D2A9B932C
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 15:29:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2997C78013;
	Fri,  1 Nov 2024 14:29:21 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3B96C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 14:29:13 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4315ce4d250so2060295e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730471353; x=1731076153;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=odFhpibLPvwuhQLLhb1fVT+w+/dlMBz12uJSK00SoM4=;
 b=dZDb2ro8o197zf3pcjVl3chWdEHHCB+DA1UPCPJLZUG55tpikHIPgIJDy2En4I4mXJ
 ZHdD+oXqlCmYs1D4BJq52qk6Ams76v3LIkfw/DS2oUXpXRowSTzYjbrlCZpOUP2KKj5R
 VRhGwZa74QsL/hVyX9GiFnBAHDoRMubh+WaQnwmsFTa/a7qLMoPNLL+q701Me8PXBvBT
 M1i5cm/Fkn2FkpYfyt9HQufmV+oLXOEyzZZv3zGei83tSmWnvZH7tNc9bQzH50k/pi+v
 n/JO9VQXeS3rAjQRW8dRntDDjLuOuorQjkpaxaXTi2sGAdRp5cQjq+J5BvosnUz8OfUY
 NfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730471353; x=1731076153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=odFhpibLPvwuhQLLhb1fVT+w+/dlMBz12uJSK00SoM4=;
 b=FRfR1Iyr1WZs3qejNA4xrT5y1cZ6fhhLWiQaXrxZO5/f/UoLP+GovZkeFAm0zOqVxG
 6gjqU/qzMTFhpQv9ejGKjU6JkmsvaPt72z98gXJFfsrYYujFZCvNWT5ULJjakllFDMOF
 JGS4rdaI2FZh8Ns1vQHjkXJww2soT0Ru+gufgjMV4+KYtREE8yyi8ZmF3F0qbGrIxx3x
 eC9Wmoi1z7wn4fnvpqiKyIjAtrI4d3ar0jw2oVmMi5pgnmhlPCmpELKY/PQa9T/5fpc/
 CLp8tUGddzT2PRkyZAQZsWEDJRvHvFVNStuwIOf4eftzNNxvm5XDR7ApzgXqiT1OcXf8
 TpjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHj0CbKcxwnGVMG0PaSzat+/huWIpextCTVHNM7crGqtIBqosx/4ZDlPaKlqntdAsFxfT+cngJk02nTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwaEgF4pTJkDaqSFCLDnIi9RZk7yqyndVQ+gTnhuTzoiH36Z+Jb
 1ShZ8eDqyOsXheIVjic5qNOO/+horPgvATfFycXuKIhtXyU6pPEa
X-Google-Smtp-Source: AGHT+IEEMVRXqLdwmJV7pRqfFpEUN3/kmvstqI5JyyZgowwwoXMF0vgEs0QQNJ4tL3FcNqLPsYwFmA==
X-Received: by 2002:a05:600c:3542:b0:42c:ba6c:d9a7 with SMTP id
 5b1f17b1804b1-4319ad08603mr88397485e9.4.1730471352892; 
 Fri, 01 Nov 2024 07:29:12 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d685287sm66007415e9.35.2024.11.01.07.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 07:29:11 -0700 (PDT)
Date: Fri, 1 Nov 2024 16:29:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241101142908.ohdxsokygout5mfs@skbuf>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 0/8] net: stmmac: Refactor FPE
 as a separate module
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

On Fri, Nov 01, 2024 at 09:31:27PM +0800, Furong Xu wrote:
> Refactor FPE implementation by moving common code for DWMAC4 and
> DWXGMAC into a separate FPE module.
> 
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
> 3) Bit offset of Frame Preemption Interrupt Enable
> 
> Tested on DWMAC CORE 5.20a and DWXGMAC CORE 3.20a
> 
> Changes in v8:
>   1. Reorder functions in their natural calling order
>   2. Unexport stmmac_fpe_configure() and make it static
>   3. Swap 3rd patch and 4th patch in V7

For the series:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
