Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3891AA1B0B8
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 08:12:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB7CCC78F8D;
	Fri, 24 Jan 2025 07:12:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BCD1C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 15:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZ/Kla/nqwLgJqaDjD6wMw4rudYcrupKqwxhERSImz3nAO5/losipXJJ7+Tn8W4RUcgSZuKy9YRg+PfuTzXPYkFJN1GVM5czCOuxyY6wwtrNuFG8dVWzTnc31q8nK2AkCEWuT7HLlkix6SqQPq1UJaRTlo2as9d4LnNLiIzo2PmdXj2BdTp8AlUmGpO+UEvAEu6MHeKEh1pbn8LycCk/zDpkt8vyQ4n4JS1lK9845nHdASWk8JOlMRDm5QosNs+QupL+5K4o+s2mGXjkKIgACnQ8MnNdMtqkebKPDt7H33S/gOzuKULL7zJ2vuPjPVoC1jDidC08cg85d70WCSam6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1nAACqQ9xwPc6UZNtF1UGVEGOk2c/WzK7IbHeUPoW0=;
 b=rwOSkXi5S15driQ7NhegE5U0jkePZDLPaDBWsQL7oJdyyr47G1NgfgYo2qcEBVecvCdYrPLCJ+7x+S6nkiqt9oac8hqnAdeJpgNnL4VWqy1ZL1XZn4tnryRUopdjJFonymCDRrb9D0wQ7JcsVUkm+sPydGGbR0mlW5fPk/I5U+YOwO2sldXfOSOe+F8UGZNjOYvi7Peub/OUBvizcKSdBxeECO8rfkCMGB0SqcTLAnVBXnv03RnHZBenkJtdfJALKCpNC/RrenxDF9tzpclZkFdkBIYpUWk5PqVGR17i9YVG5zPaUmEzF7O0mgOFAg1L2krpjPXKheJXHUzrD1l1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1nAACqQ9xwPc6UZNtF1UGVEGOk2c/WzK7IbHeUPoW0=;
 b=z7fHF4JQFj6KH+hedXVPcIXy8WY3vn5iO7oX8HIdBwEICn7t6VMxguwg90gP6YuPL05AUdIp8EdBa+mIazuVVbjWiHBeVTbjCKFi5ePqNkNln95zQrvkoZcvxfPxrmz1Dljc+GiMQ7B2RfMYuG1gzgMo7XOCndDdM985wGyTIpGukiUklPALCOuX1X96MzNuX99UbVO4I2jRPmOCjjKze4B9xkNm2/+uCu0s228/CC6WR3WvTqDe1ZixPh+Nm1m+i0KqZ4o1yS4H0nKuBK7Oh28W7PxvDyTWFHwJ0yfKqjYOUuvgzMIS14ViKztZTEiGhNkZM39Pz0vK/3MuuYDnkg==
Received: from AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47b::22)
 by AM7PR10MB3176.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:101::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Thu, 23 Jan
 2025 15:40:18 +0000
Received: from AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f25:24f8:9a0e:3430]) by AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f25:24f8:9a0e:3430%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 15:40:17 +0000
From: "Bouska, Zdenek" <zdenek.bouska@siemens.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, "Bezdeka, Florian"
 <florian.bezdeka@siemens.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>, Magnus
 Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski
 <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Joe Damato
 <jdamato@fastly.com>, Stanislav Fomichev <sdf@fomichev.me>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Mina Almasry <almasrymina@google.com>, Daniel
 Jurgens <danielj@nvidia.com>, Andrii Nakryiko <andrii@kernel.org>, Eduard
 Zingerman <eddyz87@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>
