Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE750D78D
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 05:30:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2D62C5F1F2;
	Mon, 25 Apr 2022 03:30:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA449C5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 03:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650857433; x=1682393433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=luL0/wg9B+CoFPdBbUSMaeeK0/aZDfKYYg7WWqhLpS0=;
 b=BMvEWAoBZ0NOTCFeF1L1BCbt2VEMGtfF/sOQoceHZuvW8O8obg/xJQ1B
 65hCN7MZdStX9qfZA1ry8yYbyBTPRem8FsqfxJY0twIPcFaJrKYqXmWsg
 QfUMZjQhl6yEjwiMqhFnfo5+fu0crkH8Ss180KVQmse6KLm26dxI9hpo6
 yLP+gug4TnRp0XcBFZ0k/70lHtgWCsiUO7yz/8TTMKV0zsJgVZnnLYQwO
 MvOd9eS+auCVDD2U95XBg7htq3g6hrs05MeYJZRAsC3SsK4flXamOPCc/
 QdZ+4I45KldKIvGopyjrhRqvuaJsWrxls+W8yOhNfn04sTHJrcXBXmQDF g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="245692809"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="245692809"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 20:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="871785621"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2022 20:30:30 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 24 Apr 2022 20:30:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 24 Apr 2022 20:30:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 24 Apr 2022 20:30:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 24 Apr 2022 20:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBUAqdx6Z7skbhORlrqTeLnqjsONfFLJeZ7Vrz9G7F21XTplxZGaeiWyfDawSdrWr37wGAV1mGgbe3LHepfv2YgLaXZkXz0PEl8dgEcKQ4l2BBrTBmBhuOLZndg7gyDHdsXSpgAg9GVDJS7WEB+tsiX6HA8rZIVHbmVdt7BjyiQUXrstGdAITPmbCTmidjBVLYQGXJLGGkGEvj+iPP1B4hRxCYE5qZw1BOiuSIbbtJer93CUver/R/7OHT9ao/kE6pWCSHCgx5ff2ljrX89v9rAwg53HZV03huN54wFHI9z8C7OQdBIuL9vs1bvvFwI21l4iPdrmsFvY1fYv6L3ACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWsC2iqjRNS4ztKVRLIFQMBJ0zy6Zi16BNjytJYj+vE=;
 b=BSbCkGnlLohTFcyOOgSeBKbIYlmXwRwMHwmLqY8zlAXPucEwuxSukF3vXqZa7vZPjmW7Q3RQBHJcaI6MHJNe1FIFCBP69bB/OsWO2GAGFaKml7gAVDes1FwtwMCSLShamVmO9vqWAL5WYuGVvuQOkeNMRnxbxvjkmUJx+ngIwxvm+gI4D/vIiuCqrlLbwtiLfMsoW9P3TXMoV3hB4bb00aPyVpBNgQN7YsuqcGi4JySJMhx3F7mtx4TmTJqUQ0nMrOhOI3aN0VEMi3e+6+ZV3DkRbnibghPCp6K9XY/ZKv5k97NiMKGng6KOOsk2dTS7rHrrbR1tXeVTrKXL7Z2mYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2780.namprd11.prod.outlook.com (2603:10b6:5:c8::19) by
 BL0PR11MB3345.namprd11.prod.outlook.com (2603:10b6:208:6f::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Mon, 25 Apr 2022 03:30:27 +0000
Received: from DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::714a:62c1:8ebd:bbe0]) by DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::714a:62c1:8ebd:bbe0%6]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 03:30:27 +0000
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: 'Russell King' <linux@armlinux.org.uk>
Thread-Topic: [PATCH net-next 1/4] net: pcs: xpcs: add CL37 1000BASE-X AN
 support
Thread-Index: AQHYVhwfIMXBhcfHC0qdNZ1ixGW1oKz7keaAgAEgmCA=
Date: Mon, 25 Apr 2022 03:30:27 +0000
Message-ID: <DM6PR11MB2780E0BA7A87B3395133D328CAF89@DM6PR11MB2780.namprd11.prod.outlook.com>
References: <20220422073505.810084-1-boon.leong.ong@intel.com>
 <20220422073505.810084-2-boon.leong.ong@intel.com>
 <YmJgqSdF7LMxoSXv@shell.armlinux.org.uk>
