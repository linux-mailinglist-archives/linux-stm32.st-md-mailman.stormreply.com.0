Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B1142F99
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2020 17:28:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABAB2C36B0C;
	Mon, 20 Jan 2020 16:28:51 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81BC9C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2020 16:28:50 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q10so16092949pfs.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2020 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GR1APR+Wyd2YLYbRnsV0u2x1C6uwTZZ2OEWNdjnqjo4=;
 b=S6+Ui0Ryg93xsfEPW/3lRMkkxdRzUj5Lj4DWAsydzFghegwFbHnFn4k4+y4g+3n72x
 aLHNWwUI48bhXguZbAg7T8bRrfqn+CD+jmkVdCFXplLf/ZegqNFp+Ew4+PciPqsf8fXO
 2BPK9SKgxQpIhyNCP5UxRci1fAXsIj7TQHQ5KiBuZidvYnf8hRi/jZcgxyg+W8ckdvO+
 yDKLUjJN5owNIXL43AP60swXX9MhAGAB8/9rcgWpoOfctWcx1kBj+csXRrMnOgfoFyqu
 AEhRqyShDMoqtf8kGVGOvM20fPC/reJw4pAWJJZB2jh+qVq2w9eb1He8yJ32mbzTIzKi
 WwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GR1APR+Wyd2YLYbRnsV0u2x1C6uwTZZ2OEWNdjnqjo4=;
 b=jGIZlpNOArePwR/9prWIoSzQpgci7wtbESR+z91zCVfLfYVvs4Fl9Aiv+/+cpJl3F2
 X3yp3eJhkcASAgHrI9YREqPklnxDMY6kyq+favYdd3pUJSChhaEkXGMHTrRKZldWQw97
 gKtP69UkwjFSZoKMHINpTjVaxJxouVw+U8sfGGjbiZu9AY3xQ1SXZhvnNRbkPPrZZd5I
 31VUxjOYEdR9J3H2PCSbOJHC4UI/RJ3FMI2f/3AhNC/NrXBdCFhFbzXGzMgvIAZMzUd7
 nFxosUNlxM3dM70KXNDzOncsObb9kqhSO0WATzwfLhTGMhs8QjD3X4mZ8Ok/1SlnyUcf
 t2gg==
X-Gm-Message-State: APjAAAXLYdQ8577XUSbDpvV01YqO0NBRMJTeYEdvR4n/TQSfgT1hjf0U
 0VC+cQaIEiJbm/Ici0HYYtg=
X-Google-Smtp-Source: APXvYqwsolQ7KdarCdpFxI9kDgOcqi9S5elKUvLwcvNAHuPL+EqeFJc3kZAVTtrTKnyWkVXKShj07w==
X-Received: by 2002:a63:3dc6:: with SMTP id k189mr453630pga.396.1579537728723; 
 Mon, 20 Jan 2020 08:28:48 -0800 (PST)
Received: from localhost (64.64.229.47.16clouds.com. [64.64.229.47])
 by smtp.gmail.com with ESMTPSA id w11sm38347342pfn.4.2020.01.20.08.28.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jan 2020 08:28:48 -0800 (PST)
Date: Tue, 21 Jan 2020 00:28:45 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: kbuild test robot <lkp@intel.com>
Message-ID: <20200120162845.GA11480@nuc8i5>
References: <20200108072550.28613-3-zhengdejin5@gmail.com>
 <202001181542.rImVkJEi%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202001181542.rImVkJEi%lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: andrew@lunn.ch, kbuild-all@lists.01.org, weifeng.voon@intel.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 tglx@linutronix.de, treding@nvidia.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: remove the useless
	member phy_mask
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

On Sat, Jan 18, 2020 at 03:51:11PM +0800, kbuild test robot wrote:
> Hi Dejin,
> 
> Thank you for the patch! Yet something to improve:
>

Thanks for reminding, This patch has been dropped, the patch V3 that replaced
it no longer contains this content, Please refer to
https://patchwork.ozlabs.org/patch/1219694/ for details. It should be fine after
giving up this commit.

Finally, Thanks a lot for Jose's help (Jose.Abreu@synopsys.com), he told me 
that the phy_mask is useful and should be kept when I submit this commit.

BR,
Dejin

> [auto build test ERROR on net-next/master]
> [also build test ERROR on net/master linus/master v5.5-rc6]
> [cannot apply to sparc-next/master next-20200117]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Dejin-Zheng/net-stmmac-remove-useless-code-of-phy_mask/20200110-011131
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git daea5b4dc16c3edc90392a512492dae504f1a37a
> config: mips-randconfig-a001-20200118 (attached as .config)
> compiler: mipsel-linux-gcc (GCC) 5.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=5.5.0 make.cross ARCH=mips 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/mips//loongson32/common/platform.c:82:2: error: unknown field 'phy_mask' specified in initializer
>      .phy_mask = 0,
>      ^
> 
> vim +/phy_mask +82 arch/mips//loongson32/common/platform.c
> 
> f29ad10de6c345 arch/mips/loongson1/common/platform.c Kelvin Cheung 2014-10-10  79  
> ca585cf9fb818b arch/mips/loongson1/common/platform.c Kelvin Cheung 2012-07-25  80  /* Synopsys Ethernet GMAC */
> f29ad10de6c345 arch/mips/loongson1/common/platform.c Kelvin Cheung 2014-10-10  81  static struct stmmac_mdio_bus_data ls1x_mdio_bus_data = {
> f29ad10de6c345 arch/mips/loongson1/common/platform.c Kelvin Cheung 2014-10-10 @82  	.phy_mask	= 0,
> f29ad10de6c345 arch/mips/loongson1/common/platform.c Kelvin Cheung 2014-10-10  83  };
> f29ad10de6c345 arch/mips/loongson1/common/platform.c Kelvin Cheung 2014-10-10  84  
> 
> :::::: The code at line 82 was first introduced by commit
> :::::: f29ad10de6c345c8ae4cb33a99ba8ff29bdcd751 MIPS: Loongson1B: Some fixes/updates for LS1B
> 
> :::::: TO: Kelvin Cheung <keguang.zhang@gmail.com>
> :::::: CC: Ralf Baechle <ralf@linux-mips.org>
> 
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology Center
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
