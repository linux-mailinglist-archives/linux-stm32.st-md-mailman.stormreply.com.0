Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD942575CC7
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 09:52:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 790BBC0D2BF;
	Fri, 15 Jul 2022 07:52:35 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10A3FC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 07:52:32 +0000 (UTC)
X-UUID: 95c87faa33c24f53b1136fcca39c7063-20220715
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:f6471752-b73b-482f-9ea8-797952906337, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:46
X-CID-INFO: VERSION:1.1.8, REQID:f6471752-b73b-482f-9ea8-797952906337, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:46
X-CID-META: VersionHash:0f94e32, CLOUDID:57a96164-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:7f41dda61adb,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 95c87faa33c24f53b1136fcca39c7063-20220715
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2036495129; Fri, 15 Jul 2022 15:52:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Jul 2022 15:52:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Jul 2022 15:52:22 +0800
Message-ID: <5a36c4d676b462a8652a27ce9748d4b7597eb0b2.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: kernel test robot <lkp@intel.com>, David Miller <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 15 Jul 2022 15:52:22 +0800
In-Reply-To: <202207150612.B3phHNEY-lkp@intel.com>
References: <20220713101002.10970-4-biao.huang@mediatek.com>
 <202207150612.B3phHNEY-lkp@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 kbuild-all@lists.01.org, Jisheng
 Zhang <jszhang@kernel.org>, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net v4 3/3] net: stmmac: fix unbalanced
 ptp clock issue in suspend/resume flow
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

Hi,
	This warning is fixed in v5 send, please test with v5.

Best Regards!
Biao

