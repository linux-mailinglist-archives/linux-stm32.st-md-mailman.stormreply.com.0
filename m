Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CCF80E74E
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 10:20:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 357AEC6B45B;
	Tue, 12 Dec 2023 09:20:21 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38C25C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 09:20:19 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2c9ea37ac87so74850511fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 01:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702372818; x=1702977618;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rksCD0YvwRVPdr9cALicJG1jtcdwoAy/N1wXuToJ/sU=;
 b=grNKgxBv2aY9UHJ4l9NZJ99j9yzJPTbNBMqktfwgA59Z+/7id08LHb4YHWAxWSBa//
 TXNWi46wEtEATeLbGT4jul4sj4yaQ1NFxHlQ6k4Lj62d6Bfb4d7k4PE2XxIAmz14BkDv
 C0yNMd/Pcyqla+N0s+9/BNIOrnv2PGnr3vgWmdJhlZgAoL7xvgKUgzvLKgb2mjsTHdvH
 mYhJb8xbKhH+6WYz/1i/FqZimj9VQ1BXQC/BNu5nunEVYzqGp8uKSvgblRtIL/y/3lMz
 Q6zZZFrKC0Y5x08zZnf3kms28zzFlHGqdCM7a4JNswSjvn+1f9EoR3VywkNJY1k75ePI
 yjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702372818; x=1702977618;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rksCD0YvwRVPdr9cALicJG1jtcdwoAy/N1wXuToJ/sU=;
 b=irg9Iuujo66L5AQLGVKraum7sEeYZWENxivXkWiY0sSFCqrupJWtbQIB94n/m/zyRc
 AxHsT8tI/FafAMR+a/qFo9++UpJDvrs89s3usqvV8DS1T9DvL41xXgqe1KFXFFazXbcL
 y8+7aSPRBPxXnjxCS57XNMKFBobz7YYdQC8xsIHkTDMFg6nEBMuXc2hHRDfiiy2t6NI9
 0IceXQ4wrtO1vqupb8AsNdHuCE04rBTeB6SMAlH5q8iBlHZTds+MSR+irk3zw1vhr4KM
 B5E9SZbt3U5IaRl2qACVeX3w9p7czQuvclyvMJNbl4D0bsQkGzpn96h4xjTXfCrcfUOM
 F4Eg==
X-Gm-Message-State: AOJu0YyQdcHUO3abS0yYgISzqIvC2vQi2AlzUYojq4DPscRsOWuXxSS5
 v9SuJkkYIFCP+sw9oZrFL7s=
X-Google-Smtp-Source: AGHT+IFBfXFN9YMbampOxy4UlOpmDcj+w/s3WuIJrPWhqFQHlOAYZA7vdH0HKg760a+7o1+41h3Taw==
X-Received: by 2002:a2e:711:0:b0:2cc:1dc8:af0b with SMTP id
 17-20020a2e0711000000b002cc1dc8af0bmr1600707ljh.36.1702372818014; 
 Tue, 12 Dec 2023 01:20:18 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 ce26-20020a2eab1a000000b002ca00b027ccsm1447690ljb.123.2023.12.12.01.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 01:20:17 -0800 (PST)
Date: Tue, 12 Dec 2023 12:20:15 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <edfg5hbcysvah5lnxoeygjn3qz2243c6o5ilt4uyeggegu5wzd@t2ngy4xikpio>
References: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
 <zx7tfojtnzuhcpglkeiwg6ep265xpcb5lmz6fgjjugc2tue6qe@cmuqtneujsvb>
 <20231211145944.0be51404@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211145944.0be51404@kernel.org>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>, James Li <James.Li1@synopsys.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 Jianheng Zhang <Jianheng.Zhang@synopsys.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac3+: add FPE
 handshaking support
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

On Mon, Dec 11, 2023 at 02:59:44PM -0800, Jakub Kicinski wrote:
> On Mon, 11 Dec 2023 14:14:00 +0300 Serge Semin wrote:
> > Although in this case AFAICS the implementation is simpler and the
> > only difference is in the CSR offset and the frame preemption residue
> > queue ID setting. All of that can be easily solved in the same way as
> > it was done for EST (see the link above).
> > 
> > Jakub, what do you think?
> 
> Yup, less code duplication would be great. Highest prio, tho, is to
> focus on Vladimir's comment around this driver seemingly implementing
> FPE but not using the common ethtool APIs to configure it, yet :(

Fully agree. If that required to refactor the currently implemented
handshaking algo (looking not that safe and clumsy a bit), it would
have been even better. Although I guess refactoring the code
duplication could be done as a preparation patch anyway or as a patch
which would convert the feature-specific callbacks to be suitable for
the 802.3 MAC Merge layer.

-Serge(y)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
