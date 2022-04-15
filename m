Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1FB50258C
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Apr 2022 08:27:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1C50C60495;
	Fri, 15 Apr 2022 06:27:54 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61409C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Apr 2022 06:27:52 +0000 (UTC)
X-UUID: 037575d748144b85a8b83871af7e718a-20220415
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3eab5806-633f-4f1d-9991-14a74b903715, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:27,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:27
X-CID-INFO: VERSION:1.1.4, REQID:3eab5806-633f-4f1d-9991-14a74b903715, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:27,FILE:0,RULE:Release_UHam,ACTI
 ON:release,TS:27
X-CID-META: VersionHash:faefae9, CLOUDID:6a1a3ba9-d103-4e36-82b9-b0e86991b3df,
 C
 OID:IGNORED,Recheck:0,SF:13|15|28|100|16|18|48|101,TC:nil,Content:0,EDM:-3
 ,File:nil,QS:0,BEC:nil
X-UUID: 037575d748144b85a8b83871af7e718a-20220415
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 297101346; Fri, 15 Apr 2022 14:27:46 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Apr 2022 14:27:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Apr 2022 14:27:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 14:27:44 +0800
Message-ID: <48380a5b06ce48c4538e6c89bc6399ba1f425718.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 15 Apr 2022 14:27:44 +0800
In-Reply-To: <202204142333.qXgcGMI1-lkp@intel.com>
References: <20220412103114.19922-8-jason-jh.lin@mediatek.com>
 <202204142333.qXgcGMI1-lkp@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, llvm@lists.linux.dev, roy-cw.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, hsinyi@chromium.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v18 07/10] drm/mediatek: add mediatek-drm
 of vdosys0 support for mt8195
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

Hi "kernel test robot",

Thanks for the reviews.

On Thu, 2022-04-14 at 23:31 +0800, kernel test robot wrote:
> Hi "jason-jh.lin",
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on drm/drm-next]
> [also build test WARNING on robh/for-next krzk/for-next linus/master
> v5.18-rc2 next-20220414]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> 
https://urldefense.com/v3/__https://git-scm.com/docs/git-format-patch__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaGS9DHJM$
>  ]
> 
> url:    
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commits/jason-jh-lin/Add-Mediatek-Soc-DRM-vdosys0-support-for-mt8195/20220412-183359__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaP5NY9rw$
>  
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: arm64-buildonly-randconfig-r001-20220413 (
> https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20220414/202204142333.qXgcGMI1-lkp@intel.com/config__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaMatHhNq$
>  )
> compiler: clang version 15.0.0 (
> https://urldefense.com/v3/__https://github.com/llvm/llvm-project__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaED4pz5K$
> $  6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
> reproduce (this is a W=1 build):
>         wget 
> https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaGF0WqUy$
>   -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commit/7c175317aa80bbc885609a730214448147a46b47__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaN_w7rr0$
>  
>         git remote add linux-review 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaMen_Lno$
>  
>         git fetch --no-tags linux-review jason-jh-lin/Add-Mediatek-
> Soc-DRM-vdosys0-support-for-mt8195/20220412-183359
>         git checkout 7c175317aa80bbc885609a730214448147a46b47
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/mediatek/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/gpu/drm/mediatek/mtk_drm_drv.c:707:15: warning: cast to
> smaller integer type 'enum mtk_ddp_comp_type' from 'const void *' [-
> Wvoid-pointer-to-enum-cast]
>                    comp_type = (enum mtk_ddp_comp_type)of_id->data;
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I can't reproduce this build warning in my platform, but I'd found the 
same warning fixed patch: 20210928154620.11181-4-cgzones@googlemail.com

It should not be fixed at this series. So I'll fixed this warning in
another fixed patch.

> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:203:42: warning: unused
> > > variable 'mt2701_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt2701_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:218:42: warning: unused
> > > variable 'mt7623_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt7623_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:234:42: warning: unused
> > > variable 'mt2712_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt2712_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:246:42: warning: unused
> > > variable 'mt8167_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8167_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:260:42: warning: unused
> > > variable 'mt8173_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8173_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:274:42: warning: unused
> > > variable 'mt8183_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8183_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:288:42: warning: unused
> > > variable 'mt8192_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8192_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:305:42: warning: unused
> > > variable 'mt8195_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8195_mmsys_match_data =
> {

Oh, I forgot to replace the driver_data to match_data in mtk_drm_of_ids
table. I'll fix them at the next version.

Regards,
Jason-JH.Lin


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