On Fri, 2022-07-15 at 06:40 +0800, kernel test robot wrote:
> Hi Biao,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on net/master]
> 
> url:    
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commits/Biao-Huang/stmmac-dwmac-mediatek-fix-clock-issue/20220713-181044__;!!CTRNKA9wMg0ARbw!zSIorkBYIMJM_lsS_i-iPXUHkJnImzF7_legwMzhyi3I_4dNo9-GDn7_MBAjUJw2wA$
>  
> base:   
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git__;!!CTRNKA9wMg0ARbw!zSIorkBYIMJM_lsS_i-iPXUHkJnImzF7_legwMzhyi3I_4dNo9-GDn7_MBA1ViIHxA$
>   22b9c41a3fb8ef4624bcda312665937d2ba98aa7
> config: x86_64-randconfig-a016 (
> https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20220715/202207150612.B3phHNEY-lkp@intel.com/config__;!!CTRNKA9wMg0ARbw!zSIorkBYIMJM_lsS_i-iPXUHkJnImzF7_legwMzhyi3I_4dNo9-GDn7_MBDrBZ7cUQ$
>  )
> compiler: clang version 15.0.0 (
> https://urldefense.com/v3/__https://github.com/llvm/llvm-project__;!!CTRNKA9wMg0ARbw!zSIorkBYIMJM_lsS_i-iPXUHkJnImzF7_legwMzhyi3I_4dNo9-GDn7_MBB4_f7rKw$
> $  5e61b9c556267086ef9b743a0b57df302eef831b)
> reproduce (this is a W=1 build):
>         wget 
> https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!CTRNKA9wMg0ARbw!zSIorkBYIMJM_lsS_i-iPXUHkJnImzF7_legwMzhyi3I_4dNo9-GDn7_MBBCyTTgjA$
>   -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commit/f145c999bcff52c22cc849bf17f2b30c5e991c0a__;!!CTRNKA9wMg0ARbw!zSIorkBYIMJM_lsS_i-iPXUHkJnImzF7_legwMzhyi3I_4dNo9-GDn7_MBCdfrCTBg$
>  
>         git remote add linux-review 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux__;!!CTRNKA9wMg0ARbw!zSIorkBYIMJM_lsS_i-iPXUHkJnImzF7_legwMzhyi3I_4dNo9-GDn7_MBAnpXqSbQ$
>  
>         git fetch --no-tags linux-review Biao-Huang/stmmac-dwmac-
> mediatek-fix-clock-issue/20220713-181044
>         git checkout f145c999bcff52c22cc849bf17f2b30c5e991c0a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> drivers/net/ethernet/stmicro/stmmac/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> > > drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:837:6: warning:
> > > unused variable 'ret' [-Wunused-variable]
> 
>            int ret;
>                ^
>    1 warning generated.
> 
> 
> vim +/ret +837 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> 
> 891434b18ec0a2 Rayagond Kokatanur 2013-03-26  820  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  821  /**
> a6da2bbb0005e6 Holger Assmann     2021-11-21  822   *
> stmmac_init_tstamp_counter - init hardware timestamping counter
> a6da2bbb0005e6 Holger Assmann     2021-11-21  823   * @priv: driver
> private structure
> a6da2bbb0005e6 Holger Assmann     2021-11-21  824   * @systime_flags:
> timestamping flags
> a6da2bbb0005e6 Holger Assmann     2021-11-21  825   * Description:
> a6da2bbb0005e6 Holger Assmann     2021-11-21  826   * Initialize
> hardware counter for packet timestamping.
> a6da2bbb0005e6 Holger Assmann     2021-11-21  827   * This is valid
> as long as the interface is open and not suspended.
> a6da2bbb0005e6 Holger Assmann     2021-11-21  828   * Will be rerun
> after resuming from suspend, case in which the timestamping
> a6da2bbb0005e6 Holger Assmann     2021-11-21  829   * flags updated
> by stmmac_hwtstamp_set() also need to be restored.
> a6da2bbb0005e6 Holger Assmann     2021-11-21  830   */
> a6da2bbb0005e6 Holger Assmann     2021-11-21  831  int
> stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32
> systime_flags)
> a6da2bbb0005e6 Holger Assmann     2021-11-21  832  {
> a6da2bbb0005e6 Holger Assmann     2021-11-21  833  	bool xmac =
> priv->plat->has_gmac4 || priv->plat->has_xgmac;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  834  	struct
> timespec64 now;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  835  	u32 sec_inc =
> 0;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  836  	u64 temp = 0;
> a6da2bbb0005e6 Holger Assmann     2021-11-21 @837  	int ret;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  838  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  839  	if (!(priv-
> >dma_cap.time_stamp || priv->dma_cap.atime_stamp))
> a6da2bbb0005e6 Holger Assmann     2021-11-21  840  		return
> -EOPNOTSUPP;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  841  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  842  	stmmac_config_h
> w_tstamping(priv, priv->ptpaddr, systime_flags);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  843  	priv-
> >systime_flags = systime_flags;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  844  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  845  	/* program Sub
> Second Increment reg */
> a6da2bbb0005e6 Holger Assmann     2021-11-21  846  	stmmac_config_s
> ub_second_increment(priv, priv->ptpaddr,
> a6da2bbb0005e6 Holger Assmann     2021-11-21  847  			
> 		   priv->plat->clk_ptp_rate,
> a6da2bbb0005e6 Holger Assmann     2021-11-21  848  			
> 		   xmac, &sec_inc);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  849  	temp =
> div_u64(1000000000ULL, sec_inc);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  850  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  851  	/* Store sub
> second increment for later use */
> a6da2bbb0005e6 Holger Assmann     2021-11-21  852  	priv-
> >sub_second_inc = sec_inc;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  853  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  854  	/* calculate
> default added value:
> a6da2bbb0005e6 Holger Assmann     2021-11-21  855  	 * formula is :
> a6da2bbb0005e6 Holger Assmann     2021-11-21  856  	 * addend =
> (2^32)/freq_div_ratio;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  857  	 * where,
> freq_div_ratio = 1e9ns/sec_inc
> a6da2bbb0005e6 Holger Assmann     2021-11-21  858  	 */
> a6da2bbb0005e6 Holger Assmann     2021-11-21  859  	temp =
> (u64)(temp << 32);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  860  	priv-
> >default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  861  	stmmac_config_a
> ddend(priv, priv->ptpaddr, priv->default_addend);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  862  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  863  	/* initialize
> system time */
> a6da2bbb0005e6 Holger Assmann     2021-11-21  864  	ktime_get_real_
> ts64(&now);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  865  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  866  	/* lower 32
> bits of tv_sec are safe until y2106 */
> a6da2bbb0005e6 Holger Assmann     2021-11-21  867  	stmmac_init_sys
> time(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  868  
> a6da2bbb0005e6 Holger Assmann     2021-11-21  869  	return 0;
> a6da2bbb0005e6 Holger Assmann     2021-11-21  870  }
> a6da2bbb0005e6 Holger Assmann     2021-11-
> 21  871  EXPORT_SYMBOL_GPL(stmmac_init_tstamp_counter);
> a6da2bbb0005e6 Holger Assmann     2021-11-21  872  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
