Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK8kN3kZsWn6qgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF08C25DE9A
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AC94C90097;
	Wed, 11 Mar 2026 07:27:53 +0000 (UTC)
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com
 [67.231.148.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E28C0C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 15:08:48 +0000 (UTC)
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62A6bbZM1846057; Tue, 10 Mar 2026 08:07:37 -0700
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11022097.outbound.protection.outlook.com [52.101.48.97])
 by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4cte6uhnn4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2026 08:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mABx9NN/5C+R6XHBdjNDb3cqTt37N6+Lar2wFnkT+YKPW+7caZRxdlkyGoYWJVV34i1xL6Be3Uv+wdsBOsMeEeoZX6InTXp6Vr1/SBGCEtDSnBF3i1ugY/CsbBA27kt6TykgNOzCrawQ6wZVe7x7Olk7qrOs9lazKmLcev5rYwe1JJWWKapAPeBonzYR/63JGzpeFfnanR0y47drlaRoWbhzGwrsXnaxewmI7af71eZQj7uiMhBo0YjtY7LHb0H8GjM3md5s79rOv7G5McY73MQx5OPDZNkkeTa6t5oW1jbZnUAjKLqQEQtkRgJUKceTKdRT/TB47nHzyuFMz4VlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dx0jFElRQCzuElB3xkafsU3B0B1oyWjkQOIQutQeyI=;
 b=zRq8Ech820q8slEFhIannEobkplOx9ojLx3RImupb6UKASMVdgxjWVpSuQAoAZhZbggPjA6/anCxhJ8XiUhQHfyiOYi1rdpERFg13d09QB+HW09msnq948Okc2ZAkQtRCFDBTjbuZcFBGZmzZEtOoWSKooLaHUeKkZNN2vAqm1vQYfaQx00HV50btNkUCt0DJkVZYZLFP6EcWPqJ+3f4R6q+K7A9Tml3n11SN/EXtFe4S1rEtdgAn6zr8zPDy5apOeiaez6FiQ9Si/7dryxiuvjJ/yqEnNVY6wlig/yR1R0CcBWXOokCiLOnDwMqfElPWctTOhS+xkO+jbkmiSX0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dx0jFElRQCzuElB3xkafsU3B0B1oyWjkQOIQutQeyI=;
 b=KELOA0oT2dz9pXYGVjzVlBVL6naqUFQRhiiusj3iCuZqAMScT7fJUF30V7icKDopFXbPSpFvX8U3tNZLBHb2ChgmIIjSeQpmDFhpXCRUExhtOvv4Qtsjbr8RVANEPClR7emCMQJH55NUST/sosG2qIaL0sRow5JvI52ArCouJks=
