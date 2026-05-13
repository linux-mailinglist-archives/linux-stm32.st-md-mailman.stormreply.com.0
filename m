Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rGsOGNQ8BGrDGAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E211C5300ED
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A69CDC8F292;
	Wed, 13 May 2026 08:56:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AEC5C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 07:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8lAyjg6kLUI9O3JCBoezfREaIlKIe1w1yt052qpHGOJ1QXvx85of4iYcd7l/AxQY5N61q6C9Omb22ZlyD6+Oi+tcVVXB6DbS4XlRCl5D3l26DIhBIRrQmFqsTFBvIa5twBQQ5dq/RivDAhdHeeOdMYIEsXJneF09OCYZT3wGu3RZZeNagt634nfi6lwgoNgwQWNWQpY7SbTj0bgktFo5zeVusWfAkpIN1zAouBOC/CbB6vZ+emVBWM/B2ROrTAFftKRBqfijQnpXxtx2AEfqWEx/GlrhrNmPVwZCFcOmbgpcmSpFs3YUu+HWz3CeJ5zKWDGR9UqVUDWlRyL8hRf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5ZIz6KLruL9znndppI3AG344Bk/x3jdkQlTq7DA078=;
 b=OURiKjwQfrw5+1RmiRjHGa85pe4MakjXQTBP+JwmpPsKIPDBBcwM/FCVwD1PWKuZgUcCUdBzAEQiWWLBfpKiErf1Ohkg3epLNItbyen15bZee10+p4qKn2nt1Zny2wftM7Lygup1YXnnSflpmM+T7lJmvk5nNN9kEMMP2h11ly5b/4DY+pAIg2v7zypjdC1cGsU9zQ0x2o8PfdcluCrzSOMocSB4Hn+aWKgJ4F98uuc/D93fRME8b0lyHfj3m5gLEKEVrd6sBJ2qjsfK4r2QLFsz+26Bj0v/SjhntoxeBTvMnr83vDeL8oKZKUCE7gEBTnhTsOXeW/4ZiSIvAecEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5ZIz6KLruL9znndppI3AG344Bk/x3jdkQlTq7DA078=;
 b=ZO9CumzFmJacxxfYfTKBa3fLnv9o9Pd5/o3G5dVe+6ht/mHohn8dOfKgjtIauzOwYybjMIR3DtWI4enkAVAmrQhKLlK/YjIhu2+vilwoqzOJsegfGThVSp1wrbFDLfH2BMdUEllAp2IB5On7DrKRKAlpJPXDkNkQUCXLwndZClbJTgAq5izgf7QJaOh577w7x+CAQaWXWxG78MJfSCWrAiGWzdGasxpxfi8QUgbxp2XcSOlZvkPvzRW6XFQR7qkFyAdFQLrK8fYIH1aqn1t6yRoUqEgZS79bz/r0E9Pss13BLo5zi2tZXfgWQAnSLJL8Iln6uBOt7jAh/WWViq9d3A==
