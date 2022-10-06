Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D75735F677E
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Oct 2022 15:15:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 821EFC64112;
	Thu,  6 Oct 2022 13:15:40 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AB9EC64100
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Oct 2022 13:15:38 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id cj27so913148qtb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Oct 2022 06:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=GSOPunDdTF0UIVvBpION9xBpexDiGo+rjOxipFbXtOA=;
 b=j4TXfdYhCC5IuPEKT7c142DGOyyUICiYEJ2rQ5pM4q0yiZx4WA0kHStxgeCysxKdIn
 TuxQmiKuGnCh2iLv5lCSAeVvdfZCgr0gslAO6C/wmbiJpJE+HGv9p0BlGAp2YHTd7MAZ
 JFShEKjZddNRI3EB69zxWrjNCIn5FEtT938q5Kh600byBOTgEAyr3Cw5BxKLykg6qGKZ
 putHsZDuOr6KOj1BUasiDhf52tRH/Ed62HmMrAEpEsYDeTWjqgqViGX5p251folDWhG6
 /9qz6hzxVHLZMa8vddlM+hc6XFLs5D7qWuuoVr7OgpiuiN/JdE0keFKPOZzvhwuMVbjX
 g/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=GSOPunDdTF0UIVvBpION9xBpexDiGo+rjOxipFbXtOA=;
 b=MQv1zl5Xa9wVIqCMH3wUvPCzEZdL/Fe+xiPxUpFe/RRci10OcSecr5dCi07BTe5tS6
 kIcQinWbGIpPzXALRpuD9P2VmrbeGNJA/zF6Up6lUA9mbRrk44CCnlGmao50kL8Spd71
 AAFqQ9Y5FytlYlhSQ7O8vX28kOVuOlwR7eCQk9+V6PZaQBUymdLWUhugm2QfLUkrntd9
 J62iO+mJeuKzaIsgovRocaSjNCJ58ATV+7xu3qM48OFxhIuX0mMOWPba/yZw+Twx9+FN
 utC8A/M8bD4dmJm6M/z9DAdOkuJ7YNREQRqt7jGG0EK3ZgMryCfLI1gvpNlLEebFk5co
 Vt1A==
X-Gm-Message-State: ACrzQf25/N+FlUghmU5RQDOrlSwSAKAWFr8HqrOjvVM+Fro3YtIuwjmC
 p05Srsfgt+yOqdw3OaOa1Hn2lg==
X-Google-Smtp-Source: AMsMyM4GpHypPhwf4qnIOCDMCCPPCaDHHZXra2UnB6U4hePjwcf7/TKsWZTRJwrBHYFFgt7B+K7zfA==
X-Received: by 2002:ac8:5703:0:b0:35c:c3f6:5991 with SMTP id
 3-20020ac85703000000b0035cc3f65991mr3383265qtw.185.1665062137334; 
 Thu, 06 Oct 2022 06:15:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05620a0b8b00b006cbc6e1478csm18686320qkh.57.2022.10.06.06.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 06:15:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ogQit-00A1hY-6O;
 Thu, 06 Oct 2022 10:15:35 -0300
Date: Thu, 6 Oct 2022 10:15:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <Yz7U99PPl8uHCLFY@ziepe.ca>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com> <Yz7OdfKZeGkpZSKb@ziepe.ca>
 <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 drbd-dev@lists.linbit.com, dev@openvswitch.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com, coreteam@netfilter.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, cake@lists.bufferbloat.net,
 brcm80211-dev-list.pdl@broadcom.com, linux-raid@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v1 3/5] treewide: use get_random_u32()
	when possible
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

On Thu, Oct 06, 2022 at 07:05:48AM -0600, Jason A. Donenfeld wrote:

> > > diff --git a/drivers/infiniband/ulp/ipoib/ipoib_cm.c b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > index fd9d7f2c4d64..a605cf66b83e 100644
> > > --- a/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > +++ b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > @@ -465,7 +465,7 @@ static int ipoib_cm_req_handler(struct ib_cm_id *cm_id,
> > >               goto err_qp;
> > >       }
> > >
> > > -     psn = prandom_u32() & 0xffffff;
> > > +     psn = get_random_u32() & 0xffffff;
> >
> >  prandom_max(0xffffff + 1)
> 
> That'd work, but again it's not more clear. Authors here are going for
> a 24-bit number, and masking seems like a clear way to express that.

vs just asking directly for a 24 bit number?

Jason
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
