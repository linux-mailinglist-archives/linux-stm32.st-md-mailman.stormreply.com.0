Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KUD+FJkinGn4/wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:49:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9A1742B0
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:49:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09A19C36B3E;
	Mon, 23 Feb 2026 09:39:15 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F93BC5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 03:49:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZKYVHsCP/RaGTTVpM+zb6CworRLtc05nRPcsFgcOtNrGUnaG5yruiWLBTpvcAhEMVg2wS6aLSVIKVca5sTc81Wl40KB2DGmvMypyS8uqxQ4DkW4YaRQJ43ksteRtXw3kCm13NcWYSt4iAE15b91tKXMxX+RfsiVlE6+VL7FBbrVun6f5wYJYcLdkuYLmTRSDVBfA2I0j+OvizxWOaBTgEIGeht1bUgwd64nqHceX6e3BZDZkvOnD/bYmFPPjTm2CIohtINWmwau4jsuR0utOc8FDOc2DIlcL5FvDoD2yudG0Z3UE/6EmZfQSbZgTgDgi/OlAJDLGAenPBom7ZB2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1oTStWRmV2wBdfQLvC3P5Ij4ERm4Nt0ydB81rQE+9Y=;
 b=pcSCmQ4syVkBz8vBFGW6rKzDt71l0N/7KQEz77qeyr4AaBEvdHGLQifB/T0na1rLtrUshrw5QDb5K51uTMP/6iAYAdH+/MwQOZGYf8jEj/t7navFs/m/WzPPyckN+/wNHeOnPCkNXPbgc0Sbg7hTta1Er1Sn6WVf9O6ciwX2yFN0DWO/ecbGCpUmC7vbEKWVx89F6WhLpo0+fKxPiC/OrwuL3Ev0V/dfDSkajjsi/QwU8vtHKipZ1GWKXSe+twSWYsuvClfeS0DpN/+TY1OuhrOASoXDG7YTLLJ50Hqe36F78fAUq/JYVLFFsJ7dttSjLICluMdsyftZkENoTBhsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1oTStWRmV2wBdfQLvC3P5Ij4ERm4Nt0ydB81rQE+9Y=;
 b=P5mRR2LLKic+M/vs6FKtqlvJJaq78PfKH/DXWzMQh1NV1sGvDhAzJV0WpJ/MNiRuW0m8fptRgJnISzE2takTy7zamprdCogJXWXW0wjRy6svCy9zMHQdHqeB071XVTf2m4J0jee02nTPp63TQ+V0WR5DsPvMxG+cI6sdZ7YHFm3gW/gcM4p9Kdgbr+kWR9iMdoQnMSrVa4I4vsWRUPCPu6E13hfHFdBwiu1a51mzm0dIJj4zClh99xeJmBRglhhwLcM6M462aDY+GJxbO9kc7a5rZ/OKDcEp96miUd9TVWOErbH9CJAA3EieXGR5bcql5S2XeoIRQoJ4Vz60UmYt4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 03:49:37 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:49:37 +0000
