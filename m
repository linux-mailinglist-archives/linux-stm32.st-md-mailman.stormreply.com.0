Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB1763B27
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 17:34:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 622A5C6B45C;
	Wed, 26 Jul 2023 15:34:17 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9123C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 15:34:15 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so2025b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690385654; x=1690990454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PWbwYwSV7iiV6v9eT8C4182R5bKMpB+kkZZ7eQ6vX84=;
 b=O9NuTZlCFyepHw+5xc11xK0qyBnILVl1oSHaNXjEcYMPOpFk2SIywI6Hc94q7dB/i4
 k7BDk0dCPgAkXd748xfFiko2FtThKPgfVB8p7ufDi0GCfjRLfa9iCE6SmkuY2MBNUQyX
 /koVe2eClI7gEGcJrhFUeImHiZDDrj4eHk2o9I0Fg9GSvol/jp/JnOklLns+J4Tnmk9n
 hraaPzk8JBASi0E/52rKC9dAgzj8sjJwrY34kwu08FczCzb/MjND23mq2aFh3R8K4meF
 p4wTjN9QMqZjRVvVHItwJMXNWCjIZJEp4c5N+ELlPtiEC7Mwq3IUOSQjP0XGjJS+JE2O
 w8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690385654; x=1690990454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWbwYwSV7iiV6v9eT8C4182R5bKMpB+kkZZ7eQ6vX84=;
 b=R1E0n1ZclD4C29ed8SX17TmIUZdQ80wjpIJtX5c/6OP4U8UOzeBTOf3JHObnd5jpMV
 qg6AXtYvXSj9xp7uzbdiaV/6a8pVtrxTbL0+isrwZC8mI+AGbR7+L3YDn7h8PEG9yfLf
 jvuPa8E1/mDmvB6PAGA9JYONbZthL90R3l87hxTEl3Y2jqcTBbF6HA5FSFa5ulgOG5Pn
 1Dqr1Jp5r9BoCdNpcpPvfcPp62OcBl4pgYMMGUMsvJsf6CGiS1Yr17k4hrdKszuUw3R0
 DQtfYcwyGfse2UUc2zqZCJSd1kpCvGWCs84m7w2YiDd3ME/ptT0oyl+R002DC0bF+1Cz
 pL/Q==
X-Gm-Message-State: ABy/qLbsswpw3fKDAjYX25joxUPsavBQ6OVPX37CojZB+fd607vtNIAK
 jr54FXKlhJu+Jhr2U1hWfbU=
X-Google-Smtp-Source: APBJJlGSV4nZT1u6Y+/+kpLnfP8AtBGmz13jE940isfGl8JKoJTH8WT3igY56rfoJorcXH1FFrBmWA==
X-Received: by 2002:a17:903:2441:b0:1b8:95fc:cfe with SMTP id
 l1-20020a170903244100b001b895fc0cfemr3017435pls.3.1690385654076; 
 Wed, 26 Jul 2023 08:34:14 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 jw11-20020a170903278b00b001b89d9a58e9sm5963541plb.132.2023.07.26.08.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 08:34:13 -0700 (PDT)
Date: Wed, 26 Jul 2023 08:34:10 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <ZME88hOgNug+PFga@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org>
 <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
 <20230726-dreamboat-cornhusk-1bd71d19d0d4-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726-dreamboat-cornhusk-1bd71d19d0d4-mkl@pengutronix.de>
Cc: Johannes Zink <j.zink@pengutronix.de>, kernel test robot <lkp@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patchwork-jzi@pengutronix.de
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

On Wed, Jul 26, 2023 at 08:04:37AM +0200, Marc Kleine-Budde wrote:

> At least the datasheet of the IP core tells to read the MAC delay from
> the IP core (1), add the PHY delay (2) and the clock domain crossing
> delay (3) and write it to the time stamp correction register.

That is great, until they change the data sheet.  Really, this happens.

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
