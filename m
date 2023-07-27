Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B97654FE
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 15:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 013E9C6A603;
	Thu, 27 Jul 2023 13:30:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FFAAC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 13:30:27 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-682ae5d4184so223667b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690464626; x=1691069426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q15IWYuI/5HXw0x/ECyva1u3J08tlhfzm/oK0Hr+ZKE=;
 b=kEIp9RgOgQCaTTw/aecerraAkoEs0C62NJdBO2YnNixfqY0YGhuogCBOWqDkHo4VAF
 S4T3rRczmfOr9MC2Q+7AVGn73DAWOVCGYolD9KedHNb1uPlHk39/58BVm5wHJj4XHmbn
 2ZtUyXAdU9X5hXeGbiB/05wcHo+RlX/ERS7LcS5lTMBe6jydIXxxegosO64dfqnTQ27b
 AwCKxp/4+qQngkJVUxc853IjsxeIC6wo8wR/IeUSEg5WUy9rNnEnD/NvjeP25TsAC3Yx
 3cc9S8IrwH95xEIPJWa4YQ9Eip3XO+bh2xoNgMtnx+kM6jNFWymrBjyMv2u+S0HnyKYa
 367Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464626; x=1691069426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q15IWYuI/5HXw0x/ECyva1u3J08tlhfzm/oK0Hr+ZKE=;
 b=GtH9P9n5YO1DB0OVYngQmmU/d/B63oXJ+1GVoBE8jbXkmOuwZGoDepttjriT5DN7SB
 hMMEJKoM2cfxZIKT3wYMMytHlq9BQ7nmD1tYM7EOKgPTaqtq11uA4oK3Lgpn9HBiMcOf
 oODRqDNvNbHsrLRMKf+6qJGoInca8nOhdDIbYOYkAaVmwFOLShlT/nkArubh62jMzKJp
 BcvwOuDBfOGCzPA17H1mFrg/sJV8DAhEAkRakAXJWTyX76rchFn/LOhpsXUqR6fuASE1
 F6OCOWzG9JEQ5tRJ6H9Cb9yps8uk15HuIHPfVfN0xQt4ZwFMJiQ7zBfxXxOcn4aPds3x
 rWYg==
X-Gm-Message-State: ABy/qLbKInndYVPdUQKbRHWGteLSCLjaXaEGeHZi0ESEbWs+jBpAwiAk
 5TOgUUpOzDczb2shYXg/9nc=
X-Google-Smtp-Source: APBJJlH2t6LvM3rfPgOJFkiOqxs8I29PpPEv4TY2g4fk8qzAa/BBrOgIS38EQ7PpAma2sVL6v4PZMA==
X-Received: by 2002:a17:902:da82:b0:1b8:811:b079 with SMTP id
 j2-20020a170902da8200b001b80811b079mr6462323plx.0.1690464626000; 
 Thu, 27 Jul 2023 06:30:26 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a1709028d8b00b001bb99e188fcsm1610682plo.194.2023.07.27.06.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:30:25 -0700 (PDT)
Date: Thu, 27 Jul 2023 06:30:22 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <ZMJxbrXBeE3WnEUn@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org>
 <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
 <20230726-dreamboat-cornhusk-1bd71d19d0d4-mkl@pengutronix.de>
 <ZME88hOgNug+PFga@hoboy.vegasvil.org>
 <f7849436-8dac-64b1-8ec6-3aced13bee94@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7849436-8dac-64b1-8ec6-3aced13bee94@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
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

On Thu, Jul 27, 2023 at 08:40:51AM +0200, Johannes Zink wrote:
> Hi Richard,
> 
> On 7/26/23 17:34, Richard Cochran wrote:
> > That is great, until they change the data sheet.  Really, this happens.
> 
> I think I don't get your point here.
> 
> That's true for literally any register of any peripheral in a datasheet.
> I think we can just stop doing driver development if we wait for a final
> revision that is not changed any more. Datasheets change, and if they do we
> update the driver.

This is different than normal registers, because the values are a
guess as to what the latency in the hardware design is.

Here is how it works in practice:  Vendor first asks a summer intern to
measure the latency.  Intern does some kind of random measurement, and
that goes into silicon.  One year later, customers discover that the
values are bogus.  Vendor doesn't spin a new silicon revision just for
that.  If vendor is honest, a footnote appears in the errata that the
corrections are wrong.

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
