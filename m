Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D4BDE8BC
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 14:52:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB9ECC56623;
	Wed, 15 Oct 2025 12:52:52 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6D07C349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 12:52:51 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FCNEOY013380;
 Wed, 15 Oct 2025 14:52:40 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r26j7n69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 14:52:40 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNAf5eOAemEAdwwh1Z9GpLWF7/AFSbAq+OsOJUTCdKeOKHi1hnXbPmnoANE2Ha+qRiZ35az/akkfgSaEYb8vxNGEywGAOJdm1cjZND10/bBozosfWqqPwXZjYj3xLc2zv5/V0uwhnNgEkOy/VQbflyGNEoH928czuByK2MfqApUCkLFfyjkkjxNMZbUOCz6o8HSOGdYt9KUGGaEtVNta4dTf6KUVMZ1GdbVckeplTqFC5JD+b0zbvoEVmMA0x3uD7QD2m+qXC4QTEhuvBf70PP0rmfrpEsc1wAUQ1+uaRSagYmT6sDETajrRkREMnCVbYtOqi7iCiCycN481HWYdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfc0HHzrAu/WtpZEZsr0n27RDdp6ReB2X1dcNCLm03U=;
 b=kM09Rchn5R3z5wQwFpj+goHGG/oBPrHboQ+9zUWd1NIrWAlEmwA8aZ7YxZiAYatjwsc6252d+V2DxyW/Q8NOqAvlHWfEka2b5Ren9IYaFjLjd0/Y1hMwxIa30Fs0MdkXm7jYbJ2ufILxZynr8G0EXQ2oxYzthPsVE3bwD6elEq6Nz/zOewisHc3KZsggaXWDt2zM0yX6icu79RT0NXDSaGRX6XK9blozY1bRVWoukeiDhtTZ/cZsju47SNHDlzb3oqtnYofTTETNis0WYio5lD01qY18ocL7WV9rma4dkhwb/tZ3i3mn8yVO0evxhHQTWvB2sv8h3SyrW7cdbGLiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfc0HHzrAu/WtpZEZsr0n27RDdp6ReB2X1dcNCLm03U=;
 b=Yo5tnztyGm/07DVM4rCfbUycE6ywWQ0rPRwkeGKpjLqy2I8bGeMkFGP44/wh4LFBtXL6IToeqbzIOa1oAcjokFbmJNVDjoxy5edJ6ydfrFh6cnmkectdiqnzm0EVgpvFL+Xtuzb1zG/u0U0hY2d94K2aRXDxKJoNay18pqawWir76vLQVqZauCd/eOOr93PYO4gY4E4B1pDn6jLoUFuKB/W9zkNHGCjgRiCYb4IpZtEYZVsq7fHflMeVfz+Vx6HvDhMJB0zK48pA8EOi0yd9NXc8+lkCCfUKxi7tKxWJxjKhrfa302nX5aGj2Z3sTuUXyvMk/QM/hJP/YjcC0rZxIQ==