Thread-Topic: [PATCH bpf-next v6 4/4] igc: Add launch time support to XDP ZC
Thread-Index: AQHbaC9NftORAnH56E2O4EjHNdzz2bMkh40A
Date: Thu, 23 Jan 2025 15:40:17 +0000
Message-ID: <AS1PR10MB5675499EE0ED3A579151D3D3EBE02@AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
In-Reply-To: <20250116155350.555374-5-yoong.siang.song@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5346f792-2728-437a-af4f-d8df71fd3714;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-23T15:32:06Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5675:EE_|AM7PR10MB3176:EE_
x-ms-office365-filtering-correlation-id: 682df271-2026-4003-1611-08dd3bc43cfd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|7053199007|921020; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?2FaQIKJZTR48OcC3ALybSDPfIEQSdPgfYKf5iGSXiR9U8fKW3JokpGdtlP?=
 =?iso-8859-2?Q?oXddsmSXL8UikF9RNqLfw+8LSK7cZQd1m9HRwAPkXMMfuVnLGI+eMD3I37?=
 =?iso-8859-2?Q?JCh0zcedlRxXP/EI/yWFyzXurIHcvG6JGNTT0Miy/G/PdLzXNu7wBkBDca?=
 =?iso-8859-2?Q?7vshlpGSGL+2deG8u4cHPeV8SNgruxD1OzuXqPuWRfyfUradV9GF5qZKqy?=
 =?iso-8859-2?Q?xMlisGl+HyvpyjtPQk7gnYT9xsMZzRllQtzMcHDKF3WiVSdbRch8cJVZ9p?=
 =?iso-8859-2?Q?coP9RQbNnEAXJNtQfirTPLitQd4AntHtnMrle55X3RK8DBv27wRGLaCQKV?=
 =?iso-8859-2?Q?dSd3m+v391QQqKCEMDh/5Or+xY7+y3d944anacJpUG0+ffYBs1nLCbS7VN?=
 =?iso-8859-2?Q?E9d8R4QK1d16pyOLy8sCMbJ2Bok5gNC7gvLO08iaBcy2DpBSMbYao7kpQU?=
 =?iso-8859-2?Q?MfB8OmHPtEri+r9vBRxdZzgeXjfDwPAFo10d1fr71PXdrzqnPRy+njgH0j?=
 =?iso-8859-2?Q?0Bwg3m3UcQ69tg+MWv4pN3uesIShcLQUwDgleJToG3MIuYK6bmxSJNZ5uh?=
 =?iso-8859-2?Q?UHyJXZNquBGogiR1Qe07jDwL9TlDxV+kYdHFrs4CnITblVDmJTtYQKyNcp?=
 =?iso-8859-2?Q?WKE63WwteAzkIr54Q5t5iEdYPj1ZSoFJjgcDeIonnxlMQsTMKKO+8+wN4J?=
 =?iso-8859-2?Q?2yZ4S7tI9KMVbz6Y2sPAsVrRQjGdPB7BaL5CJwMyMiRnEzxSScPNGcTmjX?=
 =?iso-8859-2?Q?cnTClRBveUJUU6fmzp5bXY7Khq3re2BY+8OrWUoENF+tS1PUR6rvItDlSG?=
 =?iso-8859-2?Q?gCYARKNSFtXVYA709BxX+S7WDIqKqzruNE+rD9KTFyCyLSHw66aN+/lz2Y?=
 =?iso-8859-2?Q?ZcaGyJ6t8zl5v4o8Kx/2O+vXXwRB552q/kbKaPeqUg5D8fG25asDnrXcQh?=
 =?iso-8859-2?Q?VPvH0Hv6ZB17xQ5WckjaUJH/6uglijKAnL9AfvFJyxFj5WFfjHfD2Lmo14?=
 =?iso-8859-2?Q?nKvn1F1CnpvViypctb0PoXTT3sZoKhpck6NSDhWYNZtIgMZLhPq5o6ue9g?=
 =?iso-8859-2?Q?1gOt6w2xey26P1U4WxH7JI1EV9avJ8n4UsKz70a/zjLAUqzxkYAZ8Jsqvs?=
 =?iso-8859-2?Q?+d7fFhvW05RaDjIX96YgXNZicoVXFyKNODifhY1SpVjmWEcPWKfPXMgdT2?=
 =?iso-8859-2?Q?CEiK01mpElT1oLetCDMOL5OXlGJvEkz94ncJ1NBdKrmzsF84paKi5XCxU8?=
 =?iso-8859-2?Q?Dy6n5x63ZpIBTnOBnvVqEVjB8SAxwaO1O3QwKvqjMHawzonej0pBGpT8Fs?=
 =?iso-8859-2?Q?tk/ivhaPDk75RgdwG/EZfS7OMJsgHmnTv9OTEaAtMXlbCpx9DXKCMklEN5?=
 =?iso-8859-2?Q?j9QeUvWe1KbTQTFQ/KPLMBtYHNdnFowem3K39VehExB/lF/Q79/AGkYc0N?=
 =?iso-8859-2?Q?09NDlnN8GNflpkCl6ujvHYpjGkHoOyHZaHUGYQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?nZooqm37ZO53YP6ACV7WW/7zbYfc1hs6MlglWTugsHDXaoF0ydMS3GRV/8?=
 =?iso-8859-2?Q?wwxeOdN+Y2mmJyoZiaWiRzG8Gh9Wvprl6/7aaVHnxdZpJqq64WznmQrU+Z?=
 =?iso-8859-2?Q?yNFm15kvbuw3eN575iAealWhLfIypGJAFSw5ThE36FMzsImSqnA3/58dBb?=
 =?iso-8859-2?Q?Nywig+xrQyrK/sj6sEe/fSRcLDYaHbeGS7ND3lsG7mplMjjKodUJw3ltg6?=
 =?iso-8859-2?Q?WD7JfC0TrZWU/JsOX1e+Q5zs5Ez6RZnGOgrp6/rQVMTSKPRV5otlF8da/K?=
 =?iso-8859-2?Q?jCd0Sw75qH41J9qoLKGMeVre6l5Y1IpP4aPc71LZAw45ihSzIwyFow3v/F?=
 =?iso-8859-2?Q?+KPNPsEX+sWmNAZ0KUlUcnLAC/zQtzvOfZ2sI/X5mhv0LfwREvyg9tF2h9?=
 =?iso-8859-2?Q?/L86AH70X0QkGxutATA5jEYGsQQtiePx36cWjPDbv9C1ryMsXcO9qGinpQ?=
 =?iso-8859-2?Q?yt3SdqCAzSS6xd9ZKE260glgLfd/P78tpMmeuejCS3hirZq2fQ/qISFEmZ?=
 =?iso-8859-2?Q?N/O8N9x/mCC7PYE/L0eupk0xMD4Y0eHbmB6478RKfqG4Awl6vlLk16Fyxd?=
 =?iso-8859-2?Q?zqm4HuRaILlUshMFKkEtLDADVVQ6jVKMVJxOqfYxnKkJWsh8UUaeN/Y1+a?=
 =?iso-8859-2?Q?+Okd/YOCQloPOCDyGz8MesfQR/vztDHzrfwQ59CJTePLktKz/TiewZu3qB?=
 =?iso-8859-2?Q?ppz9aJZ7ULe75C3M5LuZeQc0koDKWRunv3E6o3YAmpPvcQtbxzjNz0PUb2?=
 =?iso-8859-2?Q?Sgn2946iDUO15wSqcrtTHYmXSzg3I8IlaAQJ2Kq/0LT1606Q5lAaDMJWVr?=
 =?iso-8859-2?Q?JKFbOatcEcBDGvej+wk3xpfsLv9i81rWg/dMj5aYqJv7Q5wWN5m8Fix3pT?=
 =?iso-8859-2?Q?W+0Fz+n1N1vE5hTHtCluUCLPKERaVsZn4c92hAWHfrehQmIUN47RNh5KMy?=
 =?iso-8859-2?Q?BQxEWAINoo4rQtqfpI0udEaZWO33lvoSsIZPB81/Q1IssXs+Yay5fuV6t7?=
 =?iso-8859-2?Q?amtr5iCQEWI+XsLL9saPrBaFDpKbF2rOd9ssth+3lI2Y8IH8+orsw++ut6?=
 =?iso-8859-2?Q?VNrw8WQ37p84vBbVIXwXl6wz22XorAxfcLajfzjVr/ouA/QAcbMtZ07wm0?=
 =?iso-8859-2?Q?5gpSHsoXOG+kiwrNepf7RwWxGDlSjor7aqnJbvC8nftLq2tXFvRNkP7Bx8?=
 =?iso-8859-2?Q?SplH+tkSVZ7DyJ8Zysc7tXpxJBGnWVGFdWed/gEvu11N2IXUWWQVhdJC63?=
 =?iso-8859-2?Q?cdBXk1fkKI/H/j/9xXpx6ozuOJKpUKHeQksp3u6Kazl6tdleMy5Ml/UnAc?=
 =?iso-8859-2?Q?ScIoiYjyvBHL3NkCcDMEY0lI5HzoYVDQqpYRHH/VBfGYXgtK7S0ybbwI36?=
 =?iso-8859-2?Q?rQw79g4BT6riQOKv0G9fXO722sxr28NTDT3zpxOKIX/doGizFXX9Ga1kJ7?=
 =?iso-8859-2?Q?0iHZb69Wjox+Zvwo99+Gxgxr5T/KuEFyUB8EFhnCPat/KCLcwJJP/TEako?=
 =?iso-8859-2?Q?k4V9r/FdjqYshmdPrrlkV1hmqp1vSw61WZ6xI39yMIZ6huiTls5K800eUt?=
 =?iso-8859-2?Q?RLR4iYO/xZx7jIUrH+zPcrZu7xaUzoN2hTYj/QkPKfKOduqN6zlbmb/gff?=
 =?iso-8859-2?Q?4jFp2Qjhd0tthI0AzMkQBmsKor4p3zYbHJ?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 682df271-2026-4003-1611-08dd3bc43cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 15:40:17.9102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TOUmu+D4MEbrWvo1qTDea7s70pxxAvW0La+lxPOYtl2BXt/h7WnNxSuv/TaGmU+V4sZR/ruvIXf0ocqSAbgaxuF7JkIXRAkOeWHq2CuCBoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3176
