Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E3B79CE04
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 12:18:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17E20C6B46E;
	Tue, 12 Sep 2023 10:18:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED781C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694513923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oucudl+k5IeCt8bSPR9EAaN7OT3eWorjofAbojhI4aE=;
 b=R+M3OTbgoRS/FWEzI2PIoWTa2TlGEzP3qTGeadw2jkuNRPn22UskZFMS4+4gQ7YLAkqilu
 igyininG/IlcCsxXI2Ox1/ctDOOukmNTT32d5/6uHEM7rInyp8ysEfPinuZlEeeZjGhi+Y
 A0j0yFgJyr/EVCnxmSqj7FGDTDOpgiA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-MZQBOvhTPnepS69Cl8XJpw-1; Tue, 12 Sep 2023 06:18:39 -0400
X-MC-Unique: MZQBOvhTPnepS69Cl8XJpw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9aa25791fc7so48572666b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 03:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694513918; x=1695118718;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oucudl+k5IeCt8bSPR9EAaN7OT3eWorjofAbojhI4aE=;
 b=uNQCHZ2OdATwF855Tm6diNIhxAE1+c9PmiqA5BWfRLwqchgpOy0AZORO5mcKOh8vOw
 HwiH//7ntTGOXXOTUdOrS4eGqYGYgflYr/YCTcTf2tu8c+/NZNDc6YeXxc1Q7bUv5T7B
 PIIrEJbQe9wUM250cKpFVoxmrulb9sU7AFLU68GYYz1tmq2siZ1V0H8oBl5dKjTSVHRw
 ALIjm2guPtUkZoFllV6vcIRRg1ltSAP7OI4C+g4Trv8VBeLbICSr9OyEgIQdha6+jXKk
 +C2ox1DJ7namy0px+OOKy8pOvcUrGrJtC7npbWYG/uslPessmY9atHhRMcD4z8X6smOX
 yPbg==
X-Gm-Message-State: AOJu0YwFkaWzHe3szSMrXrImXU7KQieHLAjFusOz7u9IscV09mZQVDzJ
 y4fQXivp0Qjh4QFypf8Ky0Y5TzJISp1djEso2Yf04j1CCnFhRDqm5mKSgUKUrazsyZusy3rgZhw
 XJkT/rizQBDNV/WWRHK12QFLc7WOKnJ/yFDn1+z/k
X-Received: by 2002:a17:907:971d:b0:9ad:786d:72af with SMTP id
 jg29-20020a170907971d00b009ad786d72afmr2092903ejc.5.1694513918690; 
 Tue, 12 Sep 2023 03:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKwCMgpdBMyoyLEjev3VQygvMbQjCTrvrmIP82YAFTOsxsVft5rlwggdRA/8rvn4uqVVCjZw==
X-Received: by 2002:a17:907:971d:b0:9ad:786d:72af with SMTP id
 jg29-20020a170907971d00b009ad786d72afmr2092894ejc.5.1694513918370; 
 Tue, 12 Sep 2023 03:18:38 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-249-231.dyn.eolo.it.
 [146.241.249.231]) by smtp.gmail.com with ESMTPSA id
 z25-20020a1709067e5900b009937e7c4e54sm6681815ejr.39.2023.09.12.03.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:18:38 -0700 (PDT)
Message-ID: <ad61e3fffdfb899d57307b2bddb2226a084bcb65.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>
Date: Tue, 12 Sep 2023 12:18:36 +0200
In-Reply-To: <E1qfiqd-007TPL-7K@rmk-PC.armlinux.org.uk>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
 <E1qfiqd-007TPL-7K@rmk-PC.armlinux.org.uk>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Daniel Borkmann <daniel@iogearbox.net>,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add platform
	library
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

On Mon, 2023-09-11 at 16:29 +0100, Russell King (Oracle) wrote:
> Add a platform library of helper functions for common traits in the
> platform drivers. Currently, this is setting the tx clock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

FTR, two copies of this series landed on the ML. I'm marking the no-
cover-letter version as Superseded, but please have a look at the
comments there, too.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
