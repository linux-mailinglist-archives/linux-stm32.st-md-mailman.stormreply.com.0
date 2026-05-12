Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIEGH/klA2p21AEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 15:07:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257B520BC6
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 15:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABC47C8F28A;
	Tue, 12 May 2026 13:07:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47D3FC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 09:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPKMnPpHBC11zIUXj2AQsU/SQoHS4DmI8YGxN99S7G2rfLjclW4jA8gY2/IRkI9ft67IiIKB5sONyR9k3epnA87xiX9Ca1N5WYU8SW/KU/aEyVBzRt+kVSvSL/7K+7vlgMyLvpgRrrvdD/mvJC7ALp4am4chM8F/g65/RxTNEviKo9B5SQsoSWQ4VWSyjZW5nFharpPgb7VIEf/Ibn5MVbto+dcjdRyGgZrCDgf1I4F8Jvb1vj6KS4l0R059zMZ83kar7QtKsOOZ5YRqPO42ZjR2i80Mgjqw/DwhkHkhJixvjtStWapXx7ardctoFLiGvrk2DJKp5v1qFSklzjdZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWYPH0/9LvofXZDCigxuyU0iBvvlApgKd1KISS2kmyA=;
 b=kA4F21Pj5b3cuHCN+5M8pL4EW9TW/d0z+IFodkoP+mAVp9CT4j6U99QjVXyMRQaCzPCSul2yxRGE9rs/fn7dAzRY3W9PLco9GJc9p+4L3tJSrEW6IuSoTKajLkpWrzUlLEMhYoD69m8JWZkbeecgmSSZVC6PFMRt6p8qCgOzQH6ZCqSRxPcTahbv6QBAfOc7gPj89ynKl1ik7TqJss8KnnNKMfVzTiQNLWfedy7eo50f8Hx4/sgGsmfG+d/uhlBXyYS1f2ObZFr/FqbJJP0Hga9a9WaKzNNJXvSJe25rb3Ne4YR5ogIbV4R6V/eVciKdeynH3z0sATZ3X43r73ctcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWYPH0/9LvofXZDCigxuyU0iBvvlApgKd1KISS2kmyA=;
 b=BfHssJiITDdgPmW4uLhc/mVxWbAoX3+hJaEjUraLKa5wc/dNiWXWD7aqjnZWJjcgPoZMZwRJUP8zqw8qISI+Tgie9+EZbobbBeVueEXvTDahNsc7pGDyF/J3h3lNgMxdP7mq2aT/J2208kr2TD77c07VxHBOFvPIchk/H+uWOlSYHwl7oI6Zy7zaAbFlV9T+lMfT/kWKLp7GdQhHuuD5FNWiVeAbjBGAjUewXV4JCFXmuBehZy0SHTf1gsSh+hBxB2K4/MtpiNXVpqYsO/ayzLQCLVK6xFwSH/ISr/aqLfZH5p6biZxMgQfnzoZXZupxNEfeVHOW3t+OoNTYCT+yMw==