In-Reply-To: <YmJgqSdF7LMxoSXv@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2136095-47fb-4d7b-7ed1-08da266bf0e6
x-ms-traffictypediagnostic: BL0PR11MB3345:EE_
x-microsoft-antispam-prvs: <BL0PR11MB334567F6BA1EC0D49A21C0E8CAF89@BL0PR11MB3345.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fz1sc5gSsFNH9u6QOoF4Yyx30zSMVSr6GQ8fCRLQTAd/oyMRsZcN8e5pVE/emkIlz+u7mXA8sKiVio+DbN7t5phzZ1qbTlfjq44SLwtNCiYoaHYM2ifzCAeJ68elX0SZ+gvdj9DbbO5xyKNR6Ltz7GTUfNuIy8FLVUXUjf+AtpJ23HLQYTTMf8Q0g/HpqVzA/CNTu3fJW0wVHSpNdHf4y7z8zjrMZaY5qC/NhjWL7ufqyzMYgbzvuvuFpNU2KoOnzrHQ3hvIZ/GBmthXjS1YuuaBeoxv7LfZJp6gG9vxsy/W+0coEXiXJRyyEBEkO9oaF1wf47B31vzfQ1UnHDncqRcctLRB3ZSSk0iyLFHviKCAWWXt2dx6BYXhNAT4zYWH8sBFpiMODJI/+cg3z9Hdr/ZjGTNZ6TNc2NN1czSqq9bsu+LKjZZMjZxvCwRCHxEbrI45Y6KEsrn6JXfn2dEX0Akb5ghRtWlW5/4ACEhL3Lvnku5nqnwEm6XWgYTuLaR9k04MhLQ55F6BwsvGdFQgISOEm5ob6BxsqH8WaXVgkBLADArE2zDrjnkIzHPBE/zJd8kPzIWSR5hTYYeCKhwu/lHRwNYUR+U5TJt/i0ymhepbYPcOdyIwwJ1o22+3RnKACMn99bQWXVo/4lW2s/6wLe1cOm4hTVLIptRB4UOXO5PkxUS/W5Q4DVd+luc/INfdDnJILcgsgCIwDrXORbMI7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2780.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(186003)(76116006)(71200400001)(66476007)(66446008)(6916009)(83380400001)(54906003)(66556008)(64756008)(33656002)(6506007)(55016003)(9686003)(7696005)(26005)(5660300002)(66946007)(8676002)(52536014)(7416002)(8936002)(4326008)(508600001)(2906002)(122000001)(38100700002)(38070700005)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+LxTO1gXcuRcGUdanxK7z4a2H38edrVWkXPSUelUYZk5Q6TjqyeUBeF4ZidD?=
 =?us-ascii?Q?tv1qxh9pnRPHaLdIaDn1QxTe/T6scE6c5qcjOTfr74V21WS0JUCNIFIwpHPR?=
 =?us-ascii?Q?YQIBBVNkqHmTHHD7bmmt7Y3vzo3H6QSZO+R/seOl00YVwiiKSJLYDytBw3VJ?=
 =?us-ascii?Q?00hCfNMU+fNQvFUBtvMlKJZYgBMNE2FtEhDnP2pUwrTzMu7w2UpYN1He4xdA?=
 =?us-ascii?Q?mNoArl+7fK0l3OhRJoeSjke9vfkimHYCwCE0bI68biqsS8wcaKZbxKWTR96p?=
 =?us-ascii?Q?SFnh4GD8jxCnl3PDa9ZaDbI+3I+9tX+8mWFZcQt5GLNjIktn+2DnwvR2kJWK?=
 =?us-ascii?Q?XrxUkGzVHPQ1F56SzgpVsSUFC8eMKDH02K/fslFtbVdBNdmGd82S/ckBO1Ve?=
 =?us-ascii?Q?QcU+wA6ueH2x4WR2y4b79lCkMebktMTo3KecbDdmtDbHzTi5RS9Wx74xN0cY?=
 =?us-ascii?Q?f0R/2NboN3gNsM3+JDEzHNFATMh2L1XpgBSAJKPRBtfRK1qM+HSc8Eyr8eoL?=
 =?us-ascii?Q?fSyhLpE+1VHd6JXcZwsFvNMTonJYWjO4/a4wNRrloBbLXpm9nqnw+AUGssj7?=
 =?us-ascii?Q?cCrfLfJpN9p7i2cRZnJjWNEl6syxEO99M5agcvTUtC1SYFTnhoASZ1hGi/GM?=
 =?us-ascii?Q?jpVzA21lMz7F1yUIIdZ0X/FZSpqOlkzlDLxh5L9I3rJfrQcWvUAiKJsr7YmK?=
 =?us-ascii?Q?A76NytsBLOswIoWX8uw301dbuXvT7+tAv+RVBj+H+FfQkLqndTZ3mosfb9eN?=
 =?us-ascii?Q?biLt26dIfUIMb0kghzzP1frr7lzZhQPd0HnqzPXOJBN3vpa1bzJeL51o51j0?=
 =?us-ascii?Q?SczFN8WaJzr2sZrDlvRhWbVgJ8bhZ2FEyIarqQbEyRmwzdp3XoeVkJvkY4xQ?=
 =?us-ascii?Q?kmNMXQtiQ6xmhFYwC90goPDMnGY9kDZbAiXCHtfKCbtIsB9ENowUgWgHaXkc?=
 =?us-ascii?Q?nRfBHZsIlU5tlKSXdK/TuZgP9ylNGSdg5W+OK7IXKG+LdvtwIb0V+jYXute7?=
 =?us-ascii?Q?sLfd73+6oS8vX8u5kS5Z9N9qJiJiARE7uSo0s8gaZ+XSEmZSUJzbPNYz7v6b?=
 =?us-ascii?Q?KkuGVS+87NrV2CZt1o7ohPJsn5LRw8PABHwhM+20tOb0YhD7adq7SRy2uydx?=
 =?us-ascii?Q?URdcOxcnI5RPra0Njyv8mPqrwOTkLP+7bfylc9fxaRJWbr29Ghmzrure2bnp?=
 =?us-ascii?Q?n37JuOcIFvmTPXoedjYaD/5cazE8iucbcnlEz0iThgyp0OY9O78sJlLBf85s?=
 =?us-ascii?Q?7RPM8p9TMPRAj9GvhlDGXQqvx6yW2iie6ZkauD6FgkDTfo1773S4JE0FyfUp?=
 =?us-ascii?Q?bM7uFwFDt9m/8OjXOBxgd9pG7ow4VmpJdt+a+8gRAWC3tzEjg/jnY+jN7zdQ?=
 =?us-ascii?Q?LHjNUsRB46Z4FfiX6Fb4lADgPJdWBvPcbfDmQJeb9PikjY/weURWEbYLQ/vm?=
 =?us-ascii?Q?M39Tmnl1bAH0kYlJA5/4M5/l12wnQ3AX3Fd8pIoX78e1REuHINw7V0FpoEm6?=
 =?us-ascii?Q?I+Bb6iEYYVPOnHYVTwpjN0+/L+U2gP9sJZLCEb6R8WuV/cNXnu73Q7p7x9bQ?=
 =?us-ascii?Q?COMjmN2P20rDN1z0eaQ8CDJwRk6f1SD+BUOLFrnihzl0TUK1W7aH8TZ9sxiO?=
 =?us-ascii?Q?duSlp/QtJ3xASP513uL90cJ05xTO4T2K9kgYBYZf3+epOijWTlU68IgJiLoo?=
 =?us-ascii?Q?9dTGnp3FO190IplWJUahiNx73oyRNdlZinam7DmLnDxbd0PCmifjC4XBhDzc?=
 =?us-ascii?Q?Li5q6LEoTxuCt5JDcXOKU2p/dnfHZ1Y=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2780.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2136095-47fb-4d7b-7ed1-08da266bf0e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 03:30:27.1183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ApONMX9nd92Z0kxA8LbTCjcy3ZJDI/lzZ0Kn3GdSUd7wtotHobvPEYXYg4f5/zEt05yhSh/ePW5WJ8Tqc3b4S9lhq5j/WoXbHkumNUpcVx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3345
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] net: pcs: xpcs: add CL37
 1000BASE-X AN support
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

