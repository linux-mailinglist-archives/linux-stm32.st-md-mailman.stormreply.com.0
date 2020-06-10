Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA11F4B5E
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2020 04:24:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68323C36B22;
	Wed, 10 Jun 2020 02:24:51 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE268C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 02:24:49 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c8so468584iob.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 19:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WL9w6hwM5zwERLskxjbOw8ThwKl4nB9IVsOxgE1aSfw=;
 b=b2Pg1DmQL9P+qQbJmBlRhO8NtpM4v3VMQ3hqoRVe0OUmgjuHXJJ+Rr5F39s5GpmdXk
 +wjMGJrBl414GoAbQN8cMUvAROoa42COk6SQXHMt7bm95zIzlwAmmBM0p+oiPgdZLVuK
 /hTQPh5DyFQpc1aeP0cmN2YWXrywKrrWLCVXJh8Vp8+3v5FbKoZzJB0T9f3Gx7ONVfxy
 nU5kt9sin5zr/8zBfNCCHUJD3Oh2QS1+XXm6HTliGLMG5L1UHz34nH2/c3CuyT07mkd3
 kSbk1lSZN++4YQN866MC4lXH53k8czjtdWiFvCzeA/XmsxY9xZk0T7sER6W+Hy6Z5itS
 eEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WL9w6hwM5zwERLskxjbOw8ThwKl4nB9IVsOxgE1aSfw=;
 b=hSmUXD9vCEWya7b0P7Lj0/fNSQpOkxoYHX16mszKTctEYZUeILAqy5X/GY2PZNh7qQ
 Rl+CMYqoCXah3MsoxS0b5wGaXGExZa4AXCzXvWqYg5lvIAFTGiKUHdjARFsEoiUkG3n4
 RmSK2gtt0xW8XiMWDDacs1W73K4b1Jf27lq3EPPvay13UFXVvIYSE8pskqEAL6uWU0te
 njxWP5/hrimjXPxxEyVnZfmr8Um5WiE//ZjnclbBKyd9+aGoMAgMo5c7c7uRfTzlqNYt
 v3tPa+AXy/3zy7ZfTgq9H4epTqq7gG7CL6oMZ1/7B+slbNhYcNHAj6NxGutCYZaQnoO2
 T/jA==
X-Gm-Message-State: AOAM530fWlCDTOVfPpqm0VsqsANy+z1T4yMJgqsLBO75cDB7/qjWgoae
 lreDL9lOLk+PNw/j/71buqdQGe5E35NUmx2Vuh4=
X-Google-Smtp-Source: ABdhPJzJL0VW4ZqrcmeuZtWCByNYhsDAOHjCX0d7VNmCxG+zN5Y4+GfRIxYqtLeW9H5uN1evIqiHkRYY0zBAWwV8mZQ=
X-Received: by 2002:a05:6602:2431:: with SMTP id
 g17mr1167430iob.3.1591755888469; 
 Tue, 09 Jun 2020 19:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
 <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
 <90df5646-e0c4-fcac-d934-4cc922230dd2@arm.com>
 <CAL9mu0+__0Z3R3TcSrj9-kPxsyQHKS9WqK1u58P0dEZ+Jd-wbQ@mail.gmail.com>
 <20200609153646.GA17969@lst.de> <031034fb-b109-7410-3ff8-e78cd12a5552@arm.com>
 <b0c85637-4646-614b-d406-49aa72ce52e1@arm.com> <20200609173455.GA25467@lst.de>
In-Reply-To: <20200609173455.GA25467@lst.de>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 10 Jun 2020 10:24:10 +0800
Message-ID: <CAL9mu0KejK9JRrJg5tFb5xKGjaEYr=XRpvGB2nuBfnhLeBMdng@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 linux@armlinux.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, tglx@linutronix.de,
 info@metux.net, linux-stm32@st-md-mailman.stormreply.com, allison@lohutok.net
Subject: Re: [Linux-stm32] [PATCH 2/2] arm-nommu: Add use_reserved_mem() to
 check if device support reserved memory
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

Hi Vladimir,

I tested your changes, it's working fine on stm32f429-disco(armv7m,
without cache) board.
you can submit a separate patch for dma-direct support on non-mmu
platform, i will drop mine.

thanks.

best regards.

Dillon,
On Wed, Jun 10, 2020 at 1:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jun 09, 2020 at 05:25:04PM +0100, Vladimir Murzin wrote:
> > Even though commit mentions ARM, I do not see how mmap would continue
> > to work for NOMMU with dma-direct. ARM NOMMU needs it's own DMA operations
> > only in cases where caches are implemented or active, in other cases it
> > fully relies on dma-direct.
>
> > It looks to me that we either should provide NOMMU variant for mmap in
> > dma/direct or (carefully) fix dma/mapping.
>
> I think dma-direct is the right place, the common helpers in
> dma/mapping.c are basically the red headed stepchilds for misc
> IOMMU drivers not covered by dma-iommu only.

Yes, thanks Christoph's input.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
