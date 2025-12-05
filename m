Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B2CA7FAA
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Dec 2025 15:38:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AE56C5F1D4;
	Fri,  5 Dec 2025 14:38:08 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4829DC57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 14:38:06 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-640d790d444so1871921d50.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Dec 2025 06:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764945485; x=1765550285;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rZeX/t9XBIstd9pSBZ5++UMA+6ZEbyBEMYNpSCQ2HHE=;
 b=aNohQhHiaPcT7jRR3tVpVTgC/j95JRklPHJBcYxrHaOWK55f66F9Uq8p1fw1LC6q2c
 9VlgsIudHt4pAdYg1gg0XcEb0qRPI8F9Ecdh2V1AZYWocMmtSTseDi0EfJXetPGvTVGX
 Tk9mirJc15Zl+dgGcgtPpN4xrDD1nT+v2By0JYiPksQeuzuM9no3NTJjIzaMlWFtALMQ
 WvA1nWFtp28n35qkj6UZ6IpdSEyyMbY9Y/5S6qtmurULH2NfZaKjWpjOl89/95tDs3tn
 oFgJfPtSshEF/Au78ahBhfgWrBdFcb1R0NGOsBaC4xOIYlJ7o6DSvZgq9qN6dv6uYgZn
 DJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764945485; x=1765550285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZeX/t9XBIstd9pSBZ5++UMA+6ZEbyBEMYNpSCQ2HHE=;
 b=KG24IVLANlH0cZJ4wafbzIlkDTZ95Qzw63C7BIKiuBKaXxRzztdamjyeVqEvqNG1eM
 a9uIKKMD3uRvXpC96MMvpvo2Y5nnLf0H82Zp5hzimnKEbJRS5Qm6mBUI+i83bxfbwoNe
 sVY599w1fLlRFVlCaTr59QmoB8FBc+R4v+OuFEGfKJ5H3Bu4Z0PX5IePPAALVmdaakCK
 y1Dgnkh24kaDC/i9lVhx+II8kzkIfSE9i0ujRQ/RVIsIR3PjAsEZCFYmZpa2BJdC6gRK
 M1lDCOhT8tL9m4uGDUKUFjpBZU0oMlO7wn8HVTdicRja803ze0ojxxqryUzeMetKAOUQ
 np6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiu8cP6iyHScLoF+w/MQwgtf/PoIQy98bmZOAWjVR8tUyNESqs+U2crqQApC02xmsOwLcwtB2qXiunRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxum2K6n/jsTGJdK0S0VE+AbG7zgKjEUGoXKR+CEj3qonjb4pJU
 L9RHmDYbkLZiTR3vWTuKF+rnKuzO1fKR9QdnfKcBCYKrwPg24bkIBAH1
X-Gm-Gg: ASbGncvBY7uTSth4UULTDYpruUz76ntYYsJYWeKLwmKpQqszT7C54VfKKYPC81sRUhY
 RmYBb069aCMYVCJKElLl458ANsyNBP31/LrJo3JEuf79adnxUbD30joxTuT26OU/xYKtdDIHZDv
 TahWoBHNHtECXRTPMtAhO2as0QDauvrxvO8BZk/ln4bliqy/pz1wBJjB26E8K6MZTrhWcczu3hf
 mXF9svZzsnyfN+OzU0RZhFjbiybznqXSbWW7KBvXDtOPZGcQCzscwVhMlfFr+KVTsbnOH8DOPUh
 spjPOa3t1Isca3eIRbdmYEziYksFosjNMiMHqxkwdBDoddo5Zf67W0AELgu9ZkgVueSslLjlu59
 MtrsMz8fR1i92QzvZQ73gCTiQZR5vVJcT9BQVZEdko/rpKKvcVauQ5LLsnR5+4CWdY4rS/mI1lJ
 HI9lS31wVbT6fFnQUPGEa6iN4GiXUhjQ==
X-Google-Smtp-Source: AGHT+IHZolp98udP+u1AjHHX7nPNhJRkfNJpkP0YtwmKdcia0YfdLvMiUF1UHkN2//HLsO8YP+Ij8g==
X-Received: by 2002:a05:690e:12ca:b0:640:d038:faf9 with SMTP id
 956f58d0204a3-64436fab5f7mr7781946d50.25.1764945484906; 
 Fri, 05 Dec 2025 06:38:04 -0800 (PST)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78c1b4ae638sm17499737b3.4.2025.12.05.06.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 06:38:04 -0800 (PST)
Date: Fri, 5 Dec 2025 06:38:01 -0800
From: Richard Cochran <richardcochran@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aTLuSZugpZDNCRzf@hoboy.vegasvil.org>
References: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
 <26656845-d9d6-4fd2-bfff-99996cf03741@redhat.com>
 <aTFuJUiLMnHrnpW5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aTFuJUiLMnHrnpW5@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Fugang Duan <fugang.duan@nxp.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Fix E2E delay
	mechanism
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

On Thu, Dec 04, 2025 at 11:19:01AM +0000, Russell King (Oracle) wrote:

> Basically, the conclusion I am coming to is that Synopsys's idea
> of "lets tell the hardware what _kind_ of PTP clock we want to be,
> whether we're master, etc" is subject to multiple revisions in
> terms of which messages each mode selects, and it would have been
> _far_ simpler and easier to understand had they just provided a
> 16-bit bitfield of message types to accept.

Encoding the PTP role in the hardware is a fundamentally stupid idea,
because it makes changing roles (which is a normal and expected)
impossible without losing time stamps during the transition.  Some
early PTP hardware designs had this defect, but vendors figured it out
in the second generation of cards.

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
