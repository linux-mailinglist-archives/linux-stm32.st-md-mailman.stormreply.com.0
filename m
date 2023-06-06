Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30B7248E1
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 18:22:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9EB7C65E70;
	Tue,  6 Jun 2023 16:22:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B924C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 16:22:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356FfYpI010079; Tue, 6 Jun 2023 18:21:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3wHoj1x5ujGwvYaMKKlhkdrqnk12Ej6uqq5gLrdJc8U=;
 b=SnqC8btFG1BYF0EHYhRbeLjqSjRW2HPdNJpRNDT2s+VSj/C9puc/5Tu8j4xqKT/8D5Cf
 AmWENiKk6I2v6YN6q6K2bu/VJK1H+1LJ1ygL4dBBnEvaiINFH9BF5Hze+JQc0+QBEGX2
 nIeXLdZPUHMNnXNuvX8rPXD8mNF+ZWfc1HtwRb9qf5owxFc4p+/Us+HQ75EK3duPICp5
 HCUjoLNcbnUEnQUj1EivXA83NTzO94EdX/E/PyJfS+XoEIelwZ+01Rv2fOQqW8lwl4TF
 vAxrE2Y/0C6mhqRDg8f4Oj+JqEMR1AUzB6wo3yuosOm12DxHWSyOCI7RzWH+7cEu+g8M uw== 
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r27nt0605-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 18:21:58 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEtgBRFVBRDCuAwov6oO9unfgj9ZeciO0VFFsCsOyKES11U0ivj1QDCGEA6AUc2uIEwhcuPoNTtb4iuKF8GR1bQd8IgjzunjZ/znhi5L93eiuVV2MMH8QnwApa5SG+zYclELxt2aw6Q21psKifWOvxZFNE3ysANo86Cuw+ZZiUqz/Kja/2Dr7kqiHbB/+hqItfoHHjlf0pqEGRNJdJSLkYKe7XTQMdM2eBdzARY8KzIoSl4iIo6p/5zUeFKhAai8GhfOESsEvKPvG7NrgHDXJAMdfgada9fM8nXc4cGHOuOvhBZAIdRcM4rb0wSAjZG7aM9EflYu68A4XnphfjGoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wHoj1x5ujGwvYaMKKlhkdrqnk12Ej6uqq5gLrdJc8U=;
 b=WV/7rXUoeBqa9oTNyrGPHtzkPfBZlhyq4uUvt57UmxsEgW9jMTRZu3a/RTUt5w51k2Sv68ouIE1nzycvli3XS3hm7QTFxtlNX9RGGb7ebPUcYyd5cLT49T3j1HY7cqpvYyyUoUSpOUR6JNxccOqvrZ1CNy7Dig751YulQML8e0RcbjZiI/gSR46DkSU0Kc/3hkYJpXLi1Je0saYIENwAj4CbPrIaPcAHT/o5vcrq1sIyn/uCqx6F7kgP2U/qinfoHOTGVSMt3yHrIz0oKWEo0k6ufmwGnQbc/uEWYpajwOnPwo2NiWVtBeyqraWC6Mz2f60Ihi7ZLS4KVpdnQoK4kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:158::12)
 by AS8PR10MB5856.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:508::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 16:21:56 +0000
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb]) by PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 16:21:56 +0000
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
Thread-Index: AQHZkuz842ysAt4Sc0yUqaQH1WPTlK911U/wgAD6pYCAByfNcA==
Date: Tue, 6 Jun 2023 16:21:56 +0000
Message-ID: <PAXPR10MB471825B145645894D626F070F152A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
References: <20230518011246.438097-1-marex@denx.de>
 <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
 <PAXPR10MB4718D37242FF00D47DF0CEF1F1499@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <81f4574d-38c2-21f2-b947-d13e5fc99c60@denx.de>
