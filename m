Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B32685B98B
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 11:51:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65A4EC6A61D;
	Tue, 20 Feb 2024 10:51:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE905C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708426265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gFms9h+t9TpIytTSNSIgaIkXNbLktX4XDv9i7G5Gsw0=;
 b=F3K/TDw/qmbR6mH4DA2SHGFrR05TAMZuz1WbrggU5jUwtimuEOuZEiQme1VpFDTrq3IoAp
 Id+lcElZw/ah+C/ShWDboo7f8l8S3PCvdCxIfJJyUWaLYn4Hlc15kgMVug2MujmJg4VHg/
 rK6+Tb0QZqdVsrmksCToDaRKLd/LEjQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-3qSmQnZAN-CCVfZhjE0LGw-1; Tue, 20 Feb 2024 05:51:04 -0500
X-MC-Unique: 3qSmQnZAN-CCVfZhjE0LGw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33d1896e0d5so438965f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 02:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708426263; x=1709031063;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFms9h+t9TpIytTSNSIgaIkXNbLktX4XDv9i7G5Gsw0=;
 b=OYYsRnyJ6RKlx87PNQPM9VsQIX+pHz1EQiSZTyNtAuQSBC6WGEfKvuDcQ7zDcfUiJs
 FLpa5a0lSR4EEpI4TsQu+WqbG1LXj9Rm3DPqANurTuCxYqru0/1VDWf2Zze6rv04Jo5G
 7PWDIiLnWzJLgX5F1qkQ3quTijtzmB7WjQV/HseJEH3blaxyg2ifACd746OIDaP8xjLP
 VsTDSJLM1eSg/xgLxWr84fS4FaGtxqBvoDng+iG63TDISqiy9qtM2590AmMIBtYR7QL5
 tjXkFZqd3KHHnneU3PSmUCpCYIoYRY+AQ1OoWI0ImXrT3ZFjN4kIOLqjoi0MyRCX3qW6
 i2fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpOLcmcdoD+zTFD5OWduvpRsDDC5t61EIIXctQbu/gGOLZ8SmAKX0DSBX0k72jY8EGYgr+6OEMjA9JxkRtwbrT88suzAQs8lWimi9GwdOewiHMucVW7m9K
X-Gm-Message-State: AOJu0YykZ7ZaSaGA1YMO+lPBxKfAFW9vP8qGG5A5jgJGWxm3eklisn24
 McROaJkEa9gCih+3fpcRPhn5KqTidzysMpM8UvHC3O6ElO0Suvf5eD0T+IPn56IgFufXDqT8PLu
 1aZsXP2ij+UqLidWJc+w7xE3cudAQ8RdmUxnufU5Rx00Jq3D0weiNTXYYiUVtNUv9eTr31U5yOt
 3/pg==
X-Received: by 2002:a05:600c:510a:b0:411:de28:bb52 with SMTP id
 o10-20020a05600c510a00b00411de28bb52mr10452957wms.4.1708426263061; 
 Tue, 20 Feb 2024 02:51:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUNimcpyY/1g2ysTqT9zw+cZcG1hwdfEtTiZ1zoou2n/DfOAnxjdDcgwvmNuhEROxe5tsv6Q==
X-Received: by 2002:a05:600c:510a:b0:411:de28:bb52 with SMTP id
 o10-20020a05600c510a00b00411de28bb52mr10452946wms.4.1708426262743; 
 Tue, 20 Feb 2024 02:51:02 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-230-79.dyn.eolo.it.
 [146.241.230.79]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c025000b004101543e843sm13958608wmj.10.2024.02.20.02.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 02:51:02 -0800 (PST)
Message-ID: <68a7dbd619a1a609f102a0786c37bc33c24cdbcd.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>, Florian Fainelli
 <f.fainelli@gmail.com>
Date: Tue, 20 Feb 2024 11:51:00 +0100
In-Reply-To: <20240219104025.GM22484@axis.com>
References: <20240216-stmmac_stats-v1-1-7065fa4613f8@axis.com>
 <61bdd802-abe4-4544-8e48-9493a6bb99c8@gmail.com>
 <20240219104025.GM22484@axis.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, kernel@axis.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: mmc_core: Assign,
 don't add interrupt registers
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

On Mon, 2024-02-19 at 11:40 +0100, Jesper Nilsson wrote:
> On Fri, Feb 16, 2024 at 09:13:51AM -0800, Florian Fainelli wrote:
> > So in premise I agree with the patch, that incrementing those is not the
> > right way to go about them. However these registers are currently provided
> > as part of the statistics set, but they should instead be accessed via the
> > register dumping method.
> 
> You mean extending the dump register code to dump the MAC Management Counter
> registers that are not counters?
> > From what I understand it's only the Rx and Tx interrupt and interrupt mask
> registers that aren't counters. Oh, and the MMC control register itself?
> 
> To be honest, I don't think their use can justify the code churn.
> 
> > In either case you will get at best a snapshot of those two registers at any
> > given time and I suppose this can help diagnose a stuck RX condition, but
> > not much more than that.
> 
> Yeah, their use is very doubtful. For me, they only introduce more nonsense
> data in my logs.
> 
> The Rx registers looks to have been added in the first version of the MMC
> back in 2011, but the Tx registers never was.
> In commit 1c901a46d57 Giuseppe mentions the MMC interrupts as something to
> add later (if actually useful).
> 
> So Serge's suggestion to drop the entries completely is actually quite attractive.

Please, go ahead and drop such entries.

Thank!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
