Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22EB34F3
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Sep 2019 08:59:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E902CC35E01;
	Mon, 16 Sep 2019 06:59:04 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87B8BC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 06:59:03 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8G6qkfE027590; Mon, 16 Sep 2019 02:58:48 -0400
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2055.outbound.protection.outlook.com [104.47.46.55])
 by mx0a-00128a01.pphosted.com with ESMTP id 2v0t2936fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2019 02:58:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfzxcNuYNkiMQahrEXwPMIQyG8p5ZXCKczq6D3IIT1sKGDTZzwem2mKQYZxCbNpIzQf2huyzlMUBqKGVZfC7qYJjYE5T88vYsA57Pf9RUoZwEx7fo8xdHnppYVsnBOon3ku8nhPuJ3GXbkRRwhVGfvWsQQg474gy57cQpxG/jgp2hIejO16zKsesS2X5x9O3cmSmh/ybbhtZZyoK0SwjnFCmZOpulQ5b4rl8CWMoQ75I25BhTD30kA02hNtt4iWpy0+EgH3M1iSnIb6K4pxwGaa8dKQgDY7axAwzx26hn/FR1sZQvh2iJGTbTdhEtjTI0UWrZArwPfKCgK003uSssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkK5K3uknWpY2TrkhuRXmUmThRUwY6AbEUanMQj95hM=;
 b=nYi3smPX38OyjA3VLXiWFOZB2LZyyyYhsjlJRmnkcrHHgkFQ/b/OOdxeDZSQ0udFbROipweJyp4exNLPVnTHdOjdC7FQuaP35/2WzA3wG5okaq0v+dPJsTD7mAvM9vlOt8LjQKwsAdVqubYCkCKV6eNa+9/MhwIKCMqbDZYSqQSSJoPIk6YnTQjPk/EIZP2BHbpBJlNPRMFTalcYtqZx2YIMBfrG+RkFTEjXXjmsoodhKtaloDIvPM3FUh91JZHznKBvrUASIULVpW/WYk4+iLmQDoQ6IOb8Fp9tANBkQBv2nx1CEcqcz90WN9hyytTLAY21FS6yiczSfBlQhwrNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkK5K3uknWpY2TrkhuRXmUmThRUwY6AbEUanMQj95hM=;
 b=vvdTXhLw3EZMKqY4ZV8leJdVJTJQjAS2SvIBG284uN6BcHYb1/MqqsH2QjxApWIWb3an1GIhEpERmdg6BIwCxI3ykdH9/+9lzoq8uGdOBIn+M+TRs9iZelo0GXM2PFAio1RQu0cdTjmSrc51xDsHRGMmiqzdY28PmkP0+HsLpxM=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5174.namprd03.prod.outlook.com (20.180.4.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 06:58:45 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::344d:7f50:49a3:db1b]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::344d:7f50:49a3:db1b%3]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 06:58:45 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "davem@davemloft.net" <davem@davemloft.net>
Thread-Topic: [PATCH v2] net: stmmac: socfpga: re-use the `interface`
 parameter from platform data
Thread-Index: AQHVaVTi4HKe60y1t02IETURYvxs6KctGpiAgADLGgA=
Date: Mon, 16 Sep 2019 06:58:44 +0000
Message-ID: <7d2b366fb6969a2baed5639e3f8935fcce5e2f4b.camel@analog.com>
References: <20190912132850.10585-1-alexandru.ardelean@analog.com>
 <20190915.195149.86866545205816280.davem@davemloft.net>
In-Reply-To: <20190915.195149.86866545205816280.davem@davemloft.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03fecbbd-131d-45c6-2a66-08d73a73511d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR03MB5174; 
x-ms-traffictypediagnostic: CH2PR03MB5174:
x-microsoft-antispam-prvs: <CH2PR03MB5174A710AB1F42F86F303CBCF98C0@CH2PR03MB5174.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(25786009)(6916009)(76176011)(54906003)(6246003)(6506007)(186003)(102836004)(66066001)(36756003)(71190400001)(71200400001)(1730700003)(81156014)(81166006)(76116006)(6512007)(66446008)(66476007)(66556008)(64756008)(8676002)(66946007)(4326008)(478600001)(26005)(6436002)(118296001)(6486002)(5640700003)(229853002)(53936002)(7736002)(256004)(86362001)(476003)(316002)(8936002)(14454004)(2351001)(305945005)(3846002)(6116002)(5660300002)(99286004)(2906002)(11346002)(486006)(2616005)(2501003)(446003)(4744005)(81973001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR03MB5174;
 H:CH2PR03MB5192.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aKlPfpGhOBb5E4ZNzy6+N3EvPrVWLsgKB2P9lBskMg1xYPV3bEEy/4+BPVxi5YnKoy1mVov8b85fONrTryRCat0odr9yFTNVMHId3dfBffqm4TB2gnOmFouMC5YNqhS3VHmu/BKWShcIqShuRxwbMhFH4ymSMakNDsU6Iu42g0u7vhprg/GKJ1JMmAsMMpVJxQQKVb7bdAos5bbpAw3L1mPdt45LtaeOK2E67GMJFszUnRtI8lfOrMuGSfqj1mOnpFBM+C5mGS3kWrITbfN9a+15Al5aI5zJDPAWXN/P/xBYyRiCqDoXbkvqHC6gvqrMiJrV3TSQD+LudKO4zKEckL8OE4eAhKnL6OcSfCH7n3/OcGybLWs4nhrAisbm1XaQw1YY6+/qNLmAvhVPKqhKADo7p9ltPUj3rXZZnbxLeY0=
x-ms-exchange-transport-forked: True
Content-ID: <B83A354A738D9749AACB0B5254A76BBB@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fecbbd-131d-45c6-2a66-08d73a73511d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 06:58:44.9778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdD2n7BFFOs2h06E+FOmHttl5okgxl/bG9my6AH+lFrJj1Aw6571jIROrZzNRbcFTFZZ1XHqBYIoI4YCevPkB0KFbKH0gB32+iLIWXAUlzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5174
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-16_03:2019-09-11,2019-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909160074
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: socfpga: re-use the
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

On Sun, 2019-09-15 at 19:51 +0100, David Miller wrote:
> [External]
> 
> From: Alexandru Ardelean <alexandru.ardelean@analog.com>
> Date: Thu, 12 Sep 2019 16:28:50 +0300
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-
> > socfpga.c
> > index c141fe783e87..5b6213207c43 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
>  ...
> > +static inline int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
> 
> Please do not use the inline keyword in foo.c files, let the compiler device.

Ack.
Will remove.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
