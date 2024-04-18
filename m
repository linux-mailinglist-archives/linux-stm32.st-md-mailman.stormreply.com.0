Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2218A9A7B
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 14:57:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FA95C6DD66;
	Thu, 18 Apr 2024 12:57:49 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CA08C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 12:57:48 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d872102372so15397761fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713445067; x=1714049867;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H7TvlJDHh6PM8Lai+72isa4pBtCMtiwvjV7L+/XlE4U=;
 b=ZD4u1Uq39SIE+JkTzsGTRo/jl2dmtGTXORMIxD2Ea2nTyUE+4S7CyDhupY+/1EpX5v
 sHKysfx/csbIPjvZzYaJM3P3Lz1vxomVERhFVryGUSDevep+Sln+dBKZkWbzQ758ufNo
 6B4opLrn8mmhCs7ErJ/v+J5BnQLR2K6bWi3I2NZgoYfi247ozhiMnr448A13FHgLIu1c
 2eYqZTgwP7iBVqwYLx6Is9MMF4IgxTlKdKsWhoX7LiVNsb13ZlLQqTFFRKXIVrgg1Rm/
 Wo/ktezfeMvdH7LQGQO449QAFk4HWUmyJBxgYDUjGq1odv6AV3bMcZd0Ci9j7WIw/geI
 m3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713445067; x=1714049867;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7TvlJDHh6PM8Lai+72isa4pBtCMtiwvjV7L+/XlE4U=;
 b=tGs1/dlNfShOLeaHkZAQ5OJhZht45iq4JZ5fqN26lD2pt+PNZ5ZzqwvZ9aVg1dTgm/
 GqzGgUJ4VR+9wIjNtqxMgFDJbrcDq2Lvc68Nmtr5LwCzTYf8WDHJBXnMbOqwsdBV9wHP
 xb1kV1sYCVrjlrV6NSWtSNhj9GO7P6uK9DeD+JMfitn7ikgfzPOC+EIvxCqvRTZcPC5r
 2rE0wLpLOHgHO57XpMn0RkB6W9KJ5myA8I5zaz/eG3H0GgcbmOn5oVoHjmbUam7+zHyb
 kRDMsWZsbLu1xsy8cnS3KQbHcZPCH8+114lQhgS1MM6626cQYTHCsYebwwa0nB7G1YCO
 DohA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6kEYzp+jcw/63QPaFbG95TM7I3Q3EH7YFUBFZWaJOcKD2+yMf2JecHsfY6ltJO6M9jskeyF6dKf9dQ52ice6aNyMww/4AfBj705iKoFw8ngsF1jYT3jgV
X-Gm-Message-State: AOJu0YyQrL5IFZvXhCEYvNChQ3XWVIQh71UaCClC9sN+YUG96/L16jlN
 sI+oT5s6oBYRuW7zwOoYacaDpfh70F6LBhrCAOVjjpFDZmW9kNdg
X-Google-Smtp-Source: AGHT+IHfKLq2UzaMXO/4uNIuhb8wjwhcxG7kZvjOwkPLDKwcLA+nxELTBqKKXudYnYTNlpQpw0rHVQ==
X-Received: by 2002:a2e:9f17:0:b0:2d7:1a35:d580 with SMTP id
 u23-20020a2e9f17000000b002d71a35d580mr683715ljk.15.1713445067067; 
 Thu, 18 Apr 2024 05:57:47 -0700 (PDT)
Received: from mobilestation.baikal.int (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a2eb5b7000000b002d88804b368sm190667ljn.43.2024.04.18.05.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 05:57:46 -0700 (PDT)
Date: Thu, 18 Apr 2024 15:57:44 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <eqfta73ost45nbzz3aoa2tw5tasg3geehf4fgphu4teq5yfvar@ngif2e6j5j2k>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-4-ab12f2c4401d@bootlin.com>
 <xp34tp5cjmdshefxjczltz2prqtiikagfspf4lobznzypvsyah@ihpmwfynwzhh>
 <232e3b0c-ca55-2da0-1c9f-47520a1bcfbd@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <232e3b0c-ca55-2da0-1c9f-47520a1bcfbd@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/5] net: stmmac: add support
	for RZ/N1 GMAC
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

On Thu, Apr 18, 2024 at 01:57:47PM +0200, Romain Gantois wrote:
> Hi Serge,
> 
> On Tue, 16 Apr 2024, Serge Semin wrote:
> 
> > > +static int rzn1_dwmac_pcs_init(struct stmmac_priv *priv,
> > 
> > > +			       struct mac_device_info *hw)
> > 
> > AFAICS hw is unused, and the mac_device_info instance is reached via
> > the priv pointer. What about dropping the unused argument then?
> 

> Unfortunately, this is an implementation of the pcs_init() callback, which is 
> also used by socfpga (see patch 4/6 in this series). The socfpga implementations 
> use the hw parameter for both pcs_init() and pcs_exit() so I can't remove it.

I had that patch content in mind when was writing my comment. There is
no point in passing the hw-pointer there either because you already
have the stmmac_priv pointer. There is stmmac_priv::hw field which you
can use instead in the same way as you do in this patch. Here is the
respective change for your SoCFPGA patch:

+static int socfpga_dwmac_pcs_init(struct stmmac_priv *priv,
+				  struct mac_device_info *hw)
+{
...
+
+	priv->hw->phylink_pcs = pcs;
+	return 0;
+}
+
+static void socfpga_dwmac_pcs_exit(struct stmmac_priv *priv,
+				   struct mac_device_info *hw)
+{
+	if (priv->hw->phylink_pcs)
+		lynx_pcs_destroy(priv->hw->phylink_pcs);
+}

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
