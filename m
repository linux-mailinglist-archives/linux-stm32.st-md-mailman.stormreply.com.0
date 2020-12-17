Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 992002DCAF6
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 03:22:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B876C3089F
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 02:22:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82CE9C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Dec 2020 02:22:41 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2so18043445pfq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 18:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kdgZpH5zhK45f9ONEpP7+71rrjeg6WLO9Q4NzwSPfyA=;
 b=vXecVVRKqSGBP29JUmVEz46Mswwzd6+4DFqEOHeZ19Uw3rEAj0M9Wmp4SbPbzA13+A
 OZ16G6CkgSsW+44JpD+fgbJWJMJYfghNdCAh/HlYK6lTMYqsvypt48JsQPkW308XTf0U
 TY0cKi1aOuA8S6LU9R9y2O+nFpWXDP4GEraU6ZdxFrNCGPY6FYV+uK4TBDdJ0gt9WCYX
 YOWWTWxR7QFWNj90s6AZKPLMUKFkq6UaXipRHyeTIpn2Vskr17GThKxQPbTRHDyeCja4
 7bWnTjRHEGRojydjgPegOYAAs2WRAUiivZZp7ZojtY0avNqnHxa4XJFwDgLF0krWK2xW
 0NFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kdgZpH5zhK45f9ONEpP7+71rrjeg6WLO9Q4NzwSPfyA=;
 b=om/vZbWYQeLRjXWdmeLL0IEXJ2BjQQGfFOoFC0V0kHzFs+bVVp2a5wZ2pJD7XcEYcO
 xZ7dnq33i8Sk5CmhsZoMGABldKPm+mr/URNi1A6NXfU+1lQP9HQqynbmvvQ3PbQs0asl
 oMHQoVPg9+YtMZH4BFe+c1i0iF/tdn/XnfftTcTS7Mp4Ny8wQepF834FWcmUOB3ywAaj
 OAh4NCJKHoYj65xmP05YMOp4mVD1Ph540ZYKh6dMkzy9ABmYfhU6NfYi9r9gz7QRRb+y
 7pplwN7gCXC1KEPwLwIW4nmAgVgO2rqWM7EluTVbhqDKlkqQRHzZ8E43M/qn5HHnEuKF
 aWhA==
X-Gm-Message-State: AOAM531hWKsMUHL//CEQcLD335fHpgIDgava7Ub+vRepaplU5EfgsMAj
 Hhb7QbdcZcW6rGD2tl+bnsk=
X-Google-Smtp-Source: ABdhPJwaabE+62JHWNklzDe5UAl8rrxr/LynPFYnVqDEgOEZGzOwbeGLHoCSs54O6VOzjy8p0D1Byg==
X-Received: by 2002:a63:4b1f:: with SMTP id y31mr36353111pga.29.1608171759955; 
 Wed, 16 Dec 2020 18:22:39 -0800 (PST)
Received: from hoboy.vegasvil.org (c-73-241-114-122.hsd1.ca.comcast.net.
 [73.241.114.122])
 by smtp.gmail.com with ESMTPSA id w70sm3728551pfd.65.2020.12.16.18.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 18:22:39 -0800 (PST)
Date: Wed, 16 Dec 2020 18:22:36 -0800
From: Richard Cochran <richardcochran@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20201217022236.GA28883@hoboy.vegasvil.org>
References: <20201216113239.2980816-1-h.assmann@pengutronix.de>
 <20201216171334.1e36fbff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216171334.1e36fbff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel@pengutronix.de, Jose Abreu <Jose.Abreu@synopsys.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Olbrich <m.olbrich@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] net: stmmac: retain PTP-clock at
	hwtstamp_set
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

On Wed, Dec 16, 2020 at 05:13:34PM -0800, Jakub Kicinski wrote:
> On Wed, 16 Dec 2020 12:32:38 +0100 Holger Assmann wrote:
> > As it is, valid SIOCSHWTSTAMP ioctl calls - i.e. enable/disable time
> > stamping or changing filter settings - lead to synchronization of the
> > NIC's hardware clock with CLOCK_REALTIME. This might be necessary
> > during system initialization, but at runtime, when the PTP clock has
> > already been synchronized to a grand master, a reset of the timestamp
> > settings might result in a clock jump.

+1 for keeping the PHC time continuous.

> Please remember to CC Richard, the PTP maintainer.

+1 to that, too!

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