>On Fri, Apr 22, 2022 at 03:35:02PM +0800, Ong Boon Leong wrote:
>> @@ -774,6 +788,58 @@ static int xpcs_config_aneg_c37_sgmii(struct
>dw_xpcs *xpcs, unsigned int mode)
>>  	return ret;
>>  }
>>
>> +static int xpcs_config_aneg_c37_1000basex(struct dw_xpcs *xpcs, unsigned
>int mode,
>> +					  const unsigned long *advertising)
>> +{
>> +	int ret, mdio_ctrl;
>> +
>> +	/* For AN for 1000BASE-X mode, the settings are :-
>> +	 * 1) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 0b (Disable C37 AN in
>case
>> +	 *    it is already enabled)
>> +	 * 2) VR_MII_AN_CTRL Bit(2:1)[PCS_MODE] = 00b (1000BASE-X C37)
>> +	 * 3) SR_MII_AN_ADV Bit(6)[FD] = 1b (Full Duplex)
>> +	 *    Note: Half Duplex is rarely used, so don't advertise.
>> +	 * 4) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable C37 AN)
>
>So if this function gets called to update the advertisement - even if
>there is no actual change - we go through a AN-disable..AN-enable
>dance and cause the link to re-negotiate. That doesn't sound like nice
>behaviour.
Good feedback. Will look into this part. 

>
>> +	 */
>> +	mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2,
>DW_VR_MII_MMD_CTRL);
>> +	if (mdio_ctrl < 0)
>> +		return mdio_ctrl;
>> +
>> +	if (mdio_ctrl & AN_CL37_EN) {
>> +		ret = xpcs_write(xpcs, MDIO_MMD_VEND2,
>DW_VR_MII_MMD_CTRL,
>> +				 mdio_ctrl & ~AN_CL37_EN);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>> +	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret &= ~DW_VR_MII_PCS_MODE_MASK;
>> +	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL,
>ret);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_ADVERTISE);
>> +	ret |= ADVERTISE_1000XFULL;
>> +	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_ADVERTISE, ret);
>
>What if other bits are already set in the MII_ADVERTISE register?
>Maybe consider using phylink_mii_c22_pcs_encode_advertisement()?