Received: from DU2PR04CA0229.eurprd04.prod.outlook.com (2603:10a6:10:2b1::24)
 by DB4PR10MB6096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 09:22:43 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::32) by DU2PR04CA0229.outlook.office365.com
 (2603:10a6:10:2b1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 09:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 09:22:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 11:26:08 +0200
Received: from [10.252.13.51] (10.252.13.51) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 11:22:41 +0200
Message-ID: <1fb7f68d-7843-4b24-bfbe-71046ee1541d@foss.st.com>
Date: Tue, 12 May 2026 11:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, Ben Levinsky
 <ben.levinsky@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
X-Originating-IP: [10.252.13.51]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F8:EE_|DB4PR10MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: a459a153-032e-4a70-5dfa-08deb0080555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|7416014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: cwKaAR5oy0b+UY9pwj7hiWZzXY1W97JpmvmG+fo0r5ZTs2DOzyLqJzk4Ab4CA0CRw8RcLRULAfYF4IuYvP38hBpbBXBqdxf6gDWUmWyO4d0cTh1UXYIXhESNwXd51Bc2Th0Y61A3mj7QhoGxFomHbgcyJpSrL6zLRqLnoPCYDvID4/KzVskmfDcI3FfdVkaVKL+ZkWTXEPLHyhP/neXyOU1ThUw/43aMPMc8EIWYpS4lylIREFZMb5X52fv75HLd2icoANWmlYJJfOLEbYZXdl/t3/0ZiJ+2acFOjjLsR9yEObkoZEQUT8FIkgBmUrubtY7hPwcECcecv6ju2S5rMUlMCDRi703wkGmkFgwFvLE9WZimql/0W0bbUqGw8bLFEkA0KB7TrM2a1yXqsxgAUVbQHgV2Fnn9VZ9VdeEb8ORsSm1bq7+/i9gvVZM84/IeJWnodbhEoTOGNTXckI+AOQIFVoTLB1B4NlUJkmel0vlz5aFkWgDYLPFjzDQxcFx/fVJUhwJ9U/Cey/EvhaK/Cts0P6AD2XIvOQmpFZeKToZv0IGy8+sKQimt4gBVmAt/xefSCCEplkpAJP1vXQKc7FUcALDUf9OTtF3wUOCr4BAHgRHGHQCVz5B2XvFFNvsIh4fiu10Hh7wPabcvSNUvTpz15UO2h+i66QtoRjotWVi09OTZZIliEqeIP908aXhXcOXYGUXfg2tkRFINPROv6WfBpzVpxHtmttz2XzdEByE=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(7416014)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8BStKz9DkWDkVcSJi05KH9EkYfW9XKcdu4TrBifDSLptEps7NlFt2d4VU+j+z9SDbQT/Sq+UUCSwNZmtjcFn8MF8QEaZd4M7rRpGgvqCe0bZkjOGjYVfZu1T32HQ7sunerip4f+3PI75lM7QJzCJw+QDmmi5hUocOivOCr6xX5P0DlL5116rAmBJf9x12wuxd3yakLli3tMDL/3Yyu4VKUBbo/LN2Gncs56Xwo+HDm7GEh2XwcnOT6STWz2JZE+LDKRJ2OvgEXMUPjrqiIq7eLawCwhAaL7T6G/ibOWRI91/54PIlmg1wZGjQtY0z5gHtekz7ZNCbUcxwZ1iVLit4pZvB32Z9s60+eAmYFEVoxio2LGD+p+NnM9OiliopJHMrAOJnmzr/uU9aXnox4GGjVK/ngljUlaFoETXnrFMsJpF8f+BF9vpnTnJKop5oRKL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:22:42.7776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a459a153-032e-4a70-5dfa-08deb0080555
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6096
X-Mailman-Approved-At: Tue, 12 May 2026 13:07:03 +0000
Cc: imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, tanmay.shah@amd.com,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Magnus
 Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] remoteproc: add helper for optional
 ELF resource tables
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
X-Rspamd-Queue-Id: 0257B520BC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.baluta@oss.nxp.com,m:ben.levinsky@amd.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,amd.com,nxp.com,pengutronix.de,vger.kernel.org,foss.st.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/12/26 09:55, Daniel Baluta wrote:
> On 5/12/26 00:18, Ben Levinsky wrote:
>> [You don't often get email from ben.levinsky@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
>> drivers that treat a missing ELF resource table as optional. The helper
>> returns success on -EINVAL and propagates other failures unchanged.
>>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>   drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 3724a47a9748..dff87e468837 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>>          return 0;
>>   }
>>
>> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
>> +                                                   const struct firmware *fw)
>> +{
>> +       int ret;
>> +
>> +       ret = rproc_elf_load_rsc_table(rproc, fw);
>> +       if (ret == -EINVAL)
>> +               dev_dbg(&rproc->dev, "no resource table found\n");
> 
> You are changing loglevel here. Initial drivers use dev_info or dev_warn. At least I'm used
> with seeing this messages in the logs.
> 
> So, what do you think on adding at least dev_info to this instead of dev_dbg?

+1 for dev_info (dev_warn is used in  stm32_rproc_parse_fw(), but ok to 
move to dev_info)

Regards,
Arnaud

> 
>> +
>> +       return ret == -EINVAL ? 0 : ret;
>> +}
>> +
>>   static inline int rproc_prepare_device(struct rproc *rproc)
>>   {
>>          if (rproc->ops->prepare)
>> --
>> 2.34.1
>>
>>
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