Received: from BN9PR18MB4251.namprd18.prod.outlook.com (2603:10b6:408:11c::10)
 by SN7PR18MB4400.namprd18.prod.outlook.com (2603:10b6:806:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 15:07:29 +0000
Received: from BN9PR18MB4251.namprd18.prod.outlook.com
 ([fe80::8581:a781:5bfd:fc1b]) by BN9PR18MB4251.namprd18.prod.outlook.com
 ([fe80::8581:a781:5bfd:fc1b%4]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 15:07:29 +0000
From: Elad Nachman <enachman@marvell.com>
To: Philipp Hahn <phahn-oss@avm.de>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "apparmor@lists.ubuntu.com"
 <apparmor@lists.ubuntu.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "cocci@inria.fr"
 <cocci@inria.fr>, "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-bluetooth@vger.kernel.org"
 <linux-bluetooth@vger.kernel.org>, "linux-btrfs@vger.kernel.org"
 <linux-btrfs@vger.kernel.org>, "linux-cifs@vger.kernel.org"
 <linux-cifs@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-erofs@lists.ozlabs.org"
 <linux-erofs@lists.ozlabs.org>, "linux-ext4@vger.kernel.org"
 <linux-ext4@vger.kernel.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org"
 <linux-leds@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, "linux-sh@vger.kernel.org"
 <linux-sh@vger.kernel.org>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "ntfs3@lists.linux.dev"
 <ntfs3@lists.linux.dev>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>, "sched-ext@lists.linux.dev"
 <sched-ext@lists.linux.dev>, "target-devel@vger.kernel.org"
 <target-devel@vger.kernel.org>, "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>, "v9fs@lists.linux.dev"
 <v9fs@lists.linux.dev>
Thread-Topic: [EXTERNAL] [PATCH 38/61] net: Prefer IS_ERR_OR_NULL over manual
 NULL check
Thread-Index: AQHcsIkeZ/xggwHfFkuIUZ5RP4ycHrWn3KSw
Date: Tue, 10 Mar 2026 15:07:29 +0000
Message-ID: <BN9PR18MB425115D21F4E30DD480F56E7DB46A@BN9PR18MB4251.namprd18.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-38-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-38-bd63b656022d@avm.de>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR18MB4251:EE_|SN7PR18MB4400:EE_
x-ms-office365-filtering-correlation-id: abfe42a5-442b-464d-4fff-08de7eb6bf6d
x-ld-processed: 70e1fb47-1155-421d-87fc-2e58f638b6e0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: lIcbvYB7WZbatPehR+tNCJXPsytgVz8ncaoaPmz12te01Q/D8LntZ8ctwi/EnN5SuXfgyt4wvlVvLhS+kzTTqQbPvfu3V4oA6r7A6r20z3gkG2dEUsOF18S7doEjcQF03RVb0K3hXr2nUGU7lcvU1C7QUnvLucoPiyXTZWdmVLWoFy4N3zboFt3WoUrcPDdUzBB+ZyibNSiRWW9aZs4bQxl+D2q0Zjc7BZRUmN8HwMWccM+ZMz4k7Ai7aVgSyqUDVUb+45LckE4oFqoFWhsXVffS7dcVMCaiDN3dWIgZg5ar4Kkz12uCTLSjUVrrl3cB01yhuS2jZyRtP00RlqAyo5s6MpwWSqR7cDG/r8r7mxVUKzFEMaDveSXVhaM8Bpx2nd0oa02Mehcfxzz3GFeggrniABU7i+IGs9KQEr2WEc0hHiShki5HIl11CsGAZjEj2YMM+6YzTXapBW8UkSK4NQuH7rVoMNv1j9tXI0RYNIobvBi1sIuuIXbuo+09gN6zWeO+Gg3PUMfge6pUtgRBe6vzyb+yFSC1LrINVjgq7tfDapRDvnC+ifzj3pMRFf2dYuwemnqzszpKPVXxEkRitBoAS0L00MZLqvL37OkZMvMLIRN0aKTpszr4qULcuousalYR0aX0l7A3dR++sS+LbSvtM7PsvGJNBzSRF5BYM1/K3sdI2FGn3h6/4gQKgXS2z7o6Kl/mvN3OTYS5RAVfQIrEvC4oasmzWn6zSlWi9jCB4OshPprQEf6Ha2katbsGiQXryezqWn5/pNhp2KrNeLHssFiyD45DNGGFFvOESmKFOEV5e5kqdPYGFJ25fFbj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR18MB4251.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGp5R0N1UkppWkZkNk9kZWFoeC9Ta0F5VHNMcTh1eTVONkI2WXR4Q0doUE52?=
 =?utf-8?B?U3FWcHVqZkhXOTlERDk3RWF5bDZMRitXK1YxY3ZKY25uQXNsY20xOHVFdGhI?=
 =?utf-8?B?b2tDUkZEZVZMRjdZTHcyZjdiMkYzUE1RRjdacG43eWZQalUvOWx4dDBZUytO?=
 =?utf-8?B?a1IrZ1lrQ2hoZjRQbWF4R3BsZXNyS3ZMdHIyeE1ZYjlnZG1LTlVISExkamtU?=
 =?utf-8?B?NEpVSVZsc0NMZ042L3FScmhvMlRCWEhHeUxIbFJqTWpPd013NXhRYW9MYVN2?=
 =?utf-8?B?a2R3YytreGwwWXJrdDgzMjhMbDB2ZERPa0dCcEQ4ZGRQQTJYVFlQVHFKeFBw?=
 =?utf-8?B?TTBFbkQ1djJNY2FrSU16WWxaandGMlFhU0NkREZiUGdaSk9JcWEyTVVJcnFw?=
 =?utf-8?B?RVJrRTBXSFdoVGswNHZoOFRwYm9rd2Z3eEhETVYzaDBYbEkxZldHTG5PaWhJ?=
 =?utf-8?B?MndCUS9yUlFyZTFieVM0UVVja2ZLR01IUTdxN0dpVXlNakt6NjhCUkpuZ0Q1?=
 =?utf-8?B?NHdETUpJY1I5YlZ5QkM2MUFENU1IUVFJUkVWNFh2QU9kNDF6SFN5em5KZEZ3?=
 =?utf-8?B?OHFZa1pWVGUyZ3ZxQ09ObEpLNFpJdXdad1ltOHRQTlpxSEoyZWowS3lIbUVL?=
 =?utf-8?B?c21XT3dXVnNsOGlqNmZ2NExRS0l4MGZSejFaZXdueDRCdklkUllFdlROOUds?=
 =?utf-8?B?YTB1TXZybGQ4TnczRk9kbWJ6NGcxdnA2SWI0NVo2Wk5Lc2NnaVA2TEVtL251?=
 =?utf-8?B?U0hISFhwQlpCakJuQjZka25QOHF2ZVpYZnVhYTJCZXhwZW5qTGsyRFNyRlVZ?=
 =?utf-8?B?Ty9IbHcvOUZBeC9Xa3Y4akVKN05RMlc5UnJ5Z1grZzFsWU91L2N6aUxyL1lC?=
 =?utf-8?B?dWtobVpid1RBallLeE5xVTFndnhBTnJmVG1STklWSWlta3pha2NJTHVKcG01?=
 =?utf-8?B?LzA4THV2amZnM21zWmdBU0FlSmRKS1BGcTFKTGJWbDZIWEVpNEF6Zy9kalc1?=
 =?utf-8?B?d3kxbTBsUVl1R1F6cUFudHVyZ2Z6OXJuNWt0NWlsOEFNMDFqdEVFeWo2WGlI?=
 =?utf-8?B?Z0ozelJEQm0yRUg3ZytUYzdrQnI3Q0lzV2dWc2F4NHBsV2p3Sk9EWmJCUEZ1?=
 =?utf-8?B?R1Z2WnN2bnZkL284M1VtZ1BQYURYbS9yTFArUDBoTXZ3L1R2Q3N4WUo5OFla?=
 =?utf-8?B?RDVhYVZyc3YxbU5sbkorV2dUdWdLYmRjbkFCeXQ5U0FndnJFcFpteURxRVJS?=
 =?utf-8?B?SlFnSTczSzA0dnZEem1PdWxpR1JSd0NNOWp5c0xJRUdXQ2NXRmxKYWRVWFNC?=
 =?utf-8?B?MG5EOU1OM0RoblBPeVpRU1pqUmlGTFgyM0hhOWpVQUsxQXhKVCt4cDJlVkhD?=
 =?utf-8?B?NmxmUldEcG05eUZBWDZWQVV6aGVTTXVrNkdZNC9ZWTloRk9Ec3pLb3QxT1Q1?=
 =?utf-8?B?azhISDVVN1lTcVZ6bDlLS0ozY1crMkdsNTdicjJvRzBPSVdJZkdTYnhDR241?=
 =?utf-8?B?K0U0QzM5S0Z2Rk9CUlp4Wjc5V2dwbW9GcmRxckZSWi9Hb2d5UTF3TnZ0cHFQ?=
 =?utf-8?B?UnVOQXNBZ0czRDZaZnIxaGd1V2xtcWhGdlhFTEhUWWdlUEpzcXRWWm9jYkxx?=
 =?utf-8?B?WHVYSUIrY0FQMk9MRTBLcUw0eEZ0V05VTGFqeFJaa3Jmcmo5ZzlYWWgwSXAz?=
 =?utf-8?B?bDh0eHo3VkphcTBMcEdKZE84S0dOMEZuK21zcEdkU0lhYUFoS3JYemVnRTZ5?=
 =?utf-8?B?NlRVeWJ6RGtyZzdBUDJsTFFWZnYwWlBsY1RtTEZtTDRLc2pVWGxFQnBqZ0tZ?=
 =?utf-8?B?VEMxbjhCNXpkMkF1ZVprR0Mxa0tuTG8zTElMaENKK3JiYlNaRUxKNnZJTHkr?=
 =?utf-8?B?eElvSkw1bTlJTDE3NUNCV2tjME92SE5DZm9nK3ovZVA3MW9zUWMxaDVXa3FN?=
 =?utf-8?B?K3hEczVUbkJkZS9RMklUcFlzMHU2OHBBSjl3bUwybCtJdVRRSGxkdTlGU1Bm?=
 =?utf-8?B?RmJHTEhaRFFCMWZRNEE0UEF6VU02c2d4WWt5T3BiQ3ozclRDOWEzU1dsUVVC?=
 =?utf-8?B?cmFiTWIrQVBzYUI1MUw1UFFVVEgzNFBxSzRTM3hTekY3bTJLMFNUWGZ5VWlS?=
 =?utf-8?B?VEk2VStnMmk2YTJZd2ZEeUgva1h3RmZyYjJKUlhXUDhBSkJ1Z09IMlljR2g0?=
 =?utf-8?B?ZkxZMmpvaVMxcFA3MzI2MEZpNFF0VWR1SlFyU2lqUVdyT1V6NmY0a0Z4SEdi?=
 =?utf-8?B?TDJ1cEYrSS9KUGtEcmNsQkU0bTJ5d0JjeXd2cjlrTkY2Q3RscS96QzBjQXhW?=
 =?utf-8?B?NFhDek1wL2FGM0ZScmhGbnVKSXg0V25Dbmtkd3ludDZMTDlGUGJqUT09?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XTdsE3xw+r72za5XcswWbolKIfSFnh0plbDzuAgMAiCvxvFRvqD4Q2UBVPEeRsz2ZNnBbMFh0KGCXNGdSSC4lKg+4MbKI2a6IKAAg7I2RWHFRcI8csV2clUn0ix3os1yRI0K1UyuLW4ZMRDU/z5gZKErjJpzV5OPrJGEblGs0S90sIBuLMx+uq1elsmC9tMaZyVRanSwdaA1svC0+K1dEGFUVKecmpB+bSo0VjPP9CrOqz5ozfxrSGeUUN7FVws54fURoK6qP4keGM8HmkS6a2RFHQ9ow73UPonWGaN4t/J1HV6zDLeYmqGHYUTpIkQhKUb5Cs926YA+29w2sidS2w==
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR18MB4251.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfe42a5-442b-464d-4fff-08de7eb6bf6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 15:07:29.3787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9il1EPukTYTVtWi+TL/GFX7Py26khauNltMzlXd0UBcwHwqH3ZQ0OC7MWbPWsQ9Be1ZksBhAUydMhKY+ShO3/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB4400
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=69b033b9 cx=c_pps
 a=kzsVodbpLl5/Zj7uDz6sWQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=-AAbraWEqlQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=TtqV-g6YmW1Jfm2GSLaY:22 a=M5GUcnROAAAA:8
 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=Q-fNiiVtAAAA:8 a=AGRr4plBAAAA:8 a=QyXUC8HyAAAA:8 a=g8kJ_gb0AAAA:8
 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=vzhER2c_AAAA:8 a=PHq6YzTAAAAA:8
 a=lTbjQzD5AAAA:8 a=phlkwaE_AAAA:8 a=JfrnYn6hAAAA:8 a=e5mUnYsNAAAA:8
 a=fxJcL_dCAAAA:8 a=voM4FWlXAAAA:8 a=37rDS-QxAAAA:8 a=hGzw-44bAAAA:8
 a=FP58Ms26AAAA:8 a=2Y-fJpPwltZ1yrNfleAA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=OBjm3rFKGHvpk9ecZwUJ:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=bOnWt3ThIoLzEnqt84vq:22
 a=ecSNLfPMzbq-p5zXJZOg:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=0YTRHmU2iG2pZC6F1fw2:22
 a=ZKzU8r6zoKMcqsNulkmm:22 a=w8YF5asEQ23juLwKoPR8:22 a=uKTQOUHymn4LaG7oTSIC:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=Vxmtnl_E_bksehYqCbjh:22 a=IC2XNlieTeVoXbcui8wp:22
 a=k1Nq6YrhK2t884LQW06G:22 a=HvKuF1_PTVFglORKqfwH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzMSBTYWx0ZWRfX7sIdcLwRou48
 STpxAdzmTIFltfom6/gddPw+Hxt9YSeBSTr+FMrnQf4BYblVl1Swt32zRHGMP3M56MuSpUdsJn2
 zcRM+5GZReGqVXZ1Lux3ordmUOsRbt2ILzhaZgg/hq2THhMuyKU0O7scmOhy/0pcF74LOBuYP4X
 NBLWL06/vzs1LA/Teh6R1KJv7s1CUg1K8nJn7/gl5JVuMQieBGKwXj1ESX3XnXH73JQZD04dgFY
 T03/TZRF9WRI2XRqxnxVzVADrXT4QTWIx+thXyhI1HOKPUBg2U3fO3JX9Pk2c+tLOnox3snDfQt
 oajcgiAYPtUue/w0H5Y+ZKsdaUYTykSr3B+gTizfFHP4NlW73Yu7TyneBaFu+31qfNk/OleAsT6
 54ZBqPVMyCS0LZDYcuBHHhbU1CBkjLFEARuwqU31rD7NEhGdSAGwcRjcfuJJYE2zhXGIE3cAYWl
 TwfQXHWoP9LqfePUJ2Q==
X-Proofpoint-GUID: Nl5W4I-io87qvTSFXJtlxRwMkjWAYvb0
X-Proofpoint-ORIG-GUID: Nl5W4I-io87qvTSFXJtlxRwMkjWAYvb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:23 +0000
Cc: Taras Chornyi <taras.chornyi@plvision.eu>,
 Igor Russkikh <irusskikh@marvell.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Potnuri Bharat Teja <bharat@chelsio.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Chan <mchan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [EXTERNAL] [PATCH 38/61] net: Prefer
 IS_ERR_OR_NULL over manual NULL check
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
X-Rspamd-Queue-Id: BF08C25DE9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[marvell.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[marvell.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kerne
 l.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:taras.chornyi@plvision.eu,m:irusskikh@marvell.com,m:przemyslaw.kitszel@intel.com,m:bharat@chelsio.com,m:keyur@os.amperecomputing.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:iyappan@os.amperecomputing.com,m:anthony.l.nguyen@intel.com,m:quan@os.amperecomputing.com,m:mcoquelin.stm32@gmail.com,m:mchan@broadcom.com,m:pavan.chebbi@broa
 dcom.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:hkallweit1@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[enachman@marvell.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[plvision.eu,marvell.com,intel.com,chelsio.com,os.amperecomputing.com,armlinux.org.uk,lunn.ch,google.com,gmail.com,broadcom.com,kernel.org,redhat.com,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enachman@marvell.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[marvell.com:-];
	RCPT_COUNT_GT_50(0.00)[72];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.920];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

> 
> 
> From: Philipp Hahn <phahn-oss@avm.de>
> Sent: Tuesday, March 10, 2026 1:49 PM
> To: amd-gfx@lists.freedesktop.org; apparmor@lists.ubuntu.com; bpf@vger.kernel.org; ceph-devel@vger.kernel.org; cocci@inria.fr; dm-devel@lists.linux.dev; dri-devel@lists.freedesktop.org; gfs2@lists.linux.dev; intel-gfx@lists.freedesktop.org; intel-wired-lan@lists.osuosl.org; iommu@lists.linux.dev; kvm@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-block@vger.kernel.org; linux-bluetooth@vger.kernel.org; linux-btrfs@vger.kernel.org; linux-cifs@vger.kernel.org; linux-clk@vger.kernel.org; linux-erofs@lists.ozlabs.org; linux-ext4@vger.kernel.org; linux-fsdevel@vger.kernel.org; linux-gpio@vger.kernel.org; linux-hyperv@vger.kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; linux-leds@vger.kernel.org; linux-media@vger.kernel.org; linux-mips@vger.kernel.org; linux-mm@kvack.org; linux-modules@vger.kernel.org; linux-mtd@lists.infradead.org; linux-nfs@vger.kernel.org; linux-omap@vger.kernel.org; linux-phy@lists.infradead.org; linux-pm@vger.kernel.org; linux-ro
 ckchip@lists.infradead.org; linux-s390@vger.kernel.org; linux-scsi@vger.kernel.org; linux-sctp@vger.kernel.org; linux-security-module@vger.kernel.org; linux-sh@vger.kernel.org; linux-sound@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-trace-kernel@vger.kernel.org; linux-usb@vger.kernel.org; linux-wireless@vger.kernel.org; netdev@vger.kernel.org; ntfs3@lists.linux.dev; samba-technical@lists.samba.org; sched-ext@lists.linux.dev; target-devel@vger.kernel.org; tipc-discussion@lists.sourceforge.net; v9fs@lists.linux.dev; Philipp Hahn <phahn-oss@avm.de>
> Cc: Igor Russkikh <irusskikh@marvell.com>; Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Pavan Chebbi <pavan.chebbi@broadcom.com>; Michael Chan <mchan@broadcom.com>; Potnuri Bharat Teja <bharat@chelsio.com>; Tony Nguyen <anthony.l.nguyen@intel.com>; Przemek Kitszel <przemyslaw.kitszel@intel.com>; Taras Chornyi <taras.chornyi@plvision.eu>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; Alexandre Torgue <alexandre.torgue@foss.st.com>; Iyappan Subramanian <iyappan@os.amperecomputing.com>; Keyur Chudgar <keyur@os.amperecomputing.com>; Quan Nguyen <quan@os.amperecomputing.com>; Heiner Kallweit <hkallweit1@gmail.com>; Russell King <linux@armlinux.org.uk>
> Subject: [EXTERNAL] [PATCH 38/61] net: Prefer IS_ERR_OR_NULL over manual NULL check
> ZjQcmQRYFpfptBannerEnd
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Igor Russkikh <mailto:irusskikh@marvell.com>
> To: Andrew Lunn <mailto:andrew+netdev@lunn.ch>
> To: "David S. Miller" <mailto:davem@davemloft.net>
> To: Eric Dumazet <mailto:edumazet@google.com>
> To: Jakub Kicinski <mailto:kuba@kernel.org>
> To: Paolo Abeni <mailto:pabeni@redhat.com>
> To: Pavan Chebbi <mailto:pavan.chebbi@broadcom.com>
> To: Michael Chan <mailto:mchan@broadcom.com>
> To: Potnuri Bharat Teja <mailto:bharat@chelsio.com>
> To: Tony Nguyen <mailto:anthony.l.nguyen@intel.com>
> To: Przemek Kitszel <mailto:przemyslaw.kitszel@intel.com>
> To: Taras Chornyi <mailto:taras.chornyi@plvision.eu>
> To: Maxime Coquelin <mailto:mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <mailto:alexandre.torgue@foss.st.com>
> To: Iyappan Subramanian <mailto:iyappan@os.amperecomputing.com>
> To: Keyur Chudgar <mailto:keyur@os.amperecomputing.com>
> To: Quan Nguyen <mailto:quan@os.amperecomputing.com>
> To: Heiner Kallweit <mailto:hkallweit1@gmail.com>
> To: Russell King <mailto:linux@armlinux.org.uk>
> Cc: mailto:netdev@vger.kernel.org
> Cc: mailto:linux-kernel@vger.kernel.org
> Cc: mailto:intel-wired-lan@lists.osuosl.org
> Cc: mailto:linux-stm32@st-md-mailman.stormreply.com
> Cc: mailto:linux-arm-kernel@lists.infradead.org
> Cc: mailto:linux-usb@vger.kernel.org
> Signed-off-by: Philipp Hahn <mailto:phahn-oss@avm.de>
> ---
>  drivers/net/ethernet/aquantia/atlantic/aq_ring.c        | 2 +-
>  drivers/net/ethernet/broadcom/tg3.c                     | 2 +-
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c    | 3 +--
>  drivers/net/ethernet/intel/ice/devlink/devlink.c        | 2 +-
>  drivers/net/ethernet/marvell/prestera/prestera_router.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
>  drivers/net/mdio/mdio-xgene.c                           | 2 +-
>  drivers/net/usb/r8152.c                                 | 2 +-
>  8 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
> index e270327e47fd804cc8ee5cfd53ed1b993c955c41..43edef35c4b1ff606b2f1519a07fad4c9a990ad4 100644
> --- a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
> +++ b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
> @@ -810,7 +810,7 @@ static int __aq_ring_xdp_clean(struct aq_ring_s *rx_ring,
>  		}
> 
>  		skb = aq_xdp_run_prog(aq_nic, &xdp, rx_ring, buff);
> -		if (IS_ERR(skb) || !skb)
> +		if (IS_ERR_OR_NULL(skb))
>  			continue;
> 
>  		if (ptp_hwtstamp_len > 0)
> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 2328fce336447eb4a796f9300ccc0ab536ff0a35..8ed79f34f03d81184dcc12e6eaff009cb8f7756e 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -7943,7 +7943,7 @@ static int tg3_tso_bug(struct tg3 *tp, struct tg3_napi *tnapi,
> 
>  	segs = skb_gso_segment(skb, tp->dev->features &
>  				    ~(NETIF_F_TSO | NETIF_F_TSO6));
> -	if (IS_ERR(segs) || !segs) {
> +	if (IS_ERR_OR_NULL(segs)) {
>  		tnapi->tx_dropped++;
>  		goto tg3_tso_bug_end;
>  	}
> diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
> index 3307e50426819087ad985178c4a5383f16b8e7b4..1c8a6445d4b2e3535d8f1b7908dd02d8dd2f23fa 100644
> --- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
> +++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
> @@ -1032,8 +1032,7 @@ static void ch_flower_stats_handler(struct work_struct *work)
>  	do {
>  		rhashtable_walk_start(&iter);
> 
> -		while ((flower_entry = rhashtable_walk_next(&iter)) &&
> -		       !IS_ERR(flower_entry)) {
> +		while (!IS_ERR_OR_NULL((flower_entry = rhashtable_walk_next(&iter)))) {
>  			ret = cxgb4_get_filter_counters(adap->port[0],
>  							flower_entry->filter_id,
>  							&packets, &bytes,
> diff --git a/drivers/net/ethernet/intel/ice/devlink/devlink.c b/drivers/net/ethernet/intel/ice/devlink/devlink.c
> index 6c72bd15db6d75a1d4fa04ef8fefbd26fb6e84bd..3d08b9187fd76ca3198af28111b6f1c1765ea01e 100644
> --- a/drivers/net/ethernet/intel/ice/devlink/devlink.c
> +++ b/drivers/net/ethernet/intel/ice/devlink/devlink.c
> @@ -791,7 +791,7 @@ static void ice_traverse_tx_tree(struct devlink *devlink, struct ice_sched_node
>  						  node->parent->rate_node);
>  	}
> 
> -	if (rate_node && !IS_ERR(rate_node))
> +	if (!IS_ERR_OR_NULL(rate_node))
>  		node->rate_node = rate_node;
> 
>  traverse_children:
> diff --git a/drivers/net/ethernet/marvell/prestera/prestera_router.c b/drivers/net/ethernet/marvell/prestera/prestera_router.c
> index b036b173a308b5f994ad8538eb010fa27196988c..4492938e8a3da91d32efe8d45ccbe2eb437c0e49 100644
> --- a/drivers/net/ethernet/marvell/prestera/prestera_router.c
> +++ b/drivers/net/ethernet/marvell/prestera/prestera_router.c
> @@ -1061,7 +1061,7 @@ static void __prestera_k_arb_hw_state_upd(struct prestera_switch *sw,
>  		n = NULL;
>  	}
> 
> -	if (!IS_ERR(n) && n) {
> +	if (!IS_ERR_OR_NULL(n)) {
>  		neigh_event_send(n, NULL);
>  		neigh_release(n);
>  	} else {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6827c99bde8c22db42b363d2d36ad6f26075ed50..356a4e9ce04b1fcf8786d7274d31ace404be2cf6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1275,7 +1275,7 @@ static int stmmac_init_phy(struct net_device *dev)
>  	/* Some DT bindings do not set-up the PHY handle. Let's try to
>  	 * manually parse it
>  	 */
> -	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
> +	if (IS_ERR_OR_NULL(phy_fwnode)) {
>  		int addr = priv->plat->phy_addr;
>  		struct phy_device *phydev;
> 
> diff --git a/drivers/net/mdio/mdio-xgene.c b/drivers/net/mdio/mdio-xgene.c
> index a8f91a4b7fed0927ee14e408000cd3a2bfb9b09a..09b30b563295c6085dc1358ac361301e5cf6b2a8 100644
> --- a/drivers/net/mdio/mdio-xgene.c
> +++ b/drivers/net/mdio/mdio-xgene.c
> @@ -265,7 +265,7 @@ struct phy_device *xgene_enet_phy_register(struct mii_bus *bus, int phy_addr)
>  	struct phy_device *phy_dev;
> 
>  	phy_dev = get_phy_device(bus, phy_addr, false);
> -	if (!phy_dev || IS_ERR(phy_dev))
> +	if (IS_ERR_OR_NULL(phy_dev))
>  		return NULL;
> 
>  	if (phy_device_register(phy_dev))
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 0c83bbbea2e7c322ee6339893e281237663bd3ae..73f17ebd7d40007eec5004f887a46249defd28ab 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -2218,7 +2218,7 @@ static void r8152_csum_workaround(struct r8152 *tp, struct sk_buff *skb,
> 
>  		features &= ~(NETIF_F_SG | NETIF_F_IPV6_CSUM | NETIF_F_TSO6);
>  		segs = skb_gso_segment(skb, features);
> -		if (IS_ERR(segs) || !segs)
> +		if (IS_ERR_OR_NULL(segs))
>  			goto drop;
> 
>  		__skb_queue_head_init(&seg_list);
> 
> --
> 2.43.0
> 
>

Acked-by: Elad Nachman <enachman@marvell.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