Received: from CWLP123CA0238.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::19)
 by AS4PR10MB5200.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 12:52:38 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:400:19f:cafe::dd) by CWLP123CA0238.outlook.office365.com
 (2603:10a6:400:19f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Wed,
 15 Oct 2025 12:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 12:52:37 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 15 Oct
 2025 14:50:15 +0200
Received: from [192.168.8.15] (10.48.86.11) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 15 Oct
 2025 14:52:36 +0200
Message-ID: <7ba7c2f2a6dcfac30f05b35a4f41ef0af2dab575.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Conor Dooley <conor@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Oct 2025 14:52:35 +0200
In-Reply-To: <20251014-water-gown-11558c4eabe7@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
 <20251014-water-gown-11558c4eabe7@spud>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|AS4PR10MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b89f2fb-0219-42a2-7469-08de0be9b84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGQ2WlJnVFFSV3dWOVc3dXYzZk1adEtxVHpiU3FvUjBZQjJzUjg5RHptaU0z?=
 =?utf-8?B?eHdJM1lEdzUrek9SS3NWQ1k1WENtUzJPQzRNa3NRUFNIWGU5T3djL0dhUHRT?=
 =?utf-8?B?Qmczd202b1YydFNaeVU4N1BpR2F2VEIyYytUSldSUVQ2ZG5GNDEwK3Qrcnc5?=
 =?utf-8?B?MlRlQndCV3l1eG01aG15S1NyaXN2VndBUGF3T3VTY3M1c1lMSXR0MXd2Qi91?=
 =?utf-8?B?RUhCZStrVk5BWjhQZStIRkNseTVoZUlPU3doY1hEbU4rQ29iTDhEaVRJbUFL?=
 =?utf-8?B?V2JwQmIrSlQzbVM2RTk1TVRhblk2UTN2L0c2QnByUm9mWlVzSWRyaWJYOWNh?=
 =?utf-8?B?am5rZHpmaFhqYnJkRjJjeHhCQzNZN2w2Z1BzWXUxbVl6WlYrZGowLzgxaG5F?=
 =?utf-8?B?VnZqSTl4a213bkV6b0ZxL2VOaEpoRFVHTW1kRVNobmNHTzdvdzZhcDFDM28r?=
 =?utf-8?B?VzhWQ1hQR0F4T2lMUmFTWUJ2aTdGYTMvQ1hnaVhYYkdzclpHSmhQaGZQZTQ0?=
 =?utf-8?B?anlRTnpETUh2TE85a1JXL3JSUUt2eDM3dDFMVGk2TWlsUE12Vk5jckpiUXR4?=
 =?utf-8?B?VzlEbXpUclRwVlpyRVBubFFya1VucHVNSE51NkVySDNEd3hGMDBTZTJwcFZo?=
 =?utf-8?B?bm9HeHN3MzdKZmMxOStqajNXWmNxZnByaUc5TW9yb3RHa09wQlA2eThhcWFU?=
 =?utf-8?B?TWhMRnNWK3c2SzdtYjAwZVpJTEVvU1FtSzJ5OXorWk5KcmpiMlp0NCtXR3Fx?=
 =?utf-8?B?N2RvZHVOQTY1MTNrZERvT2pyalphRVBDeUl6TFlDRnNHVXFncXg4V21MQUNw?=
 =?utf-8?B?eUV6c3BrdDZIVHk1ZFJVT05La0IxdThucldpWmtwK2FLY3p6TUp5Y1pSekgv?=
 =?utf-8?B?cllHUE56Vzc3UTA4emhjSGNwMXJ4TlkwQ2g4Z1FsNmpGTWdKSldQL2w4Vm40?=
 =?utf-8?B?d0ZXWFNQbTZGZlJGd0xVQVhHRVJEdWF0QStLOVRJV2RpdFJ4WDloSXhpYng3?=
 =?utf-8?B?N1ZlaERkSFBrYUhLbVRGL2FyT1UrUUplalZabWhsMko5N3l3VGxiUDNoZGw1?=
 =?utf-8?B?alFTbGx4NEQ1cFNTekJsUldYdk5udW42VFViM3c0Q3pXa1BGTTUvT0RLUUtk?=
 =?utf-8?B?Ly9kb2NQTHp3U2VVdFU2bXRUUitlUWZpMnJqSEgyWFhJRHpsWGJxYjVOZUNO?=
 =?utf-8?B?a2JBQmdNMkRHV0Z1bGU1THFaQStRSVgzN2xzdExaSWptejN1M0ZLN0tETEZN?=
 =?utf-8?B?R0pqZW5tTG93c2tHOXAwSXRGTEVsN1pheVRGVndGdCtKSVZyWHFBdHJZWlR2?=
 =?utf-8?B?RkpnVkVsMkE2NUg4UUkrY1JUbmg3Z0FWbzczUlIwY2pxZm9RaGRFTGMrUk9z?=
 =?utf-8?B?NUI0NURTMmhkRmdMa1BleDVTYk5yVm9mR2RnanRZQzVpQzgxRkdXaTN3WHhZ?=
 =?utf-8?B?V281b0MzVExpa1lVM1BsdEp5NWNjNTFIS0RiRWMxdGIrNldPc1FkM0E4WCtC?=
 =?utf-8?B?OTlkcEE3aFIwT0dLVnZyWjJnSDZLYVRUY0pDQk5QSndhRVFUaTYwUnBra3NN?=
 =?utf-8?B?RG8wVXdQMXVLY1YwbkZQRVd2SGtiRzZ1dkhVRG5PbUVYOE9ib0xNWGxOSFJX?=
 =?utf-8?B?M0lGaU1xQW9XbnBUY3JBZmhnSUYyRENrVFg2bEF3TVpRK3Q5SzluRFB0VHo5?=
 =?utf-8?B?TnJrSXZnN3p6blBlNGFtYXFJck9wTzM3cHRFTHNlTGc4UCtxTm5UcEg2VWww?=
 =?utf-8?B?UkVkNFdoVWZYTURGMzZiOG1IUWV1ZHV0YzA1MXZEaGJ5TFNBOEd1YUNKUGpN?=
 =?utf-8?B?Mmc4WGc2QXhLd3M3L0RPOC9kRkhWWUtuczZBTVdrK2pBeHEydFRQcU5Wb3l5?=
 =?utf-8?B?Y3FQYlhaKzNlZGFLT1piU0c2UDVHUkxMaVBPci91Y0VZdnY0TG5XWGtweUN2?=
 =?utf-8?B?bnJYMFRQK3RzeE1BWmtqU1gzZTRSK1c2NUptOEx3bTl4bmNuZlJIejc4RktK?=
 =?utf-8?B?ZVgvUTNnK05mb2VEVEROQmhvRktidFRSQXUvMTk5U3pTckJTNmZMNzFOVzVs?=
 =?utf-8?B?VEJGZDJ3ZjUrdUZmNDlrM2lNL1VJbWcrc05lQ2gvVXR1R3NyVDlsbTVrVXlB?=
 =?utf-8?Q?abDM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:52:37.9542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b89f2fb-0219-42a2-7469-08de0be9b84e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5200
X-Proofpoint-ORIG-GUID: DzjhjdYrFB6QAhiEj-KilIyn8FSA5oX3
X-Proofpoint-GUID: DzjhjdYrFB6QAhiEj-KilIyn8FSA5oX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDAwMiBTYWx0ZWRfXzez08l3T10P0
 jieETZz4Yl3MmnNT4Js3YC9qDZvYg+X2vINvEYj5iaxsKwJpItyFRRuYXgYAchKOruurtBH1vVG
 U/FcGP5BFFn0Te8t/J0ggHhTfz3tupc0BinTXF32+e71teCrwqrJ//u0MKXV8K3+7va/RJMtxLp
 OsbcfHQlF7sGQTwKqnXNam9XiUSLnXHq711eTQSVJS5y3sa0lb0z/gIWBE9efifTc62jb4oZQoA
 dkcufHWN0bskp75LObG8EwobPHT3RJ5W9WOckJ+bLKU5mbgNkqJLkQW9ZUmKhKWPdB7AkcmGLri
 pGKP5w4hF/fDLIkNQaxVWe+ebCNWjtEBkI1UPm1wEdsoIu8uaK5hzCrWn++nug6SLN4hOqNlwyi
 b70JTXWgWglggFPlPvMYX6zkuDO2BQ==
X-Authority-Analysis: v=2.4 cv=X5Vf6WTe c=1 sm=1 tr=0 ts=68ef9918 cx=c_pps
 a=j46eMmXtwYkrOlOTjSJKlQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8
 a=a4Evs6e31utlwK-snYoA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=3gWm3jAn84ENXaBijsEo:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120002
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 02/10] dt-bindings: pincfg-node: Add
 properties 'skew-delay-{in, out}put'
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVHVlLCAyMDI1LTEwLTE0IGF0IDIwOjM5ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4g
T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMDk6MzM6MTRQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiA+IE9uIFR1ZSwgT2N0IDE0LCAyMDI1IGF0IDg6MDTigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIE9jdCAxNCwgMjAyNSBhdCAw
NDowNDo0M1BNICswMjAwLCBBbnRvbmlvIEJvcm5lbyB3cm90ZToKPiA+IAo+ID4gPiA+ICvCoCBz
a2V3LWRlbGF5LWlucHV0Ogo+ID4gPiA+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiA+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjoKPiA+ID4g
PiArwqDCoMKgwqDCoCB0aGlzIGFmZmVjdHMgdGhlIGV4cGVjdGVkIGNsb2NrIHNrZXcgb24gaW5w
dXQgcGlucy4KPiA+ID4gPiArwqDCoMKgwqDCoCBUeXBpY2FsbHkgaW5kaWNhdGVzIGhvdyBtYW55
IGRvdWJsZS1pbnZlcnRlcnMgYXJlIHVzZWQgdG8KPiA+ID4gPiArwqDCoMKgwqDCoCBkZWxheSB0
aGUgc2lnbmFsLgo+ID4gPiAKPiA+ID4gVGhpcyBwcm9wZXJ0eSBzZWVtcyB0byBiZSB0ZW1wb3Jh
bCwgSSB3b3VsZCBleHBlY3QgdG8gc2VlIGEgdW5pdCBvZiB0aW1lCj4gPiA+IG1lbnRpb25lZCBo
ZXJlLCBvdGhlcndpc2UgaXQnbGwgdG90YWxseSBpbmNvbnNpc3RlbnQgaW4gdXNlIGJldHdlZW4K
PiA+ID4gZGV2aWNlcywgYW5kIGFsc28gYSBzdGFuZGFyZCB1bml0IHN1ZmZpeCBpbiB0aGUgcHJv
cGVydHkgbmFtZS4KPiA+ID4gcHctYm90OiBjaGFuZ2VzLXJlcXVlc3RlZAo+ID4gCj4gPiBEb24n
dCBibGFtZSB0aGUgbWVzc2VuZ2VyLCB0aGUgZXhpc3RpbmcgcHJvcGVydHkgc2tldy1kZWxheQo+
ID4gc2F5czoKPiA+IAo+ID4gwqAgc2tldy1kZWxheToKPiA+IMKgwqDCoCAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+IMKgwqDCoCBkZXNjcmlwdGlvbjoK
PiA+IMKgwqDCoMKgwqAgdGhpcyBhZmZlY3RzIHRoZSBleHBlY3RlZCBjbG9jayBza2V3IG9uIGlu
cHV0IHBpbnMKPiA+IMKgwqDCoMKgwqAgYW5kIHRoZSBkZWxheSBiZWZvcmUgbGF0Y2hpbmcgYSB2
YWx1ZSB0byBhbiBvdXRwdXQKPiA+IMKgwqDCoMKgwqAgcGluLiBUeXBpY2FsbHkgaW5kaWNhdGVz
IGhvdyBtYW55IGRvdWJsZS1pbnZlcnRlcnMgYXJlCj4gPiDCoMKgwqDCoMKgIHVzZWQgdG8gZGVs
YXkgdGhlIHNpZ25hbC4KPiA+IAo+ID4gVGhpcyBpbiB0dXJuIGNvbWVzIGZyb20gdGhlIG9yaWdp
bmFsCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJs
LWJpbmRpbmdzLnR4dAo+ID4gZG9jdW1lbnQsIHdoaWNoIGluIHR1cm4gY29tZXMgZnJvbSB0aGlz
IGNvbW1pdDoKPiA+IAo+ID4gY29tbWl0IGUwZTFlMzlkZTQ5MGEyZDliOGExNzMzNjNjY2YyNDE1
ZGRhZGE4NzEKPiA+IEF1dGhvcjogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgo+ID4gRGF0ZTrCoMKgIFNhdCBPY3QgMjggMTU6Mzc6MTcgMjAxNyArMDIwMAo+ID4gCj4g
PiDCoMKgwqAgcGluY3RybDogQWRkIHNrZXctZGVsYXkgcGluIGNvbmZpZyBhbmQgYmluZGluZ3MK
PiA+IAo+ID4gwqDCoMKgIFNvbWUgcGluIGNvbnRyb2xsZXJzIChzdWNoIGFzIHRoZSBHZW1pbmkp
IGNhbiBjb250cm9sIHRoZQo+ID4gwqDCoMKgIGV4cGVjdGVkIGNsb2NrIHNrZXcgYW5kIG91dHB1
dCBkZWxheSBvbiBjZXJ0YWluIHBpbnMgd2l0aCBhCj4gPiDCoMKgwqAgc3ViLW5hbm9zZWNvbmQg
Z3JhbnVsYXJpdHkuIFRoaXMgaXMgdHlwaWNhbGx5IGRvbmUgYnkgc2h1bnRpbmcKPiA+IMKgwqDC
oCBpbiBhIG51bWJlciBvZiBkb3VibGUgaW52ZXJ0ZXJzIGluIGZyb250IG9mIG9yIGJlaGluZCB0
aGUgcGluLgo+ID4gwqDCoMKgIE1ha2UgaXQgcG9zc2libGUgdG8gY29uZmlndXJlIHRoaXMgd2l0
aCBhIGdlbmVyaWMgYmluZGluZy4KPiA+IAo+ID4gwqDCoMKgIENjOiBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZwo+ID4gwqDCoMKgIEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+ID4gwqDCoMKgIEFja2VkLWJ5OiBIYW5zIFVsbGkgS3JvbGwgPHVsbGkua3JvbGxAZ29v
Z2xlbWFpbC5jb20+Cj4gPiDCoMKgwqAgU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gCj4gPiBTbyBieSBsZWdhY3kgc2tldy1kZWxheSBp
cyBhIGN1c3RvbSBmb3JtYXQsIHVzdWFsbHkgdGhlIG51bWJlciBvZgo+ID4gKGRvdWJsZSkgaW52
ZXJ0ZXJzLgo+IAo+IFllYWgsIEkgYWN0dWFsbHkgbm90aWNlZCB0aGlzIGFmdGVyIHNlbmRpbmcg
dGhlIG1haWwuIEJ1dCBhcyB5b3Ugc2F5Cj4gYmVsb3csIHRoZSBuZXcgcHJvcGVydGllcyBjYW4g
YmUgZG9uZSB3aXRoIGEgdW5pdCBldGMKClF1aXRlIGFuIGludGVyZXN0aW5nIGRpc2N1c3Npb24s
IGhlcmUuCgpUaGlzIHNrZXcgZGVsYXkgaXMgImltcGxlbWVudGVkIiBpbnNpZGUgdGhlIGRldmlj
ZSB0aHJvdWdoIGEgc2V0IG9mCnVuaXRhcnkgZGVsYXkgY2VsbHMgKGRvdWJsZSBpbnZlcnRlcnMp
LCB3aGVyZSB0aGUgdmFsdWUgb2YgdGhlIGRlbGF5Cm9mIGVhY2ggY2VsbCBjYW4gaGVhdmlseSBk
ZXBlbmQgb24gc2lsaWNvbiBwcm9jZXNzLCB0ZW1wZXJhdHVyZSwKdm9sdGFnZSwgLi4uCgpXaGVu
IHVzZWQgdG8gY29tcGVuc2F0ZSBza2V3ICJpbnNpZGUiIHRoZSBkZXZpY2UsIHdlIGNhbiBhc3N1
bWUgdGhhdAp0aGUgc2tldyBvZiB0aGUgc2lnbmFsIHRvIGJlIGNvbXBlbnNhdGVkIGlzIGFsc28g
YWZmZWN0ZWQgYnkgcHJvY2VzcywKdGVtcGVyYXR1cmUsIHZvbHRhZ2UsIGFsbW9zdCBhcyB0aGUg
ZGVsYXkgb2YgZWFjaCBkZWxheSBjZWxsLgpJbiB0aGlzIGNhc2UgaXQgY291bGQgYmUgZmluZSBy
ZXBvcnRpbmcgdGhlIHNrZXctZGVsYXkgYXMgbnVtYmVyIG9mCmRlbGF5IGNlbGxzIGJlY2F1c2Ug
d2UgZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQgdGhlIHZhbHVlIG9mIGRlbGF5IGluCnRpbWUgdW5p
dHMuCgpCdXQgd2hlbiB1c2VkIHRvIGNvbXBlbnNhdGUgZGVsYXkgb24gdGhlIGJvYXJkLCB0aGUg
dmFsdWUgZXhwcmVzc2VkCmFzIHRpbWUgdW5pdHMgaXMgd2F5IG1vcmUgYXBwcm9wcmlhdGUgYmVj
YXVzZSBpdCdzIHdoYXQgd2UgZ2V0IGJ5IHRoZQpib2FyZCBkZXNpZ24uCkFuZCwgdGhpcyBpcyB0
aGUgbWFpbiB1c2UgY2FzZSBpbiB0aGlzIHNlcmllcy4KCj4gCj4gPiAKPiA+IEkgZG9uJ3QgcmVj
YWxsIHRoZSByZWFzb24gZm9yIHRoaXMgd2F5IG9mIGRlZmluaW5nIHRoaW5ncywgYnV0IG9uZSBy
ZWFzb24KPiA+IGNvdWxkIGJlIHRoYXQgdGhlIHNrZXctZGVsYXkgaW5jdXJyZWQgYnkgdHdvIGlu
dmVydGVycyBpcyB2ZXJ5Cj4gPiBkZXBlbmRlbnQgb24gdGhlIHByb2R1Y3Rpb24gbm9kZSBvZiB0
aGUgc2lsaWNvbiwgYW5kIGNhbiBiZQo+ID4gbmFub3NlY29uZHMgb3IgcGljb3NlY29uZHMsIHRo
ZXNlIGRheXMgbW9zdGx5IHBpY29zZWNvbmRzLgo+ID4gRXhhbXBsZTogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hZGksYWRpbi55YW1sCj4gPiAKPiA+IEFudG9uaW8sIHdo
YXQgZG8geW91IHNheT8gRG8geW91IGhhdmUgdGhlIGFjdHVhbCBza2V3IHBpY29zZWNvbmQKPiA+
IHZhbHVlcyBmb3IgdGhlIGRpZmZlcmVudCBzZXR0aW5ncyBzbyB3ZSBjb3VsZCBkZWZpbmUgdGhp
cyBhcwo+ID4gCj4gPiBza2V3LWRlbGF5LWlucHV0LXBzOgo+ID4gc2tldy1kZWxheS1vdXRwdXQt
cHM6Cj4gPiAKPiA+IGFuZCB0cmFuc2xhdGUgaXQgdG8gdGhlIHJpZ2h0IHJlZ2lzdGVyIHZhbHVl
cyBpbiB0aGUgZHJpdmVyPwo+IAo+IFRoZSBwYXRjaCBmb3IgdGhlIHNwZWNpZmljIGJpbmRpbmcg
ZG9lcyBoYXZlIHZhbHVlcyBpbiB1bml0cyBvZiBzZWNvbmRzCj4gYXNzaWduZWQgdG8gZWFjaCBy
ZWdpc3RlciB2YWx1ZSwgc28gSSB0aGluayB0aGlzIHNob3VsZCBiZSBkb2FibGUuCgpXaGlsZSBp
biB0aGlzIHNlcmllcyBJIGp1c3Qga2VwdCB0aGUgbmV3IHByb3BlcnRpZXMgdW5pZm9ybSB0bwon
c2tldy1kZWxheScsIEkgc2VlIG5vIGlzc3VlIG9uIHVzaW5nIHRoZSAnKi1wcycgdmVyc2lvbi4K
SSB3aWxsIHNlbmQgYSBuZXcgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLgoKV2hhdCBhYm91dCB0aGUg
ZXhpc3RpbmcgJ3NrZXctZGVsYXknPyBTaG91bGQgaXQgYmVjb21lIGRlcHJlY2F0ZWQgaW4KZmF2
b3Igb2YgYSBuZXcgJ3NrZXctZGVsYXktcHMnID8KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKQW50
b25pbwoKPiAKPiA+IAo+ID4gSWYgd2UgaGF2ZSB0aGUgcHJvcGVyIGRhdGEgdGhpcyBjb3VsZCBi
ZSBhIGdvb2QgdGltZSB0byBhZGQgdGhpcwo+ID4gSVNPIHVuaXQgdG8gdGhlc2UgdHdvIHByb3Bz
Lgo+ID4gCj4gPiBZb3VycywKPiA+IExpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
