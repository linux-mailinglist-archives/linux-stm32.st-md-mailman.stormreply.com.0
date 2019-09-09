Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8767AD51E
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Sep 2019 10:53:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EAF4C35E01;
	Mon,  9 Sep 2019 08:53:20 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 003E7C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Sep 2019 08:53:18 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x898r8WI019249; Mon, 9 Sep 2019 04:53:08 -0400
Received: from nam03-by2-obe.outbound.protection.outlook.com
 (mail-by2nam03lp2056.outbound.protection.outlook.com [104.47.42.56])
 by mx0a-00128a01.pphosted.com with ESMTP id 2uv6d983ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Sep 2019 04:53:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HM4Ow77pPKElk2NZIifySov/qZNCbAh/e+HFfG81xfLKwAjkiMeHEhfNsFiyZUCJAO8YSAzxcWXoXOmtw9VgN+k3/PQZD1OU1kS50oEInYugP6wGI1e96lpMbpI+71+EdmT++yKOdP4KT912FGgkoHZ5/0LWgQwNBrjWHqZ0KrSnkbttDvtAnlpAJwtRKHd6NumJotZscLeNS7aUkpqmsf7eNMNZPA/6sDGOZFWdvfSb99OYxaEz2ipYKAcDEbg+agag1vahfP2fF6c0HsWz+IyAFY217M1ZfZ3f+kySMuv3VWUe9coHf/buzHltwuhOraa7xe/3yznHF93HPMKohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rzaacQqsHtWxfDdbIq2SgzD1pSvBS4WIoqEaWc81c0=;
 b=O1E+aN9n+SaV5GHjbB7ZTHunU5LCkyiOhnAXUrCDPxkOk63VEOT//vW7QOt58nOjSZINRr+NrSZeklzhgzXQlT5jtsgI6FhxZVixmv1Qz4mFuuwO/royp5i1B3JfDt+wxThOQMDnOQMK47iJslN3WAHjYrQBPIRujDQj2jFctbofecPTWSaB1p9j6sMQ0SM+j2bTtAwe3AKDinDt4QqLr29OuVT44/Mabia21seliuFA3dHhFjCR2ZkAYrGbWLVGT7nfhwHmEaO68G8qL3caxoYBbmilfPADj3ehGxXTwabvth8+AIDTRQFiFTH3w5YBAbwk6cvnpoF9xH9bKKVZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rzaacQqsHtWxfDdbIq2SgzD1pSvBS4WIoqEaWc81c0=;
 b=K5xeXZhbkUj7R8GZvLiCYdqkxOZOeXvpgITXvPuo3sXe4crKKZ7dC+axgLVl9ayxxlJ+55t17jZKB6uaveTZBgZK1lXF8acCf9gT6ztT4RL3t5/vAK9XehYWQkXxzE1oy4KRCLJ2z848Wg8Np2La74G5F3N2jtg+NGbQcsoz+Fw=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5239.namprd03.prod.outlook.com (20.180.5.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 08:53:06 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::344d:7f50:49a3:db1b]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::344d:7f50:49a3:db1b%3]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 08:53:06 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "lkp@intel.com" <lkp@intel.com>
Thread-Topic: [PATCH] net: stmmac: socfpga: re-use the `interface` parameter
 from platform data
Thread-Index: AQHVZK71MotWq7Szq0ysUG4QFG+T4qcgLVwAgALhQQA=
Date: Mon, 9 Sep 2019 08:53:06 +0000
Message-ID: <a7dc54d6e1fad0dc464a30101c8740b8c11f2d8b.camel@analog.com>
References: <20190906123054.5514-1-alexandru.ardelean@analog.com>
 <201909072036.v1rX0Vwh%lkp@intel.com>
