Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEFFB9C8BE
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 01:26:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B50B5C3F938;
	Wed, 24 Sep 2025 23:26:22 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 361E3C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:26:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmXQcGJAUmbQ8CLlQeQ76EkaI3EdwlXJHNcir3bnF9vg+/2kkDz3fbC5fT07qvwTHJaxnB6p6D7c1msaVaKC9pzPYG7KnECAleE5GA12hkPF21IN4aWtNygtYUdhaPzqOQ+Q5zcYTr/+xqzRrPMn20Y+D4Bt9O+RRFzGtQOYYnULW6mMpRAhM6sH7e50kHpvy1mHqLo5hVjN8EScqyVtHVdtagP1GQqPiiNXHRICCvRN3oWhYhHigh6n9tOEmUO9CCnhJHYqS1G1ejaGL35IrXqBqNhI7H38uJc/XS7kptcFBl8yO0nNGvz3Z1ZZ3zmQBPbU7jYF68FkD8qQBJgWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNr3o2OXriRGIdXKXnP4uAAV67MvZJIkMxGqhdAL0LI=;
 b=uV1Lot3SwvZttistyxmi0CfH829HZ7SCfOoQow4kz6KX8gWLuhu2tOzldYpg1uxFawFPcErGuuANBEsuNyYK7yqk7suuERfyNPlExDIWRKHC4KkLbIH0teNduJbBAHIvaFhGbn5Yp0ZTi+n+PSuXhq4p1DbTDj5TCbT4b8GvdEvv0Yzna/il3szchCO3XOLyqthgLllylzLM829zKLTc4scMNDGlbKe2Uyw/4siiE22geoNg80OtNKU7jUr/vWb7XtVNfJP3eueVEQcC/4NwcLY1LU9u3rd3IDPGbNJWrhbdSJqET7mf1ZzmA4PqqODnhCveY3bIPwGBCh3yS2tTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNr3o2OXriRGIdXKXnP4uAAV67MvZJIkMxGqhdAL0LI=;
 b=hc40GZaKVOpcMaylkIZxsRuFv9ntj31rxclFozP1TEPdj8r9qbSqo/USDOn+lvXE479IXancduO1K9Snq4VMGkC7W/oKZMd/0xfea9A75w8YPuGDYyAymx5ZqKhK/th0Y/UK8xGbSTvt+y3AxQ86tEIqUnUQDNxrmAbORhCribA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB15034.jpnprd01.prod.outlook.com
 (2603:1096:604:3a1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 23:26:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 23:26:16 +0000
Message-ID: <87tt0rzb3b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <a4950a0d-32a2-4cdd-8c8a-8f451181b0d6@foss.st.com>
References: <20250916123118.84175-1-olivier.moysan@foss.st.com>
 <87ms6taph0.wl-kuninori.morimoto.gx@renesas.com>
 <a9725bfd-a2b8-4343-83f2-d18908029ea0@foss.st.com>
 <875xdgpmq6.wl-kuninori.morimoto.gx@renesas.com>
 <a4950a0d-32a2-4cdd-8c8a-8f451181b0d6@foss.st.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Date: Wed, 24 Sep 2025 23:26:16 +0000
X-ClientProxiedBy: TY4P286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB15034:EE_
X-MS-Office365-Filtering-Correlation-Id: e6360ede-554b-4143-68b3-08ddfbc1c27a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rz5NptWuFv3pWTvZ7ALsm2m4kLP2KDTJBHDh3+8kR0j67uEwGaeGqmqTZL+y?=
 =?us-ascii?Q?vzY+7ap7b4ZSoihH21Jd1jeQLfyJF/QOCg/H7g6dUREE4IMLdk4AkPZAzGw7?=
 =?us-ascii?Q?hgD2t5y0Bt64HaQXFKkTB53Yvmjom1rnT/ghFRy+Ha9kQ62xzhqgDdFddCGI?=
 =?us-ascii?Q?hTps5Gw/czlmE1x46DgqBZrjsOOeyUCVfURL7tjcdgUkDmq/SrT456vlQ8/j?=
 =?us-ascii?Q?9t+Os5PioR06XKV/TVtbIcCVCBccM6VOf8dXFXNXB2Aye9f9LFlIXah1Njqg?=
 =?us-ascii?Q?r8iY3ntGG0n2XaspLK8p1zN2i8xUgaHBG72u4jhekgD4ejfyZChp/PP05yIE?=
 =?us-ascii?Q?3QH3IR3v7hzwO9NvLizLOsM169fegVnFRelqrl8OPzEMMGm95YnRrpZaSgcA?=
 =?us-ascii?Q?A0OvYeRCQL2XFUujcOK3SH3UyLc5xdBYmMPGkbxj4dYQpmhOmc04WgnU0x4f?=
 =?us-ascii?Q?U3sR/xQchB96X4OTTUexmDgrVud+kxJ3QTGnUWmo9Fgr/5sNNZkWWTSsHqVh?=
 =?us-ascii?Q?yB8g21lZyT3dVMs87DGCMi/JkSsHZGMsuGVIMT+X/ogS1gjEeBojrDtX/gbB?=
 =?us-ascii?Q?GqrGJ+wPsJ8v5SskRzWtKmEXkrO3BJQmEvIGbqYJ6aMdII1IYUlW5rUHknsT?=
 =?us-ascii?Q?RaanuLhoVWxRLdEH6dNqhQc5lZeVXO5s8vRWkum3VxiJNeBC5OFA/2+7wGCh?=
 =?us-ascii?Q?VOjrYi2DVTRAF4WBD03mNcQGyD+rsHqZSg6gCNNGFmxiH2tZlvZ5LlNccCUS?=
 =?us-ascii?Q?ow77ezdhKnTzr+fGJTfJleA2mdlbwybPo9JRRrezzgb1ys3UtVx/u0f3bHc6?=
 =?us-ascii?Q?g/F3lRMEgCxesJhJ4OozLbGUjy47XawSTDdlTntITjjw4MVTMWyydAO7owZA?=
 =?us-ascii?Q?xoX7zOWhqfzp9hnVrmGj3+zP/UNkb1dIc/hle+uW/SkzeXJ2opCrg/dH2rmG?=
 =?us-ascii?Q?XiY5gC7uoxnEr/2yuaaNbIgrCGJKigH1ZNv/kk8C5qV973RUlqS5af6FZnCc?=
 =?us-ascii?Q?3OJbvQbUuQWQ6UHmUUszdGPgLYEwebYTAMqylDzv5xnWYiKJXm337WDqoIGU?=
 =?us-ascii?Q?aFa3+8CI7LxqBBu2vn6Wf1PHbnv7mQdnnuyxo9PLv6nhHabzdgAiFdc0J3Jt?=
 =?us-ascii?Q?NTlSR2dNJpQv6Xo2/rVd9u0dU/EmLm56OTCtwwYe+vllt0h0wAtI5k8seu2V?=
 =?us-ascii?Q?zFv+vPhUPHpAIIP5RUHID/jsh12SwW3BfhwfyuOgo76RXuoPwWoe3fmLEPzn?=
 =?us-ascii?Q?EPLwU8slTs0DfI+AS+WwbSQIEK5Vx8/pSc1LO2XJ1b0gtOW/31BCRXDB0vPO?=
 =?us-ascii?Q?EgG4uBAITenf5FYgi00c6csidCfsW0LZ19qVXcjdGXkycVbJ+Y8uqcJOzopb?=
 =?us-ascii?Q?gR5nYHZnH/zn3MlXxw6vWiM9n6KwAX7YzWHxMyxCDuDpCIMb6T816WszDpl3?=
 =?us-ascii?Q?k0xffLqSQCTFX5oWoPXaYBs2QoouCZ9rSjSWFzJHcZ26XCbldMWAVxOXZV6e?=
 =?us-ascii?Q?+0d/CkLErQjsrs0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IvlsdnS4e/LUk1LL9mOOYkxdd9K4kXTaNRMOX25lDyQOeRrt98SnCBUc/H9j?=
 =?us-ascii?Q?fmFsRO/CqAjtLujMw8e7iM5qZzBf4oSVVjW2GPYT4wHeNmINFQRhJQPc7AyW?=
 =?us-ascii?Q?rgsL6k54ypS+kgkGKaUbbTFZqL/jvJkxz34iO8PK+lgbj/LpOenvL5cLNte/?=
 =?us-ascii?Q?msM86rTOQGpIKHwhh6zO7WPkXIb5pnYZx1v4y2LNEQk8cm+8T1XRCvvHUyF0?=
 =?us-ascii?Q?RUKPpDNIUqKyyJOnlQA34Se0QGcLaigukSliZGmPj9W7oitePJMRqChPIPSA?=
 =?us-ascii?Q?jTCBWYQemAOKNEjDXZ2L9vo9FmvfqORx0YA5snUt95Aizh+EW3c3kgRehxdr?=
 =?us-ascii?Q?xEKjxj3yeCsKftQR5P7SAERO6Xd0lI/cd9b+XlRfVdcHeRFeTo6Hlgzc2au6?=
 =?us-ascii?Q?Mik7J78/JTW5+6sGS/CNK3jojdFQZCubGfaOK0kSOeBON3uyg6iOuXKk++sE?=
 =?us-ascii?Q?yWSFDai7kLagYFef/bK/g5ukjWppTeRq6j1jPHRLKlDDAZYBeKwirExVZK2q?=
 =?us-ascii?Q?p1D9GlWD9Dfin1XYJfEcdfSsJgUEB7cNAw8r0jR1GH5llGYCDr2pXbNusC3I?=
 =?us-ascii?Q?exqCP79YaLduExi9Wbt0AYo5t/mxnHP153WviRf8WRAkkmvX68HFvu9wwKDh?=
 =?us-ascii?Q?nSgHWFfYtX9IqEados/bPwb5vxn7wIlX+RUu7fr08EVAegbKJ4edO7d5q8aQ?=
 =?us-ascii?Q?+f12Taizn4RFPvFLlNmRRlkW/0bA3io4VnAhl7A7OKWQgc4nbnyCczaDfjNX?=
 =?us-ascii?Q?PnQc38lruukyDBvFR2UEGlanaADAS84mpuZPSrnfxx0f6r3BA10ALQE8UTF7?=
 =?us-ascii?Q?zIp5Gk0r+0EGbvxBq0Y2dHRSQn1ZcKeHtIswurZbSj0Yq6BE2KJ/E18bGkaX?=
 =?us-ascii?Q?LeCAOVGF8chc0AS2TugLvM40YYSgXRw9rUEcclNdmckP5fTVhfa3zqbQEyLK?=
 =?us-ascii?Q?YYFEiWLYwhhPT/DitqhJaEnUGw+36qewWnQ57KnNaGvKXLI1bitECck/2t1L?=
 =?us-ascii?Q?XHsHswhVVj4MgLjeRh4bv3sTV0MO1zcMFpTOqpw0eFdNhCXyZexLBAkUfmam?=
 =?us-ascii?Q?4Iz9WmQJ2Wh1XFpP+b5lgaUeg3M1t3ngDBnTEv70GFGtJwqGzaRncp4Wng97?=
 =?us-ascii?Q?QPDMJydum4qew+4MAFy10Td28TrSK6Xz6qaGtgFZXYzmzgErBqLbrNwE7NOS?=
 =?us-ascii?Q?gdAfQJxT8vvfNOL/rrJYmT28wFEuLMBIz0kMNiZbahR8P8LCy6TJd/KaT/W5?=
 =?us-ascii?Q?6/rJjUDHsq7Lz62PZuoePkdc/QU6x3LCzpQw+dj5w2bauHlTEz4OP7ZrjDjh?=
 =?us-ascii?Q?3iPFDshzLUgirevItqFUOJ6wCxxxlTuOmdc0ddQJas62IK5Op/j4tyjZ6HBn?=
 =?us-ascii?Q?/c1cyA6SOfeSQMVCrS+E3PtVpvcGAjKpBMNzCKsH8YCIZHmMnHfsvcgSG+uI?=
 =?us-ascii?Q?G6dYp9Nb5bsFpJLDaWjf6VII9nVkfBhec7FPWhAJ9qXBn3lFtcYD//r33Dya?=
 =?us-ascii?Q?mwhhviRbgAJFnr8IBg2O0ZzHCDCoAlzUg0EJUmOMqlB1fxM0BxOVyzQ9YFOC?=
 =?us-ascii?Q?S+4bceDg5QYrEW7sX6KCxqEHlnfY7FAE+xED+hEHplsNfOlBnH2aaP55M/gq?=
 =?us-ascii?Q?NgiABCNskOvZHcfN5Dia7fk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6360ede-554b-4143-68b3-08ddfbc1c27a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 23:26:16.8161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXQuRB76zBVFzRh9rmedClUJVryvijQtxO0aArcdiN6+gOFIJEY98Y58NlIQcv09yW5pKx8CQFgPbsqjXRZ2pm8SvWzwN093moukFgpqm+M6DYdDegcspxJ5mZN97lE3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15034
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: manage context in
	set_sysclk callback
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


Hi Olivier

> > Or maybe reset simple_dai->sysclk somehow (not sure...) ?
> > (simple_init_dai() will call snd_soc_dai_set_sysclk() if it has
> > simple_dai->sysclk)
> > 
> 
> Yes, resetting simple_dai->sysclk may also be an option, but I could not 
> find a way to do it in practice. Requesting a reset of 
> simple_dai->sysclk from the CPU DAI .probe callback might be the right 
> time I think, but there is no service that allows this.
> Another way would be to set "system-clock-frequency = <0>" in the CPU DT 
> node. However, this is not possible, as it conflicts with the following 
> check in the simple_set_clk_rate() function:
> if (simple_dai->clk_fixed && rate != simple_dai->sysclk) {
>     dev_err(...)
> }

OK, thank you for confirming the situation.

Generalize closk setting is one of complex code, and some driver might get
damage if framework was updated, like you.

> So, the current patch still seems like the better option to me.

Yeah, it seems.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
