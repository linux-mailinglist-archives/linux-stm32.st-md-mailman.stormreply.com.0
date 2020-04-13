Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D663D1A6353
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2020 08:59:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8145CC36B0B;
	Mon, 13 Apr 2020 06:59:07 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC383C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2020 06:59:05 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 941A3C035D;
 Mon, 13 Apr 2020 06:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586761144; bh=Q0jiQANGcT/dtRxrLun8OWlccU+m84ZxfhZwFZgtvvg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CPFVfCpe9Sl7ofRAFW5ILPvJilloG/d04/vk18dAO5c2mhyQ230EVd6vWEIg+3nEj
 SPIUxKgYrLjjf2HDZvLuVhpKmISPHeYEqvb3Q7NiubncY/p2LJv/tw0hSJP8uBbR/O
 lpqL1RFFRdtqtzTLxihPsqAsYIUn1sEBZU/qyTGLdNLamnqCb7gBza2OpWl3E1KB/O
 vjsBy4WMXD2Jcffpoz9SdtTgCp1lQKrNZw15mJNnaCYFyx/PAdp+3751rBCJxBgr5q
 fAanI7bUNJVkikLpuKGeiURoH+ZRPxrr7O/hqd0WntE0i1DivbOP9rL98QvfFdqCA4
 fJ3Q5Wa5WBe1w==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C5C70A0080;
 Mon, 13 Apr 2020 06:59:02 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 12 Apr 2020 23:59:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 12 Apr 2020 23:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA4a6Iboppwpwmo76attsRRMM+YlgMRZdbcDnOaLowMzUSWV5+hiKs/MzCIuOLuHPgughZwVCrP2A9eyOkoIZgB95Kji1auRO9P34J1ttmatV3LUgJrLCevP9YDUQyObKVCSgSdPrA89prCIv15iudiYsyE9c2Kdgikn3VOT+oxxr3fua90nvyisuHmPeg5pAMeDeaaJ9uL/W+GB4HyfGPpUxdXBMCRpzIi9fzVDUiVMrSB29oJEgcj3/S39w9Vc1PxZ0FsywVJJWbGc+QSUTnz2+5Pmm5A4RlvgFku24diBguHEFn0lZIQc4yPEHcTA52PV8bffSgE5o1vBoGqGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0jiQANGcT/dtRxrLun8OWlccU+m84ZxfhZwFZgtvvg=;
 b=Gf+hkkRk1eQFxke6qvBtxjSR/Cb+n3axu0oGlH+HRTGMWsJc4yD2F8uLsNjA8/W3QNEE4jmbpZ2CmrOcO6iZkymmGQw7YZqJMEitI4DPgloAm7vNS/Wu2WPZzeLwKzr26k/QaplOIXeHKTzh6jPLK9RO57JI30RqanMYA7lugm617VqpPAQvYDbkVuCms3iBmATJViyBiRBRyIM/GgbL6dBq6Z3JiArTSjttsQEhRHY0S/ux851jLrrB7i9iHtsgA7/LEfemFpG8LyyJ8UEke3N3hpvMDnXD2q1+gPpT1zDASMbhlPlkzzbd6bIBcfwSS8HBU2cuy/EiBd9u3tmjPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0jiQANGcT/dtRxrLun8OWlccU+m84ZxfhZwFZgtvvg=;
 b=J+XztPbl0/a1VXXLn0E+3k3LVwtzoVpEc6UcP8iY7jA0Kw9DL4TojMaHD9j5nlSj0ebK7Bo64FsV1ycTCctUnRWLbSMyswVa9sFyS2BNt1m4PK3/Eg9Ibvj6nHmiH0ClvdU2SkbX5+rDlQDL7C77ldVKXUPfAypfnMQxvqkyoA0=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (2603:10b6:408:6e::17)
 by BN8PR12MB3364.namprd12.prod.outlook.com (2603:10b6:408:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Mon, 13 Apr
 2020 06:56:31 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::651e:afe5:d0fb:def4]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::651e:afe5:d0fb:def4%3]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 06:56:31 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Chen-Yu Tsai <wens@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Thread-Topic: [PATCH net] net: stmmac: Guard against txfifosz=0
Thread-Index: AQHWEH11lcj1LhRkfUiqKOYMl1gtAKh1zzAAgAABHYCAAMjRAIAABZ+AgAAA9RA=
Date: Mon, 13 Apr 2020 06:56:31 +0000
Message-ID: <BN8PR12MB32667D9FEB2FBC9657C16183D3DD0@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20200412034931.9558-1-f.fainelli@gmail.com>
 <20200412112756.687ff227@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <ae06b4c6-6818-c053-6f33-55c96f88a4ae@gmail.com>
 <BN8PR12MB3266A47DE93CEAEBDB4F288AD3DD0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <CAGb2v65wjtphcN4DEM4mfv+=U5KUmsTujVoPb9L0idwy=ysDZw@mail.gmail.com>
