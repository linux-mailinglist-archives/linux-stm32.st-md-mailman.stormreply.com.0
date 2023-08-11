Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3629C77866C
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 06:14:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE5DFC6B468;
	Fri, 11 Aug 2023 04:14:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF92BC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 04:14:30 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1bda9207132so8769345ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 21:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691727269; x=1692332069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSR3Q04lK59tiGJay4SkNer8bq6qRzC22OcRjYST5Xs=;
 b=ixEv7OnX4jkE2gbNOieRXO69/GTH7zq/og7zqDIWbH+/gw6jP/MwDbdgnV45z35rsg
 W2/laVoakXArMI3jrZ/2W4BUrRjZljKaPvgZ5W2DI9HirG2WJ4iaYLvV65qV9jjpfM5Z
 jGZ6RVsQHERM9SswkODBO3BebWfrDrCMvhNIVC8ar4fH6xHv6d3Fj/6pqm9w/4MbVNda
 DV5LsjHSN7CUM6jFD2vavZRqs6ycrNrn1H/UsM/6YyvM5mvOyMIJ2E+dRxeSkgAnPMbC
 z2zPQ6t5HeSBwB17brm2ECR42uRHcWIUPUgubjJumA2T+M8C6x8BmPTxVthOEgeBHNm9
 EviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691727269; x=1692332069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSR3Q04lK59tiGJay4SkNer8bq6qRzC22OcRjYST5Xs=;
 b=BTPeMiXgTfs9U+u81kJpo4BEvqRNAJYnDtcv5ot5lj3Rl32v0a49gx+ZKsxmdBVmr8
 g1bJHuSDBSUmS54mliseOSF7nw6mk7V8uidjoXd6naTv4ovpn063KKqaNO9o3vGfYG6N
 ASXCsZXXCTR3DnhoXBdHY8S0D586fN8B48Z0firFi2/g8Gs4674FN/2wFYhOkw/LZKH7
 n0QrGfruJ3zumvfaFx/ftz8LLFsS8Z5jMOZILXB6NlPKcGthvDDTZeqStMu0cIX9O6O/
 guPZk+qSquPLl94nbj6u6jrji38YakAYbi9BnJSp15s5oC4fi4666mB3YJg4FQqPxzHT
 D2oQ==
X-Gm-Message-State: AOJu0YxlvcDaZVY1At4+/7fc40ovtzjYam8isrwIopIzENg1hkza9Ca2
 We5ge2MSuEbKaWnF9VeZzxs=
X-Google-Smtp-Source: AGHT+IEOhiTP3OqfDr24GR4MV2Zif3y73zLGJn4lAgQ4UFvuftuROMI632adJdSQEy0ThczGN6Em/w==
X-Received: by 2002:a17:902:c409:b0:1bc:6c8:cded with SMTP id
 k9-20020a170902c40900b001bc06c8cdedmr1027879plk.67.1691727269271; 
 Thu, 10 Aug 2023 21:14:29 -0700 (PDT)
Received: from localhost ([198.211.45.220]) by smtp.gmail.com with ESMTPSA id
 r2-20020a170902be0200b001bb9883714dsm2626522pls.143.2023.08.10.21.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 21:14:29 -0700 (PDT)
Date: Fri, 11 Aug 2023 12:14:20 +0800
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20230811121420.00007a95@gmail.com>
In-Reply-To: <9b9635bd-2635-4115-bafb-8a07573c6556@lunn.ch>
References: <20230810095929.246901-1-0x1207@gmail.com>
 <9b9635bd-2635-4115-bafb-8a07573c6556@lunn.ch>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: dwmac4: extract
 MAC_HW_Feature regs MSB first
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

On Thu, 10 Aug 2023 15:59:25 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Thu, Aug 10, 2023 at 05:59:29PM +0800, Furong Xu wrote:
> > The bit extraction sequences are a little messy.
> > No code changes, just reorder them.  
> 
> How is this substantially better?
> 
> If bugs are found in this code, your change is going to make it harder
> to back port the fixes to stable kernels. cherry-pick is unlikely to
> work, it will need a human to look at it. Not hard, but still effort
> for somebody.
> 
> So i think there needs to be a clear benefit to this, and you should
> mention the benefit in the commit message.
> 
>     Andrew

Hi Andrew, Alexandre

In Synopsys databook, the description tables about all registers
start with the MSB.
So we can read one line code and then check it against one table row,
and goto next line of code against next row of table.

I agree with that this commit make cherry-pick less compatible.

If the benefit above is not worthy enough, we abandon this commit :)

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