The IP supports C45 MII MMD access and not C22. Your feedback does
make sense to strengthen the logics here. Thanks 

>
>The pcs_config() method is also supposed to return either a negative
>error, 0 for no advertisement change, or positive for an advertisement
>change, in which case phylink will trigger a call to pcs_an_restart().
>
>> +static int xpcs_get_state_c37_1000basex(struct dw_xpcs *xpcs,
>> +					struct phylink_link_state *state)
>> +{
>> +	int lpa, adv;
>> +	int ret;
>> +
>> +	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ret & AN_CL37_EN) {
>> +		/* Reset link_state */
>> +		state->link = false;
>> +		state->speed = SPEED_UNKNOWN;
>> +		state->duplex = DUPLEX_UNKNOWN;
>> +		state->pause = 0;
>
>Phylink guarantees that speed, duplex and pause are set to something
>sensible - please remove these. The only one you probably need here
>is state->link.

Thanks for the input here. 

>
>> +
>> +		lpa = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_LPA);
>> +		if (lpa < 0 || lpa & LPA_RFAULT)
>> +			return false;
>
>This function does not return a boolean. Returning "false" is the same
>as returning 0, which means "no error" but an error has occurred.
Good catch. 

>
>> +
>> +		adv = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_ADVERTISE);
>> +		if (adv < 0)
>> +			return false;
>
>Ditto.
>
>> +
>> +		if (lpa & ADVERTISE_1000XFULL &&
>> +		    adv & ADVERTISE_1000XFULL) {
>> +			state->speed = SPEED_1000;
>> +			state->duplex = DUPLEX_FULL;
>> +			state->link = true;
>> +		}
>> +
>> +		/* Clear CL37 AN complete status */
>> +		ret = xpcs_write(xpcs, MDIO_MMD_VEND2,
>DW_VR_MII_AN_INTR_STS, 0);
>> +	} else {
>> +		state->link = true;
>> +		state->speed = SPEED_1000;
>> +		state->duplex = DUPLEX_FULL;
>> +		state->pause = 0;
>
>If we're in AN-disabled mode, phylink will set state->speed and
>state->duplex according to the user's parameters, so there should be no
>need to do it here.
Thanks for the input. 

>
>> @@ -994,9 +1143,21 @@ void xpcs_link_up(struct phylink_pcs *pcs,
>unsigned int mode,
>>  		return xpcs_config_usxgmii(xpcs, speed);
>>  	if (interface == PHY_INTERFACE_MODE_SGMII)
>>  		return xpcs_link_up_sgmii(xpcs, mode, speed, duplex);
>> +	if (interface == PHY_INTERFACE_MODE_1000BASEX)
>> +		return xpcs_link_up_1000basex(xpcs, speed, duplex);
>>  }
>>  EXPORT_SYMBOL_GPL(xpcs_link_up);
>>
>> +static void xpcs_an_restart(struct phylink_pcs *pcs)
>> +{
>> +	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
>> +	int ret;
>> +
>> +	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MDIO_CTRL1);
>> +	ret |= BMCR_ANRESTART;
>> +	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MDIO_CTRL1, ret);
>
>If xpcs_read() returns an error, we try to write the error back to
>the control register? Is that a good idea/
Thanks! I will fix this.  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
