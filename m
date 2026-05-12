Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MANMNc48BGoqFgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F055300D1
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19EC3C8F290;
	Wed, 13 May 2026 08:56:46 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48749C87EDD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 14:53:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZ6+ja7eu33zwPIPURlYkYHrK3wO1pMoNzuQSE648/ZJvcCLlyU8vAy/tbfNSI0bPYAR93AMcVcol9bjk6XodN4Ulx2M32ET17QAVyv/HMEhPs+WYjmjB9qiPN++EL7z1ue2y9tijtbWhk2Chy9EK2h6a1BIIFn16rVByZIBTlWFsTCGK9D/n16J/48i0RMKPolawDIst6WdpUeS9P6sPTS3sZF5EZTbWbiB0j0qttfVqNDrmutX+gH0QfUf7knYsChg041+vlEXC/y+uLHdgxAESdG0qVq9kkWqcdwvpkeXDWrPi4vcpY5mIGIfYnzrfAPaGuzGuY2gNXr1eX7UIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzofhYUm9Mc1bK7p5TqwAz158lzxySiC+Tfppbo1rkU=;
 b=oD5cFCtln6qE6Yg6EyZflMxz4bHgHyvECe4EAqPyAB3ZOKp5HDvhDAh2otVFrqmG1O9r9nlnsFWhm/XaEjLcB9VTRy6cDROpth9zXxdPlQE7SP3hdQLb8M4V+ALjS5oVX+k4iu3Q6Yp++Of+lfx2TW7gjlPQlxfaBf4klkOABoCbwy/RzMzm/1d4qE2lPAraWLVO2SgQiki3pvRPB1OIaMKiQmVaVmLw2GekjcxLKATB8w3w9CQIFtLts9JhXMzsJj9FQV8bK7X6IbzW8hmPFGy+VmnboKrPki9/WiDKGcU//xFMEo319ePuvn52V2ltW40PjO4v1649DpOEXW/xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzofhYUm9Mc1bK7p5TqwAz158lzxySiC+Tfppbo1rkU=;
 b=IHbfPHG/3L4VI8DOeca2m8UduNLqZyD8JisJNJzlY8TnK+BgiMuxuH/h69rmOrxnmJm4W7oRPqDlDJLViCo3qi/5ryKExJRhvAdqhb6wpqcfOhkuo5HJzDtWjXqqu+gqp4bfpAtEx7P7A1kolQkb+TyuvfRVU8clqRUF5kPlZlY=
Received: from DS1P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::8) by
 BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 14:53:47 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:8:453:cafe::73) by DS1P223CA0003.outlook.office365.com
 (2603:10b6:8:453::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.24 via Frontend Transport; Tue,
 12 May 2026 14:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 14:53:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 09:53:46 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 09:53:45 -0500
Message-ID: <9e3a88d9-1679-43ae-a96b-62a29bd45d9d@amd.com>
Date: Tue, 12 May 2026 09:53:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, Ben Levinsky
 <ben.levinsky@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 083f1460-c57f-47fd-966e-08deb036453a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: +o8GsQ1vLTFZs1Zu9UqH1HX9O3nauPjzkg3+kDyocOoXdPnp/r43RdW4rNbBaCXB/rZXK+4v9EW0+FwxJBtIqpQDUKbd0j6RA2iYHRgB2hdZeAoaUoCzNncrHm8yNT0MKy+obnxgkUaGWM9IORnRqJibApIVsIvEVu6JtuEEyCWJXVcea2brFsXfS8snjGBeJ/CydEZOG85x3ERrhHahf/T9xjiv8p7mwyfVFOFWL24fFyk6Kr5uzTF4Px0gJlUTDIq+TSljTuC0IFQkYUAofQUoTnu8Le8bI27jVrm9SGa7C8mYnoMOc5csEsnY4dOKgZWGG0JJyJbFgSO7LzDhRC7sS5EnjOqRRSoKOs7D3zRcOYNGo3Ip3IsX8WDtE1hh0Qrr+QNvmrJX3bZ/jyXVpLIwjocf6U8kJotjh23lp/cDwbfrFCeYc49XAAl9quonCuP8sfSEGt8CsLZa9zCt3G53AM39CRmU8/rMKDQgwlLTmFkDm4Ulpj4VmCyqGn6bt6m80RDys+S6f9nOgc2yrFLDz+/tfLdIhvlXcQdjDqppHSBnyg7GDNTCmvymXfZL5D8tRqpk1vIWOJ/zZ/SkEndNbWiiVR9vciJGpkQE+mq571uG27lJAqNGbYbr+GHb9hJJ3CwBQYLEbGtHmdVUh2ZfCfzRIP5suran8Bo4B+9LJeeBDBZXOI+2GGrsF/Rf+nbMMYCGc3mC4fgXydNvLNdCIqUht5RoOH5+bKy7DIU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3olwf2wK95yBFQGC5kzvb9Kj6X/UcEdzlYlBMveR18PNEr208F5vqlGVivvI/x9RNyjhuw+7N2ACi2Rj2F/8ur/hbmXyWGAb4A2r6Gc+048GUvqPBJcM9pIO/Dkc4h2EOOprj4TZUGunO61qGmTOSu0T6/O6m+vw5unkFo6PHMtRohvlNB5467dFC/W+aiLTkCT2Fd8jwHusykjG2zAxAoEubLfPmuMhqeFIuqRAU65f9YeL0mIs27ki8EPnE8epZDeMzLJmdAGRxpOo9caUCNPKyHPg/k2rw3y0W9mw7dQfLyt2FmOfn8TtkcllHQ8GTQyRhBQ+AzwPzpvP9W7SihsPu8abRz86zaR8AxJ5Ksu1IBomDMmMVQIcWBs8PxJXppy1T2vhwvEPtYOQHdYGIWJEYfxPzPoXhs8tbeCOHqPkAk0Lu7yiTMoB2D2AmR3X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:53:46.8682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 083f1460-c57f-47fd-966e-08deb036453a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099
X-Mailman-Approved-At: Wed, 13 May 2026 08:56:44 +0000
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
Reply-To: tanmay.shah@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 68F055300D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[tanmays@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.baluta@oss.nxp.com,m:ben.levinsky@amd.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,amd.com,nxp.com,pengutronix.de,vger.kernel.org,foss.st.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tanmays@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amd.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	HAS_REPLYTO(0.00)[tanmay.shah@amd.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.773];
	REDIRECTOR_URL(0.00)[aka.ms];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/12/2026 2:55 AM, Daniel Baluta wrote:
> On 5/12/26 00:18, Ben Levinsky wrote:
>> [You don't often get email from ben.levinsky@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
>> drivers that treat a missing ELF resource table as optional. The helper
>> returns success on -EINVAL and propagates other failures unchanged.
>>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 3724a47a9748..dff87e468837 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>>         return 0;
>>  }
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
> 

Actually can we leave that choice to the platform driver ? There are
many use cases where the remoteproc subsystem is used to load and start
the remote core and the firmware doesn't have the resource table. We
don't want to make info level log for such use cases, as the resource
table is not expected in the first place there.

>> +
>> +       return ret == -EINVAL ? 0 : ret;
>> +}
>> +
>>  static inline int rproc_prepare_device(struct rproc *rproc)
>>  {
>>         if (rproc->ops->prepare)
>> --
>> 2.34.1
>>
>>
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
