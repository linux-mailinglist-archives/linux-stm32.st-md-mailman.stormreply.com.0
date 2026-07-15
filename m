Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tg44Kb3wVmoNDQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 04:30:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D46375A0E9
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 04:30:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=cLiR0lub;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07390C1A97C;
	Wed, 15 Jul 2026 02:30:21 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012056.outbound.protection.outlook.com [52.101.126.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67025C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 02:30:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaGPr8N2wcZmJ4rlKJDt8Plzm3HPjhiRzKHExo+yYlKaYYwK8D82oUBqihEF18G0ShKvE3VbbS0eduuUBfnZ5ql+5tHaIdollkNkSm9IJdAwlxIuKhI0NGdI2kArzXW8zAkeBAWtSmHwjfnP4udz8GOg5yETeWJUsZAq9UNWZ0T8hyPPmaFayZcMf7qs1agNH+FQJJq1q6fOH5KmadklQtUJNIMy5sLetfYQdkE+1rVKkevnsEbpLMKzKINtgGwwmdODoiYAM84KPPiiI9PLD2by3VESl2KEOKTDQF2DEDZmb3bWlMiBzxo23sljY80IuN3faWdPBNejOw9WE/hRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1Z/xLKs4TOg0eAYHeHh/2ehT7l+aSr/5Oh1a8Te1l4=;
 b=EJTBDabg4ciEUGrBiR35XWiExiAEwzefOJo3WHVw5OnhsKPq2U0WgDS0D8kGJagC012y3AfbCvgkEMMWjcCky38rLgNbdL+ZatzPre5qc8T7Dc8+UFdK9HC2DPL6GRCBJk8fTD0vSwwCobkSUbMFOv3P8eaIOXzJImIhJ7ExVa0VdDG7RmKZAOGUuypLTBOxPosIGlpV3eVVuEhHURyQuFFnEQFsAY0U28zbI7waV/pojMTTOBasY3LaO2G+UNS+XbVMjq5N7OK8xmcyQ0Tyj4V6vaIeI/KMLaib291kEZVXryLzg0tQ8Bs58ipFPFdMGuSTjStWTO9rJ4Y0KzIaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1Z/xLKs4TOg0eAYHeHh/2ehT7l+aSr/5Oh1a8Te1l4=;
 b=cLiR0lubxqZc9pa/l964xqPDzICWh0f3czhQmUu+fROwb538KoWqP6EBMyOH3jVBUn+HPRQm1Nf4tuz3dfZBv/BUh5LCAbgNGoALetF465NsNCjC2URlfk/uHHGgSMeaqS2fP0KAT7l4lEMdXKv8Mzgo3wLnEMyq35FE4EdBsn3wPhAlfDbC0LvAeC4iW59Zcl9ltoAisPG3vPA5vZI4wbz3yn7UhYIJ7IjKrp03h2BtDCjet85joKfkPQcJWbUx+ZNqLqWeKTt2ivjqwU0MzB99nrIcQiUPXp577n2RW88htvpQgdv4yZLB3cmtnQ+Atw6JpjyQ9PikemHTDTEjVg==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB5938.apcprd06.prod.outlook.com (2603:1096:101:d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 02:30:15 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 02:30:15 +0000
Message-ID: <2e62df2c-698e-4f22-9498-bed0388b6bc6@vivo.com>
Date: Wed, 15 Jul 2026 10:30:10 +0800
User-Agent: Mozilla Thunderbird
To: David Lechner <david@lechnology.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
 "open list:COUNTER SUBSYSTEM" <linux-iio@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:TI ENHANCED CAPTURE (eCAP) DRIVER" <linux-omap@vger.kernel.org>
References: <20260713131005.306069-1-panchuang@vivo.com>
 <1e330026-cd09-48d5-9478-4cff59f521e0@lechnology.com>
From: PanChuang <panchuang@vivo.com>
In-Reply-To: <1e330026-cd09-48d5-9478-4cff59f521e0@lechnology.com>
X-ClientProxiedBy: TPYP295CA0049.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::13) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bc56af-d51a-4568-af2f-08dee21900e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|23010399003|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: +4lPnIhhrHdHBwqiDFacUcOwMDf2qrsomVmi8q2w0d8ueTBtTGBczaYO/HVeP5igSIV9+QH0RInpg1xGrDTL87P1dDrKPrOhJKF/VnvW//VxM9FD5R117OZbGZxHiShxJKo8j2727Po8o9/VFw4eCpEghNkQ+g5ItZeHsmVm7f5SiQLl5kpre5ROtifqyuzTlLk+UAAqmHn93/uzCRlHlHnH642k1KbFWsWuXQJ/6X2KNVKQHANBn/nZQ8ZxUvYkdGWd6FTL7ckqp+HMzoEge1P0b/wHHipziM/7DVHtqwB8DpiG1BmKcDxRIHOkKb5tkqJjeginLwVFXXr0ka+x/O6w6fdwYcmMc8jYOYCA8M/BKDHPxjtp3nbnh2f85yIiscaji1lFqb/YYJJle0rPg/p2EKqd580eLieFq4wz2hnfbIMs0z5yAN0L5L2bOQ/pDnAJgPKXefUA7URqrafJ2aRgMJZdyUM8j2C5eAWEjOKKjLpHP8fHGsND3WKyY0ehJCrhFujOLqFETT91WCbFHbpqz1atQ+3y/nPMGQhk4JCGrMSYh5VAdHxczwEIK5fadLwRriG1JlsHp/xgosa5+J5MNQrF5zBx7KMYG0Tf4P2KrTv0igXSzj/AhAArXyY8GISy2E8pc8eLOxzGhqIW38zXPxM4Vytj+9MY8KaIRX1v7oqutGxkWN1mfwQuDw9L0sWKOFYK63RMK/hs4mOhLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNjV3JzZ3VZUmw2a1VDYVJJd2tHNVdCVTJ5MG9mNVdnNW51aFRFSnZLVzJI?=
 =?utf-8?B?bHdxQzVZTGxmYXNBdVpDY0VLVVh2NXQyb2RkOHNQT0gvSU81Mm9tckRMVkk0?=
 =?utf-8?B?aE9DdWlTczU0bVBDYXMrdXBSby9kQ2F1UE5sTkxtMm5YVTE5MVpYV1JuS3pJ?=
 =?utf-8?B?RDJyZk53VkxiL0tGOFpsZmxTTmozUWJMOUVKaXBRbTNQWnBqQ05BcVF2UE1H?=
 =?utf-8?B?OTRCekxKVWZQTVhKSTdCRlpsYjVnTTUyQ2JoblA5QWQ1bXpSMjRvTjRaelVW?=
 =?utf-8?B?aytMT3VZQmdlUTFQRW55TXExamJ3bkQzUy9ZWXVoVXI3QXZibDJtTXFLS21z?=
 =?utf-8?B?RTh4c2lCK3FZQXB5bW1oM0dBUk8zWXhOYzRKZExEeXcwdVBhOUxkOG5GKy9u?=
 =?utf-8?B?SE14VGxzb1ErWjNKUmVNY3BFNzlPQkNnZUttSi8xUFNqMmY1ZnBvTE1OQlVP?=
 =?utf-8?B?cHBXYUVsNUpCQjdFMU1CWko1MVlhamJKY25VWlBZZktQTTI4NHI0c29GdmNq?=
 =?utf-8?B?Q2MrS2UrRk9yZWJ2V205dXJGMzNod1VzSzNtSXdaUXpCQUZTZzlSckZISzVW?=
 =?utf-8?B?TW5NcHZDUFFQSEl6T0t4dzJpL3IyVTNBOTZOV0dhRXVrY2FaUm9VbGhPdzdZ?=
 =?utf-8?B?TnJneGhyN2lRcDQ3RVNXWWNuU09YTWpvWU56MFBORkh6ekYwaThRUjY2K3JG?=
 =?utf-8?B?WlpkeXdYUitZVHVIZEpVaEFJQml6VHUvUlFPd3R5ZHhjd0RSN1JNbkpFS3lO?=
 =?utf-8?B?VHNZYUV5N3B5c0IwelB3bWxqUVY5VFRQODg4ZWNCc244VG15Um1GZVN0MWht?=
 =?utf-8?B?VHArOGcrUE1DQmF1S01kdDNWa2U5K2d3VlVUbExQUTRWdnV5TkRJVkVHcVJm?=
 =?utf-8?B?enowanJPbDhFU2E4NG1tc0RhNEQ4Q0RLc3hPRERpaExtNHlrQklDYXVKWTVJ?=
 =?utf-8?B?bmVnbkk5VkpXTEJENVhYejZ1dUFDWHFGakVlNUxCRHlWRUNkclprNjhBZ2Y0?=
 =?utf-8?B?K25ucHlIMXJObGhzZ2RjT3dqdWNPd2g3b0xvTjh6V1ovNG9nU2IxNzJOTjli?=
 =?utf-8?B?Ry83b0QwYnc0QitHZVdmVytrWXhWWDV4MmlKaVVaNmVkRDBPa1FOOWlJZ0xU?=
 =?utf-8?B?K3ZkOWJWcUk0SXcraTRveWRhZ1RsbFBnSDMrRUxmR1VMaUVjTkU3QjhmcVN1?=
 =?utf-8?B?Y0JFdTRkejJPRjBESHFEbHZ5RFlLcUxLUnJjNGVDQWFqZ21jU0dkVVpVUnlh?=
 =?utf-8?B?V05YckpkVTVJZCtXVnV5ZVRDR3E1YTJmYUoxWDRQNUtaeWhHbllCNkxVNXpt?=
 =?utf-8?B?OXlxc25GcVp4eHZ2cEtRTmEya3Y4c0VEN0tVbHZmSEQvQnltQURORGhEbDJX?=
 =?utf-8?B?NEhYemUzcS91dDhGVzRtNlVuWTRiVHVFaDJPTXo2cU1SRW1Rc1FmZU5tN1Nx?=
 =?utf-8?B?ZXduZnUyVmIyWGdJN2VWT0NKaWpsbVhRMCtEY1NFYlRJblc0dDZiZUJmSFda?=
 =?utf-8?B?MGpJR1I5T3I2S0FCajZFZ1NtSFlCK09SWHRIMWpvY21wV2RYcDFXcTROMHhw?=
 =?utf-8?B?MnU1Y3JBUWNtbmNzZTBtYmpjS0REVEZHL1lIRGFhcGx6NFd6aEN3U1NTZ2dQ?=
 =?utf-8?B?MllFS1dYcDlhWDlFZGFydThJa3E5YksvVkVwZWxEQnd3T25MZk1VQzhZalJW?=
 =?utf-8?B?ZjBabDk5V2RHNStCU0lDK2hzTEZGK1d0dHVkb29vUXF2Nzd0RWJ5VW53ZjlT?=
 =?utf-8?B?MjhrTmZVb0JURUFRMUxubVluSEVwbTYyTk1FUHQzd04xMnBHdXdYcmk4MFUv?=
 =?utf-8?B?RVMyWkJCWmg5T004bzRFVUJCOGI5SXQvbnFoMDNSMUplM3h2bDdZcFdrMzVj?=
 =?utf-8?B?YnFpWkF3YjdQcjViekVDNGI0V1ZjMENYYnRrdC8yWjgzcnFDYUJQeUtocDlO?=
 =?utf-8?B?SlBXcEtuOVRLdjNuWnNRaXhjZmZUbjRGT3l3U0dCWHdoTFFHY0poMVBtbGhs?=
 =?utf-8?B?NGNvR0g0aTQ2Y09WNHNVd0tjUXRqSHJZaWFaaFNQaFJkYjRkVHBHZ1dpdTNH?=
 =?utf-8?B?S25OenhlZjEyMDRkVnhDaTVhWTFZd2FDZ2JTK1R4azVTcTk1SS9pajc5OHQw?=
 =?utf-8?B?U0lsdXFkZ3lWWERNOHloRXFNMVgvVHpXTlF2UnRQMm5Da3hMOGRhd0tJZFpJ?=
 =?utf-8?B?bUpWeFJGZ0VLV3kwL3pvSHVEMWZQeW1MS3JhZVhtMVYxY2RPVk82cERKWjg2?=
 =?utf-8?B?VEN5UExUbkRBLzJhWVlNY0cxRkw3Sk5HL3M5TUQ3QzVGbVYwaG5ZR25kQUkx?=
 =?utf-8?Q?hPjJOHy6XYNVKqI7/u?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bc56af-d51a-4568-af2f-08dee21900e3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 02:30:15.1411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SraU05XgwHw62Hk9KasjpzxRQWmd1uJXvuYS64NCCsgdLPGoGnwrilORCu4iOC72lTAfBmBOsgsVFwpIurhTYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5938
Subject: Re: [Linux-stm32] [PATCH] counter: Remove redundant
	dev_err()/dev_err_probe()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[vivo.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[vivo.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@lechnology.com,m:fabrice.gasnier@foss.st.com,m:wbg@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vigneshr@ti.com,m:jpanis@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lechnology.com,foss.st.com,kernel.org,gmail.com,ti.com,baylibre.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,vivo.com:from_mime,vivo.com:email,vivo.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D46375A0E9


On 2026/7/13 22:20, David Lechner wrote:
> On 7/13/26 8:10 AM, Pan Chuang wrote:
>> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
>> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
>> automatically log detailed error messages on failure. Remove the
>> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>>
>> Signed-off-by: Pan Chuang <panchuang@vivo.com>
>> ---
> Seems OK, but probably be should be split into one patch per driver.

Got it, I will separate them by driver.

Best regards,

PanChuang

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