X-Mailman-Approved-At: Fri, 24 Jan 2025 07:12:42 +0000
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH bpf-next v6 4/4] igc: Add launch time
	support to XDP ZC
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

Hi Siang,

I tested this patch series on 6.13 with Intel I226-LM (rev 04).

I also applied patch "selftests/bpf: Actuate tx_metadata_len in xdp_hw_metadata" [1]
and "selftests/bpf: Enable Tx hwtstamp in xdp_hw_metadata" [2] so that TX timestamps
work.

HW RX-timestamp was small (0.5956 instead of 1737373125.5956):

HW RX-time:   595572448 (sec:0.5956) delta to User RX-time sec:1737373124.9873 (1737373124987318.750 usec)
XDP RX-time:   1737373125582798388 (sec:1737373125.5828) delta to User RX-time sec:0.0001 (92.733 usec)

Igc's raw HW RX-timestamp in front of frame data was overwritten by BPF program on
line 90 in tools/testing/selftests/bpf: meta->hint_valid = 0;

"HW timestamp has been copied into local variable" comment is outdated on
line 2813 in drivers/net/ethernet/intel/igc/igc_main.c after
commit 069b142f5819 igc: Add support for PTP .getcyclesx64() [3].

Workaround is to add unused data to xdp_meta struct:

--- a/tools/testing/selftests/bpf/xdp_metadata.h
+++ b/tools/testing/selftests/bpf/xdp_metadata.h
@@ -49,4 +49,5 @@ struct xdp_meta {
                __s32 rx_vlan_tag_err;
        };
        enum xdp_meta_field hint_valid;
+       __u8 avoid_IGC_TS_HDR_LEN[16];
 };

But Launch time still does not work:

HW Launch-time:   1737374407515922696 (sec:1737374407.5159) delta to HW TX-complete-time sec:-0.9999 (-999923.649 usec)

Command "sudo ethtool -X enp1s0 start 1 equal 1" was in v4 [4] but is not in v6.
Was that intentional? After executing it Launch time feature works:

HW Launch-time:   1737374618088557111 (sec:1737374618.0886) delta to HW TX-complete-time sec:0.0000 (0.012 usec)

Thank you for XDP launch time support!

[1] https://lore.kernel.org/linux-kernel/20241205044258.3155799-1-yoong.siang.song@intel.com/
[2] https://lore.kernel.org/linux-kernel/20241205051936.3156307-1-yoong.siang.song@intel.com/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=069b142f58196bd9f47b35e493255741e2c663c7
[4] https://lore.kernel.org/linux-kernel/20250106135724.9749-1-yoong.siang.song@intel.com/

Best regards,
Zdenek Bouska

--
Siemens, s.r.o
Foundational Technologies