In-Reply-To: <CAGb2v65wjtphcN4DEM4mfv+=U5KUmsTujVoPb9L0idwy=ysDZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a4a3c69-75f9-4e51-ac54-08d7df77cc3c
x-ms-traffictypediagnostic: BN8PR12MB3364:
x-microsoft-antispam-prvs: <BN8PR12MB3364D24EFC1713B1F6BF9F64D3DD0@BN8PR12MB3364.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3266.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(396003)(346002)(136003)(39850400004)(366004)(66476007)(66556008)(64756008)(8936002)(71200400001)(8676002)(52536014)(5660300002)(66446008)(478600001)(76116006)(66946007)(81156014)(86362001)(33656002)(54906003)(55016002)(4326008)(9686003)(53546011)(110136005)(316002)(7696005)(26005)(2906002)(6506007)(186003)(7416002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MLzCxwSUPwRx1cSQYK5BvxzkUfT08LmL1d6XSi2SoTxQfOWhOCt4paga6XN1a9mDzE0jvxEKxD0f2rCoxf6oKobreQ6WU7YhtFZfe+tSJIhG6qF/d741tl5cObRBuo6i6Lr5imW23qjma/3jC7u7voHA8vKHkglYby8vnOoJpT75fSk40XohHcs4V+CtwCeIxkBCBXmgXZUKzy+yndupPYTapG18SZ6FgPVG0RttMNFuqLs/cV1T2gDoqSOg/dZfu244EBxvTR7Vk2PwViQmvcqkfq/ThNzPQs5O9NhHQkWzCU468YwvcKTXK6igDqFInQNmOb93Mta986sMUR5OH/miewmBFK+BB8DVLFB7EdvqxbDUKhQkCjTzHOz8nKp3c+qsviw8514jc8mskkkt4FzF4uINrGdnfVMZTjAunNORoEQ0gLwnRh3L3xju1Ctz
x-ms-exchange-antispam-messagedata: 2mdR+PABWaftLa4hKj4l+zwStx333Gi1NEDl/J0J+sCAszRKe6ryNe+NqWNqAKiWuMssVRe9O65rfdeuTwsMxkrdXMrTF7SS9Bc4yLZ0qehWbCN0C0HTXmFkn5eHEBbydI/hVNeVVwsONWrRwCHuLA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4a3c69-75f9-4e51-ac54-08d7df77cc3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 06:56:31.6245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLisMvE7wBob7cg7oMJl50/cVeKfMcCbg2MzjIwOAdTV630favYg88SiGcLPNL00Gcc2kOrRtWNgS4jjhCUqgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3364
X-OriginatorOrg: synopsys.com
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Guard against txfifosz=0
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

From: Chen-Yu Tsai <wens@kernel.org>
Date: Apr/13/2020, 07:50:47 (UTC+00:00)

> On Mon, Apr 13, 2020 at 2:42 PM Jose Abreu <Jose.Abreu@synopsys.com> wrote:
> >
> > From: Florian Fainelli <f.fainelli@gmail.com>
> > Date: Apr/12/2020, 19:31:55 (UTC+00:00)
> >
> > >
> > >
> > > On 4/12/2020 11:27 AM, Jakub Kicinski wrote:
> > > > On Sat, 11 Apr 2020 20:49:31 -0700 Florian Fainelli wrote:
> > > >> After commit bfcb813203e619a8960a819bf533ad2a108d8105 ("net: dsa:
> > > >> configure the MTU for switch ports") my Lamobo R1 platform which uses
> > > >> an allwinner,sun7i-a20-gmac compatible Ethernet MAC started to fail
> > > >> by rejecting a MTU of 1536. The reason for that is that the DMA
> > > >> capabilities are not readable on this version of the IP, and there is
> > > >> also no 'tx-fifo-depth' property being provided in Device Tree. The
> > > >> property is documented as optional, and is not provided.
> > > >>
> > > >> The minimum MTU that the network device accepts is ETH_ZLEN - ETH_HLEN,
> > > >> so rejecting the new MTU based on the txfifosz value unchecked seems a
> > > >> bit too heavy handed here.
> > > >
> > > > OTOH is it safe to assume MTUs up to 16k are valid if device tree lacks
> > > > the optional property? Is this change purely to preserve backward
> > > > (bug-ward?) compatibility, even if it's not entirely correct to allow
> > > > high MTU values? (I think that'd be worth stating in the commit message
> > > > more explicitly.) Is there no "reasonable default" we could select for
> > > > txfifosz if property is missing?
> > >
> > > Those are good questions, and I do not know how to answer them as I am
> > > not familiar with the stmmac HW design, but I am hoping Jose can respond
> > > on this patch. It does sound like providing a default TX FIFO size would
> > > solve that MTU problem, too, but without a 'tx-fifo-depth' property
> > > specified in Device Tree, and with the "dma_cap" being empty for this
> > > chip, I have no idea what to set it to.
> >
> > Unfortunately, allwinner uses GMAC which does not have any mean to detect
> > TX FIFO Size. Default value in HW is 2k but this can not be the case in
> > these platforms if HW team decided to change it.
> 
> I looked at all the publicly available datasheets and Allwinner uses
> 4K TX FIFO and 16K RX FIFO in all SoCs. Not sure if this would help.

Yes, thanks for finding this!

So, I think correct fix is then to hard-code these values in dwmac-sunxi.c 
probe function using the already available platform data structure.

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
