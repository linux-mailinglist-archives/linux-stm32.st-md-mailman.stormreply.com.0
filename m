Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EB294888B
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 06:55:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24C35C71290;
	Tue,  6 Aug 2024 04:55:47 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B886CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 04:55:39 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2cb5b783c15so264636a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2024 21:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722920138; x=1723524938;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=85q65meJHydsbw2SpNer02iCevJGYGCAkmgA8yKAoQk=;
 b=Pgll485P0W7XnhBPjWSSeoOkMVtFa/QRZFqZEPi1e/IWiiE/G66odKkKD8ObG7v6Ws
 Ws6TSBII9P2Mfg1/OekrAQmT6TpAE7hYxMynGsgSOTEQJWqG9IgL/pR+ZI7pJK0lHJDp
 0cvAGy+8mr/LV/A5dB0Cj/Xd5QiC0PrppkozHb7a6RpUJ2hwnj5gpZPChaIJWJdqIzNG
 7OVWWhkMJNQNQrnFyddAu3/oeMxWiAo9cwJ1drPIrrBD6f+Yxr6TgvG/po+7TsRS3XBm
 1J+o7I4gzeEqCoDKPe1wwtY+Ll85mZzDo9YRpsvG6Vt7XbkzGgbBN4RONKb0OEaNHSrI
 /Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722920138; x=1723524938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=85q65meJHydsbw2SpNer02iCevJGYGCAkmgA8yKAoQk=;
 b=etGtA7IG6DONHsqTwrV0vbw7sRWKFwlwGV0VKsoH2N28pmHvQWJTfQd1j9KO2hKpmX
 kQdLntWP7sU8EbW4+NtLbK5BrbVXOVkjxCd/xpLVLTUmzP4STvIY+44IdGn+/D28jlU4
 jU6vM+afHcUlgZPRzQbzYBxPLrHEnuW/yjTxt5HA3G6GzvSTR9u50vYKv3OenAml4kZP
 DryIh2H8WYveO/583OkKI7wqMVnqccRyh2/9Yq3FHzDhiCrpo+esx9gzFZ27EVtLdwQd
 p/OKzNzLjPtvcNa7l5wiHSM0mPhkDTTKN6e+wP+YGv+KfdXN3Sr+wBvFGJmwBkEdy3+X
 sRfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT1DyhdBU+5x/VgP9jSIrw4+nLWnfWQy+quYH5pknicvVmsLbiyM/qtn1mEnAS0udXnvI+dWbrb3o9pg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywdp1DkMF1QC3EQdR5MgwILHn9IzX1Y39mJQbEksJ8NSS+lRvMW
 3+Zj6RXW+AcnP7Zona62/m4CRM273cyRnqr1PenjbZfVwVeTSZWN
X-Google-Smtp-Source: AGHT+IG9oatnH1xHVkWpI886BnKzAhj9hlfqXwSP17RhqetcsZVbRZp41LdrRYdy6alY4pR/K0sltQ==
X-Received: by 2002:a17:90b:1094:b0:2cf:f3c5:871b with SMTP id
 98e67ed59e1d1-2cff93d40f1mr16111394a91.6.1722920137930; 
 Mon, 05 Aug 2024 21:55:37 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cffb36bd3dsm8080980a91.36.2024.08.05.21.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 21:55:37 -0700 (PDT)
Date: Tue, 6 Aug 2024 12:55:24 +0800
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240806125524.00005f51@gmail.com>
In-Reply-To: <max7qd6eafatuse22ymmbfhumrctvf2lenwzhn6sxsm5ugebh6@udblqrtlblbf>
References: <cover.1722421644.git.0x1207@gmail.com>
 <max7qd6eafatuse22ymmbfhumrctvf2lenwzhn6sxsm5ugebh6@udblqrtlblbf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 0/5] net: stmmac: FPE via
	ethtool + tc
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

Hi Serge

On Mon, 5 Aug 2024 20:11:10 +0300, Serge Semin <fancer.lancer@gmail.com> wrote:
> Hi Furong
> 
> Thank you very much for the series. I am not that much aware of the
> FPE and ethtool MAC Merge guts. But I had a thoughtful glance to the
> FPE-handshaking algo and got to a realization that all the FPE-related
> data defined in the include/linux/stmmac.h weren't actually
> platform-data. All of that are the run-time settings utilized during
> the handshaking algo execution.
> 
> So could you please move the fpe_cfg field to the stmmac_priv data and
> move the FPE-related declarations from the include/linux/stmmac.h
> header file to the drivers/net/ethernet/stmicro/stmmac/stmmac.h file?
> It's better to be done in a pre-requisite (preparation) patch of your
> series.
This will be included in V2 of this patchset.

> 
> Another useful cleanup would be moving the entire FPE-implementation
> from stmmac_main.c to a separate module. Thus the main
> driver code would be simplified a bit. I guess it could be moved to
> the stmmac_tc.c file since FPE is the TC-related feature. Right?

Thanks for your advice.

A few weeks ago, I sent a patchset to refactor FPE implementation:
https://lore.kernel.org/all/cover.1720512888.git.0x1207@gmail.com/

Vladimir suggested me to move the FPE over to the new standard API,
then this patchset comes.

I am working on V2 of this patchset, once this patchset get merged,
a new FPE implementation will be sent to review.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
