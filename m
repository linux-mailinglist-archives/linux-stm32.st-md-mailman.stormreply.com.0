Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1A9AE50B
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 468E3C78F73;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on2094.outbound.protection.outlook.com [40.107.215.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4C62C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 01:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyE/2oqX/CSaEmO2KNVLke5cPwH8kJA1XvrQO9BgSvfyadKz+gIBGhl7KvvbfTYICRXnHJD/gReZGMBxyrtHlv2+usY7ciyTSQn3/N2sR7NmMWUMel3SBl2qFVdlVTN8N0TrSmnhEJjDESZQ+ygrDGXUfP4ba+jeJnqrwhnZZPiAFg1SN4XWhpAkJ0UqcN3xBJ6D0k2lONByZrL19uG6ObbZsvzEBg+UPrxtxFCSxKQFDeBcUiHOHO3sPgpMIdeXvEVwKoKRC3w0AWiFwA4w9lGMURdrQcI78F15BWL+/wlAY/3N2YFIkMxGNB/YPbNpj1ilEC54jI4OEFkhZCmfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=se0f8YQXh0ceycHuforf52GjnWnfE4NLkGlIl7LC6h4=;
 b=GBDEAQmU+xqLGmT63Q/bygaZgb0NoYN1kI2P9+4EzTNTpTTj8n77knbbO0Fs7IUVmcu59o6yL/aEZeVL+4rwCb9vKR1fYLn1UcKCvgm26cBPoqF3ZmmJ+tiZ7Bd3Enep0xQVWffV3yLu3ItrXhETCNgDVU1GZe1Q4OWZqBfPQvrouxK4yn3bgfT2/Ks09/glyFnMLqzJGD9tsSTA6vKR71Ov5zFk/3BIX6qVHDGBMALN9YM8SNKSdW/nQJeW1CghW+L3ASEF6TbBHfver2QnsdYmg2AV/WEvoFZyb2gJWZt5DYF0VuJzpYN6KdvtXgcFuq/VJvMtc8guBgSWzya38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=se0f8YQXh0ceycHuforf52GjnWnfE4NLkGlIl7LC6h4=;
 b=NSzecORF/adXYng7UIVLTwC5D2TsFLkuoop6F3HN1cGP4GQyJNLA3ypbbZCfxno/zAhl0cb7wR1cUZ6TrCAC3ekbn51kYhYR0Lx5IbZbEFNVF/fox5V3QBmqKocKK4G4ybYsDTfBa8xeJW8o270UXCds2GBV1urkJUzcl/cRpszKFYAv8FfdCszmoXWyQphaoZICqNCAvk9yi0o6fm2UMjp53lXSDSglOB3+W3cwuNiY2XSZQJupdq/uigd3Jn7PMe8TdSDgMzhKcxk4CGMgHLmkEocQjPyeC1qbVoDpZISB9hmBIq759a0EoduFgFVwGFksWjrpOlrZcfv9qZ1GQA==
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by KL1PR06MB5896.apcprd06.prod.outlook.com
 (2603:1096:820:db::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.15; Tue, 22 Oct
 2024 01:15:15 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%6]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 01:15:15 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: Marc Zyngier <maz@kernel.org>
Thread-Topic: [PATCH] tools: arm64: add registers read/write tool for arm64
Thread-Index: AQHbI8ooNcmQPCWvSUuK/6QQ+sINT7KReg8AgAB9oeA=
Date: Tue, 22 Oct 2024 01:15:15 +0000
Message-ID: <KL1PR0601MB57734C39BCAAE623724DD501E64C2@KL1PR0601MB5773.apcprd06.prod.outlook.com>
References: <20241021150112.1194-1-rex.nie@jaguarmicro.com>
 <86cyjt4ahn.wl-maz@kernel.org>
In-Reply-To: <86cyjt4ahn.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB5773:EE_|KL1PR06MB5896:EE_
x-ms-office365-filtering-correlation-id: 60d56c3f-3527-40f1-5ad5-08dcf236fc18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d3JHU3dQdll5Z0svTjF2bUIwQ2U3ck1RTTZGTDBmOWxvUFhtN3BsZEkxV283?=
 =?utf-8?B?eWxtcUtzK3puTW5aaCthdzU5YXIxdVhydytYM25nZ09ONVVnYmszdWYvdC9B?=
 =?utf-8?B?WXFKSVpEVXRQOElvSzR3Z3d4aTNtdko1Mm5FQVAyVysrZDN2MGJ1NkZxejB3?=
 =?utf-8?B?eHQ2NlVoL2xIalhaSG1xMGJaZUlqc1FpUHY2Y1U5ZjJ5ODRCaVlxcWw4MjJQ?=
 =?utf-8?B?SS80TUFQUFcyQ2xYQnJSNFFTOHhLYTA4YXEveGVmNzEzMDA2dFpXcENXV0la?=
 =?utf-8?B?SmIyRmJYaVI1UUZlUG1scnJINDNONHgwYStlZEc5dHROMkxwTEM2aXNKTDR4?=
 =?utf-8?B?bmlKSGpWcUx5cDBYUENkUi9yY1ZHSzFtYjZRb282N3BmT0VnbWVEZUFxRjFV?=
 =?utf-8?B?Qlo4dzBkV2Y0TnF1SzhqbnNiWldQVHBUZzArUDkxSmp5WjJ4eXpFd21tVVo2?=
 =?utf-8?B?Vkl0ZDkyTFZsRVBwR3BzNjh3YjY1SW92Ni9FMGhPendGUVo0UjFzNUovclNI?=
 =?utf-8?B?L2lFdWEyeEJVNGNqb1ZXWmRlTHZBelc4R2lzdkNHVFVrY1pxZHRqeFlwSk01?=
 =?utf-8?B?eWVDQTVmSS9zVk9wWXVia2s2YkV2WUphVWYvQnNKaGZtenVLNUgvRS9jNEhB?=
 =?utf-8?B?MitXbmxTRWpSTVYxckQ5NG5Zc0YzTVRGYjlCME5zTWxMNnlUMUJselVHRllO?=
 =?utf-8?B?VWxocXdGMEFON21GRGUrN2lHdFBkMGtnYjhxQ2NIQk9KN3FsVURrL0U1NWlL?=
 =?utf-8?B?NCt0Z21yWUorcEdDR0lXZ3pST2k2Y0V2d0dJNk4zMGF5bElSU085aDRHRno1?=
 =?utf-8?B?YlNEYlFZMHFFN0FwbGp0UTVQNllNZHZQTFRSSTFtN2ZxV2VBeTY3UUx2bElJ?=
 =?utf-8?B?WkFEak0xQ1dkVWIvTkEyWVFjMVdKeW9nZUNjcUp2N1ZHa3hDSXRqdERCKzV5?=
 =?utf-8?B?YyswODNpKzlTd3Z1T0lYMy9pM1RJazdncE1qamxZRGNjQ2cxSlFsUTh5dzlX?=
 =?utf-8?B?QjJmemNMMGk1Tmx4MThOM3BKNWFpSE51MHBOQ2RScGp5N0RKL1hMZ29kTmVn?=
 =?utf-8?B?TEY5ZWtiU29LdlZWb0d4UnZHWnZ2aldHYVgwNzEzbnBpdWUxSGQydUg4VmNn?=
 =?utf-8?B?cEQzUzkvU2w5ZVRGVm5vTkQ1c1p4S2tPVElEUzgvVmV2RzNaZFpCNWRqQWVn?=
 =?utf-8?B?cXY3UFZaRU5ETDIzZW52Ny9sU0I4dmt5TllQYjNhdDVDcTBic0ZNNzU5bzkr?=
 =?utf-8?B?WlJ0ZFZMOFNMc1lBbmh4bDJHc1NuSmhaZXpGbUtVVFJQeFdPZUQ1Q2V3elJy?=
 =?utf-8?B?OE5sRUV1L2NIYklXdlpaYU5lRms3MzVENVAvenlMYmhQSG9pdzNubFgrSkph?=
 =?utf-8?B?eGtNRHpYYmU4SVUyQ1pkWlpyMG9NR2ZTUXZFMTNxWmRDcTlnZnV3dmNWYmkz?=
 =?utf-8?B?SHplQXdjZlhRYm8zZ3BDemFKNlhuSU01TVFJTlkvZmgvaVNLS0tSbEhDM0dT?=
 =?utf-8?B?c3ZjQzJNK3dGbTJuWnE0Qndyd25kWGlnWWdWK3VQbkdHQjg5eDk5R0tpL1Fn?=
 =?utf-8?B?ajdXM0d4VC8wZzQ5dHFRT3BaMjdyNXhLaW0zWVVZWndzaGpjVDhNeW91NWE3?=
 =?utf-8?B?VThFclhIMHQzTXpCNlFTbWlPV0hmS1VBUWJKdFNqa0dSOTZZcmE4TXY2amln?=
 =?utf-8?B?dGxXK0l5VkhBcVVkVmMydlBCNlQzT0lCbFZxY3l1Tzk5enR6THE0UXptcWd4?=
 =?utf-8?B?dENueDd1bC8yT3o5bnFudnF1ZGJvL1ZSSnFBazF6NmwrcGViMzNlV0NxZ09k?=
 =?utf-8?B?L2NTNkpsU3orLy9iNklyeXJXakZoUjhwQS9WeUpCQWR4aVVPeEt4Q1Z3VFp3?=
 =?utf-8?Q?HxreNOtDfd6Da?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:KL1PR0601MB5773.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Slh0bHpBd0lxTHZxTHU1Mk40bnhrVEI0SW5JcWRsclp2TER0YUtEeTF5V2dC?=
 =?utf-8?B?bjRkYzhMQjV0cmIrS0pZNVBlMGdXNi9wVUpmSzNiMGNnL2pMQmFZMlhaeHhj?=
 =?utf-8?B?RVJjd0R6clh1YzVwWk1YajFjOEUrcDRKRzZtQXlQdGUvQ0YxbkU2OWV2WVF0?=
 =?utf-8?B?SnRrcTFxSmR6WlFPRlE2YnZVUFNvNElxbjBiVCswclk5TXhOQ2NTd25UQy9w?=
 =?utf-8?B?Ynp1Rm83UDhxeG01dlBhMTZCcFZvU3VsK2JxMnpPYlJxcUdZM0daK1dmUU1I?=
 =?utf-8?B?Mm9BbWxtdllZa3phNUgvV0o5dDBHYnQ3bXFKZHJma1FiVTB6djUyVVdMUlhL?=
 =?utf-8?B?d1JqRzQrNGh6dFZ5VnVxYXVobW5CRXl5VG52YVBKYmdSOTAyc1NlUjNIRmhv?=
 =?utf-8?B?b0NiNzBKeU9SQ0ZaSEtUN0RQaFVKZzcvTXorMlRBaDlsb3c5RjR6NkplbVla?=
 =?utf-8?B?WkVOWmJOekNRWURYMU9GVzkzUTYrcTBXZTIxVzF0TDBVaktzZWt1b0RGT25x?=
 =?utf-8?B?YmV3eGR1Q2VxVWRKUFNMUjlQT0RzUU0vZnM0Zng4YXdhdVpvOUhNMnpUZUlY?=
 =?utf-8?B?SW11Vk5vbllXeVJXTFNTMkV3cHRnazhoQWgwUjUxMm82bmN5MUhFYWtXNWNM?=
 =?utf-8?B?OC8yZW5MTnVseW1yczU3NHhvcXhYK1RJZSsyZkkyVmJGSVJoT2dZQWxpbFFD?=
 =?utf-8?B?NTZIeDlldVFvQU1zS3ZmVHFUcmdIRy9UUi9HZU1PM3U0SEJtb3c5RlI4WDc4?=
 =?utf-8?B?UTZhVmpQZ3JOVnEwcXZlRGlPVFdLaWtQTXFsNmlOSFhOeXlnRHYvSlowc09y?=
 =?utf-8?B?TDhTV2pCS25EWFUxaGs1bUxhc1ppem1RZHV0U0JvSitOQXh5dGVDSG5zWXNR?=
 =?utf-8?B?M1dlTUxZQVdORStKVzJ6SmdqSGRESjRqQk5DeWsxUHZLKzNaU3FnZzU1T1JQ?=
 =?utf-8?B?RmJ4UWRlMkZtdjBYSWhySWNxRW5NV1dBeEpYenJxbTJEMGZUemcreVkyN3U3?=
 =?utf-8?B?dGhObEJpQlN3ZDRyTHpKekQwWDRKVnBqN1AwUTE5QzhqbE11TUN4RkhsajFT?=
 =?utf-8?B?VmFvbTQvWGhFQ3pNY1VYWlc1ZzhpTGZLem15RVNvS0tyVVRHeDZFbjBzbDg5?=
 =?utf-8?B?R2tyTFp2R0dpc1ZKYlg5ODQ1MFFYTmlaZlZ6ZGkrQ2w1cnVrZmtOL1ZtT2RT?=
 =?utf-8?B?Z3EwQVFVM0haZEJ0VDBuMmtrVlk0NXZKZ1JkZm5zZlE2eHZXOUdVZWsyb2Zx?=
 =?utf-8?B?akZ3eXhlWThXVGFiVnBoOFhzejhkZVFENmI5UFkrd084M25hWjhaTVdHejJL?=
 =?utf-8?B?UElBSkJwYWVmNVFJRzhFNzl6L29PUldkVlg3RTNYUUZDVzFMcklROUVqdW9w?=
 =?utf-8?B?QVZtZG9FSUtKNkZ2TWx4VXVSanR3YVkyeTVkTU03SUVEQlYzVDczWnBWcVky?=
 =?utf-8?B?UVBFamhJNzlJbXA5TmFTQ3V4TXYvMkVnSnpoY2kxd09nNzdQeEZ6UnlTRXJX?=
 =?utf-8?B?a1ZjdldubmF5VVVvNitEeUdpTml3Y0MyRVdMZmRnWkdNWWx0R0dRS2dtL0E0?=
 =?utf-8?B?VHlqTVdReHhRT2RYZUpXZk80SnM2SHFRNkJVMnNJZGRDNVZkYkEvNkZGdWJL?=
 =?utf-8?B?Tk1EOWo0ZGY1RXlyU0xva01xZ2pLRHA3TkdkSk1hWExudlNrZ0RoTHBydjJO?=
 =?utf-8?B?VHZpTisvRnc3RUtQeE9XNXpYb0Nkbk96ckhobmtUWld0MkRhY0RBR25wdFVG?=
 =?utf-8?B?UHdRWFZZSlpQTUExQy9XcFc0QThaZzBqSFdubFV0dG1SczYwbUM2WklXTEVT?=
 =?utf-8?B?U3dudXdYUGNUK2JQVlh3OExDRTQ2TjhnQkVNMGxZMVk5VTlIaEc2aWFOYkNC?=
 =?utf-8?B?UnhMVzBvM1JBY2ZLUHVFZlBRTzJWa0lYQ0VUY0dHL0hvVzZabEx4bDdGWEZU?=
 =?utf-8?B?cGFwQml5blFqbjRmYmpleEZoaTJNY3ZndUlHRU5WVTJ1M0Y2VFVDaGMweVRi?=
 =?utf-8?B?bVlGMXA4Mzk5dzVmWWNGc3NVaSszSlUyYlp3TExuaG82eU01VGl3ZFNnUHBW?=
 =?utf-8?B?TzQwWGx3QlZmRVdVS2NDYVlhbmFyM0h6dDV0WUttdThIUjFCSUFmYWhMMVJy?=
 =?utf-8?Q?1IO6JzohUC+O1tPD3ztJsoJMI?=
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d56c3f-3527-40f1-5ad5-08dcf236fc18
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 01:15:15.1167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z00jeZbXrkaTiHk65PY0Hs0B4fZK1Tm1By/LjOa6uB09g+wNI/zFdM9b0BlralDClNsgBzeXkc6A31CR6sCRYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5896
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Angus Chen <angus.chen@jaguarmicro.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIHRvb2xzOiBhcm02NDog?=
 =?utf-8?q?add_registers_read/write_tool_for_arm64?=
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

SEkgTWFyYywNCglUaGFua3MgZm9yIHlvdXIgcmVzcG9uc2UsIEkgZ290IGl0Lg0KQlJzDQpSZXgN
Cg0KPiAtLS0tLemCruS7tuWOn+S7ti0tLS0tDQo+IOWPkeS7tuS6ujogTWFyYyBaeW5naWVyIDxt
YXpAa2VybmVsLm9yZz4NCj4g5Y+R6YCB5pe26Ze0OiAyMDI05bm0MTDmnIgyMuaXpSAxOjQ0DQo+
IOaUtuS7tuS6ujogUmV4IE5pZSA8cmV4Lm5pZUBqYWd1YXJtaWNyby5jb20+DQo+IOaKhOmAgTog
bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbTsgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbTsN
Cj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbTsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBBbmd1cyBDaGVuDQo+IDxhbmd1cy5jaGVuQGphZ3Vhcm1pY3JvLmNvbT4NCj4g5Li76aKYOiBS
ZTogW1BBVENIXSB0b29sczogYXJtNjQ6IGFkZCByZWdpc3RlcnMgcmVhZC93cml0ZSB0b29sIGZv
ciBhcm02NA0KPiANCj4gRXh0ZXJuYWwgTWFpbDogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20g
T1VUU0lERSBvZiB0aGUgb3JnYW5pemF0aW9uIQ0KPiBEbyBub3QgY2xpY2sgbGlua3MsIG9wZW4g
YXR0YWNobWVudHMgb3IgcHJvdmlkZSBBTlkgaW5mb3JtYXRpb24gdW5sZXNzIHlvdQ0KPiByZWNv
Z25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+
IE9uIE1vbiwgMjEgT2N0IDIwMjQgMTY6MDE6MTIgKzAxMDAsDQo+IFJleCBOaWUgPHJleC5uaWVA
amFndWFybWljcm8uY29tPiB3cm90ZToNCj4gPg0KPiA+IFRoZSByZWdfY3RybCBrZXJuZWwgbW9k
dWxlIGNhbiByZWFkL3dyaXRlIG1vc3QgYWFyY2g2NCBzeXN0ZW0NCj4gPiByZWdpc3RlcnMsIGlu
Y2x1ZGluZyBFTDAvMS8yLzMsIHdoaWNoIGlzIHZlcnkgdXNlZnVsIHdoZW4gaGFyZHdhcmUNCj4g
PiBkZWJ1Z2VyIChzdWNoIGFzIEFybURTNS90cmFjZTMyKSBpcyB1bnVzYWJsZS4NCj4gPg0KPiA+
IFRoZSBwcmltYXJ5IGltcGxlbWVudGF0aW9uIG9mIHRoZSByZWdfY3RybCBtb2R1bGUgaXMgYXMg
Zm9sbG93czoNCj4gPiAxLiB3aGVuIHRoZSBjb3JlIGNhbiBkaXJlY3RseSBhY2Nlc3MgdGhlIHRh
cmdldCByZWdpc3RlciwgaXQgdXNlcw0KPiA+ICAgIHRoZSBNUlMvTVNSIGluc3RydWN0aW9ucyB0
byByZWFkL3dyaXRlIHJlZ2lzdGVyLg0KPiA+IDIuIE90aGVyd2lzZSwgaXQgcGVyZm9ybXMgYW4g
U01DIGNhbGwgdG8gc3dpdGNoIHRvIEVMMywgd2hlcmUgdGhlDQo+ID4gICAgcmVnaXN0ZXIgcmVh
ZC93cml0ZSBpcyBjb21wbGV0ZWQgYW5kIHRoZW4gcmV0dXJuIHRvIGtlcm5lbCBtb2RlLg0KPiA+
ICAgIEkgaW1wbGVtZW50IGFuIE9FTSBTZXJ2aWNlIGluIEFURiB0byBhY2Nlc3MgcmVnaXN0ZXIg
YXQgRUwzLA0KPiA+ICAgIHVzaW5nIG9uZSBTTUMgZnVuY3Rpb24gSUQgZm9yIHJlYWRpbmcgYW5k
IGFub3RoZXIgZm9yIHdyaXRpbmcgcmVnaXN0ZXJzLg0KPiA+DQo+ID4gdGVzdCBzdGVwcyBvbiBt
eSBwbGF0Zm9ybSB3aXRoIDE2eCBBcm0gTmVvdmVyc2UgTjI6DQo+ID4gMS4gaW5zbW9kIHJlZ19j
dHJsLmtvDQo+ID4gMi4gY2QgL3N5cy9rZXJuZWwvcmVnX2N0cmwvc3lzdGVtLw0KPiA+IDMuIHZp
ZXcgdGhlIGRpcmVjdG9yeSB0cmVlIG9uIERVVC4NCj4gPiBbcm9vdEBsb2NhbGhvc3Qgc3lzdGVt
XSMgdHJlZQ0KPiA+IC4NCj4gPiDilJzilIDilIAgY29udHJvbA0KPiA+IOKUgiAgIOKUlOKUgOKU
gCBWTkNSX0VMMg0KPiA+IOKUnOKUgOKUgCBpZA0KPiA+IOKUgiAgIOKUnOKUgOKUgCBDQ1NJRFJf
RUwxDQo+ID4g4pSCICAg4pSc4pSA4pSAIENMSURSX0VMMQ0KPiA+IOKUgiAgIOKUnOKUgOKUgCBD
U1NFTFJfRUwxDQo+ID4g4pSCICAg4pSc4pSA4pSAIENUUl9FTDANCj4gPiDilIIgICDilJzilIDi
lIAgRENaSURfRUwwDQo+ID4g4pSCICAg4pSc4pSA4pSAIElEX0FBNjRBRlIwX0VMMQ0KPiA+IOKU
giAgIOKUnOKUgOKUgCBJRF9BQTY0QUZSMV9FTDENCj4gPiDilIIgICDilJzilIDilIAgSURfQUE2
NERGUjBfRUwxDQo+ID4g4pSCICAg4pSc4pSA4pSAIElEX0FBNjRERlIxX0VMMQ0KPiA+IOKUgiAg
IOKUnOKUgOKUgCBJRF9BQTY0SVNBUjBfRUwxDQo+ID4g4pSCICAg4pSc4pSA4pSAIElEX0FBNjRJ
U0FSMV9FTDENCj4gPiDilIIgICDilJzilIDilIAgSURfQUE2NE1NRlIwX0VMMQ0KPiA+IOKUgiAg
IOKUnOKUgOKUgCBJRF9BQTY0TU1GUjFfRUwxDQo+ID4g4pSCICAg4pSc4pSA4pSAIElEX0FBNjRQ
RlIwX0VMMQ0KPiA+IOKUgiAgIOKUlOKUgOKUgCBJRF9BQTY0UEZSMV9FTDENCj4gPiDilJzilIDi
lIAgaW1wbGVtZW50YXRpb25fZGVmaW5lZA0KPiA+IOKUgiAgIOKUnOKUgOKUgCBJTVBfQ1BVQUNU
TFJfRUwzDQo+ID4g4pSCICAg4pSc4pSA4pSAIElNUF9DUFVFQ1RMUl9FTDENCj4gPiDilIIgICDi
lJzilIDilIAgSU1QX0NQVVBQTUNSMl9FTDMNCj4gPiDilIIgICDilJzilIDilIAgSU1QX0NQVVBQ
TUNSNF9FTDMNCj4gPiDilIIgICDilJzilIDilIAgSU1QX0NQVVBQTUNSNV9FTDMNCj4gPiDilIIg
ICDilJzilIDilIAgSU1QX0NQVVBQTUNSNl9FTDMNCj4gPiDilIIgICDilJTilIDilIAgSU1QX0NQ
VVBQTUNSX0VMMw0KPiA+IOKUlOKUgOKUgCByZXNldA0KPiA+ICAgICDilJTilIDilIAgUk1SX0VM
Mw0KPiA+DQo+ID4gNC4gcmVhZCBFTDEgcmVnaXN0ZXIgb24gY29yZSAwOg0KPiA+IFtyb290QGxv
Y2FsaG9zdCBzeXN0ZW1dIyB0YXNrc2V0IC1jIDAgY2F0IGlkL0lEX0FBNjRQRlIwX0VMMQ0KPiA+
IDB4MTIwMTExMTEyMzExMTExMg0KPiA+DQo+ID4gNS4gcmVhZCBFTDMgcmVnaXN0ZXIgb24gY29y
ZSAxOg0KPiA+IFtyb290QGxvY2FsaG9zdCBzeXN0ZW1dIyB0YXNrc2V0IC1jIDEgY2F0DQo+ID4g
aW1wbGVtZW50YXRpb25fZGVmaW5lZC9JTVBfQ1BVUFBNQ1I0X0VMMw0KPiA+IDB4MjAwMDMxNWEx
MDAwMDA0NQ0KPiA+DQo+ID4gNi4gc2V0IGJpdCAxIG9mIElNUF9DUFVQUE1DUjRfRUwzIHJlZ2l0
ZXIgb24gY29yZSAxOg0KPiA+IFtyb290QGxvY2FsaG9zdCBzeXN0ZW1dIyB0YXNrc2V0IC1jIDEg
ZWNobyAweDIwMDAzMTVhMTAwMDAwNDcgPg0KPiA+IGltcGxlbWVudGF0aW9uX2RlZmluZWQvSU1Q
X0NQVVBQTUNSNF9FTDMNCj4gPg0KPiA+IDcuIGNoZWNrIGlmIGJpdCAxIGlzIHNldDoNCj4gPiBb
cm9vdEBsb2NhbGhvc3Qgc3lzdGVtXSMgdGFza3NldCAtYyAxIGNhdA0KPiA+IGltcGxlbWVudGF0
aW9uX2RlZmluZWQvSU1QX0NQVVBQTUNSNF9FTDMNCj4gPiAweDIwMDAzMTVhMTAwMDAwNDcNCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJleCBOaWUgPHJleC5uaWVAamFndWFybWljcm8uY29tPg0K
PiANCj4gVGhpcyBzb3J0IG9mIHRoaW5nIGhhcyBiZWVuIE5BS2VkIGluIHRoZSBwYXN0IChzZWUg
WzFdKSwgYmVjYXVzZSBpdCBpcyB0ZXJyaWJseQ0KPiB1bnNhZmUuIEknbSBhZnJhaWQgdGhlIGtl
cm5lbCBpcyBub3QgYSB2YWxpZGF0aW9uIHRvb2wsIGFuZCB3aGlsZSBJIHVuZGVyc3RhbmQNCj4g
dGhhdCB0aGlzIGNhbiBiZSB1c2VmdWwgaW4gZXh0cmVtZWx5IG5hcnJvdyBjYXNlcywgaXQgaGFz
IG5vIHBsYWNlIGluIHRoZQ0KPiB1cHN0cmVhbSBrZXJuZWwuDQo+IA0KPiBUaGFua3MsDQo+IA0K
PiAgICAgICAgIE0uDQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjAxMTMwMTc0ODMzLjQxMzE1LTEtcm9uZ3dlaS53YW5nQGxpbnV4LmENCj4gbGliYWJhLmNvbS8N
Cj4gDQo+IC0tDQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlz
IG5vdCBwb3NzaWJsZS4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
