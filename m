Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5359993B4
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 22:31:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 377CEC71290;
	Thu, 10 Oct 2024 20:31:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F66CC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 20:31:25 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2fad100dd9eso14689411fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728592284; x=1729197084;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3k2MWb0seFKuo7cYNb8ZHsjG7JTps9V/jxdBLKOq6XY=;
 b=B2eFhQCyROYhsxyYFnfiXLwSlNHCT+uJoILMf/UjI56M7iXN5skt22SLWzZ63zpx6H
 Woqb/iwLWAO/iWebumYThljU84e8715jX5r1vzN0TrGuKxRTIBHcqITl549lH6CThbfX
 tkd4s8c/uEPz7HB1h0qHs5i/muZyq5jATf3IrMmzdRV1xRT/6gdfXJNvTn2A0WRwD3df
 8O/cpNTS4skevrge/SsuvLIewiKQsUEJc3meYlfPRf9EnDLE9wEa7xoltfifL1dfm2Wl
 5Fd1xoxt9TFdPgBvQt9a6TqtM2q6sqyDYZ7LSwkJ4zUov0aECSsgYxPjECLURk7ySQ6c
 acDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728592284; x=1729197084;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3k2MWb0seFKuo7cYNb8ZHsjG7JTps9V/jxdBLKOq6XY=;
 b=C6rKTlSOcS6D603X10ogQmZR7h0tYVPXAH5CmYDk2MkNipZeUyDAgDUigKTT1/FRpX
 IrFqrR0m5DcCprac/xdzQb9b84DH8y5TFBL6Bz7xpT18ra3FGRYxwZMQC9gVWevqsrSr
 f84RPzvqRRaveUJBCwN9LYC130Gsj/nenFrMoedi1/fFfqGHJh+H1EHpTduX2maUdwCS
 vjWkSRfdi61B7rjF/Bk5lmDFXmEds7ZhE0me8MwVovO5mRuS9wsP9VOXj1yBSzWTpAd8
 PhLgwIdPX5NVRlIK4+5U7K4Adf4Q6qyIFrFfjGyhChlnD3JpPKOmfmAMW8o44GmR7bSV
 dNDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTWL8Fe0nT2IuYw0ID3HMMjOsfacM0bgZNl2RPDVEjIVmu9Z7+RKmqUPKtWoBYegq6oObKrszEjnJJmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzWLVW/thmP6bUpfjz0ZimBL97PGeUkVOBIuN0PnRuAU9JyWHID
 MPFudT5xKXMzw2u/DWu8ugJmrPUZ6xWI+Cy8AmAVCILHgM2Lj+hq
X-Google-Smtp-Source: AGHT+IFICGzObqMtyDecknzLwhoDgga4CQl0AhOmnVkzq/uPaeTdp0l6NSqKfI/08veuxhT9YaiAJQ==
X-Received: by 2002:a2e:b894:0:b0:2fa:c014:4b6b with SMTP id
 38308e7fff4ca-2fb32b014b6mr155571fa.41.1728592284063; 
 Thu, 10 Oct 2024 13:31:24 -0700 (PDT)
Received: from mobilestation ([85.249.18.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb2457983fsm3088341fa.27.2024.10.10.13.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 13:31:22 -0700 (PDT)
Date: Thu, 10 Oct 2024 23:31:18 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <6x6ysomjef4khxhaflggtyzqca3rwxh2f4wifmbddm3pjasbbz@fc3wingdcoeh>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
 <vjmounqvfxzqpdsvzs5tzlqv7dfb4z2nect3vmuaohtfm6cn3t@qynqp6zqcd3s>
 <rxv7tlvbl57yq62obsqtgr7r4llnb2ejjlaeausfxpdkxgxpyo@kqrgq2hdodts>
 <ZwZMglQLdg-5XPwm@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZwZMglQLdg-5XPwm@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 00/13] net: pcs: xpcs: cleanups
	batch 2
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

On Wed, Oct 09, 2024 at 10:27:30AM GMT, Russell King (Oracle) wrote:
> On Wed, Oct 09, 2024 at 03:02:46AM +0300, Serge Semin wrote:
> > On Sat, Oct 05, 2024 at 02:40:42AM GMT, Serge Semin wrote:
> > > Hi
> > > 
> > > On Fri, Oct 04, 2024 at 11:19:57AM GMT, Russell King (Oracle) wrote:
> > > > This is the second cleanup series for XPCS.
> > > > 
> > > > ...
> > > 
> > > If you don't mind I'll test the series out on Monday or Tuesday on the
> > > next week after my local-tree changes concerning the DW XPCS driver
> > > are rebased onto it.
> > 
> > As promised just finished rebasing the series onto the kernel 6.12-rc2
> > and testing it out on the next HW setup:
> > 
> > DW XGMAC <-(XGMII)-> DW XPCS <-(10Gbase-R)-> Marvell 88x2222
> > <-(10gbase-r)->
> > SFP+ DAC SFP+
> > <-(10gbase-r)->
> > Marvell 88x2222 <-(10gbase-r)-> DW XPCS <-(XGMII)-> DW XGMAC
> > 
> > No problem has been spotted.
> > 
> > Tested-by: Serge Semin <fancer.lancer@gmail.com>
> 

> Thanks. However, it looks like patchwork hasn't picked up your
> tested-by. Maybe it needs to be sent in reply to the cover message
> and not in a sub-thread?
> 
> https://patchwork.kernel.org/project/netdevbpf/list/?series=895512
> 
> Maybe netdev folk can add it?

Yeah, the tb-tag hasn't been added to the commits either:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=bb0b8aeca636373a9136a7a5b7594031c7587c5e
Likely you are right and the patchwork just doesn't detect the
sub-replies tags. In the meantime the b4-tool does pick them up. I've
just tested it.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
