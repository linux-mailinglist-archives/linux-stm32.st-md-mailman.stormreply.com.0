Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D8765520
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 15:34:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 517C3C6A603;
	Thu, 27 Jul 2023 13:34:18 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A9F6C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 13:34:17 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-686f6231bdeso195435b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690464856; x=1691069656;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4QMI/vlzpJV7j3wA/LmKMP2eizxiAkesVF2nfD4pPBU=;
 b=Q5wLfe12VdIzPDpblQpZ7UyATf3DQ9s2gq7j5911KRQGlip8vaOO/waDiUjVLQGgJ8
 jVR9jkDwdbHCMYvX8KBIpkB40pcdhb7/Twka0oUJAMeepHNg5ELkCBi/+Z6aHfNgLh0I
 wZ/feFkXBJPN/Vo7vhQp4qhcSCTxMf0COOSOYlP3kL6YnQJ20xcVX3geFuBFGin4aNpr
 UhVjWm7B8CcIphHBV+IcJ94yo6NR4lhifzLOFbkiOrYaiBdftFpJ0Vwrwz/05OHqy61p
 zPtRnDqsLz0U1J9o915kxDJNe20qKre2eYBi0DDAIb5jSwG9zONnt54ouiABWxZ0gbUT
 C+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464856; x=1691069656;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4QMI/vlzpJV7j3wA/LmKMP2eizxiAkesVF2nfD4pPBU=;
 b=ASLRRBItsMbb6ODESMHfFLlQUqG6ewPGCiqSZEiyFA1Vwj/BoEYas3s9+aM90ViX7+
 ZaU8xSvzzZmBtFvJiVYv8hdgj5E+nsDgIiZjsYB2Zt/rqyfj0Kpy/GrHV9ymP6fhGAFy
 EHhW/De3oR15xCwuOlkNook0EaV9NAr+pfyAx36lA6Txknk61PIIdQi2YKkKexS0GEAG
 IVVVRokjPEGM/MurvERba5KABuHKZRBGdBSlkANvos8GmZJmqHQMVi0tZ8XZPMXS5cV2
 yan0hVb85nLXRXE+n3c89wcRrX/TlZNrbE9tBSxb3QqMyiao8VsCWYDY+10+bN/qbE6o
 04jQ==
X-Gm-Message-State: ABy/qLboJntnokYkMi1yEPAz2+qxOvP6b3RyW/gVWBgtAfPe5ios10dY
 hGLS8L7WcksLAHZbYVhX0Gs=
X-Google-Smtp-Source: APBJJlFbgEPhyuFnR/27BrDvGPU1qazB9QgORyU0BBYwxq9b2uyVmNVw0ZDY26pO/YAIM1sIZEoB2g==
X-Received: by 2002:a17:902:d2c8:b0:1bb:ac37:384b with SMTP id
 n8-20020a170902d2c800b001bbac37384bmr6472527plc.6.1690464855668; 
 Thu, 27 Jul 2023 06:34:15 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a170902f55100b001b9cdf11764sm1637276plf.31.2023.07.27.06.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:34:15 -0700 (PDT)
Date: Thu, 27 Jul 2023 06:34:12 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <ZMJyVLy4NnBMUI55@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <ZMFfI3xU5pkJW4x4@hoboy.vegasvil.org>
 <06859eed-6f9b-5d66-3221-e55dcd83466c@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06859eed-6f9b-5d66-3221-e55dcd83466c@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

On Thu, Jul 27, 2023 at 08:42:52AM +0200, Johannes Zink wrote:

> good catch, I think adding the register definition won't hurt, but if you
> feel more comfortable about it I can add them only for IP core version 5.

Adding the offsets in the header is not the issue.

The issue is reading from these offsets when there is nothing there to
read!

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
