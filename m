Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9A9475C5
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 09:10:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D1EDC71290;
	Mon,  5 Aug 2024 07:10:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013000.outbound.protection.outlook.com [52.101.67.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B8A3C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 07:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4er3Eyncxbi6r40aJbyB+L/ckQ6sqmD+ny7Y2AP4Z38E4LqJKH92GDqEMggx5N4/n4piN+3QuLDbZSrukQYa4qhpcqQseFkkAhnbi8kSO5H34loC527yYTq2V8hxTzSPz5DcOHwoXEdCgSkrIQ7AOVtqNLDEUpSFWr5qWdBQkXZnXBaF5xBPj1kwB14jxZIWXFxXtkDOjxMcUDeupRlwyrH9sTdLWjQ3RW4NHl5k0PeP4MO7YKI/r3KYHLcH0N6NN/YXhrXIprcVOX3SnA9Sv+Yyr5QGR0QrHLQlgKiG1Kjfpa5knPiZAaIgXbJasCXgTbdZeBBts3k9ae1tNGqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxh5A1CXVRvpueDHBZx/o1tQ6ckxZ47+xHIy4jDKJC0=;
 b=yBFZGGCKjs18rFgDZNUoOU2E87N6OqqY8GYqXbKkeNDAOZqVRJMK/rQer1D5FmcthqDh5PDA0IbW2gliajdBO1q/vgDuG4PO0/KfEMp86z+1zGUb9dyx0peSSTV1hAbI/JdrBk7fegn9it9lWwRr2plz8dMjpPZMD+Jz9AahBvKgz8QTdaFBf5HQx1Vuc1QvK/2CsUJ8UE/0ErGjkOWFwHm2Oqa5zjpdSkTx6TWCgHZs/bYyjemoAlslnglO3v1u0YZ3Pow8Y1kVeMXadyj8z2MqLwZxcaBgInM0v5xxMucDbJYwuhrwfAlHpcfT3KNqLlEFHY1EMPmOi36Kyy/3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxh5A1CXVRvpueDHBZx/o1tQ6ckxZ47+xHIy4jDKJC0=;
 b=wTmm8dkh3qNmSXfCXEkV5DsE43lyiSKcI5H7VR2DBwNgQ7D+6gLU3A5VebKhq80Ip9Jd0cpnYtblyzjiBFTCDc/qMEAj5h95H4DRRW13Y916gm/KbL6rwc9gZILfMACyYudNxhs7YdKvjFJhjABrAkJw/nnpml4JbLFG75vjMAmwXz4iaKh4wQyFdffmhjv+jFVnUYdn+lAHKxSTTSFiVuIs82EU4hgN18Q7DpFXvU6JQbZN+nqhjRVZDO4HxS311QHeOVJsmtZJlAyEEL1oCWgyT6Wq+VNdvzfup8mIbjQ7zhGrNmJDZ/g08JCSs6q18OtIJ2BI7iLIM9MMi5jMUQ==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB9111.eurprd04.prod.outlook.com (2603:10a6:20b:44a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 07:10:09 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 07:10:09 +0000
From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Jan Petrous (OSS)"
 <jan.petrous@oss.nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Thread-Topic: [EXT] Re: [PATCH 3/6] dt-bindings: net: Add DT bindings for
 DWMAC on NXP S32G/R
Thread-Index: AdrmrOTtkwWMBqX8SE2obTTIuZV8xgASOM0AAANymxA=
Date: Mon, 5 Aug 2024 07:10:09 +0000
Message-ID: <AM9PR04MB8506FC5070BEEE98400247B0E2BE2@AM9PR04MB8506.eurprd04.prod.outlook.com>
References: <AM9PR04MB85066A2A4D7A2419C1CFC24CE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <059e0b5e-7893-4c67-89d6-77c7cc87eccc@kernel.org>
In-Reply-To: <059e0b5e-7893-4c67-89d6-77c7cc87eccc@kernel.org>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB9111:EE_
x-ms-office365-filtering-correlation-id: 8fce0c1f-a1f6-47c0-f831-08dcb51da441
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VFMrdmhTNEtiTTU3TW5hWDZ3cVA1Q1hmeFoyRDRvRzRTWXNnTjNnY1Z2eGpx?=
 =?utf-8?B?U2tEWmRyRzFCOXRYNWl2ZEkzNHY0NTY1ZHZjWnU4V3k1bjJzdlRVdWR4bm84?=
 =?utf-8?B?SzhndFFGQkhBb3VVdkhic3pYZGx2a1hXeDFmRk13dUpmTnZnRCtuM0tnM3or?=
 =?utf-8?B?WGkzUGJCL3ovbHpwMXRvemtLaDhjOExrK29HYlErRjk0cjNxZzFycWxsVmZy?=
 =?utf-8?B?N25mK0NXZWtFc2ZTaExuYzkvc3dEbTZ0Ny9MbDA1MHErY0s1VWhZSFdwV05m?=
 =?utf-8?B?SmtEazF3RmJabXgveDQyUGhZTVlYYXgrMTNJdmhRMG1pOVVTVit0MDJ3L0Nu?=
 =?utf-8?B?UjA2RzIwM3F5L0tmYmNBcEQ5cW9yREtLL0tIcmMwdVo2aDVjem1GRDVOUDlU?=
 =?utf-8?B?eStZUHJlVDkzT3pTUzNUK2FDZ3p5Q2lPOVFna0xGZHpWOWo3TlhIVUFLTzU1?=
 =?utf-8?B?N29UUlhVNHY3aGd0Q0NWK2tjZjY4STZ5K00zVnpLWDRRd2R3L2hyeEJIcEtW?=
 =?utf-8?B?THVLSXpTZmp0eTNuY20xMmR3L0tvUXJ2RUNVdVhtUFRNRVM5eFQ5UFhEZWkz?=
 =?utf-8?B?ZnJ1TEI0QmMzZDVBUFlNQnBFWXBRdDdMeklpZ0lBY2NrbnBPR3Q5SkU1b1JI?=
 =?utf-8?B?dXZHem9jTE4vTEt1RTRJdTQvdlBHd1RjK3ZpbzgrNnMvUG5JM3UyQUFJOTRC?=
 =?utf-8?B?R25PZUdzb214Vm9ab0NLWHRXclg5ZU1wYjRxWkEzcmhmTG5NekV6VmttZVo3?=
 =?utf-8?B?bDhlU08xQ1IycWhHakF2NW1tSUZlbmkvSzllS1JaTk1XdXJtR25tSTVCOUh0?=
 =?utf-8?B?SVNCaWVlWjg0N1ZNdnNacXgrd3E0djRMRXBTc21Qa3dhVzNxRU5heTc3MzBz?=
 =?utf-8?B?V3g2R2NObXhlWWhicnQ1VkRLVVJUUkg1RjQ1bE8yNEJrdnFLUU1XY3h0VTR3?=
 =?utf-8?B?Vkw2SDNBajZid0k3eU9LRGx5aEhsNFdzMHJFbW5scTBsKzdCdnFvS0ZXY2E5?=
 =?utf-8?B?Vy9pZEc4VVIwMVRWYkdGRVZCK083RDBjaHVzZkpKSWdMZ0tHUE5zUkxwUXdu?=
 =?utf-8?B?aG5LZ1hIVmZXZHhTRkNEKzlnRkMyTWttKzBWRTlwdEhJQ1QwYUQzbjVMQ2dF?=
 =?utf-8?B?dmZQN1kvSjVOV3IzYXdYUXRva0p0eU81aGkvbkVOYURZNU5uYjZDaWxCRlcx?=
 =?utf-8?B?OTF2dFo2aDlBR3ZOOHVqaEFFU2ZYdjRpdGlvQlA4STlMM3Erb3pPcGc0aks0?=
 =?utf-8?B?UGpYL3FsQUJZSlkxaE4zM1JQSTFUYTJIcVNZc0NxVjd4N0tVNVZJQVZFWWl0?=
 =?utf-8?B?NFJCYXBDa1N0Wjh4VUE3VGc5bGdteEhyUEt5TTV6Y0FYcjkrdEsxc0lCUmNa?=
 =?utf-8?B?ZWJ3cWhTS2JFZ3gyTU9ndCt0SHlZazAwRElOakFkbWRFb1krR1hlbFg2OW5u?=
 =?utf-8?B?YnV6RXBkMEwvLzV4cXROd2JuNzhLT3poeGRNSXRnMDIxSFhtRmVnWW5zL3Vl?=
 =?utf-8?B?alJKS01RM1BBbFEyWExWWHpLYVhNaU1IZysrbG1kcHhUZkVYUy9vMm8zeXJu?=
 =?utf-8?B?eFdkMFRPMGY1cUVDbDhTQ0VTMmtESmdHWU8vNmJGZDJTK3dvVG4zN0prUWFQ?=
 =?utf-8?B?dkVVQUF4VHBLNUF6ZTdnSkpZc1RXZkcweG5OVWN0ZTBJTEdTcFRzSm1tSkhK?=
 =?utf-8?B?ZGlNSkZaSmdXTmJzS3lUdnhwN2R2aWt5bnBrN09ZQ2VHTzRGRVFFQncxRDVQ?=
 =?utf-8?B?c0oveUlZRkpoYmp2WFpQc2hzdktZQVZudXRybGtQVlY3VDlvVlk1eEdOQXdY?=
 =?utf-8?B?U3B3a3VkSXNlR3lpSXZxWGRVVzJPVWxJb2I1engzbVRneEFlSW5wNkNFdXlh?=
 =?utf-8?B?Ukt0bHVzdzVSR3BPbEpSYjNvKy93T3M2QTVIRE1mOFFPRnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8506.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym9UZU1uMnA1Tm9nU3A2YjhmVDFjQnh3bFUzb2M5OEF5L3hnQ29HU3pRRnkr?=
 =?utf-8?B?SzFjRloyWDVzUEZmYjRoa3JCOENzT1YweklCaFRQS3ZuNE9RNWtXUVhYUHg1?=
 =?utf-8?B?V0VTVVVwL3FBcnBKQlZ0V2IyamlDL2Y5ckRVeVdvNllHbnptUDkxT0ttVk9m?=
 =?utf-8?B?LzRmSklBYVYrL2ZaamNFNEwyN0lUdUdidjJ2VFM1UDg2eWxZMDR2YnNNQnE2?=
 =?utf-8?B?TE9MQ1BqOUluL0EwN2FiY0ZaZFhWY09OL21ibWZDek1DME5teHVwOTFBYXlN?=
 =?utf-8?B?UDdCOXkxTUxsVkw5eURYVTdyTHFNUGErVktRbDlTVUFCYXplM2x1UFlZaUs0?=
 =?utf-8?B?WmFURlJYeUVBVjRvVENOc0FScFRJUUFDdnZ4UXFrTmRJZW1ZVk9HTzU4UU9G?=
 =?utf-8?B?dVc4VVlHbzNiRmJld2lmazAvL2QxajF3cGRwME1tRFNVS3hRVmw4aDU5UXdi?=
 =?utf-8?B?eWl5bUNCazBNdXRjV3h4ZzlJQU1iamc3SkdaUU9rQSs1V09PajdvVjRSdE1T?=
 =?utf-8?B?RVJTd0xGZEtCTU1EaGZIbTVjU1FVS3NXbnhXcWZUWE1WME00alYySXpuWFpV?=
 =?utf-8?B?aGt0THhYNWU5cnVhZEo2YysySUIzRkEzZVlXUkJQVWJJZmZaellvNEROMzlt?=
 =?utf-8?B?OUxKZkhxZko5MFZqdDlIRHpMUWJMeVd0Q3lNekVjRVVhTklPaHhxK0htencz?=
 =?utf-8?B?cVltNDNaSDlhbW5lV0FUd0NnY2V4aDdLZXQzTmhxRlo0ZnhmazFqWC96Yyt6?=
 =?utf-8?B?MzdldGNKRkZhUStZcnNLeURDOE1GdXA3cFpxTEl2VWdhQ3dIVVJ2K3h3b3Qv?=
 =?utf-8?B?UW02MXlDa09QZzYvbU90TDNDajIvTndibVYwRXFiNGtZS2J0eS9ob1BwemZI?=
 =?utf-8?B?ZGtHMUhPeU5nUmxwTGFnNGY1R2VKMzNoSkVwSHpYRVZwVnVXOG81TW1qbUpl?=
 =?utf-8?B?VUZDUHUxSkc5aDdNaHBNc2ptb3F2eEtiaDdZTS9ReGFzWThVRXhqOGNJQkJZ?=
 =?utf-8?B?Kzc5c29TeXM1T3dObjVIczFFVEVBY1hKQmZMdGFockEvRUhOcEdxblFiakoy?=
 =?utf-8?B?a29VRWYzbFlPNXRDSGhQZ2R4MHBNMWN4QjJ1NjBaemwzNUV3ZU9JNXJteUx3?=
 =?utf-8?B?SHQzZXEvVDZzeXpNQnhsUjNNK2VTaWR0aE5kRHdmNnJCT3MzaDVvV0ZTS09h?=
 =?utf-8?B?WDZpeVpJRmtvT2ZkbEJnQW03YXEyNUlvelBsT293aHBEL2hJZHYxc3hhRC8w?=
 =?utf-8?B?a0NtWmdUUVErbjhnUEJUNXB3Y0NTM1Y5TmEveTJ5OVd3TFYxOUVrOWladFFB?=
 =?utf-8?B?ZXloaC9lczlXMk5NOHpaaFFkYmRuTGVzK3hqTklWYzBsSDBMSUI2Sm84di9R?=
 =?utf-8?B?ZjM1Q09iK2VmaWVsVDVHd1E4bHBmeW53WmY5VkVDc0JJSXRhakNlMmdpRWhF?=
 =?utf-8?B?N0JzcVFBSjZDT1lEQXR1bU5xbGx4dDU0ZDg4VitSMnJjNGZ3YzVGOUVwUzNq?=
 =?utf-8?B?NW9EZmkyNE52YmxTa1d0dDdhRlhRcHdWelF5eHEzNUJDS2RkV2VLRThlOFN3?=
 =?utf-8?B?V25OZ29rV09peXZST1NKbGdrQVVZYi82Ri9Ia3lZREZ6NTlldHg4WlpkSC8r?=
 =?utf-8?B?elZIT1BaZERDaXJIMjBhZjNNYS9lOVJoa0lYS25mZ1UxSUVqWG1YZ2MwM2Vt?=
 =?utf-8?B?eG95elZKY0hEcXJyNElNVkd2L2VlM1BFZzZkWVlGWVF5b1NKak15WUt1WjJ2?=
 =?utf-8?B?N1V4MjY5aHlkdFJldU40SHB5VEcvalJDYUpjeGsvZld5SkU3bnRFWEJLbGp0?=
 =?utf-8?B?SzhyMFhzdS9NL1NlQ2t4MlpkeVRxODlxK0VIbmdEWStsdlZTU1RCVjduV01z?=
 =?utf-8?B?ektGbE4xOTRaMnV5aGJyWkNWQ2xDN2tKSHhneG5ad0NYdm9sUEwwR1FRODI5?=
 =?utf-8?B?c1JYbGF3aUVYblp2MjMrUjVxUFBNM1FmY1hWL0xHMG5adnpPa056SlhNREow?=
 =?utf-8?B?M1liZ1MrS1dFdGc0YWh6b2JVOW9HYXBvaDhIZWliNURnYnNpMmtMQUdXMlJB?=
 =?utf-8?B?MzErTHkwM0ZFckYrWmY5bTczczgwK3RkUUVqdnRkNmdiWmlETXZmbElqV2Mr?=
 =?utf-8?Q?W+fjVUr8YWF3kR90Ei9qtIRSz?=
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8506.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fce0c1f-a1f6-47c0-f831-08dcb51da441
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 07:10:09.3649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXr7Mon8YvpSiY5tWSyEoeVGR15OVhT6j88NrpdcvbmRgjL9BEl9TvA34DYF22H+vxsWaz/h5/tj4n6gr/zb9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9111
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH 3/6] dt-bindings: net: Add DT
 bindings for DWMAC on NXP S32G/R
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

> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, 5 August, 2024 7:10
> To: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>
> Cc: dl-S32 <S32@nxp.com>; linux-kernel@vger.kernel.org; linux-stm32@st-
> md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; Claudiu
> Manoil <claudiu.manoil@nxp.com>; netdev@vger.kernel.org
> Subject: [EXT] Re: [PATCH 3/6] dt-bindings: net: Add DT bindings for DWMAC
> on NXP S32G/R
> 
> On 04/08/2024 22:49, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> >
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>

Does it mean that scripts/get_maintainer.pl doesn't care about devicetree ML?
I just tried to recheck, but it still shows me the list I used originally:

$ ll outgoing/*.patch
-rw-rw-r-- 1 hop hop 1998 srp  4 11:33 outgoing/0000-cover-letter.patch
-rw-rw-r-- 1 hop hop 2518 srp  4 11:33 outgoing/0001-net-driver-stmmac-extend-CSR-calc-support.patch
-rw-rw-r-- 1 hop hop 2794 srp  4 11:33 outgoing/0002-net-stmmac-Expand-clock-rate-variables.patch
-rw-rw-r-- 1 hop hop 4427 srp  4 11:33 outgoing/0003-dt-bindings-net-Add-DT-bindings-for-DWMAC-on-NXP-S32.patch
-rw-rw-r-- 1 hop hop 8610 srp  4 11:33 outgoing/0004-net-stmmac-dwmac-s32cc-add-basic-NXP-S32G-S32R-glue-.patch
-rw-rw-r-- 1 hop hop 1143 srp  4 11:33 outgoing/0005-MAINTAINERS-Add-Jan-Petrous-as-the-NXP-S32G-R-DWMAC-.patch
-rw-rw-r-- 1 hop hop 1805 srp  4 11:33 outgoing/0006-net-stmmac-dwmac-s32cc-Read-PTP-clock-rate-when-read.patch
$ ./scripts/get_maintainer.pl outgoing/*.patch
Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
Alexandre Torgue <alexandre.torgue@foss.st.com> (maintainer:ARM/STM32 ARCHITECTURE)
"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:46/46=100%,added_lines:61/61=100%,added_lines:69/69=100%,added_lines:165/165=100%,added_lines:298/298=100%,added_lines:35/35=100%,added_lines:51/51=100%)
linux-kernel@vger.kernel.org (open list)
linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)

Thanks.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