In-Reply-To: <81f4574d-38c2-21f2-b947-d13e5fc99c60@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Enabled=true;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_SetDate=2023-06-06T16:08:07Z; 
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Method=Privileged;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Name=cf8c7287-838c-46dd-b281-b1140229e67a;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_ActionId=179648da-50b9-48c8-84a7-897ec77b412f;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB4718:EE_|AS8PR10MB5856:EE_
x-ms-office365-filtering-correlation-id: 90368669-5ab0-402a-cfae-08db66aa258c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O4Swc6vGAWm7g/WjoBY4Yci/GUSHQq+Jqre8zNk5gNPT4yni0yb4ZdGE3nbEoB/3K/jitrH3EyE9qSjjz4KgT/BdxvpIzXmf+bAO8Hp2Y8cM4A88YHhxDTN5zIGzfg8zE1iKi2Qz1/S8U1cwOdBP69ZWK8cXyR4c9hnqJ+VfqGlWzRGIISLGiBkjCxoVADe1mkk8Q7L6d4kGXNA9qcqeNsqK8c/X3vLXJO9HvqR/MAqNjMyygEPE/4S7mgUErJZ0BjolbjAZH+iCxiPXMhyU4s9bPzYXGEP/1R2TFvl47CW0L4ZY8NV1ql0bIMty2m4tUrMb1QPVU/e2KjUJJwZ55ujEXllij4rasS6h7EDFmL9OPZGraGHqssB6FOEMSrCpqI7b1cZS80eNGxlKISqFEg/hgtyJvSBO3c9IvjEKJWKbQF4hEsLVm8FWQ9jkvyZwVjZnHSBouFfm0jZo66qJggQrdSjJuLLUH5ZdpkniNozzng/zw9wkvvmDrQWQlXKXmwbuPet74yTbNj1s9KcGaDDvwVu5iVgyZFoVExEykLnQdtek5vze7QnbY7ssFHfz3AqU4XgO5w42KupVbTIFcDDOyYBSXxWkaK/B6ofMXk8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(6506007)(9686003)(186003)(26005)(53546011)(55236004)(83380400001)(7416002)(54906003)(7696005)(2906002)(71200400001)(15650500001)(8676002)(8936002)(110136005)(33656002)(478600001)(55016003)(66446008)(122000001)(5660300002)(38070700005)(86362001)(52536014)(38100700002)(4326008)(66476007)(41300700001)(316002)(66556008)(76116006)(64756008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWdPK0JkbVBuVUtyNzd5ZUpkMW9na2E3dFFBOWtYaGZKb0h4TTB6Q1R5bUJY?=
 =?utf-8?B?MktnSFZsVmRpeExxWUVqbkc0Qm52cGFCRHIyY3o0Wi8yNXBaWU9mM1pQb3dr?=
 =?utf-8?B?S1dKL0pFeEFNYU1lZXhmaFN0NzB5bHRTWlNhbEhwSXZ2ODd4TUtDcHFqQWRB?=
 =?utf-8?B?UDZlN056TnZFK2ZnK2pBaDBTMndsbXR1d2xhSERhZ0wxR1kxR0tjSGFMSk1p?=
 =?utf-8?B?YW5TUmQ0aC9OdXhDUk4xRkxOV3dLbk51b1V0QjZzK2hUT3o3dUFJeGxDQUl5?=
 =?utf-8?B?N2NzK3JLTzRGTWs5ZnFkY29sTWRuYldxZHZ2NmlQSkpCVFlLdnRwZmh0NXBN?=
 =?utf-8?B?RTJPeXFOTDhHTU5IdFFSYVYrU0dDdFp6ekwzai9pOTdtSTNuQUtEL2QxSUVa?=
 =?utf-8?B?N0lvL1BkZkFyMmNwRDFsVzIwNDBIUGRod0dPRzlxZlFydTd1L3RVa24zZ0xl?=
 =?utf-8?B?NTJlM1hsM1hzMFFaMGxVRGxrTmFGK1JuYklsYU5jbnhVa210S2dKN3c1T3dj?=
 =?utf-8?B?cHQ4Ymh5L25QdW9tdTFrSVZSK01GbTVpekJWeXAxb1J5c0lZWE5EQVBuL3Rv?=
 =?utf-8?B?VWFoTzAzbDB3MldxbUpyV3dPclRTQTJBRk5aQjBhaUgzNUZ3dmFTTUFUL1JE?=
 =?utf-8?B?cytzeFdGNEY5c0o5dHRaMXZLcm5hMHNaMUZvazVLYWhReHdEU29iaXpReVNZ?=
 =?utf-8?B?aVloQnlkTjE1SjNjOG5rcERHVi90TFA3UURHbFpBUk1qYTM4MTZHaytWbit6?=
 =?utf-8?B?N1U4WjNEVkREUThMNEkvcGtiektSOWNXUzdjTTdYNU52NnRUR2dmSW5pZkIy?=
 =?utf-8?B?emtBTVE0bEJkcERNaXNTR2NWUnIrUkExTE84dGVmNE9BdDZ4RURIVDZhWVp4?=
 =?utf-8?B?RjMxczdkbHZmSE9uR2JrL3o2ays4dDlRV0JpSFlocWtacDRpWFVnNkxIY1gy?=
 =?utf-8?B?bXFLaHdxSmlCVzhQT2xJd2dLZEltOEVaUW91SHJaYVRTRmJja0FuUkpRVU83?=
 =?utf-8?B?T2lqOFZWRmVXejJXS3J5QVN4R21SM2VpWEpwclJTWDZzTnFra0kvaEo0L3Nu?=
 =?utf-8?B?eFVQS2NtQ255WGZOUm1lR1MxdUpEcncwcmhwL0Z0TzgrTUk4NXR4V0hXaTIw?=
 =?utf-8?B?RVYyWXY4TlMwZlpIKzE3WkhCSm9hdUFiZVZwRXJjMVY4SDJtOWJ5QTZIZGRL?=
 =?utf-8?B?MjVOcFJXdkRKTXJYWjc3aWlKaUlKamxjbG5IRnU0L3ZHSHlTU0FOcEVLYzlJ?=
 =?utf-8?B?ZDRRV3VJNGxQT3B1eDVISDVJbjZ0bFh3a2dVaEFkRGZXWmZVY0lnYmtrZFJ1?=
 =?utf-8?B?L1ZqSTFjUDhrVnFwZXlHb0pRQ1lUKzlyNTF4Q2xMaDJvWWtITzMzM09TTW1y?=
 =?utf-8?B?SXZmREpyQkI0THVBWFNZOGRwYW4rejArS0xUZWdkMExETVJveG4rdzBoMUhH?=
 =?utf-8?B?R0JPZTJMVndHUmxsYzIybnhpeWd4Ty90TTdrUGU4UWdDam9nOHM3SEdLVWwy?=
 =?utf-8?B?MlBpV1EyclBmKzdJd1VOdlVJY2FXRHpSTUF0MHJPa0xHL29qRWk5UTE1ZWF5?=
 =?utf-8?B?SHJINzYyWVFSS3IvajFnTHJ6cU0wNFk4ckQxcFhpVnB3REZvUUhKK1VtRFEv?=
 =?utf-8?B?djcrT0RQSFZtdlZiK2JnNDZzQy9RN2dMSHFYVWx0OEVhSWpQcjQyQjBZNWN0?=
 =?utf-8?B?WHlDSUZxY2xpVFIya2tVUXF0dm13KzVlTFVZYjVCMElQWlBoVDFPSkVZOFJy?=
 =?utf-8?B?d1ZpQnRKUEdqcTF3dWZnNlNpRVo5S2ZjTk1lbUxHWWxCcnNlUG1zczU1djJa?=
 =?utf-8?B?NHhmU2ZYYmZiYXdyM2gzeVVocjNXblhXbG1POE1QTU5FcGN4UkhvUGhWbnZ3?=
 =?utf-8?B?aER3dXZ0WjgxTnAxakpMaEs0dnJOT0ZYeGdWdkc4QmwzUEdLNnBLSnBqbDVq?=
 =?utf-8?B?ZFpQeUh4MStDMzNBbnh5K0hjZFhCaUdZbXhkOFhlaDg4UzlDZGVsL2NWczEy?=
 =?utf-8?B?NjRub3N1MjM5VUVPTWc4aGlrNThuYUxRaVJLMTkzWFVkWXdrMjlabUw2Yytj?=
 =?utf-8?B?MDFaMVMycGFWemJyZ2FnRHVLUStNYTdHSmtNMTdVZUdILzVhY09MWGJ3Mytl?=
 =?utf-8?Q?J3vgPbA10k1SNMhfJfMj/uhbH?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 90368669-5ab0-402a-cfae-08db66aa258c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 16:21:56.3370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QuTExeld1vJXoZLchdzgwbIcKNu8TSm48TePnL87QZAg1ICa3OvvHq8AZ0AUpc2KTl2Dk6xlR91HXYIayM3gqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5856
X-Proofpoint-GUID: ECIP19vDj0N-VoTTra8-QvHsbhE1MCxx
X-Proofpoint-ORIG-GUID: ECIP19vDj0N-VoTTra8-QvHsbhE1MCxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_12,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060140
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
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

Hi,

> -----Original Message-----
> From: Marek Vasut <marex@denx.de>
> Sent: Friday, June 2, 2023 4:36 AM
> To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>; linux-arm-
> kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org; Conor Dooley <conor+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Richard Cochran
> <richardcochran@gmail.com>; Rob Herring <robh+dt@kernel.org>; Maxime
> Coquelin <mcoquelin.stm32@gmail.com>; linux-stm32@st-md-
> mailman.stormreply.com; kernel@dh-electronics.com
> Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
> mailbox for emtrion emSBC-Argon
> 
> On 6/1/23 14:56, Arnaud POULIQUEN wrote:
> 
> Hi,
> 
> [...]
> 
> >> I assume that if the firmware does not use the detach mailbox, then
> >> the detach mailbox is just ignored and unused, so there is no problem
> >> with having it described in the DT in any case ?
> >
> > Yes, The aim of the ST evaluation board is to provide a DT  to a
> > support different firmwares for demo and tests.  But it is not the case of all
> boards...
> > If your boards provide demo using the "detach" it is justified.
> > If you just add it as a workaround to mask the warnings, you just mask the
> issue.
> 
> Then it seems there is no issue with the boards modified here, because as far
> as I can tell, those are all general purpose SoMs and evaluation boards. With
> such systems, you cannot predict what the user would like to use those for,
> that could include whatever ST demo.
> 
> >> And if that's the case, then I would much rather prefer to have all
> >> the boards describe the same set of mailboxes, so they don't diverge
> >> . What do you think ?
> >>
> >
> > I would avoid this.  It is only a configuration by default for current demo.
> 
> That current demo is restricted to ST produced boards only, or can it also be
> run on development kits manufactured by other vendors ? I think it is the
> later, and I don't see why those should be kept out.[] 

ST Demos are boards dependent.

> 
> > The allocation depends on the firmware loaded on M4, so depend on the
> project.
> > For instance, a work has started in OpenAMP community to implement the
> > vIrtio Services For the IPC.  Each virtio services would be associated
> > to one or several mailbox Channels.  In this case we would need to
> arbitrate allocations.
> > The result could be that we propose a virtio channel for rpmsg + some
> other virtio.
> > More than that we probably manage the mailboxes in sub node Here is an
> > RFC on the topic
> > (https://lore.kernel.org/lkml/20220920202201.GB1042164@p14s/)
> >
> > That said, fixing rpmsg virqueue and the shutdown mailboxes in the
> > SoC dtsi, seems reasonable as it provides the default expected
> implementation.
> > Do the same for the detach that is optional and mainly unused, I'm not fan.
> > Adding the detach mailbox in the DT to mask a warning issue, I'm
> > rather against it
> 
> Removal of divergence.
> 
> >>> Rather than adding unused optional mailbox, I will more in favor of
> >>> having a mbox_request_channel_byname_optional helper or something
> >>> similar
> >>
> >> See above, I think it is better to have the mailbox described in DT
> >> always and not use it (the user can always remove it), than to not
> >> have it described on some boards and have it described on other boards
> (inconsistency).
> >
> > Adding it in the DT ( and especially in the Soc DTSI) can also be
> > interpreted as "it is defined so you must use it". I would expect that
> > the Bindings already provide the information to help user to add it on need.
> 
> Why should every single board add it separately and duplicate the same stuff,
> if they can all start with it, and if anyone needs to tweak the mailbox
> allocation, then they can do that in the board DT ? I really don't like the
> duplication suggestion here.

I was speaking about "detach mailbox. Here is what I would like to propose to
you

1)  move all the mailbox declaration in the DTSI except "detach"
2) don't declare "detach" in boards DTS ( except ST board for legacy compliance)
3) as a next step we will have to fix the unexpected warning on the 
   "detach" mailbox.

Regards,
Arnaud

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
