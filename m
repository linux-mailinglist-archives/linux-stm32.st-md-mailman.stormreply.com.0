Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9127485A
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 09:44:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C8D8C32EA2;
	Thu, 25 Jul 2019 07:44:48 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95C18C349EC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 07:44:46 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E5B2C0BE9;
 Thu, 25 Jul 2019 07:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1564040684; bh=d9aXbseWip4geo2Hn8GtPODaXk2zWbqcUFG8pTF/y8w=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=DJG86KchMQFfMb3OCMA2OOO+iTGHBXjf4KwVT58gWQ4tGle3ev3OCFfy1offTc96W
 qAaXr0xu0IIuwepJNRrFbkqnUfZ/NFM7MwbRrfjCDWky+4Ztc6ShmlSv43qu3B5mEW
 A6PT4NCf2uiTlpb4CBmrIWu7x4giQs/W9E6lQ5xj1uDNbgBXAJK76OP6HBB1QLkkFP
 FFL+azTQeNtLOnA0UTeo7EyR+2U2rt+3eBDjeL4NFgeuuumTtetYZzlMbswEx3FePO
 PxiHSNl7mEQXKs6enHra9XQCjhdR7gJy6XgeXwrBqdNRH/7UaJ8DygKZWvtalHWtjN
 XNalFjMfuZ0bg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4B6ABA006A;
 Thu, 25 Jul 2019 07:44:41 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 25 Jul 2019 00:44:32 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 25 Jul 2019 00:44:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGcPuNPFHib+7M5RKPk4JYGyU6wU+bfvbt+Ca7NSTTOY++DW+sFF3X0P41x0FwoF1YPoXwER2Ht51kmdzbk2nSx/j+6Z3hTSrK0NL62hohzHyL8yb4871EE/7lpNDwUtwMS5B8WWGTyeSf08tD1CRoFVLI1cGZwCSYKsSeSxRgVgj3RTS2gxWxdjFev32Mk8HNGmXq5JV/evHSEI94Y3zSrimaO7sliO1eo+X+EiVGhT6XzvjICvhkVMDbQZbcSHg8JGDQ7MCYZ3E4PHdoRLa6Gz6uXQjCY71Be8q6FO8qm3M63MbIeAZJfxjwm0qbNRoa84l49x9BVeXGLg1N0J3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9aXbseWip4geo2Hn8GtPODaXk2zWbqcUFG8pTF/y8w=;
 b=dsDYmfZkTG6+YXDcjcQ3muXoIdx+4vjPahT4VpLXiuufgSo+L1xYclYnpHOK2R7ZWrwy6F/DNCuP6RkecKVbWt2qRkreB7fSev1bSXj7MLy8PuYkD+XdHRNVezCoOT+u1pL84WD0iIwQmKbF4JxubkHtEwwBn8Rv7SOqZutxcAl/Is4zsj2X9KyX2jzAo0KUy1UeF5EAk6EXupcI0QACNgFd6JUtVZskKeYfvMN5/ZoZjkvcQaufo0FssifpWmCV8S+ojIq4j5u3YdVRH9cV7emyQ/6kCqnTKica6/VeCAHjVhWFEA2FQJqXfqFumAv5zjqCt+Z3l9w74HdhllIYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=synopsys.com;dmarc=pass action=none
 header.from=synopsys.com;dkim=pass header.d=synopsys.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9aXbseWip4geo2Hn8GtPODaXk2zWbqcUFG8pTF/y8w=;
 b=Tg07hLtUO4KnGgEgFUDKTuyxm7eDOPi9JL4RzWCJHVsQD88B9woIeYjrvh+AIcU4c/ODiKvzb/0bx34ElvkjmFco/91hTuq2QEUfcEU7X2WXvPTI786CKr2D1WWTyb2bUBG78/8mShQprmnTJcoRI4qlmzWL6dtvLVLyjJCiD94=