Received: from AS4P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::20)
 by VI1PR10MB3981.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 07:37:29 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::fb) by AS4P190CA0010.outlook.office365.com
 (2603:10a6:20b:5de::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 07:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 07:37:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 09:40:54 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 09:37:27 +0200
Message-ID: <a933ca19-3ede-4708-aa00-d3df2000c3f0@foss.st.com>
Date: Wed, 13 May 2026 09:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, <tanmay.shah@amd.com>, "Ben
 Levinsky" <ben.levinsky@amd.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 <linux-remoteproc@vger.kernel.org>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
 <9e3a88d9-1679-43ae-a96b-62a29bd45d9d@amd.com>
 <3b1c5579-a9de-4955-ad3c-df3f8c1860f4@oss.nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <3b1c5579-a9de-4955-ad3c-df3f8c1860f4@oss.nxp.com>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|VI1PR10MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 605137ee-1b03-479b-9294-08deb0c27c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: se8zNJvlpwDQM/1G+2ZErAnzUBNze5XGn3QL3h+FZttMd8E0ki1g9wclqBTg8p6J9yZLvLE0gMJmjwmkBC47JyVvj2AaO/o9PIIwUwGCXDfgmnqjpGxZ1cel24pBmccT5W2MUIJHFZLrYkf8RFhz1RPruLRs8YPvnYRDjuywEnv6aBKg210gQXRwZGTb3cHfAIOANpqEeFrdpWHGBoNMRtSljNRMtqB7czG7lqdqslFLpRTpQO5JD5oo7OVV7wnUJIW5vA425RiKJwZEYsVRtNlfbQWuJsk1+9qWYzlgkvRGibDgqW0s/wqFd3Fu7oUN7LUpdihi5HfYlNBL729H6LdmkFwjOTOx1oTYYHeHUq4rrtunnokE6VvhW0/gzCE/KY0UiXbHSlmGoGz9DeuPVVonqex0g2ZOTS8yYfXLtEAlQKauEnHla8E8T8KmNwLgMhnVT8/tNgtV0Vx13tbqN3B50oekJOLprSeLD833Zr6m75dn+vdgzUNwh5z80xi4gXZy5rbpEGt37IMa5vxohBDy5IdkMfZHmGLnKxshTUvmmY7P9UxN7hNK9zD938r6NaU8xT0bnFPdB6CVUxbTYtFrtxxMnw7GGCa/lOoI7U/b5yn6svzszlz4nKwaD9V0EAxeVD++iBNDWN0TKplJXJ+Vw/JQH6emJGrnoHL6bak30MNvRSCZo6PTUi6/by3GQ6JSP2uPpPH4n/5F84n/PaZnfGz+/lnBctIib1YNu5I=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ez/JtjGs3awTK6ENW5Jwv9Np3JxJI5VcrYPs0CU+3fUgEhGwBGhjVIqDyd7efEIDyL08RRZ5QPLcCDslR/uv5a2N4je75gE2bltBd7iQy9HzyprWDu/+BsNcdKIfFbajdAN8RuFstOlffHffYjUFojokcl5GG6lSiptTXjNYEsXY/XSRHQ6p6KJ16A3sfQYRZ7tlhTdgNjTlDArfPFB8ldNA1g85aSJFHQmKJ0vUNhvZdo3q7TbWgdZsjJwCqH0nVSH/eO3Ab6BWD5aVsuev5Lg3UpwaQPuhnyd6EvTds4RZ9UUPqJRTorRWz4lwZwSmV1nmMy4RO8kXLBjKo3qpMvvyA7K/NqkUYtCRfvH7xakXmBNIJGbq5Jv8CTX1vUwCyAlSkVfOOag8RfxBCsyKUVwl7CGMrzy9hNJFxTHLjLk/Nzc7OugMwti79Jde1RV7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:37:28.7272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 605137ee-1b03-479b-9294-08deb0c27c43
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3981
X-Mailman-Approved-At: Wed, 13 May 2026 08:56:50 +0000
Cc: imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Magnus
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
X-Rspamd-Queue-Id: E211C5300ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.baluta@oss.nxp.com,m:tanmay.shah@amd.com,m:ben.levinsky@amd.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,aka.ms:url,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,nxp.com,pengutronix.de,vger.kernel.org,foss.st.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.479];
	REDIRECTOR_URL(0.00)[aka.ms];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/26 08:30, Daniel Baluta wrote:
> On 5/12/26 17:53, Shah, Tanmay wrote:
>>
>>
>> On 5/12/2026 2:55 AM, Daniel Baluta wrote:
>>> On 5/12/26 00:18, Ben Levinsky wrote:
>>>> [You don't often get email from ben.levinsky@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
>>>> drivers that treat a missing ELF resource table as optional. The helper
>>>> returns success on -EINVAL and propagates other failures unchanged.
>>>>
>>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>>> ---
>>>>   drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>>> index 3724a47a9748..dff87e468837 100644
>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>>>>          return 0;
>>>>   }
>>>>
>>>> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
>>>> +                                                   const struct firmware *fw)
>>>> +{
>>>> +       int ret;
>>>> +
>>>> +       ret = rproc_elf_load_rsc_table(rproc, fw);
>>>> +       if (ret == -EINVAL)
>>>> +               dev_dbg(&rproc->dev, "no resource table found\n");
>>>
>>> You are changing loglevel here. Initial drivers use dev_info or dev_warn. At least I'm used
>>> with seeing this messages in the logs.
>>>
>>> So, what do you think on adding at least dev_info to this instead of dev_dbg?
>>>
>>
>> Actually can we leave that choice to the platform driver ? There are
>> many use cases where the remoteproc subsystem is used to load and start
>> the remote core and the firmware doesn't have the resource table. We
>> don't want to make info level log for such use cases, as the resource
>> table is not expected in the first place there.
> 
> Agree, this is the best way to go.
> 
> 

LGTM

If you keep the rproc_elf_load_rsc_table_optional() helper, I would 
suggest inverting the logic for dev_dbg(). Regarding the discussion, it 
seems more logical to print a message when a resource table is found.
An add-on could be to also print the address and size found.

Thanks,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
