Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBEECD95B
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 23:51:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3CF9C36B0B;
	Sun,  6 Oct 2019 21:51:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CF13C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 21:51:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Oct 2019 14:51:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,265,1566889200"; d="scan'208";a="217779937"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2019 14:51:19 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iHEQx-000AgY-9V; Mon, 07 Oct 2019 05:51:19 +0800
Date: Mon, 7 Oct 2019 05:50:44 +0800
From: kbuild test robot <lkp@intel.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <201910070529.LpPdh7OD%lkp@intel.com>
References: <3504067666a0cee6ecf636cf30081b09a6b79710.1570360411.git.Jose.Abreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3504067666a0cee6ecf636cf30081b09a6b79710.1570360411.git.Jose.Abreu@synopsys.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: Fallback to
 VLAN Perfect filtering if HASH is not available
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

Hi Jose,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Jose-Abreu/net-stmmac-Improvements-for-next/20191007-013324
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-42-g38eda53-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> *ioaddr @@    got void [noderef] <asn:2> *ioaddr @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17: sparse:    expected void [noderef] <asn:2> *ioaddr
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17: sparse:    got struct mac_device_info *hw
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4224:21: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [assigned] [usertype] vid @@    got  short [assigned] [usertype] vid @@
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4224:21: sparse:    expected unsigned short [assigned] [usertype] vid
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4224:21: sparse:    got restricted __le16 [usertype]

vim +4224 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  4206	
  4207	static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
  4208	{
  4209		u32 crc, hash = 0;
  4210		int count = 0;
  4211		u16 vid = 0;
  4212	
  4213		for_each_set_bit(vid, priv->active_vlans, VLAN_N_VID) {
  4214			__le16 vid_le = cpu_to_le16(vid);
  4215			crc = bitrev32(~stmmac_vid_crc32_le(vid_le)) >> 28;
  4216			hash |= (1 << crc);
  4217			count++;
  4218		}
  4219	
  4220		if (!priv->dma_cap.vlhash) {
  4221			if (count > 2) /* VID = 0 always passes filter */
  4222				return -EOPNOTSUPP;
  4223	
> 4224			vid = cpu_to_le16(vid);
  4225			hash = 0;
  4226		}
  4227	
  4228		return stmmac_update_vlan_hash(priv, priv->hw, hash, vid, is_double);
  4229	}
  4230	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
