Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A0092CC58
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2024 09:57:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66AD0C6DD72;
	Wed, 10 Jul 2024 07:57:37 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD68AC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2024 07:57:29 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1fb72eb3143so4096255ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2024 00:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720598248; x=1721203048;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jL3xB5qZUeDvQW0Bt9eHIWR5Sgy7Fo6pxuuDb821234=;
 b=SYfgYHxgqax+Tm6X86YEZwA2PDsC4aNT0wJPbyL9CPmnccUJ5VkJz0XNGSkXKvmJAp
 tavEtZv64YY1Rb/bhxpvKM1V7hUfQxW8v3GKC7lbluD+od1eawEsW7zV4vcbsgO/u8w4
 GEY3gcyV3/YICzuPnuoqoy7lOzuEraTTZR+TabusM+TPgDGEU+J/VMMx19X9OGOKa/xh
 4QtygLEsSTqyJn8Y+9KNlbMK8Zlz6EOU8Qd8JL1sr7S2lZ8kJCZRSqCIfj2+Z6P4PiIk
 4Nzz+yWERPonb2EY2uSTBNdE0N5OOdZkiI/J7Cibn3+JWhTtn9NCB/06GYr/+G318c1Y
 GwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720598248; x=1721203048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jL3xB5qZUeDvQW0Bt9eHIWR5Sgy7Fo6pxuuDb821234=;
 b=ffXW1DE0rfEzwd2PN7cxGTM6ZL2gsQ/ZmxQ9Cl/mJNfTfhj8cUUPwUgCv2WvoBTxn7
 diJlDZuBI91TNJwta8nAWCwX6BqMrVyxxytMyb23dCIy+V3OV+D0NOOxTnv15PxEAAx2
 fJW0qwqIr6E3OlmM2X2qzlIiHR7hml9R7lmY6lFq9IwSgjHKyxgcwzIfkBl/ZSQT7LJ3
 elyvyWss+1WIMwVAhIFwa3NjSoeYrGfbEtMaTbd9axkg/BHrnuX8E4W+No3NxWsxIHFp
 grcdvo2+AmipcR9Sbo7V2eZtz5A09ikCBY359fSLs2Xv2Lizu7jpYG6UZmf75OVwRsr0
 x6og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxa4wg3IxjHlD7OkjM4Uv4nabcOQZY7NoPCvAg44QvNfdaogAZwam0ghZ1j3AJWFY9OmrYqyZVmpPVx+Y/y/FdQHlePCNRwd0L1WgOqvR8LWbm6KvqZ8i3
X-Gm-Message-State: AOJu0YxJ4OpPw1VOOcW1Vj4slG5nGmaXFY2QFafcLDFDHQ8BLfNx7H+G
 a7EN3wc+mlC9sYqClpDYoGdljmHBcm6DfeMOsuKAPPtvjbLE8bq2
X-Google-Smtp-Source: AGHT+IEuKjHd15gR0P5vFk2U3b61+gsTLHqlQVreOnbUjVAf1fwZQtG7Ac4RBBngQ0FVGYThZcZ7bA==
X-Received: by 2002:a17:902:f141:b0:1f7:1bf3:db10 with SMTP id
 d9443c01a7336-1fbb8015510mr44928735ad.20.1720598247862; 
 Wed, 10 Jul 2024 00:57:27 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6b31977sm27555975ad.287.2024.07.10.00.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 00:57:27 -0700 (PDT)
Date: Wed, 10 Jul 2024 15:57:14 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20240710155714.000010cb@gmail.com>
In-Reply-To: <20240709171018.7tifdirqjhq6cohy@skbuf>
References: <cover.1720512888.git.0x1207@gmail.com>
 <d142b909d0600b67b9ceadc767c4177be216f5bd.1720512888.git.0x1207@gmail.com>
 <b313d570-e3f3-479f-a469-ba2759313ea4@lunn.ch>
 <20240709171018.7tifdirqjhq6cohy@skbuf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Jianheng Zhang <Jianheng.Zhang@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/7] net: stmmac: xgmac: drop
 incomplete FPE implementation
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

Hi Vladimir

On Tue, 9 Jul 2024 20:10:18 +0300, Vladimir Oltean <olteanv@gmail.com> wrote:
> Hi Andrew, Furong,
> 
> On Tue, Jul 09, 2024 at 03:16:35PM +0200, Andrew Lunn wrote:
> > On Tue, Jul 09, 2024 at 04:21:19PM +0800, Furong Xu wrote:  
> > > The FPE support for xgmac is incomplete, drop it temporarily.
> > > Once FPE implementation is refactored, xgmac support will be added.  
> > 
> > This is a pretty unusual thing to do. What does the current
> > implementation do? Is there enough for it to actually work? If i was
> > doing a git bisect and landed on this patch, could i find my
> > networking is broken?
> > 
> > More normal is to build a new implementation by the side, and then
> > swap to it.
> > 
> > 	Andrew
> >   
> 
> There were 2 earlier attempts from Jianheng Zhang @ Synopsys to add FPE
> support to new hardware.
> 
> I told him that the #1 priority should be to move the stmmac driver over
> to the new standard API which uses ethtool + tc.
> https://lore.kernel.org/netdev/CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com/
> https://lore.kernel.org/netdev/CY5PR12MB63727C24923AE855CFF0D425BF8EA@CY5PR12MB6372.namprd12.prod.outlook.com/
> 
> I'm not sure what happened in the meantime. Jianheng must have faced
> some issue, because he never came back.
> 
> I did comment this at the time:
> 
> | Even this very patch is slightly strange - it is not brand new hardware
> | support, but it fills in some more FPE ops in dwxlgmac2_ops - when
> | dwxgmac3_fpe_configure() was already there. So this suggests the
> | existing support was incomplete. How complete is it now? No way to tell.
> | There is a selftest to tell, but we can't run it because the driver
> | doesn't integrate with those kernel APIs.
> 
> So it is relatively known that the support is incomplete. But I still
> think we should push for more reviewer insight into this driver by
> having access to a selftest to get a clearer picture of how it behaves.
> For that, we need the compliance to the common API.
> 

After some searching and learning about your commits for FPE using the
generic framework, I think it is clear enough to me to implement the new
standard driver interface which uses ethtool + tc, and then the refactor
of low level FPE function can follow.
Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