Message-ID: <236a5eeb-e22e-4973-a693-319c1376f9d0@nvidia.com>
Date: Mon, 23 Feb 2026 09:19:17 +0530
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <cassel@kernel.org>
References: <20260217212707.2450423-11-cassel@kernel.org>
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <20260217212707.2450423-11-cassel@kernel.org>
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To DS0PR12MB8245.namprd12.prod.outlook.com
 (2603:10b6:8:f2::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b481c2-f603-4102-79d8-08de728e90cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXVEd2EwSlFYdmJvdjdKWVlRTXpWYStaUU54N2V2alBXQzVQYVYxYmRHMHBn?=
 =?utf-8?B?RFMvcnlFRktrd3duRlZKRGpQQ3pNM0tvT3o1bVIwK3V1WlBaUEFoamFjOGtI?=
 =?utf-8?B?bG9zMm13ckpQbDlBMFhEa0ZsMDdwNG5idnJCYmVTWXU2SlVPZUVFcWpSMmRG?=
 =?utf-8?B?Uk1WZ2JTdFM5ek50VWgweTI3UFZIWnRWbzRqYjQ1Tms3V01oQjltVllMTi9u?=
 =?utf-8?B?a21yeTIyOUl1WnY2N2QzSjNzcnJFbkRSaWdLeDR2eHN2TlU3a25OQzRTTlM2?=
 =?utf-8?B?SjNac0R4MDdzS01KMGgvSGkxR2xWcUg3Y3hsU2RIRTRQZ0JPbGd3YXAraGZU?=
 =?utf-8?B?RXFQakVKUlVlTDR3K0RTRGNQYmM0dnFiVE9nellUN081TkhXVlBXdENRRjJI?=
 =?utf-8?B?c1FldlUyQmZmbXVqeTF0YnRhTm5rZjNMWXp6R2VCVW1mVisxQTE5OFRYeEJP?=
 =?utf-8?B?ci9rU21XK1BaWFZGaExUaGdtMi9IOTRFQVE2NThkd0c3WUd0MDA4bm5jR2Fm?=
 =?utf-8?B?R1pYREcwSDM2akMrYVdiN2JlWFhoRldVMEN2d3FlV05oL3p6ckpYRzhFejlu?=
 =?utf-8?B?RkFoNGFzVTl3UGtmTkRoNVI4bTBPMGxEcngyMnFBZnJtNXVCZ0daTmM5NTFM?=
 =?utf-8?B?dU9vYjdIMEhMUXJNSHppVXZxa2lqQ24xU2U5OFlSVTZFUDB5MUlEamVMK0RT?=
 =?utf-8?B?MVY0QjRXeG9pblk4MENDVjAzRmRJZzFZUytVaU5HUHJrUVRBZENwd3EwQXVG?=
 =?utf-8?B?ZVFMbmprdTVIV2N6eDhuMHVYWC9lSnU5cVc2bm9oMWloeng0TDZGZVA2d3FE?=
 =?utf-8?B?SithVnNVRmxRb2N4K0lacHJCcUYwY0JYT3NjTkRjV2l5RnFSaHhURUtvM0Ri?=
 =?utf-8?B?SGxvS3luTHA0aEQ1Y0NpNkROcFVUcFVKR1FUVXE0MDRGWGh5OHQzbWVxSFA0?=
 =?utf-8?B?dVRiNVgrZEJqZ3F2eUJjNysyekFkU0ZFNW1rWHdBbkJjWVpVdmJqcllzdm0r?=
 =?utf-8?B?cHNGZlhDVHBvS3I4K2Z2Ym0vUVZndnJpQW5xRUFLWnpkSkE0d0Q0eGlFd0Fx?=
 =?utf-8?B?ZEljV2Q4bFpPNU9uczhCUUxvZUxzNW92eDEyYkJ4b2N5YmwzcnNrZmxRd1cz?=
 =?utf-8?B?R0haS29RTFc5T1pBVS9XN3hmRGoweC9GKzFtZFdtU1NTUG8xTzl1QUFwb3pN?=
 =?utf-8?B?dWt3c09rT3FUQ3V5TUZleW9tbDBmU2RPOGRHanptalBjWWxSLytWTXR3a2py?=
 =?utf-8?B?L1FKUnpsaERkSnZlVzd3bHo5UFBNOWRlOXNrWWFqR2pCeEpMdWRrM040L2g3?=
 =?utf-8?B?dnBpakk5MU5obHVCQWlVZllYSGMxQWYwTk9WclJmcERhbVcwT1hTbU1vT0xV?=
 =?utf-8?B?b0NETTdJMU03eExnb2VnL1FUdGNpeWtpWlVzVnhiaVp3bGhMeitoSjFSakVi?=
 =?utf-8?B?YWZrMmpqS1A2OXNadWgxVUUrVURncXE2eXhQZEpqbmlnSUxlQzlGc29xeHFR?=
 =?utf-8?B?VHBqUW9XVVpoV3NyTXYrUnJYRnYvRVM1VVhwV2VNQ1lQYXV4aHBuRzJMemZt?=
 =?utf-8?B?alEwem00U1poTlF4U1dyQ0g5bVZwM3BIUlo1YXVITkQwQ2l5eFdhUWhxRHA5?=
 =?utf-8?B?b2MrdnZKWlNlUlNQQml1a0NmeGpGQVBVQUZLNVVoUWUvcXI3OXl3QUtmZ3Z5?=
 =?utf-8?B?L0Q1dEdjS0lzVDdxMkJpYlN1bXI0SVJNb2dVeFlKbStwMndMeVJ1akc5Titu?=
 =?utf-8?B?UGFGSXFKTXNJbXo0cy9ZOXAwTmlpMXdjaVNLRVlHZkhUdjBpb2hUNmpXSkFG?=
 =?utf-8?B?ZkIzc2NDU1VCbkFhYXdWS3RNdVMxN3JpcjRaRGhCTnNQdGdPTTMvRFBIQVZL?=
 =?utf-8?B?dUFySlNDejg1UWMzaUw1TWxVRVV6ZjFsVTYySllsQlAzVG1HdVVjaEMvcjI2?=
 =?utf-8?B?ZXA3eXZQMzNlcHQzc2UzTkVWdmRRQlk2WVFEKzB3aSszYzdTU3NhUlZuZ0N3?=
 =?utf-8?B?MGQvMlh1bU1wRlJFS0hGd09GVHg0VklnSm1hcStKZ2JhREZPN3JyN3VKMzVL?=
 =?utf-8?B?QmhtSFlKODF0d1J1THo3eHplejlQdndNMHVTdzVtZldkYUFpdndiUlJyUXB3?=
 =?utf-8?Q?sIcw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8245.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2JSYnRhbVhGWHFtWDBVTTZyTGgvbGsxSkJXUGk1U3VYU2RVYlFFL2RxWllV?=
 =?utf-8?B?cVF3dWIrRmZnWFhVL01sdE9xLzhrZUFaNEF0V1NoenJlcHUyVUxLb2hvOXJM?=
 =?utf-8?B?U296UHZzZkw4WGhnZTk5MTQ0bGNYMlduU3VLeWh1VFhpcjJZS0JvanBDSDVW?=
 =?utf-8?B?cGpuK3c0Vmd2blBtYXFaTXhWb29aSHg2eEFINzd1RVRWdWN3eVl2WUNuNGFj?=
 =?utf-8?B?Q0xpUzArUVpoWmpheHk2SFBwY090WWRyZmFTZWJ3eVk2VGcxaERxU2V1c0k2?=
 =?utf-8?B?ZlZHWU4waHgveVNBMVh5TXFHaDJEOWkxb01CSFY4cUJOYWpsZlVlbXNWR2FW?=
 =?utf-8?B?WHhwYWRZZ2J4VTd3d1Z2N2NOdHQ5VWlQOFpHN2VoVjdQdWFNdHJVWm04YnA4?=
 =?utf-8?B?bjZ4dkoybFBzQWEyYjlGVEN4WHhzYWd6TTNja05zdmRScHJTWVVrL29KM1lj?=
 =?utf-8?B?RjM5YjJSRktlYmV5WXB3L0ZQSlpET1JSQ1JxbGdRbVRuU0JlRE5kc0Qrakk1?=
 =?utf-8?B?L0xJMkdBWnBQNWo3WWxnSU9xOS9Zelg2VitscU1xZHhnOE9DaG5DcEV6VWl3?=
 =?utf-8?B?SmxyTm1IbEhVV2Q4SXExVVdZQUo0aW9ZeVFMRnRMZ1RyTTQrVE5CTy9EVldZ?=
 =?utf-8?B?eENIcWFEdGRPdGpwZzdieWlIWHVqd1BEUGhCcTU1L1k2WmhNYUFCMU1KZXBI?=
 =?utf-8?B?c1NUNW5LTW1xcjNxeU9ENVluak1mMmZoVEp2R1VWaCswc3FrZnpGN3BPM28x?=
 =?utf-8?B?cnN3SzBjN1p4QzRaWE1Lc3h0SUs3dlI4cXlQWHR6c3pxZit6SnZVRlBndlls?=
 =?utf-8?B?ZnVSYTJYNEExTW1UMENyRGoweTN6Yy81NVJza3FYek1UT3g0cEYydDhyOE1R?=
 =?utf-8?B?Qm4wdVRQNlh2UnJETzFVSWhBMXMrTkhmd1JHd1U5NzRQYWNuMGRoZ2VmUC95?=
 =?utf-8?B?OUxld3NhamxEYTNmeG4rWW5lN01wb0lzREdFL0dwUXFGTVdUb0ZRTEdVODUz?=
 =?utf-8?B?WDkvb2hCZzQyL2NsZXB1WG0rNnpKWVhpZW1GQk5TNU1INWNtNXBNOGxJQ0V4?=
 =?utf-8?B?STBFY1pjbklQVnZJL0IzdnQyNjhNZXl1SmVPRlErZVRSakRXN1cva3NGTFNp?=
 =?utf-8?B?aGtyR2c1V2ZmUlZjQjJHMXgwRG1NcCtHVGxCTlhzcEUxQTcvcWdQOW9rcXBi?=
 =?utf-8?B?OUZMdy9XVU1LKzNrdURvdkduTWxLdHJqb3VDTHF4RHVJb1lWbmJ2a0tLcTFK?=
 =?utf-8?B?Z3MrMGNobEpKUU1WZTM4S290N1N6VUxQSWJNTUVxa0t1cVlkd1AwVVNhU3dX?=
 =?utf-8?B?OFVSY2NVR1Y4NExOMkg5N1kxV2NSM1ozOFpzRTQ1ZnJoRHRVVWk2MUhYTFp0?=
 =?utf-8?B?Snk2eHpvaXJkbjZvVnBUVGZlaGxha1o1c3gyVmF5NFJPK1Y2WEQwSFhpcUsz?=
 =?utf-8?B?MmsrQks1NndoUlA1Q1M5eTB1cHgxdnFWNzlCTldXMzcydURBK1NIR1NYS1FC?=
 =?utf-8?B?dXNWbUtJVDFPd1lnTVFMOFZQNXhCM1V1NGVFcURUcmluaUpyaXVGRlFjME9n?=
 =?utf-8?B?RzdGdzZtVit3NVRJVW9laEdLV21kbHFHdG5ITWhNbU1aekVLSEVEMyt3RktQ?=
 =?utf-8?B?QmdiclNTNkhQSFcwZFMyU2JEbVlMV1NPQ0g4YmtWQmNDcFZjdHdmZzBNUThO?=
 =?utf-8?B?aFF4RHhrWENpd2xETFhuaEdoS2ZqbEV2MlVsd2ZMc0dmalRuNHc3RENJNFla?=
 =?utf-8?B?WjYxTW04Vlp2Q1VsMGtkbFhkMFlyVWZ2SW5EUFgzMVJkelVmbTJwd3hrbW1B?=
 =?utf-8?B?M0RTWlNWTDBhSDZ3RXpSMnliR2I1QnQ5Tkppejh0aTRMVzVPZDQ0bXU2RlNo?=
 =?utf-8?B?VmVlc0NyUkgwZVcyUDRMck4rSjV3VE5kQ0ZZaXNhVDRXR1BTMlZESlIyVW53?=
 =?utf-8?B?czluaEo0aitFMTIzWVpIelRqZzBrQUIxY1BLdFkrSHlaRUg4SlpZTWFqZ0xt?=
 =?utf-8?B?ZUNhOE9rUVRMVUZHWTdNaXZreUdWYUIzdjJwRmFzLzFGY2FPd1B6bnA4UEdz?=
 =?utf-8?B?ZWtVYit3eEZIYmVEa0pZbmlLeUQ5T29tdUlFTkhFd1VqcjBHZUMxczdUSmpC?=
 =?utf-8?B?Y1FJUUxLdkJjS1pGNzJPc0FUMU40NVBGU0szY1hqMkYwSXJNMzZKM1NJNWNV?=
 =?utf-8?B?QVAxbDNqYlRralRFeGpFcVpMR3JmVFI0MWw2cFJYRXc5ckxyNG52L1FKK3VS?=
 =?utf-8?B?V0VlQmRKclYzRk04amc2bmNHdzBwVDZsZ2Q1T0tkTjVZcXI3eWpDV3J4K3Ru?=
 =?utf-8?B?M0poSlhYTWVPbm9YR2ZYTWp1RWU1czRwemZDSFRyamsxOEIxRlhpNjdlZVZ5?=
 =?utf-8?Q?X9p8wdh0avJsP+dI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b481c2-f603-4102-79d8-08de728e90cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:49:37.6692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tzq2nK2r6dC5N37IyB3SjAtlJ2nlw0fKZESv9XnyqwR2LVXUhA+oHS5AtRU89vylSYS6BNxKY+srWljpoaELWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452
X-Mailman-Approved-At: Mon, 23 Feb 2026 09:39:13 +0000
Cc: imx@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Koichiro Den <den@valinux.co.jp>,
 linux-kselftest@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Mingkai Hu <mingkai.hu@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Srikanth Thokala <srikanth.thokala@intel.com>, Shuah Khan <shuah@kernel.org>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Damien Le Moal <dlemoal@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 0/9] PCI: endpoint differentiate between
 disabled and reserved BARs
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nvidia.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[Nvidia.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:cassel@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:bhelgaas@google.com,m:den@valinux.co.jp,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:kwilczynski@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:christian.bruel@foss.st.com,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:mingkai.hu@nxp.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:srikanth.thokala@intel.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:arnd@arndb.de,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:dlemoal@kernel.org,m:linux-tegra@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:roy.zang@nxp.com,m:minghuan
 .Lian@nxp.com,m:gregkh@linuxfoundation.org,m:yoshihiro.shimoda.uh@renesas.com,m:heiko@sntech.de,m:linux-renesas-soc@vger.kernel.org,m:thierry.reding@gmail.com,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:jingoohan1@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:l.stach@pengutronix.de,m:geert@glider.be,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mmaddireddy@nvidia.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[Nvidia.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mmaddireddy@nvidia.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,google.com,valinux.co.jp,gmail.com,st-md-mailman.stormreply.com,axis.com,socionext.com,foss.st.com,nvidia.com,lists.infradead.org,intel.com,arndb.de,pengutronix.de,linuxfoundation.org,renesas.com,sntech.de,lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.886];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: D0B9A1742B0
X-Rspamd-Action: add header
X-Spam: Yes

Ck9uIDE4LzAyLzI2IDI6NTcgYW0sIE5pa2xhcyBDYXNzZWwgd3JvdGU6Cj4gSGVsbG8gYWxsLAo+
Cj4gVGhpcyBzZXJpZXMgaXMgd3JpdHRlbiBpbiByZXNwb25zZSB0byB0aGUgcGF0Y2ggc2VyaWVz
IGZyb20KPiBNYW5pa2FudGEgTWFkZGlyZWRkeSB0aGF0IHdhcyBwb3N0ZWQgaGVyZToKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjkxZGFiNjUtM2ZhNi00ZmM4LTkwYTItNGFk
NjA4Y2EwMTVjQG52aWRpYS5jb20vVC8jdAo+Cj4gVGhlIHJlYXNvbnMgd2h5IEkgZGVjaWRlZCB0
byBwb3N0IHRoaXMgYSBuZXcgc2VyaWVzIHdhcyBiZWNhdXNlIHRoZSBzZXJpZXMKPiBhYm92ZToK
Pgo+IDEpIEFkZHMgUENJIGRldmljZSBhbmQgdmVuZG9yIHNwZWNpZmljIGNvZGUgdG8KPiBkcml2
ZXJzL21pc2MvcGNpX2VuZHBvaW50X3Rlc3QuYy4gV2UndmUgd29ya2VkIGhhcmQgdG8gbWFrZSBz
dXJlIHRoYXQKPiBkZXZpY2Ugc3BlY2lmaWMgcXVpcmtzL2xpbWl0YXRpb25zIGFyZSBjb21tdW5p
Y2F0ZWQgdmlhIHRoZSBDYXBhYmlsaXRpZXMKPiByZWdpc3Rlciwgc28gbGV0J3MgZG8gdGhlIHNh
bWUgZm9yIHJlc2VydmVkIEJBUnMuCj4KPiAyKSBNeSByZXZpZXcgY29tbWVudCB3aGljaCBzdWdn
ZXN0ZWQgdG8gY29udmVydCBhbGwgdXNlcyBvZiBCQVJfUkVTRVJWRUQKPiB0byBCQVJfRElTQUJM
RUQgKGV4Y2VwdCBmb3IgcGNpLWtleXN0b25lLmMpIHdhcyBpZ25vcmVkLgo+Cj4gMykgS29pY2hp
cm8gaGFzIHBvc3RlZCBhIHNlcmllcyB0aGF0IGFsbG93cyBhbiBFUEMgZHJpdmVyIHRvIGRlZmlu
ZSBleGFjdGx5Cj4gd2hpY2ggaGFyZHdhcmUgYmFja2VkIHJlc291cmNlcyBhcmUgcHJvdmlkZWQg
aW4gYSBCQVJfUkVTRVJWRUQgQkFSLiBZZXQsCj4gdGhpcyBuaWNlIGltcHJvdmVtZW50IHdhcyBu
b3QgaW5jb3Jwb3JhdGVkLiAoV2hpbGUgTWFua2F0YSB3YXMgcGFydCBvZiB0aGUKPiBkaXNjdXNz
aW9uLCBoZSB3YXMgbm90IENDOmQgb24gdGhlIHBhdGNoZXMgdGhhdCBhY3R1YWxseSBpbXBsZW1l
bnRlZCB0aGlzLikKPgo+IDQpIFRoZSBzZWxmdGVzdHMgc2hvdWxkIHJldHVybiBza2lwIGluc3Rl
YWQgb2Ygc2lsZW50IHN1Y2Nlc3MgZm9yIGEKPiByZXNlcnZlZCBCQVIuCj4KPiA1KSBBcyBNYW5r
YXRhIHBvaW50cyBvdXQsIGJ1dCBkaWQgbm90IGFkZHJlc3MsIEJBUl9SRVNFUlZFRCBpcyBxdWl0
ZQo+IGFtYmlndW91cywgc28gaXQgaXMgYmV0dGVyIHRvIGludHJvZHVjZSBhIG5ldyBCQVJfNjRC
SVRfVVBQRVIgdG8gbW9yZQo+IGNsZWFybHkgbWFyayB0aGUgdXBwZXIgcGFydCBvZiBhIDY0LWJp
dCBCQVIgYXMgdGhpcywgcmF0aGVyIHRoYW4gcmV1c2UKPiBCQVJfUkVTRVJWRUQuCj4KPiA2KSBJ
dCBpcyBwb3NzaWJsZSB0byByZW1vdmUgYWxsIHRoZSBkd19wY2llX2VwX3Jlc2V0X2JhcigpIGNh
bGxzIGluIHRoZQo+IERXQyBiYXNlZCBnbHVlIGRyaXZlcnMgYW5kIG1vdmUgaXQgdG8gRFdDIGNv
bW1vbiBjb2RlLgo+Cj4KPiBCZWNhdXNlIG9mIGFsbCBvZiB0aGUgYWJvdmUsIEkgdGhvdWdodCBp
dCB3YXMganVzdCBlYXNpZXIgdG8gcG9zdCBhIHNlcmllcwo+IHdpdGggYWxsIG9mIHRoZSBhYm92
ZSBhZGRyZXNzZWQsIGFzIGl0IHNlZW1lZCBlYXNpZXIgdG8ganVzdCBzaG93IHdoYXQgSQo+IG1l
YW50IHJhdGhlciB0aGFuIHRvIHRyeSB0byBleHBsYWluIHRoaW5ncyB3aXRoIHdvcmRzLgo+Cj4g
VGhlIHRoaW5nIHRoYXQgaXMgbWlzc2luZyBpcyB0byBhZGQgYSBwYXRjaCBmb3IgcGNpZS10ZWdy
YTE5NC5jIHdoaWNoCj4gY29udmVydHMgdGhlIEJBUnMgdG8gQkFSX1JFU0VSVkVELgo+IFBsZWFz
ZSBzZWUgcGF0Y2ggIlBDSTogZHctcm9ja2NoaXA6IERlc2NyaWJlIFJLMzU4OCBCQVI0IERNQSBj
dHJsIHdpbmRvdyIKPiBhbmQgZG8gc29tZXRoaW5nIHNpbWlsYXIgdG8gcGNpZS10ZWdyYTE5NC5j
Lgo+Cj4gSWYgd2UgYXJlIG1pc3Npbmcgc29tZSByZXNvdXJjZXMgKHJpZ2h0IG5vdyB3ZSBvbmx5
IGhhdmUKPiBQQ0lfRVBDX0JBUl9SU1ZEX0RNQV9DVFJMX01NSU8pLCB0aGVuIEkgdGhpbmsgd2Ug
c2hvdWxkIHNpbXBsZSBhZGQgdGhhdAo+IChlLmcuIFBDSV9FUENfQkFSX1JTVkRfTVNJWCkuCj4K
PiBNYW5rYXRhLCBpdCB3b3VsZCBiZSBuaWNlIGlmIHlvdSBjb3VsZCB0ZXN0IHRoaXMgc2VyaWVz
LCBhbmQgaWYgeW91IGNvdWxkCj4gcHJvdmlkZSBhIHBjaWUtdGVncmExOTQuYyBwYXRjaCB0aGF0
IGFkZHMgdGhlIHNpemVzIG9mIHRoZSBlRE1BIHJlZ3MgKwo+IE1TSS1YIHRhYmxlIGluIEJBUl8y
IGFuZCBCQVJfNC4KPgo+Cj4gS2luZCByZWdhcmRzLAo+IE5pa2xhcwo+Cj4KPiBLb2ljaGlybyBE
ZW4gKDIpOgo+ICAgIFBDSTogZW5kcG9pbnQ6IERlc2NyaWJlIHJlc2VydmVkIHN1YnJlZ2lvbnMg
d2l0aGluIEJBUnMKPiAgICBQQ0k6IGR3LXJvY2tjaGlwOiBEZXNjcmliZSBSSzM1ODggQkFSNCBE
TUEgY3RybCB3aW5kb3cKPgo+IE5pa2xhcyBDYXNzZWwgKDcpOgo+ICAgIFBDSTogZW5kcG9pbnQ6
IEludHJvZHVjZSBwY2lfZXBjX2Jhcl90eXBlIEJBUl82NEJJVF9VUFBFUgo+ICAgIFBDSTogZW5k
cG9pbnQ6IEludHJvZHVjZSBwY2lfZXBjX2Jhcl90eXBlIEJBUl9ESVNBQkxFRAo+ICAgIFBDSTog
ZHdjOiBSZXBsYWNlIEJBUl9SRVNFUlZFRCB3aXRoIEJBUl9ESVNBQkxFRCBpbiBnbHVlIGRyaXZl
cnMKPiAgICBQQ0k6IGR3YzogRGlzYWJsZSBCQVJzIGluIGNvbW1vbiBjb2RlIGluc3RlYWQgb2Yg
aW4gZWFjaCBnbHVlIGRyaXZlcgo+ICAgIFBDSTogZW5kcG9pbnQ6IHBjaS1lcGYtdGVzdDogQWR2
ZXJ0aXNlIHJlc2VydmVkIEJBUnMKPiAgICBtaXNjOiBwY2lfZW5kcG9pbnRfdGVzdDogR2l2ZSBy
ZXNlcnZlZCBCQVJzIGEgZGlzdGluY3QgZXJyb3IgY29kZQo+ICAgIHNlbGZ0ZXN0czogcGNpX2Vu
ZHBvaW50OiBTa2lwIHJlc2VydmVkIEJBUnMKPgo+ICAgZHJpdmVycy9taXNjL3BjaV9lbmRwb2lu
dF90ZXN0LmMgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrLQo+ICAgZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpLWRyYTd4eC5jICAgICAgIHwgIDQgLS0KPiAgIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1pbXg2LmMgICAgICAgICB8IDIyICsrKy0tLS0tLQo+ICAgLi4u
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jICAgIHwgIDggKy0tLQo+ICAg
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1hcnRwZWM2LmMgICAgIHwgIDQgLS0KPiAg
IC4uLi9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMgICB8IDI0ICsrKysr
KysrKysKPiAgIC4uLi9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLXBsYXQuYyB8
IDEwIC0tLS0tCj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlw
LmMgfCAxOSArKysrKy0tLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1rZWVt
YmF5LmMgICAgIHwgIDYgKy0tCj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFj
b20tZXAuYyAgICAgfCAxNCArLS0tLS0KPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtcmNhci1nZW40LmMgICB8IDE2ICsrLS0tLS0KPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtc3RtMzItZXAuYyAgICB8IDEwIC0tLS0tCj4gICBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMgICAgfCAyMCArKystLS0tLS0KPiAgIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtdW5pcGhpZXItZXAuYyB8IDI0ICsrKy0tLS0tLS0KPiAgIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yY2FyLWVwLmMgICAgICAgICB8ICA2ICstLQo+ICAg
ZHJpdmVycy9wY2kvZW5kcG9pbnQvZnVuY3Rpb25zL3BjaS1lcGYtdGVzdC5jIHwgMjQgKysrKysr
KysrKwo+ICAgZHJpdmVycy9wY2kvZW5kcG9pbnQvcGNpLWVwYy1jb3JlLmMgICAgICAgICAgIHwg
IDYgKystCj4gICBpbmNsdWRlL2xpbnV4L3BjaS1lcGMuaCAgICAgICAgICAgICAgICAgICAgICAg
fCA0NSArKysrKysrKysrKysrKysrKy0tCj4gICAuLi4vcGNpX2VuZHBvaW50L3BjaV9lbmRwb2lu
dF90ZXN0LmMgICAgICAgICAgfCAgNCArKwo+ICAgMTkgZmlsZXMgY2hhbmdlZCwgMTczIGluc2Vy
dGlvbnMoKyksIDEyNSBkZWxldGlvbnMoLSkKPgpIaSBOaWtsYXMsCgpJIHZlcmlmaWVkIHRoaXMg
cGF0Y2ggc2VyaWVzLCBhbG9uZyB3aXRoIHRoZSBvbmUgbGlua2VkIGJlbG93LCBvbiB0aGUgCkpl
dHNvbiBBR1ggT3JpbiBwbGF0Zm9ybToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNp
LzIwMjYwMjIyMTkzNDU2LjI0NjA5NjMtMS1tbWFkZGlyZWRkeUBudmlkaWEuY29tL1QvI3QKCkkg
cmV2aWV3ZWQgdGhlIEJBUiBkZXRhaWxzIGluIHRoZSBsc3BjaSAtdnZ2IG91dHB1dOKAlGFsbCB0
aHJlZSBCQVJzIGFyZSAKZW5hYmxlZC4KSSBhbHNvIHJhbiBwY2lfZW5kcG9pbnRfdGVzdCwgYW5k
IGFsbCB0ZXN0cyBwYXNzZWQgc3VjY2Vzc2Z1bGx5LgoKVGhhbmtzLApNYW5pa2FudGEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
