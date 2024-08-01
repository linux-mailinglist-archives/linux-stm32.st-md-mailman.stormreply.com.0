Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D744E9454EA
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 01:29:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC90C712A1;
	Thu,  1 Aug 2024 23:29:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 044E0C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2024 23:29:41 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-428163f7635so48838335e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Aug 2024 16:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722554981; x=1723159781;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S3baeMLXbo97d1fQpSkYNhS6zDdUNnQMvWphkjrQSd0=;
 b=KHsmPc3yI4qN4Jv/cISAbd4/Su1DgCcVt9hONuvFNsmYu89RmZbAS+1HM1jdEJ7TuK
 phC8R9gOvYzIBIYG23Gp/D4kOngVAmovzXjvjRFSKlnCCrnQHG8BeOiZpDjIOG9/0wEN
 6pyAtEiDuPj16/NAHVyJDT/ygKgaeWOIFF68XazLL9l6UqL0ByWh4MKIwp+hQbsJ5Cns
 m1H0RKNp74PvaDv7E9A4twISlqSsMt1Xsb5STQFLkrIIx2fJKV117iS80CzpJ5AxYMD1
 N6ARJPFQn6eNtz1keYGPdZy99l/eq5zly/Pq1q0mttWdPaY5/29HvDixisOntp+g0+Az
 FG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722554981; x=1723159781;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S3baeMLXbo97d1fQpSkYNhS6zDdUNnQMvWphkjrQSd0=;
 b=KdHn0LswePxR+331E6FOzjPutjkS+rFuzfxKtDTdh91Xw7GHChGi4XiOV8vqsefjPK
 QPWhXYL1XJlgf1qbFNXcRIHMlIvZwyWS+0BjNQmJDG5XSjxIWNa6B1BMea1fj5NBJLnu
 sRarRJdD//Hy5ggCq+NA/nunnhcOwGY6O65ssAH6uifRNqGLGAcimKlBEiSM133p7HCs
 l4OPv6qI0LtAA1ww2tkCaapVPNnppCdj5iwlSVc5X2SvEyKmMgto7tgSSB2bbEvbOo7b
 olNN1T0DVYMVpd7AigT/fFbuzTb9ioXlPUlHg3A3+hBrPHt2eSI366BXRnze4KRYcdMb
 7vWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTgoWmQf6RymfHhjGuc7X11HWyE2JBoF0EtmR6vX2geDaXjqqBP3+2gpDbEza0MfYBaiMyYYmk6Kjsps5TxUabl2bl0QJj4F3YnVQsGBHrxldh5oM4VO0Z
X-Gm-Message-State: AOJu0Yxu6RPX9/7ONKNyQgGj/LyJoLtYiVADUn3vvqFLX2S07Lo4rRgy
 TIAMF1efJOdP9dnpNYU4QjjU+mNDi4AoIyGn7Jk4GgUmNyR0rAtp
X-Google-Smtp-Source: AGHT+IEXPX9rm3NSZIOdjCpUZ485555yJ5pLnsoYLHKaq0ewcpvvtEm0zfRMxyNx/9QoeYLEy/Qyng==
X-Received: by 2002:a05:600c:3587:b0:426:593c:935f with SMTP id
 5b1f17b1804b1-428e6ae27f7mr9961945e9.1.1722554981158; 
 Thu, 01 Aug 2024 16:29:41 -0700 (PDT)
Received: from skbuf ([188.25.135.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e9cd4esm11200035e9.44.2024.08.01.16.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 16:29:40 -0700 (PDT)
Date: Fri, 2 Aug 2024 02:29:37 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240801232937.rmkv3er5cc2lykwf@skbuf>
References: <cover.1722421644.git.0x1207@gmail.com>
 <cover.1722421644.git.0x1207@gmail.com>
 <4603a4f68616ce41aca97bac2f55e5d51c865f53.1722421644.git.0x1207@gmail.com>
 <4603a4f68616ce41aca97bac2f55e5d51c865f53.1722421644.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4603a4f68616ce41aca97bac2f55e5d51c865f53.1722421644.git.0x1207@gmail.com>
 <4603a4f68616ce41aca97bac2f55e5d51c865f53.1722421644.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 3/5] net: stmmac: support fp
 parameter of tc-taprio
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

On Wed, Jul 31, 2024 at 06:43:14PM +0800, Furong Xu wrote:
> tc-taprio can select whether traffic classes are express or preemptible.
> 
> After some traffic tests, MAC merge layer statistics are all good.
> 
> Local device:
> ethtool --include-statistics --json --show-mm eth1
> [ {
>         "ifname": "eth1",
>         "pmac-enabled": true,
>         "tx-enabled": true,
>         "tx-active": true,
>         "tx-min-frag-size": 60,
>         "rx-min-frag-size": 60,
>         "verify-enabled": true,
>         "verify-time": 100,
>         "max-verify-time": 128,
>         "verify-status": "SUCCEEDED",
>         "statistics": {
>             "MACMergeFrameAssErrorCount": 0,
>             "MACMergeFrameSmdErrorCount": 0,
>             "MACMergeFrameAssOkCount": 0,
>             "MACMergeFragCountRx": 0,
>             "MACMergeFragCountTx": 1398,
>             "MACMergeHoldCount": 15783

In order for readers to really understand this output (including me),
could you also post the associated tc-taprio command, please?

You deleted the code that treated the Set-And-Hold-MAC GCL command -
and according to 802.1Q, that is the only source of Hold requests.
I _think_ that as a side effect of your reimplementation, every time the
gate for TC 0 opens, the HoldCount bumps by one. Would that be a correct
description?

The more unfortunate part is that I haven't yet come across a NIC
hardware design that would behave completely as you'd expect w.r.t. Hold
requests. In the case of DWMAC, I would expect that with a taprio
schedule that lacks any Set-And-Hold-MAC command, the HoldCount would
stay at zero. I'm not sure, given the way they piggy back onto gate 0
for Hold/Release, that this is possible :(

At least HoldCount stays constant with a tc-mqprio offload, right?

>         }
>     } ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