> -----Original Message-----
> From: Song Yoong Siang <yoong.siang.song@intel.com>
> Sent: Thursday, January 16, 2025 4:54 PM
> To: David S . Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Simon Horman <horms@kernel.org>; Willem de Bruijn
> <willemb@google.com>; Bezdeka, Florian (FT RPD CED OES-DE)
> <florian.bezdeka@siemens.com>; Donald Hunter
> <donald.hunter@gmail.com>; Jonathan Corbet <corbet@lwn.net>; Bjorn
> Topel <bjorn@kernel.org>; Magnus Karlsson <magnus.karlsson@intel.com>;
> Maciej Fijalkowski <maciej.fijalkowski@intel.com>; Jonathan Lemon
> <jonathan.lemon@gmail.com>; Andrew Lunn <andrew+netdev@lunn.ch>;
> Alexei Starovoitov <ast@kernel.org>; Daniel Borkmann
> <daniel@iogearbox.net>; Jesper Dangaard Brouer <hawk@kernel.org>; John
> Fastabend <john.fastabend@gmail.com>; Joe Damato <jdamato@fastly.com>;
> Stanislav Fomichev <sdf@fomichev.me>; Xuan Zhuo
> <xuanzhuo@linux.alibaba.com>; Mina Almasry <almasrymina@google.com>;
> Daniel Jurgens <danielj@nvidia.com>; Song Yoong Siang
> <yoong.siang.song@intel.com>; Andrii Nakryiko <andrii@kernel.org>; Eduard
> Zingerman <eddyz87@gmail.com>; Mykola Lysenko <mykolal@fb.com>;
> Martin KaFai Lau <martin.lau@linux.dev>; Song Liu <song@kernel.org>;
> Yonghong Song <yonghong.song@linux.dev>; KP Singh
> <kpsingh@kernel.org>; Hao Luo <haoluo@google.com>; Jiri Olsa
> <jolsa@kernel.org>; Shuah Khan <shuah@kernel.org>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>;
> Maxime Coquelin <mcoquelin.stm32@gmail.com>; Tony Nguyen
> <anthony.l.nguyen@intel.com>; Przemek Kitszel
> <przemyslaw.kitszel@intel.com>
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; bpf@vger.kernel.org; linux-kselftest@vger.kernel.org;
> linux-stm32@st-md-mailman.stormreply.com; linux-arm-
> kernel@lists.infradead.org; intel-wired-lan@lists.osuosl.org; xdp-hints@xdp-
> project.net
> Subject: [PATCH bpf-next v6 4/4] igc: Add launch time support to XDP ZC
> 
> Enable Launch Time Control (LTC) support to XDP zero copy via XDP Tx
> metadata framework.
> 
> This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
> Intel I225-LM Ethernet controller. Below are the test steps and result.
> 
> Test Steps:
> 1. At DUT, start xdp_hw_metadata selftest application:
>    $ sudo ./xdp_hw_metadata enp2s0 -l 1000000000 -L 1
> 
> 2. At Link Partner, send an UDP packet with VLAN priority 1 to port 9091 of
>    DUT.
> 
> When launch time is set to 1s in the future, the delta between launch time and
> transmit hardware timestamp is equal to 0.016us, as shown in result
> below:
>   0x562ff5dc8880: rx_desc[4]->addr=84110 addr=84110 comp_addr=84110
> EoP
>   rx_hash: 0xE343384 with RSS type:0x1
>   HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to
> User RX-time sec:0.0002 (183.103 usec)
>   XDP RX-time:   1734578015467651698 (sec:1734578015.4677) delta to
> User RX-time sec:0.0001 (80.309 usec)
>   No rx_vlan_tci or rx_vlan_proto, err=-95
>   0x562ff5dc8880: ping-pong with csum=561c (want c7dd) csum_start=34
> csum_offset=6
>   HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to HW
> Launch-time sec:1.0000 (1000000.000 usec)
>   0x562ff5dc8880: complete tx idx=4 addr=4018
>   HW Launch-time:   1734578016467548904 (sec:1734578016.4675) delta
> to HW TX-complete-time sec:0.0000 (0.016 usec)
>   HW TX-complete-time:   1734578016467548920 (sec:1734578016.4675)
> delta to User TX-complete-time sec:0.0000 (32.546 usec)
>   XDP RX-time:   1734578015467651698 (sec:1734578015.4677) delta to
> User TX-complete-time sec:0.9999 (999929.768 usec)
>   HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to HW
> TX-complete-time sec:1.0000 (1000000.016 usec)
>   0x562ff5dc8880: complete rx idx=132 addr=84110
> 
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  drivers/net/ethernet/intel/igc/igc_main.c | 78 ++++++++++++++++-------
>  1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/igc/igc_main.c
> b/drivers/net/ethernet/intel/igc/igc_main.c
> index 27872bdea9bd..6857f5f5b4b2 100644
> --- a/drivers/net/ethernet/intel/igc/igc_main.c
> +++ b/drivers/net/ethernet/intel/igc/igc_main.c
> @@ -1566,6 +1566,26 @@ static bool igc_request_tx_tstamp(struct
> igc_adapter *adapter, struct sk_buff *s
>  	return false;
>  }
> 
> +static void igc_insert_empty_packet(struct igc_ring *tx_ring) {
> +	struct igc_tx_buffer *empty_info;
> +	struct sk_buff *empty;
> +	void *data;
> +
> +	empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
> +	empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
> +	if (!empty)
> +		return;
> +
> +	data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
> +	memset(data, 0, IGC_EMPTY_FRAME_SIZE);
> +
> +	igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
> +
> +	if (igc_init_tx_empty_descriptor(tx_ring, empty, empty_info) < 0)
> +		dev_kfree_skb_any(empty);
> +}
> +
>  static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
>  				       struct igc_ring *tx_ring)
>  {
> @@ -1603,26 +1623,8 @@ static netdev_tx_t igc_xmit_frame_ring(struct
> sk_buff *skb,
>  	skb->tstamp = ktime_set(0, 0);
>  	launch_time = igc_tx_launchtime(tx_ring, txtime, &first_flag,
> &insert_empty);
> 
> -	if (insert_empty) {
> -		struct igc_tx_buffer *empty_info;
> -		struct sk_buff *empty;
> -		void *data;
> -
> -		empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
> -		empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
> -		if (!empty)
> -			goto done;
> -
> -		data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
> -		memset(data, 0, IGC_EMPTY_FRAME_SIZE);
> -
> -		igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
> -
> -		if (igc_init_tx_empty_descriptor(tx_ring,
> -						 empty,
> -						 empty_info) < 0)
> -			dev_kfree_skb_any(empty);
> -	}
> +	if (insert_empty)
> +		igc_insert_empty_packet(tx_ring);
> 
>  done:
>  	/* record the location of the first descriptor for this packet */ @@ -
> 2955,9 +2957,33 @@ static u64 igc_xsk_fill_timestamp(void *_priv)
>  	return *(u64 *)_priv;
>  }
> 
> +static void igc_xsk_request_launch_time(u64 launch_time, void *_priv) {
> +	struct igc_metadata_request *meta_req = _priv;
> +	struct igc_ring *tx_ring = meta_req->tx_ring;
> +	__le32 launch_time_offset;
> +	bool insert_empty = false;
> +	bool first_flag = false;
> +
> +	if (!tx_ring->launchtime_enable)
> +		return;
> +
> +	launch_time_offset = igc_tx_launchtime(tx_ring,
> +					       ns_to_ktime(launch_time),
> +					       &first_flag, &insert_empty);
> +	if (insert_empty) {
> +		igc_insert_empty_packet(tx_ring);
> +		meta_req->tx_buffer =
> +			&tx_ring->tx_buffer_info[tx_ring->next_to_use];
> +	}
> +
> +	igc_tx_ctxtdesc(tx_ring, launch_time_offset, first_flag, 0, 0, 0); }
> +
>  const struct xsk_tx_metadata_ops igc_xsk_tx_metadata_ops = {
>  	.tmo_request_timestamp		= igc_xsk_request_timestamp,
>  	.tmo_fill_timestamp		= igc_xsk_fill_timestamp,
> +	.tmo_request_launch_time	= igc_xsk_request_launch_time,
>  };
> 
>  static void igc_xdp_xmit_zc(struct igc_ring *ring) @@ -2980,7 +3006,7 @@
> static void igc_xdp_xmit_zc(struct igc_ring *ring)
>  	ntu = ring->next_to_use;
>  	budget = igc_desc_unused(ring);
> 
> -	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget--) {
> +	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget >= 4) {
>  		struct igc_metadata_request meta_req;
>  		struct xsk_tx_metadata *meta = NULL;
>  		struct igc_tx_buffer *bi;
> @@ -3004,6 +3030,12 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
>  		xsk_tx_metadata_request(meta, &igc_xsk_tx_metadata_ops,
>  					&meta_req);
> 
> +		/* xsk_tx_metadata_request() may have updated next_to_use
> */
> +		ntu = ring->next_to_use;
> +
> +		/* xsk_tx_metadata_request() may have updated Tx buffer
> info */
> +		bi = meta_req.tx_buffer;
> +
>  		tx_desc = IGC_TX_DESC(ring, ntu);
>  		tx_desc->read.cmd_type_len =
> cpu_to_le32(meta_req.cmd_type);
>  		tx_desc->read.olinfo_status = cpu_to_le32(olinfo_status);
> @@ -3021,9 +3053,11 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
>  		ntu++;
>  		if (ntu == ring->count)
>  			ntu = 0;
> +
> +		ring->next_to_use = ntu;
> +		budget = igc_desc_unused(ring);
>  	}
> 
> -	ring->next_to_use = ntu;
>  	if (tx_desc) {
>  		igc_flush_tx_descriptors(ring);
>  		xsk_tx_release(pool);
> --
> 2.34.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
