Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D1985C4C
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 14:44:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4E0AC78006;
	Wed, 25 Sep 2024 12:44:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13627C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 12:44:09 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42cb1e3b449so9816235e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727268248; x=1727873048;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Eo83E3rr21/cKLc/zAZGOD/iRD2paKfELWeccpaaQQ=;
 b=TcTtUF4KOXzp4hClo/mQ61hjHVTI2p3or5bN1WCrgw3kkwvJYuhWaXqFW/LoxnJw22
 LsQagbU8kexhwWtkJcHHTto9dFI3m8movI7z+QOx1b8meDINiGRGkG4EQD2U8VNGI01v
 JNOuOcW4DsaIV71cLeTHx9MCDYqaA25fQfrcvO7HqAo2WEOu5DAt5vx2u/XY62WqH2E+
 hdT1/0l2+7tpzEsZ4terJXa+7b5XG34O2N9PdkyRLzOgPNpMdTBwH4WeFGu0qK82gDux
 8N00bz3zI/Y4TiQN86JbIz+s6CBlfao1/ln7MAfKlRzc55Rc4Np/HcdOs3tXNtHAWTbf
 Ry5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727268248; x=1727873048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Eo83E3rr21/cKLc/zAZGOD/iRD2paKfELWeccpaaQQ=;
 b=EQCjyVdmEUdXPSQhILZY+brJH7K/9jkeKZu0d9A6/BGY9nPi3ZHbwBXgh5QYsxejV3
 xjb1RpvjZy7Q6ZSs+F2lDapm3T+O7PpvKwsMkfm9DESZSC+RWbQjrWS3p75ymAJDDPh6
 zQSwxkRawH+Ia4g8qXZMmnrimsclILebfiMx3znG7PKtISwdCxU7X69uzTeoCYsjCvan
 ea4MBVdLZX42Iu+pQ5fxbiWzDVlReh8VLNAa3wKtmbYeLp6tK+mVbqd3hFEvx7jhlRW6
 jApmzO47+OZBZpyoptqPYx3olUNinzwRM/ITmsh6PM/UG/BuQlCKyrX05bK+mQI6pbZN
 dE4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBTZN5+NwuXlJheiS1ya++6IJdnM2oypS2Ap+TmftLYUBuDq5/g0WxptBBTirppgXo0//JBvE5qqtmgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1/CCQrze8OA4GC6hhci/+McC6kC4C7Z6YpshAZbLysSCxx/Mk
 PQ7oKR5jrNybemnWS9FIUwTN3Gadq6Pc0T6ZWsFIENY/JPddiiGN
X-Google-Smtp-Source: AGHT+IFfS7vhUVhrpQ9ElZSkjpzVE5QUA1yIAFxCnd7J6P95GWbU9JMpyPawsb2SPEgug7UuG0NqYw==
X-Received: by 2002:a5d:5f85:0:b0:374:c8d9:9094 with SMTP id
 ffacd0b85a97d-37cc246852fmr1068284f8f.5.1727268248129; 
 Wed, 25 Sep 2024 05:44:08 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d74f9sm1856930a12.80.2024.09.25.05.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 05:44:07 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:44:04 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240925124404.djjy7e4jhovhbwgt@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjcZ-005Nrf-QL@rmk-PC.armlinux.org.uk>
 <E1ssjcZ-005Nrf-QL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ssjcZ-005Nrf-QL@rmk-PC.armlinux.org.uk>
 <E1ssjcZ-005Nrf-QL@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 01/10] net: pcs: xpcs: move
 PCS reset to .pcs_pre_config()
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

On Mon, Sep 23, 2024 at 03:00:59PM +0100, Russell King (Oracle) wrote:
> Move the PCS reset to .pcs_pre_config() rather than at creation time,
> which means we call the reset function with the interface that we're
> actually going to be using to talk to the downstream device.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com> # sja1105
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
