Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D7985ECA
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 15:43:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A02F3C78006;
	Wed, 25 Sep 2024 13:43:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE973C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 13:43:41 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42cacd90ee4so11131065e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727271821; x=1727876621;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uHvDwBZzI4wRaMBB4iym1ztBubtpy+b9V7vHZYPrE5I=;
 b=cTZQewKjpV1e2OM8a4T2a9ewc8C3dmmTpnu/Y23GW79k8WmxFRhVD5rA9Klc1s66Sm
 linHTod3XW0VekqqdVs/AnMNSBbAQOXgWkrPLOlk3dxIr9SLB/3KsZ0h8z7z4g8yObP+
 RyygpY0/25JcHIfvgPXJRBlu5rDb8Rh0noNGDVg1YgINKolOxDQMoDPao/cy1lTHeX+E
 fOD+Vc/Y5zDWy1SNqIlLeI1RCxH7odiz62DQSDGMLJYldI5Zxpuc4YqRx1txpNUCe1pR
 nxffEBx8ldnjFAQ/jcq2Lq7An3gTLBirXpmsWAoOIynU4jSqr0omFihA3LJAKFUss+wC
 y15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271821; x=1727876621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uHvDwBZzI4wRaMBB4iym1ztBubtpy+b9V7vHZYPrE5I=;
 b=mIHU6gV4AOV7OKJHLBKsOBBKnShIBlJzO46HAFLYa6RFln0gn9r3wcnE2TI0hs/iT9
 siM4YsHpTGCu4Wts2Ro03lWNvL2/pGThd75chNWga113sfEKd/dTpR2TRKoWbtZS4WeL
 RzB67ZyKQ2qlgQoB0mfggijPOnTjlrUykha77YSwsjFKsn4Xn0aTY0vF+ejenMZzXiWp
 3xxJwkXzl9IPxQf7Gn7BMwdLWcxTf+CjN/y4fot3ZiV2B7IG9fGgucsYdQhew4X2klko
 HlTsv3OmOflM2zT5gw+oWTby/rUnbj01RCLpO1NWMbCUVAKfxeDwpwlRNmV/XY/E8Xhx
 U+9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHCTM8Nn35xgNTs8SSEuvdTm4JSo9iOEyddOB9XLa1dRm/uNIeXwEAGA3B9GyHg/Fdrb5R9mR8QRiyWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzah7jxP+muidzMe1U0AndGlDw1Rsa0B+YonlXDkwSr0xjYwCk0
 LPxqcoxcCrbHJgv7YmCDdexobtpEoxqZbF+mrtlcJBSKmWtoNYhx
X-Google-Smtp-Source: AGHT+IHmnVWjsS8xkdZZ7T2bxRduY3ggznHkuYE5rMeBgUZ+UEHsPUYheF24v3Oz1tufHagTFvs72g==
X-Received: by 2002:a05:600c:3c9e:b0:42c:b8da:c79b with SMTP id
 5b1f17b1804b1-42e96144caamr9214525e9.5.1727271820933; 
 Wed, 25 Sep 2024 06:43:40 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969a48fasm19531535e9.0.2024.09.25.06.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:43:40 -0700 (PDT)
Date: Wed, 25 Sep 2024 16:43:37 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20240925134337.y7s72tdomvpcehsu@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC 00/10] net: pcs: xpcs: cleanups batch 1
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

Hi Russell,

On Mon, Sep 23, 2024 at 03:00:26PM +0100, Russell King (Oracle) wrote:
> First, sorry for the bland series subject - this is the first in a
> number of cleanup series to the XPCS driver.

I presume you intend to remove the rest of the exported xpcs functions
as well, in further "batches". Could you share in advance some details
about what you plan to do with xpcs_get_an_mode() as used in stmmac?

	if (xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73))

I'm interested because I actually have some downstream NXP patches which
introduce an entirely new MLO_AN_C73 negotiating mode in phylink (though
they don't convert XPCS to it, sadly). Just wondering where this is going
in your view.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