In-Reply-To: <201909072036.v1rX0Vwh%lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcb38f20-807b-4034-9ad8-08d7350321b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR03MB5239; 
x-ms-traffictypediagnostic: CH2PR03MB5239:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <CH2PR03MB5239E6EED9965DA7FB7D68DDF9B70@CH2PR03MB5239.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(53936002)(4326008)(256004)(476003)(2351001)(229853002)(36756003)(76176011)(7416002)(102836004)(26005)(6916009)(305945005)(6506007)(2906002)(66476007)(64756008)(66446008)(66556008)(91956017)(76116006)(5024004)(7736002)(66946007)(4001150100001)(6116002)(3846002)(2501003)(6306002)(14454004)(8936002)(1730700003)(81156014)(81166006)(8676002)(86362001)(66066001)(966005)(118296001)(6436002)(25786009)(71200400001)(6486002)(486006)(99286004)(54906003)(186003)(71190400001)(11346002)(5660300002)(446003)(316002)(6246003)(478600001)(5640700003)(6512007)(2616005)(81973001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR03MB5239;
 H:CH2PR03MB5192.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ajHTUKxXC9xufAzxcwqryCcL/eTfPtfGYT/zzdNvqlb155vLIShMKhxqm23sSV6qQXets1Zh5Itx60A5LM9o1TXmubSBizDT/KR99T6q7AIxMLd8NB00TpgyyznCss605vnbLLU1gsxekVGKJaeBm2hmd6WirXjtHSJ7wvL1+ySgP/2QEylnOKgSckfQDlxstCq3BVv+nvqp3wxg1k+iWONg4hZoHKqxfkrhfaAgJE1xsaJjRPdEWKWv2BiFQhMPxMuA8SmEbyJJQaOhJgSSVBLCkqNhMmTb5H+rL+3UHl6ilEjh3hibWX40ldNuWujF17OxtMl4mZYsC1rO1OklgYz9bPo7Kn6/uVxmjT2XpSqGZnHoyQmnuFCOraNoyya0QN9kDdZd9SrtkCBdz3l9TDJ7xQPSnJdPyQlq9ZXq3vM=
x-ms-exchange-transport-forked: True
Content-ID: <9888AC36AEA71944A2D723F4AABCB6CF@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb38f20-807b-4034-9ad8-08d7350321b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 08:53:06.2068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUvQGx1/TRYTG1zyEWxRy0Xiqu/V2PRoHn34d16ctSIp5i/U7o/JsNdt+XL81+aNZ7fIc6nmWASb6ZlVxbLGn9t1mwKtit/oombUvQLXiso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5239
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_04:2019-09-08,2019-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909090094
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "kbuild-all@01.org" <kbuild-all@01.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: socfpga: re-use the
 `interface` parameter from platform data
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

On Sat, 2019-09-07 at 20:54 +0800, kbuild test robot wrote:
> [External]
> 
> Hi Alexandru,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]

Hmm, this error should be expectable I guess: I applied this on net-next/master.

Alex

