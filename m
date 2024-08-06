Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709F948C09
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 11:17:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23043C7129D;
	Tue,  6 Aug 2024 09:17:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08B7BC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 09:16:55 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52efd855adbso687172e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Aug 2024 02:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722935814; x=1723540614;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sKgoqBj7LDgdK9cgXdjbVyK58ya9Wcnbj0gf678fdiY=;
 b=AnGnSLMGoxRE8wHWGFZbxbaAJr8PjQEAbedH/LSyoeFW+nSWNwSRcosRijXnHsVeAu
 qxNuXnBHkn+XUizga8OBXSFcqVVJ7WkL4xcraSl23nD/phGqcZzQtIdB3VlFLqKfhfsI
 eyI58iodD2jV5j/PbGB2VPVupjOd+6BPMg8IiE7074BP+TdRCtad3ZoxsAK5cwUBXymm
 pMlgxJgsYEv4t6Y4iqutqN/aCO/VclH9w7VOqds+7Dk+Tp+5lNK4nOLcVzbS+6qRZ66W
 D9U1BXVp7TaD8c/lfZVwfeW2meCm0q5ENc4Gz4XgeDpp64dZZaMLf0E0o1vYuLxpe3cu
 AEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722935814; x=1723540614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKgoqBj7LDgdK9cgXdjbVyK58ya9Wcnbj0gf678fdiY=;
 b=mal5lpTDVl1ya6HPzEVcvGKvxrVvGNNd0ih4fbW38A/EUiBcGtGfQ1l14L7ny0Ln4R
 P8SFgZMlHZZce3hnM77yKO29Oi9X9mwsO4qCFTccQbrd4VKbNIPXYbpWNkSSEy77Xv2o
 JQLEAc7eBsTRqweaw+2fvjw6xan0xQ8r/u5MgQV3/ZHmrUlPTjIlVPumBZ4ua3GWQ9Ea
 +RmuAubAtTp0sDbGf+4Vrm2O1Xrkwy5T5Bgc3Gb0D3Al+NoM48ck+c7//uMcdwC4Ah1j
 EwQMcpA3Mzz2XazCqG/1y516eaXdBwhJNnceHhhoUfzHKJoNa0Fb/3RHA0DacYuKkFpn
 l8yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWJXy3eMACXJogcypLsrFXxql/vo9ZIfE7Rd72OoiVI7ThUg66jVo3sJthRRCwXLMWqi5Kug106pthegivKBsVCZdKKOI4FTi5Z+qT1RVfhYBdZHgvVqXg
X-Gm-Message-State: AOJu0YwHnXupOtbM8mbPYW5FSndzA4NLgJIHqqJMJBrlOx812H0y2+8l
 XJdGEil7YPGYm6I7efDcZZ/rF29oD20HcR+U62t/R5ViEd8euy/z
X-Google-Smtp-Source: AGHT+IHTZo7Przl/rVclxgOrc8JseI2RXR0EukFrflIyILA4YgmaESP3m/Bp4UxISHcGTzEdBRVrDQ==
X-Received: by 2002:a05:6512:a8d:b0:52e:a68a:6076 with SMTP id
 2adb3069b0e04-530bb3b42d7mr9535555e87.49.1722935813817; 
 Tue, 06 Aug 2024 02:16:53 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba3527dsm1423441e87.185.2024.08.06.02.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 02:16:53 -0700 (PDT)
Date: Tue, 6 Aug 2024 12:16:50 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <v3iwxjoaitetkrwjlcvc7xbwzybpbcvvcikriym4krurb76p7r@2ekkibfy6cih>
References: <cover.1722421644.git.0x1207@gmail.com>
 <max7qd6eafatuse22ymmbfhumrctvf2lenwzhn6sxsm5ugebh6@udblqrtlblbf>
 <20240806125524.00005f51@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240806125524.00005f51@gmail.com>
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

On Tue, Aug 06, 2024 at 12:55:24PM +0800, Furong Xu wrote:
> Hi Serge
> 
> On Mon, 5 Aug 2024 20:11:10 +0300, Serge Semin <fancer.lancer@gmail.com> wrote:
> > Hi Furong
> > 
> > Thank you very much for the series. I am not that much aware of the
> > FPE and ethtool MAC Merge guts. But I had a thoughtful glance to the
> > FPE-handshaking algo and got to a realization that all the FPE-related
> > data defined in the include/linux/stmmac.h weren't actually
> > platform-data. All of that are the run-time settings utilized during
> > the handshaking algo execution.
> > 
> > So could you please move the fpe_cfg field to the stmmac_priv data and
> > move the FPE-related declarations from the include/linux/stmmac.h
> > header file to the drivers/net/ethernet/stmicro/stmmac/stmmac.h file?
> > It's better to be done in a pre-requisite (preparation) patch of your
> > series.
> This will be included in V2 of this patchset.
> 
> > 
> > Another useful cleanup would be moving the entire FPE-implementation
> > from stmmac_main.c to a separate module. Thus the main
> > driver code would be simplified a bit. I guess it could be moved to
> > the stmmac_tc.c file since FPE is the TC-related feature. Right?
> 
> Thanks for your advice.
> 
> A few weeks ago, I sent a patchset to refactor FPE implementation:
> https://lore.kernel.org/all/cover.1720512888.git.0x1207@gmail.com/
> 
> Vladimir suggested me to move the FPE over to the new standard API,
> then this patchset comes.
> 
> I am working on V2 of this patchset, once this patchset get merged,
> a new FPE implementation will be sent to review.

If the new FPE-implementation includes the FPE-hanshaking stuff moved
out from the stmmac_main.c it will be just wonderful. Thanks!

-Serge(y)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
