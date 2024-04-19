Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FEB8AA89B
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 08:46:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30203C6DD66;
	Fri, 19 Apr 2024 06:46:54 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8D1CC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 06:46:52 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-de4bfdb606dso44201276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713509211; x=1714114011;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XbSzBtnw4hgq7px4JzzkDwNDE3yBxvZABkHTmlQ2vAA=;
 b=G7PoyKset9W8iogrJYMGbKBLky8UzmrCS2fLNOpMrUAnvclYcxoQEA35JrXMnN5bFq
 aheChY9m7xVRKuKKTj3+3SJZzFgJ1umeQgOooSF/RUHjhzTrPgW6YzPljN+iIuARazBb
 wctF4v41boVvxLmrnhSewSC2MIr4+BYjM7dHIBgihCmYH4RynMzS8p/C/yEnHFVkAkbW
 4Lh09tY/wC93iO3wQCeuE4Vi0Hl6E3nlCIE15ULFHvEfW+4NSRIIQEZz/TlcX7whDeKv
 F0iMqF8zceWEhnbqlBJFy4cD8i//gHKcV7vcQWJGJOblJpPbm9LL+rXLPUxPOQYaL0zH
 L83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713509211; x=1714114011;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbSzBtnw4hgq7px4JzzkDwNDE3yBxvZABkHTmlQ2vAA=;
 b=lo5x15bcMdcg93p0BGLIoHr3s4LNIfHb/bbOGw/HvVQIwaWvFW4KumuvuamxMejjWk
 NzTkysl6Cq1euSzP7tDhobPOc9NNev22ixCF7SQtFdw3jqaU5WTkE8tbGi6BE6Kv3CU5
 UzD8HsuhQqQ27RQKhsKfsGJQRZ0qA9Kc+npVrwJJxiQ/C3MOSOhmBEL5QPh4yzjNSuzk
 OYyUVd+vMoQpTM2VBaqSO0zQbZALl92tp982yQeirB+FMW6yeTPG7W4mzHbmW5eGD8vQ
 L9QmnIvoa0pLoh0rWANAo4ESpPwYsQzHAi/BGQ6gsMzZrs41h/lArkzGPoEOZ7h+g6tq
 +kZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCQMoX91ffGG7QQbI+2Ac8Xpz1daGaQAmfI4SAqyxgf9Ut0aKEEOW99/tUfIc2jAWutq4qgcqQnQG8cBMdekTcaS34G66vrYfQqAPe7Lr6o/+65/QWgoPv
X-Gm-Message-State: AOJu0Yy2495/C87ydhYoNdatB4erQtk7VmcwzgyxltHKqgk6OhhQJikF
 Flver9w6glckrajwB/WLPkHtJYkMBoYnBi1TuJlzKmpqcMhRDh2Y
X-Google-Smtp-Source: AGHT+IGLlCfPF0PKkwCVFiCiRzCfoD021zL84oexxmQJIgFwc875Wlv9wzHYbxGcRz0ExGpQvo1mlg==
X-Received: by 2002:a0d:fb06:0:b0:61a:fac1:b045 with SMTP id
 l6-20020a0dfb06000000b0061afac1b045mr792092ywf.3.1713509211428; 
 Thu, 18 Apr 2024 23:46:51 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a0dcd45000000b0061b04dd1806sm666269ywd.50.2024.04.18.23.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 23:46:51 -0700 (PDT)
Date: Thu, 18 Apr 2024 23:46:48 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZiITWEZgTx9aPqIy@hoboy.vegasvil.org>
References: <20240417164316.1755299-1-o.rempel@pengutronix.de>
 <20240417164316.1755299-3-o.rempel@pengutronix.de>
 <c8e3f5d0-832b-4ab1-a65f-52f983ff110a@lunn.ch>
 <ZiAtREiqPuvXkB4S@pengutronix.de>
 <b44a4aee-f76f-4472-9b5c-343a09ed0d33@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b44a4aee-f76f-4472-9b5c-343a09ed0d33@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>,
 Arun Ramadoss <arun.ramadoss@microchip.com>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, UNGLinuxDriver@microchip.com,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 2/4] net: phy: micrel:
 lan8841: set default PTP latency values
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

On Wed, Apr 17, 2024 at 10:23:07PM +0200, Andrew Lunn wrote:
> I suggest you go read older messages from Richard. It was a discussion
> with Microchip about one of their PHYs.

My 2 cents:

User space has all of the hooks needed to configure corrections for a
given setup.

Hard coding corrections in device drivers is bound to fail, based on
prior experience with Vendors not knowing or caring how their products
actually work.  Vendors will publish value X one year, then delete the
info (to avoid embarrassment), then publish the new value Y, once
customers have forgotten about X.

So, prudent users will always calibrate their beloved systems, not
trusting the Vendors to provide anything close to reasonable.

Ergo, adding new magical correction in a kernel release causes
regressions for prudent users.

But, in the end, that doesn't matter, because prudent users are used
to being abused by well-meaning yet misguided device driver authors.

Prudent users are wise, and they will re-calibrate their systems
before rolling out an updated kernel.

After all, device driver authors leave them no other choice.

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