Received: from BYAPR12MB3269.namprd12.prod.outlook.com (20.179.93.146) by
 BYAPR12MB3080.namprd12.prod.outlook.com (20.178.54.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 07:44:29 +0000
Received: from BYAPR12MB3269.namprd12.prod.outlook.com
 ([fe80::f5b8:ac6e:ea68:cb1c]) by BYAPR12MB3269.namprd12.prod.outlook.com
 ([fe80::f5b8:ac6e:ea68:cb1c%4]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 07:44:29 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Thread-Topic: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Thread-Index: AQHVMYtq2Zx4WVoG/U2kL8GCK0bP/abPQEOAgADTx+CABnZ9AIAADuYAgAAFQOCAAAnIAIAABLTAgAFMy7CAAB4gAIAAAO7wgAAG6gCAABvPAIAAcGAAgADrmoCAAA0XIIAAA1AAgAAAhFCAABUsgIAABPNggAAIUICAAUrO0A==
Date: Thu, 25 Jul 2019 07:44:28 +0000
Message-ID: <BYAPR12MB3269F4E62B64484B08F90998D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
 <20190724085427.GA10736@apalos>
 <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <20190724095310.GA12991@apalos>
 <BYAPR12MB3269C5766F553438ECFF2C9BD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <33de62bf-2f8a-bf00-9260-418b12bed24c@nvidia.com>
 <BYAPR12MB32696F0A2BFDF69F31C4311CD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <a07c3480-af03-a61b-4e9c-d9ceb29ce622@nvidia.com>
In-Reply-To: <a07c3480-af03-a61b-4e9c-d9ceb29ce622@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4243fa12-4056-4343-fd51-08d710d3ecae
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3080; 
x-ms-traffictypediagnostic: BYAPR12MB3080:|BYAPR12MB3080:
x-microsoft-antispam-prvs: <BYAPR12MB308068F3E3668C69CFA07A7CD3C10@BYAPR12MB3080.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39860400002)(396003)(346002)(376002)(20864003)(189003)(199004)(305945005)(446003)(11346002)(476003)(102836004)(33656002)(6246003)(486006)(229853002)(53546011)(186003)(6506007)(99286004)(76176011)(26005)(316002)(7416002)(7696005)(66946007)(5660300002)(14444005)(256004)(25786009)(64756008)(66556008)(66476007)(53936002)(71200400001)(4326008)(52536014)(76116006)(86362001)(66446008)(19627235002)(71190400001)(3846002)(68736007)(8936002)(478600001)(6116002)(6436002)(9686003)(14454004)(8676002)(81156014)(81166006)(2906002)(55016002)(66066001)(74316002)(7736002)(110136005)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3080;
 H:BYAPR12MB3269.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S3wEkdB2WCpBW7JaoYjxjbNzSoGyX6Ri1PpSx8outhdqfCp9mEuAx1agOBe69994m0PJnnqx1EQrqF1tBtshplEQkn/CjAVcSybBDnuIBrYlB+mlA72/tTPQCy5nV3vVXY3mlxG7mhOLPvfr8yxAeJUYvk3PtGp/A2f471HgVSEywQxIwCQZDj3iiN1c7RWYuUrbKoOMO/uoZibupXs6KdmqlEzxZteiAIpZ5FlKLtiVoUjszW8RmD/K85sa1hNMyPsHZnC6L37dQ8MU14vrTQE/N61sEsymUwwBetjOwJIx/YdhA/yKSio6833dWYxqqd14TYABzfXx8PD7932b/Bwfxiney21JsE5s7duMm4GyU2HMfF0fE8feprK2m9DwR3Q/g9VqQbY9GZd7O4nm8YBs1oCClPUTb9ar033GICw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4243fa12-4056-4343-fd51-08d710d3ecae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 07:44:28.8141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joabreu@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3080
X-OriginatorOrg: synopsys.com
Cc: "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "wens@csie.org" <wens@csie.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 David Miller <davem@davemloft.net>, "lists@bofh.nu" <lists@bofh.nu>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

From: Jon Hunter <jonathanh@nvidia.com>
Date: Jul/24/2019, 12:58:15 (UTC+00:00)

> 
> On 24/07/2019 12:34, Jose Abreu wrote:
> > From: Jon Hunter <jonathanh@nvidia.com>
> > Date: Jul/24/2019, 12:10:47 (UTC+00:00)
> > 
> >>
> >> On 24/07/2019 11:04, Jose Abreu wrote:
> >>
> >> ...
> >>
> >>> Jon, I was able to replicate (at some level) your setup:
> >>>
> >>> # dmesg | grep -i arm-smmu
> >>> [    1.337322] arm-smmu 70040000.iommu: probing hardware 
> >>> configuration...
> >>> [    1.337330] arm-smmu 70040000.iommu: SMMUv2 with:
> >>> [    1.337338] arm-smmu 70040000.iommu:         stage 1 translation
> >>> [    1.337346] arm-smmu 70040000.iommu:         stage 2 translation
> >>> [    1.337354] arm-smmu 70040000.iommu:         nested translation
> >>> [    1.337363] arm-smmu 70040000.iommu:         stream matching with 128 
> >>> register groups
> >>> [    1.337374] arm-smmu 70040000.iommu:         1 context banks (0 
> >>> stage-2 only)
> >>> [    1.337383] arm-smmu 70040000.iommu:         Supported page sizes: 
> >>> 0x61311000
> >>> [    1.337393] arm-smmu 70040000.iommu:         Stage-1: 48-bit VA -> 
> >>> 48-bit IPA
> >>> [    1.337402] arm-smmu 70040000.iommu:         Stage-2: 48-bit IPA -> 
> >>> 48-bit PA
> >>>
> >>> # dmesg | grep -i stmmac
> >>> [    1.344106] stmmaceth 70000000.ethernet: Adding to iommu group 0
> >>> [    1.344233] stmmaceth 70000000.ethernet: no reset control found
> >>> [    1.348276] stmmaceth 70000000.ethernet: User ID: 0x10, Synopsys ID: 
> >>> 0x51
> >>> [    1.348285] stmmaceth 70000000.ethernet:     DWMAC4/5
> >>> [    1.348293] stmmaceth 70000000.ethernet: DMA HW capability register 
> >>> supported
> >>> [    1.348302] stmmaceth 70000000.ethernet: RX Checksum Offload Engine 
> >>> supported
> >>> [    1.348311] stmmaceth 70000000.ethernet: TX Checksum insertion 
> >>> supported
> >>> [    1.348320] stmmaceth 70000000.ethernet: TSO supported
> >>> [    1.348328] stmmaceth 70000000.ethernet: Enable RX Mitigation via HW 
> >>> Watchdog Timer
> >>> [    1.348337] stmmaceth 70000000.ethernet: TSO feature enabled
> >>> [    1.348409] libphy: stmmac: probed
> >>> [ 4159.140990] stmmaceth 70000000.ethernet eth0: PHY [stmmac-0:01] 
> >>> driver [Generic PHY]
> >>> [ 4159.141005] stmmaceth 70000000.ethernet eth0: phy: setting supported 
> >>> 00,00000000,000062ff advertising 00,00000000,000062ff
> >>> [ 4159.142359] stmmaceth 70000000.ethernet eth0: No Safety Features 
> >>> support found
> >>> [ 4159.142369] stmmaceth 70000000.ethernet eth0: IEEE 1588-2008 Advanced 
> >>> Timestamp supported
> >>> [ 4159.142429] stmmaceth 70000000.ethernet eth0: registered PTP clock
> >>> [ 4159.142439] stmmaceth 70000000.ethernet eth0: configuring for 
> >>> phy/gmii link mode
> >>> [ 4159.142452] stmmaceth 70000000.ethernet eth0: phylink_mac_config: 
> >>> mode=phy/gmii/Unknown/Unknown adv=00,00000000,000062ff pause=10 link=0 
> >>> an=1
> >>> [ 4159.142466] stmmaceth 70000000.ethernet eth0: phy link up 
> >>> gmii/1Gbps/Full
> >>> [ 4159.142475] stmmaceth 70000000.ethernet eth0: phylink_mac_config: 
> >>> mode=phy/gmii/1Gbps/Full adv=00,00000000,00000000 pause=0f link=1 an=0
> >>> [ 4159.142481] stmmaceth 70000000.ethernet eth0: Link is Up - 1Gbps/Full 
> >>> - flow control rx/tx
> >>>
> >>> The only missing point is the NFS boot that I can't replicate with this 
> >>> setup. But I did some sanity checks:
> >>>
> >>> Remote Enpoint:
> >>> # dd if=/dev/urandom of=output.dat bs=128M count=1
> >>> # nc -c 192.168.0.2 1234 < output.dat
> >>> # md5sum output.dat 
> >>> fde9e0818281836e4fc0edfede2b8762  output.dat
> >>>
> >>> DUT:
> >>> # nc -l -c -p 1234 > output.dat
> >>> # md5sum output.dat 
> >>> fde9e0818281836e4fc0edfede2b8762  output.dat
> >>
> >> On my setup, if I do not use NFS to mount the rootfs, but then manually
> >> mount the NFS share after booting, I do not see any problems reading or
> >> writing to files on the share. So I am not sure if it is some sort of
> >> race that is occurring when mounting the NFS share on boot. It is 100%
> >> reproducible when using NFS for the root file-system.
> > 
> > I don't understand how can there be corruption then unless the IP AXI 
> > parameters are misconfigured which can lead to sporadic undefined 
> > behavior.
> > 
> > These prints from your logs:
> > [   14.579392] Run /init as init process
> > /init: line 58: chmod: command not found
> > [ 10:22:46 ] L4T-INITRD Build DATE: Mon Jul 22 10:22:46 UTC 2019
> > [ 10:22:46 ] Root device found: nfs
> > [ 10:22:46 ] Ethernet interfaces: eth0
> > [ 10:22:46 ] IP Address: 10.21.140.41
> > 
> > Where are they coming from ? Do you have any extra init script ?
> 
> By default there is an initial ramdisk that is loaded first and then the
> rootfs is mounted over NFS. However, even if I remove this ramdisk and
> directly mount the rootfs via NFS without it the problem persists. So I
> don't see any issue with the ramdisk and whats more is we have been
> using this for a long long time. Nothing has changed here.

OK. Can you please test what Ilias mentioned ?

Basically you can hard-code the order to 0 in 
alloc_dma_rx_desc_resources():
- pp_params.order = DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
+ pp_params.order = 0;

Unless you use a MTU > PAGE_SIZE.

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
