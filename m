Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DC2784F5
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Sep 2020 12:22:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AD75C3FAE1;
	Fri, 25 Sep 2020 10:22:14 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5049DC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 10:22:12 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id f18so2718871pfa.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2lbFg3EfTPubbbEXQCNv75JEtnNzJ5GMo5FQjXXg9gA=;
 b=LSfij8cmE3SRXNOnYNmnoAglcEmSbiz26Yt8p3PrMrnltuSQMEETYBvnz2dbFpghvt
 AqCs5GPJklKK/M1+st7P0ufNsiWQA0W1DLTTli3fHd8cF2PxThflC3I5x7fhxs53HZx/
 zeyiwKAPpDDrCdOshiLl7/CNwimYcxJCi/gf1AMqIQv4RMVsCGXyR1x8f0ko78aYEorx
 5h+wz6H6JdDA/GL2/A2b9lrMahTR5nD2vice+RxkSR7vyveSymLn3YrkLHGHWaOygIwO
 6GmXGHCJT7L6+ZLPyhfeOp1zsiogdSDdEvEPWbpRrgYX1BxJEG8RQqLhzl0SBbhWM1Kr
 P7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lbFg3EfTPubbbEXQCNv75JEtnNzJ5GMo5FQjXXg9gA=;
 b=b1EHIDTiwAL8EeLRrdjNAHrvk8o5tfBU92QnM2g29T3bAnqEwG1iU9p5bGPshAyOxX
 E6FjbG689l1EP8ggZck7o9imqzZFHD1a8Kp36VRrkp/damoJ+6Gzsz8T0/kfdkG1b8JI
 Lh9RmP9Gz032OdZLQ+wZwJXmEJ3nRAAYgN1npKjskGNMvtOb4UIhDPvacrEuIMcg6q70
 kEkaXpQHcZnqy8Dd0sEquBn3oq2UwhOPT5po7Jp3wsguKNcF+QDtm9LWNcnif48Gfcbj
 +gfK7LL5ESR06CKiNX1I7aVjY7q/JbRCarOMJTFvsYEOnkmUbhfpELZYCrpyJcRzbf4u
 dNqg==
X-Gm-Message-State: AOAM530VK8JrEgVfO1cFQK/lUj7IFJqeoZdyVdSXP00A8J16wSiCIxQN
 qK4dYNuB5MddlMafaM58hKbbRCvrp+s7Zx0j7vo=
X-Google-Smtp-Source: ABdhPJzYlM8hV0nt13kMb7p2rnKTLsPzywseTL+BVDG3rpzy9n7kySSls2sU3iDbAEm+9utxauJoCMzVwRpkG/6HZLg=
X-Received: by 2002:aa7:9201:0:b029:13e:d13d:a10c with SMTP id
 1-20020aa792010000b029013ed13da10cmr3305770pfo.40.1601029330528; Fri, 25 Sep
 2020 03:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200925095406.27834-1-vee.khee.wong@intel.com>
In-Reply-To: <20200925095406.27834-1-vee.khee.wong@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Sep 2020 13:21:52 +0300
Message-ID: <CAHp75VeMJXRhx2FrsRur4e9OLXodmXh5Krj_n6PosuJx6MD=Zg@mail.gmail.com>
To: Wong Vee Khee <vee.khee.wong@intel.com>
Cc: Mark Gross <mgross@linux.intel.com>, Voon Wei Feng <weifeng.voon@intel.com>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Seow Chen Yong <chen.yong.seow@intel.com>, Jose Abreu <joabreu@synopsys.com>,
 Vijaya Balan Sadhishkhanna <sadhishkhanna.vijaya.balan@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix clock handling
	on remove path
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

On Fri, Sep 25, 2020 at 12:54 PM Wong Vee Khee <vee.khee.wong@intel.com> wrote:
>
> While unloading the dwmac-intel driver, clk_disable_unprepare() is
> being called twice in stmmac_dvr_remove() and
> intel_eth_pci_remove(). This causes kernel panic on the second call.
>
> Removing the second call of clk_disable_unprepare() in
> intel_eth_pci_remove().

Thanks! I'm not sure how I missed this...

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 09f012e64e4b ("stmmac: intel: Fix clock handling on error and remove paths")
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Voon Weifeng <weifeng.voon@intel.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index 2ac9dfb3462c..9e6d60e75f85 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -653,7 +653,6 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
>
>         pci_free_irq_vectors(pdev);
>
> -       clk_disable_unprepare(priv->plat->stmmac_clk);
>         clk_unregister_fixed_rate(priv->plat->stmmac_clk);
>
>         pcim_iounmap_regions(pdev, BIT(0));
> --
> 2.17.0
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
