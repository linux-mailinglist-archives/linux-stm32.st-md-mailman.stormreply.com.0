Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D878B1E14
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 11:34:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9382C7128B;
	Thu, 25 Apr 2024 09:34:50 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA75BC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 09:34:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-516ef30b16eso839776e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714037689; x=1714642489;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vnD0omPzrWfWLdKhFymv2hUrXX8nXsK7L5p1vlVD4ng=;
 b=CKM3BO21hFWGB4kasgA8DhILn92kY4rvcNJhKXzwusSAScnoTlVQIiv9CcOFcmwaFJ
 4vS5hEm+G0szIwECmo/0rfsb8JQcxHGBodbWqjdFjpmuhCSFJU1hiDbyWpQ++rdEs/62
 2kaEx/gdn2greC//4SL2XZZppqfwUD9FvvpixPbBLSBOdq71uIr8cDRdFgoERKjp7V5L
 uwd5LZOusREL2h3xB3Yz0PShl5fFVPTYUDduJFcLGxTnWdGjuiubpqt67wqjuAeRmH3+
 g7KCtYpcHJn0ZRi8B2Fx+u1FVBcoDVZxJ3DEyW7wWyel4dmOP3SHMrp99LLZRZsIlWqt
 Z0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714037689; x=1714642489;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnD0omPzrWfWLdKhFymv2hUrXX8nXsK7L5p1vlVD4ng=;
 b=PDbndXkBDV1sXJwlXo+DafyyaIZwKMzuCA1/rNFzM1sOesp9H+IFNWodbF00WY6mYU
 nEUWATEURNkf5FcTdSfR9ZBAWZTIPaGdfK7dmgzUHrcnvQfTJTStiRajv0EzuC2COR4P
 ppEJc73LV0lQWgMeiumKzkzpdAxHg/G8gcjZVehczeBWkjlQwoayuXXXMEdP9tjUo8Kt
 WxmsOz0w1YL7hyM+mOwZiBMvZGI7uxur/uQgjcB1RrxwylcTaauDwfg0hyEG0++DJZ9+
 xZnLUmDYWQmji2q4P0z6w//VV2XGdy6lwZbDugl1dphYszMw1bdM1RGHRlh1mQjXODH8
 MJ2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBIKWIJlL1T0vPqNPLkZizq9BoQgWkXHfYxDkm5KSPvpRn63oLfwv/UEna8WLh+jMBMWSCLaOzfYm3FwpPe2Wg30DrsQpf7ExTukpTR7noMiDv71Nx/nL0
X-Gm-Message-State: AOJu0YxcXN7+TC0eUC1WMT8MNDvQispCk+g+dgC1g981lbh3s64ylVlw
 wz+XRE/aEl6YP5+C7ijmykier8zkNFG2Or9g+hesOBKGl7O3YlmZ
X-Google-Smtp-Source: AGHT+IHYgtPbcyGjxp9azAySSkNvUGJnVnuEhRmauc3oUtMj9W3wY74hlU+ZsIlNOYoIINrtLKKkoA==
X-Received: by 2002:ac2:598f:0:b0:516:d0e3:9275 with SMTP id
 w15-20020ac2598f000000b00516d0e39275mr3345368lfn.11.1714037688538; 
 Thu, 25 Apr 2024 02:34:48 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 fc21-20020a056512139500b0051b0703a923sm1545727lfb.131.2024.04.25.02.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 02:34:48 -0700 (PDT)
Date: Thu, 25 Apr 2024 12:34:45 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <a2ste62mw6nxfnaptv4gossylrrahplyh3e3bwsy7ayoohpts7@hdfrjctclbbm>
References: <20240424-rzn1-gmac1-v4-0-852a5f2ce0c0@bootlin.com>
 <20240424-rzn1-gmac1-v4-2-852a5f2ce0c0@bootlin.com>
 <qf637dtkakxbumefbei3qrhbpyxgerjwn72ixp5xh6mc6yjbda@6z6tm6hk7fki>
 <27279f1a-e718-a8cf-ecfc-40f45bf6c500@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27279f1a-e718-a8cf-ecfc-40f45bf6c500@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/5] net: stmmac: introduce
 pcs_init/pcs_exit stmmac operations
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

On Wed, Apr 24, 2024 at 06:33:30PM +0200, Romain Gantois wrote:
> Hi Serge,
> 
> On Wed, 24 Apr 2024, Serge Semin wrote:
> 
> > Once again. There is a ready-to-use stmmac_xpcs_setup() method. Which
> > is currently intended for the XPCS setups. Let's collect all the
> > PCS-related stuff in a single place there. That will make code cleaner
> > and easier to read. This was discussed on v3:
> > 
> > https://lore.kernel.org/netdev/42chuecdt7dpgm6fcrtt2crifvv5hflmtnmdrw5fvk3r7pwjgu@hlcv56dbeosf/
> > 
> > You agreed to do that, but just ignored in result. I'll repeat what I
> > said in v3:
> 
> Yeah sorry I took a quick look at your merged patches and thought that 
> stmmac_xpcs_setup() had been repurposed in the meantime, but it seems like I was 
> just confused about that.
> 
> > It doesn't look as that much hard thing to do, but will cause having a
> > better readable code by providing a single coherent function for all
> > PCS'es.
> 
> Sure, I'll get to it in v5.

Awesome! Thanks.

-Serge(y)

> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