> [cannot apply to v5.3-rc7 next-20190904]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    
> https://github.com/0day-ci/linux/commits/Alexandru-Ardelean/net-stmmac-socfpga-re-use-the-interface-parameter-from-platform-data/20190907-190627
> config: sparc64-allmodconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=sparc64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/dma-mapping.h:7:0,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/phy.h:16,
>                     from drivers/net//ethernet/stmicro/stmmac/dwmac-socfpga.c:11:
>    drivers/net//ethernet/stmicro/stmmac/dwmac-socfpga.c: In function 'socfpga_gen5_set_phy_mode':
> > > drivers/net//ethernet/stmicro/stmmac/dwmac-socfpga.c:264:44: error: 'phymode' undeclared (first use in this
> > > function); did you mean 'phy_modes'?
>       dev_err(dwmac->dev, "bad phy mode %d\n", phymode);
>                                                ^
>    include/linux/device.h:1499:32: note: in definition of macro 'dev_err'
>      _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                    ^~~~~~~~~~~
>    drivers/net//ethernet/stmicro/stmmac/dwmac-socfpga.c:264:44: note: each undeclared identifier is reported only once
> for each function it appears in
>       dev_err(dwmac->dev, "bad phy mode %d\n", phymode);
>                                                ^
>    include/linux/device.h:1499:32: note: in definition of macro 'dev_err'
>      _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                    ^~~~~~~~~~~
>    drivers/net//ethernet/stmicro/stmmac/dwmac-socfpga.c: In function 'socfpga_gen10_set_phy_mode':
>    drivers/net//ethernet/stmicro/stmmac/dwmac-socfpga.c:340:6: error: 'phymode' undeclared (first use in this
> function); did you mean 'phy_modes'?
>          phymode == PHY_INTERFACE_MODE_MII ||
>          ^~~~~~~
>          phy_modes
> 
> vim +264 drivers/net//ethernet/stmicro/stmmac/dwmac-socfpga.c
> 
> 40ae25505fe834 Dinh Nguyen        2019-06-05  255  
> 40ae25505fe834 Dinh Nguyen        2019-06-05  256  static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
> 40ae25505fe834 Dinh Nguyen        2019-06-05  257  {
> 40ae25505fe834 Dinh Nguyen        2019-06-05  258  	struct regmap *sys_mgr_base_addr = dwmac->sys_mgr_base_addr;
> 40ae25505fe834 Dinh Nguyen        2019-06-05  259  	u32 reg_offset = dwmac->reg_offset;
> 40ae25505fe834 Dinh Nguyen        2019-06-05  260  	u32 reg_shift = dwmac->reg_shift;
> 40ae25505fe834 Dinh Nguyen        2019-06-05  261  	u32 ctrl, val, module;
> 40ae25505fe834 Dinh Nguyen        2019-06-05  262  
> 6169afbe4a340b Alexandru Ardelean 2019-09-06  263  	if (socfpga_set_phy_mode_common(dwmac, &val)) {
> 801d233b7302ee Dinh Nguyen        2014-03-26 @264  		dev_err(dwmac->dev, "bad phy mode %d\n", phymode);
> 801d233b7302ee Dinh Nguyen        2014-03-26  265  		return -EINVAL;
> 801d233b7302ee Dinh Nguyen        2014-03-26  266  	}
> 801d233b7302ee Dinh Nguyen        2014-03-26  267  
> b4834c86e11baf Ley Foon Tan       2014-08-20  268  	/* Overwrite val to GMII if splitter core is enabled. The
> phymode here
> b4834c86e11baf Ley Foon Tan       2014-08-20  269  	 * is the actual phy mode on phy hardware, but phy interface
> from
> b4834c86e11baf Ley Foon Tan       2014-08-20  270  	 * EMAC core is GMII.
> b4834c86e11baf Ley Foon Tan       2014-08-20  271  	 */
> b4834c86e11baf Ley Foon Tan       2014-08-20  272  	if (dwmac->splitter_base)
> b4834c86e11baf Ley Foon Tan       2014-08-20  273  		val = SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII;
> b4834c86e11baf Ley Foon Tan       2014-08-20  274  
> 70cb136f773083 Joachim Eastwood   2016-05-01  275  	/* Assert reset to the enet controller before changing the phy
> mode */
> bc8a2d9bcbf1ca Dinh Nguyen        2018-06-19  276  	reset_control_assert(dwmac->stmmac_ocp_rst);
> 70cb136f773083 Joachim Eastwood   2016-05-01  277  	reset_control_assert(dwmac->stmmac_rst);
> 70cb136f773083 Joachim Eastwood   2016-05-01  278  
> 801d233b7302ee Dinh Nguyen        2014-03-26  279  	regmap_read(sys_mgr_base_addr, reg_offset, &ctrl);
> 801d233b7302ee Dinh Nguyen        2014-03-26  280  	ctrl &= ~(SYSMGR_EMACGRP_CTRL_PHYSEL_MASK << reg_shift);
> 801d233b7302ee Dinh Nguyen        2014-03-26  281  	ctrl |= val << reg_shift;
> 801d233b7302ee Dinh Nguyen        2014-03-26  282  
> 013dae5dbc07aa Stephan Gatzka     2017-08-22  283  	if (dwmac->f2h_ptp_ref_clk ||
> 013dae5dbc07aa Stephan Gatzka     2017-08-22  284  	    phymode == PHY_INTERFACE_MODE_MII ||
> 013dae5dbc07aa Stephan Gatzka     2017-08-22  285  	    phymode == PHY_INTERFACE_MODE_GMII ||
> 013dae5dbc07aa Stephan Gatzka     2017-08-22  286  	    phymode == PHY_INTERFACE_MODE_SGMII) {
> 43569814fa35b2 Phil Reid          2015-12-14  287  		ctrl |= SYSMGR_EMACGRP_CTRL_PTP_REF_CLK_MASK <<
> (reg_shift / 2);
> 734e00fa02eff5 Phil Reid          2016-04-07  288  		regmap_read(sys_mgr_base_addr,
> SYSMGR_FPGAGRP_MODULE_REG,
> 734e00fa02eff5 Phil Reid          2016-04-07  289  			    &module);
> 734e00fa02eff5 Phil Reid          2016-04-07  290  		module |= (SYSMGR_FPGAGRP_MODULE_EMAC << (reg_shift /
> 2));
> 734e00fa02eff5 Phil Reid          2016-04-07  291  		regmap_write(sys_mgr_base_addr,
> SYSMGR_FPGAGRP_MODULE_REG,
> 734e00fa02eff5 Phil Reid          2016-04-07  292  			     module);
> 734e00fa02eff5 Phil Reid          2016-04-07  293  	} else {
> 43569814fa35b2 Phil Reid          2015-12-14  294  		ctrl &= ~(SYSMGR_EMACGRP_CTRL_PTP_REF_CLK_MASK <<
> (reg_shift / 2));
> 734e00fa02eff5 Phil Reid          2016-04-07  295  	}
> 43569814fa35b2 Phil Reid          2015-12-14  296  
> 801d233b7302ee Dinh Nguyen        2014-03-26  297  	regmap_write(sys_mgr_base_addr, reg_offset, ctrl);
> 734e00fa02eff5 Phil Reid          2016-04-07  298  
> 70cb136f773083 Joachim Eastwood   2016-05-01  299  	/* Deassert reset for the phy configuration to be sampled by
> 70cb136f773083 Joachim Eastwood   2016-05-01  300  	 * the enet controller, and operation to start in requested mode
> 70cb136f773083 Joachim Eastwood   2016-05-01  301  	 */
> bc8a2d9bcbf1ca Dinh Nguyen        2018-06-19  302  	reset_control_deassert(dwmac->stmmac_ocp_rst);
> 70cb136f773083 Joachim Eastwood   2016-05-01  303  	reset_control_deassert(dwmac->stmmac_rst);
> fb3bbdb859891e Tien Hock Loh      2016-07-07  304  	if (phymode == PHY_INTERFACE_MODE_SGMII) {
> fb3bbdb859891e Tien Hock Loh      2016-07-07  305  		if (tse_pcs_init(dwmac->pcs.tse_pcs_base, &dwmac->pcs)
> != 0) {
> fb3bbdb859891e Tien Hock Loh      2016-07-07  306  			dev_err(dwmac->dev, "Unable to initialize TSE
> PCS");
> fb3bbdb859891e Tien Hock Loh      2016-07-07  307  			return -EINVAL;
> fb3bbdb859891e Tien Hock Loh      2016-07-07  308  		}
> fb3bbdb859891e Tien Hock Loh      2016-07-07  309  	}
> 70cb136f773083 Joachim Eastwood   2016-05-01  310  
> 801d233b7302ee Dinh Nguyen        2014-03-26  311  	return 0;
> 801d233b7302ee Dinh Nguyen        2014-03-26  312  }
> 801d233b7302ee Dinh Nguyen        2014-03-26  313  
> 
> :::::: The code at line 264 was first introduced by commit
> :::::: 801d233b7302eeab94750427a623c10c044cb0ca net: stmmac: Add SOCFPGA glue driver
> 
> :::::: TO: Dinh Nguyen <dinguyen@altera.com>
> :::::: CC: David S. Miller <davem@davemloft.net>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
