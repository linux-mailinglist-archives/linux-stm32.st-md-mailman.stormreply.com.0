Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B84B958358
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 11:56:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D8B9C6DD66;
	Tue, 20 Aug 2024 09:56:38 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C118C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 09:56:37 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5bed83488b3so3950521a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 02:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724147797; x=1724752597;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c/NIrAB2SV5MwsEF/06Wpke0eOaZ94Do2IfzazTumNE=;
 b=fdwRJhbE0qGgCBTIzS6qL1UHeGn/lSOXkIr04zskG5ck/S96C0636IrPRS8xMxdw+i
 67studHGoNfbBl5ZclVuQK6nZDJt/TU3ZpJV4FwBzr0JWxgpOzyPKDwlkI3r0bIFaom/
 sH40mPVQOeOsknrXWWz3383n8Y1H14Hysfv0EM4C9oF1xjSFcT784qq5Fhipn7bDFywC
 RNxu3H+JAIIdcaWj3/hW9rFsMfDAZe/LX2W83jXqkMtwpUfeCFUTDdb8NwewgQR2imNJ
 muwlbKHLvW2WYT1NANHxZBfaT5ZQOHrvTEiiPjZ9YzU5QyNKxXnp3eNg38NFZiHU6X05
 5VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724147797; x=1724752597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/NIrAB2SV5MwsEF/06Wpke0eOaZ94Do2IfzazTumNE=;
 b=c6ZdCDSMv430PaScHDGSN//e6lyxy8jrXfQtCarzWaaSfislMI8Tksqjqne0XSMIS2
 HCT7jeGPqxJYjjk8qdH206TnNh63PNLPJoCXss+Uj8TipVDKJwqVdTx3BiWTLLeZtGQi
 OaHsxgH3W9+C/OB+1eyyuuOUgIweIw/MHdf+wP12ZyHoOHOpV5zA8dSMO0FrrZd7dqT5
 NRZtRPqHSk374TFMTD4oFso1yq1l9WxNOM75z7REqTtbWto9368Q/YJ0arE4EGfkvHbQ
 pf3vQJsQx17A0xhKZJELAaZYV5kqJNdGKM/TCNNkGvaiJJ+dgGMKRzXpVKlY0r4kRvL2
 OJ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZd47VUGhuM28/aQ5syA+qMZP+lnCfPTknbyApY8eZ6N4qDIIuNuWKv9O4JrS/YLCs82rSmWCyRFseGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxyAGSfHgIfHHan0tKKvDmxUWy3v5A+MzpM//bvqe8QyRrRDo9s
 6zaOaWjDCd8UCGe11/EVrN+DEcJjL4a4lykCHD1rO81Ziq1hNlDi
X-Google-Smtp-Source: AGHT+IFWHx+VAD/A4mKL8+WTe1PuCUsQw6T0RzjJayT9ijFF56U9ZXHwSJnRiRbqZ6qYNlq9L9Dj6w==
X-Received: by 2002:a17:906:c147:b0:a80:d683:4d23 with SMTP id
 a640c23a62f3a-a8392a46e45mr964146466b.62.1724147796275; 
 Tue, 20 Aug 2024 02:56:36 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839472basm746539166b.170.2024.08.20.02.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:56:35 -0700 (PDT)
Date: Tue, 20 Aug 2024 12:56:32 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240820095632.3y6dwjpt5sy3raq7@skbuf>
References: <cover.1724145786.git.0x1207@gmail.com>
 <cover.1724145786.git.0x1207@gmail.com>
 <4358074eebdfedf4d129ccce40434af5f6e2b3f9.1724145786.git.0x1207@gmail.com>
 <4358074eebdfedf4d129ccce40434af5f6e2b3f9.1724145786.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4358074eebdfedf4d129ccce40434af5f6e2b3f9.1724145786.git.0x1207@gmail.com>
 <4358074eebdfedf4d129ccce40434af5f6e2b3f9.1724145786.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/7] net: stmmac: drop
	stmmac_fpe_handshake
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

On Tue, Aug 20, 2024 at 05:38:30PM +0800, Furong Xu wrote:
> ethtool --set-mm can trigger FPE verification processe by calling

nitpick: process

> stmmac_fpe_send_mpacket, stmmac_fpe_handshake should be gone.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
