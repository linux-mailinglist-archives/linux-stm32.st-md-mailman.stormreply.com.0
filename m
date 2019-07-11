Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F26560F
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 13:51:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02A7DD21219
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 11:51:23 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42A4FD21217
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 11:51:21 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id i2so2919827plt.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 04:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YADbvn2K6/u8nqZ8q9ZPF7M9RWPIMSzuiJIm7lkbc3Y=;
 b=dR8W5eRiA/e3yOi4FOC4uHJMU1ECzIkaS4bxgdBNsa6BXDCrKbvda7odCkmQbvNdcH
 YZoMSxJR0BYz3/xfoJkaYuvvI1fPrP/ynaRDty9gWT67FWK53dMGLMMlKD/njJJnwG/2
 ev4GNOw3od3Y/XeE6wdIhqYSrJSNF5oqRiVH634uOV7zxQMZMoJ71+aXW0u3rmgbG0OL
 92E9bCnNpG9Ool9BikbAnYOLXmoUL1PxCXFNTVbkxD19su5nmpC3Vjiv1unpY8nDw+zF
 k7FSnjPt3kEPNECLpxet7RvOHLPYL8wx5xQ8ETIxs3tM5xk8hgLMIr9b/A2K6AIpD8Zm
 J8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YADbvn2K6/u8nqZ8q9ZPF7M9RWPIMSzuiJIm7lkbc3Y=;
 b=qd6p9YPNSopoJN1sSPIw2KdOt96/2ax2YZO2bc39AzRX7AlZDOxCELIc4wsYzNk2s/
 0e9oKkXOpqAcxnrJpomNvAz7/pGJ9PjaVbhuklbrJfIMaR/a1wEAcUPZWeeyJbuyWXkQ
 Dl9ykjX8e0l9zDVNdYTrNdOtLuHoQUnPreZYt4LoUqK+54W7h1jflw3bB142J2LOqlT0
 7cUMsCe2EO8UhZ6LNZ+cUzGubGmNZUOC7WxtA7piI0ldjN053HvAhZC6IISQNU+bguFz
 y4VTHnmAwPZGUY9TVB+ERfUWXqotG6aAoBpCkIP5ICE8Dt7QfuQJUQlGg60wBUhFBNhU
 FVHg==
X-Gm-Message-State: APjAAAX2UGHfkrPzl0lYKqrQpZonBqt+3dUr49tYL6S74bCiPKtmgXv0
 9h5RAk9CI8IWzNLaMyKHlMU=
X-Google-Smtp-Source: APXvYqxcGYiazPJSNg+VJyMqpy0EBBHqn2dYQ4xvLYGpGoGXyLLw8DgEU53NFyfiW27LNl5svYK7jQ==
X-Received: by 2002:a17:902:9a85:: with SMTP id
 w5mr4200056plp.221.1562845879704; 
 Thu, 11 Jul 2019 04:51:19 -0700 (PDT)
Received: from icarus ([2001:268:c144:cf11:d03e:81be:e250:5da0])
 by smtp.gmail.com with ESMTPSA id a21sm6426357pfi.27.2019.07.11.04.51.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Jul 2019 04:51:18 -0700 (PDT)
Date: Thu, 11 Jul 2019 20:50:59 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>, jic23@kernel.org
Message-ID: <20190711115059.GA7778@icarus>
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507091224.17781-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

On Tue, May 07, 2019 at 11:12:24AM +0200, Benjamin Gaignard wrote:
> Quadrature feature is now hosted on it own framework.
> Remove quadrature related code from stm32-trigger driver to avoid
> code duplication and simplify the ABI.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

What is the status of this patch? Are there any objections currently for
its inclusion?

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
