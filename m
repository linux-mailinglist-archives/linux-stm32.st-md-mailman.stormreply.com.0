Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56819F039
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 08:04:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C1D8C36B0B;
	Mon,  6 Apr 2020 06:04:31 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08F87C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 06:04:28 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c21so7031420pfo.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Apr 2020 23:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QFvFA2IJ6GMOs1qc9Un2h+lh0ikAjobBmHDiymvmQ3w=;
 b=GtrdT8yyu6uljdxsXnGcOZJDYfipXrhZT+Ssi3IqgeE9LYYy5k1Rnzwhe0cCNuZc8i
 GEx6PLXt1WQ5T+P6vcjJZFcsxEWZMIZ+pBmB1urS3mcMsJ0JAbIaRlOo12oYSM3KsQ52
 QGT6FTVas4uKbVvSR1iuVGzqx21DhqwZuCBd41cAmG+7Z+5ROHOm8NHmLyO7bmTa7sY1
 sEkidKwptE8eRpFAivg0O1K7DovYi5TQjP3UtLawxGm/PHs30JrAiI4rb8oygYAp1k8T
 /O8DQvbzalKiil+xmZYTsaxq/hE59mXtFnsERGo7s07K12ahKPYpfzndVz09nGquGIgK
 lKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QFvFA2IJ6GMOs1qc9Un2h+lh0ikAjobBmHDiymvmQ3w=;
 b=qXuuc9wOBORyxvJM+G6vPb6GHOnvScttaK/3AdHcLw1hRu1QoflZS/txU4ScESh8aD
 ie5kZnQKPs0i8aib0zCI1nxj5pC5QND4U51+nzb3eh5TpolMjxrE23sLW4t/gWr7CnEJ
 L6ciGraLM/QSdmGwpEzSFWfmJ03pBCBGMy++qMgRvf7+HOIdCm3XZ3j/sKC/e9VnssYK
 GB8vSc10iOodDoUNt55kOkPgatnqF2NUEDbgCFnDV8j5E68yvPZGm5mwcP2p0YLUJsz/
 wukL6w5VXsCkUs4kJet/DuN54F+wxT8cKUozi0aFVhFP32OdTE/eF2XasBPCHGtOydOU
 hCog==
X-Gm-Message-State: AGi0Pub4/WFIWfvr3ywlM+KyWPFUbSMVquEQ8A2HMfNbmlTMoHuW4xSH
 qpWRp8iCbrhceukfUrcGB0A4
X-Google-Smtp-Source: APiQypLLm5KyGBPD+P+I1MwgVVO4HjtoG199EluwR7ELVAdVJjIpbHP/Ux7R61j+vdMFXw+BcifxzQ==
X-Received: by 2002:a63:e44f:: with SMTP id i15mr20018471pgk.310.1586153066876; 
 Sun, 05 Apr 2020 23:04:26 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id t186sm9963620pgd.43.2020.04.05.23.04.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 23:04:25 -0700 (PDT)
Date: Mon, 6 Apr 2020 11:34:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406060419.GA2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200405144305.GT8912@Mani-XPS-13-9360>
 <38dc1697-28e3-8680-4998-74e30339a2eb@denx.de>
 <20200405183729.GA9410@Mani-XPS-13-9360>
 <0faa0102-4504-d17b-fb7a-d710100cce2f@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0faa0102-4504-d17b-fb7a-d710100cce2f@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 00/22] ARM: dts: stm32: Repair AV96
	board
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

On Sun, Apr 05, 2020 at 10:01:54PM +0200, Marek Vasut wrote:
> On 4/5/20 8:37 PM, Manivannan Sadhasivam wrote:
> > On Sun, Apr 05, 2020 at 04:55:54PM +0200, Marek Vasut wrote:
> >> On 4/5/20 4:43 PM, Manivannan Sadhasivam wrote:
> >>> Hi Marek,
> >>
> >> Hi,
> >>
> >>> On Wed, Apr 01, 2020 at 03:22:15PM +0200, Marek Vasut wrote:
> >>>> The AV96 board device tree is completely broken and does not match the
> >>>> hardware. This series fixes it up.
> >>>>
> >>>
> >>> Can you please share a git tree with all these patches? These are not
> >>> applying cleanly on top of mainline/master or linux-next/master.
> >>
> >> Alex asked for them to be rebased on
> >> git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git
> >> branch
> >> stm32-next
> >>
> > 
> > Thanks, I'm able to build with your patches. Btw, I just found that the
> > current mainline versions of u-boot and Linux kernel are certainly broken
> > on old Avenger96 (588-100) as well.
> 
> Considering the difference between the prototype board and the 588-200
> production board, that's quite possible. Are you willing to test things
> on the 588-100 board ? If so, then we can try and support the 588-100 too.
> 

I can but looks like DH Electronics doesn't want to support 588-100. You
can check with them!

> > u-boot doesn't boot while linux kernel has MMC2 and Ethernet broken as you
> > reported. However, checking out the commit which added Avenger96 board support
> > in both projects works fine.
> 
> At least
> 35a54d41d9d4 ("ARM: dts: stm32mp1: sync device tree with v5.2-rc4")
> in U-Boot broke the old board.
> 
> But that should all be fixed for the upcoming U-Boot release in master
> already (for 588-200).
> 
> The rest is a lot of incorrect pinmux in both, fixed in U-Boot already,
> fixed by this set for Linux.
> 

Yeah. Let me have a look.

Thanks,
Mani

> > So this clearly tells that there is a regression which caused the board support
> > to be broken with mainline u-boot and kernel. I didn't try to find the offending
> > commit(s) as the support for STM32MP1 got matured in both the projects. But
> > we can go ahead with your patches.
> > 
> > I will review the remaining patches tomorrow
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
